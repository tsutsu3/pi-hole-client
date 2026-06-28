import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/services/totp_login.dart';
import 'package:pi_hole_client/ui/core/types/resolve_totp.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/globals.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
import 'package:result_dart/result_dart.dart';

/// UI-layer orchestrator that manages the full server connection flow.
///
/// Handles authentication, TLS certificate validation, and user-facing
/// feedback (modals, snackbars, dialogs) for connecting to a Pi-hole server.
///
/// ## Responsibilities
/// - Authenticate with the server (v5 token / v6 session)
/// - Validate and optionally pin TLS certificates for self-signed HTTPS servers
/// - Update [ServersViewModel] and [StatusViewModel] on success or failure
/// - Show [ProcessModal] during connection, and error/caution snackbars on failure
/// - Prompt the user to update the pinned certificate fingerprint when a mismatch
///   is detected, then retry the connection automatically
///
/// ## Usage
/// ```dart
/// final service = ServerConnectionService(
///   context: context,
///   appConfigViewModel: appConfigViewModel,
///   statusViewModel: statusViewModel,
///   serversViewModel: serversViewModel,
///   server: server,
///   createBundle: createBundle,
/// 　resolveTotp: ({error}) => showTotpInputModal(context, error: error),
///   showModal: true,
/// );
/// await service.connect();
/// ```
///
/// ## Notes
/// - This class intentionally lives in `ui/core/services/` because it depends
///   on [BuildContext] and UI widgets. It is **not** a domain use case.
/// - The actual API calls (auth, DNS status) are delegated to repositories
///   created by [createBundle].
class ServerConnectionService {
  ServerConnectionService({
    required this.context,
    required this.appConfigViewModel,
    required this.statusViewModel,
    required this.serversViewModel,
    required this.server,
    required this.createBundle,
    required this.resolveTotp,
    this.useRootContextOnFailure = false,
    this.showModal = false,
    this.fetchTlsCertificate = fetchTlsCertificateInfo,
  });

  final BuildContext context;
  final AppConfigViewModel appConfigViewModel;
  final StatusViewModel statusViewModel;
  final ServersViewModel serversViewModel;
  final Server server;
  final CreateRepositoryBundle createBundle;
  final ResolveTotp resolveTotp;
  final bool useRootContextOnFailure;
  final bool showModal;
  final TlsCertificateFetcher fetchTlsCertificate;

  Future<void> connect() async {
    // Prevent a second concurrent connection attempt to the same server.
    // Two callers (e.g. home screen + server list) can both trigger connect()
    // for the same server at nearly the same time. Without this guard both
    // would pass the connectingServer != server checks below and each call
    // createSession(), creating duplicate Pi-hole sessions.
    if (serversViewModel.connectingServer == server) {
      return;
    }

    final previouslySelectedServer = serversViewModel.selectedServer;
    final previousStatus = statusViewModel.getServerStatus;

    _startConnection();

    final serverForLogin = await _ensurePinnedFingerprintIfNeeded(server);
    if (serverForLogin == null) {
      _abortConnection(previouslySelectedServer);
      return;
    }

    if (serversViewModel.connectingServer != server) {
      return;
    }

    final result = await _runLoginQuery(serverForLogin);

    // If another server (other than B) is selected while switching from server A to B, abort the process.
    // Without this check, it may appear as if the app is connected to B, even though a different server was actually selected.
    if (serversViewModel.connectingServer != server) {
      logger.w(
        'Server switch interrupted: '
        '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
        '-> ${server.address}(${server.alias}) '
        '-> ${serversViewModel.selectedServer?.address}(${serversViewModel.selectedServer?.alias})',
      );
      return;
    }

    serversViewModel.clearConnectingServer();

    if (result == null || result.isError()) {
      final error = result?.exceptionOrNull();
      if (error is TotpCancelledException) {
        _onTotpCancelled(previouslySelectedServer);
        return;
      }
      logger.d(
        'Fallback to previously selected server: '
        '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
        '<- ${server.address}(${server.alias})',
      );
      await _onFailure(previouslySelectedServer, error, previousStatus);
      return;
    }

    logger.d(
      '<*> Server connection successful: '
      '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
      '-> ${server.address}(${server.alias})',
    );
    await _onSuccess(result.getOrNull()!, serverForLogin);
  }

  void _startConnection() {
    serversViewModel.setConnectingServer(server);
    statusViewModel.stopAutoRefresh();
    statusViewModel.setServerStatus(LoadStatus.loading);
  }

  void _abortConnection(Server? fallback) {
    if (serversViewModel.connectingServer != server) {
      return;
    }
    serversViewModel.clearConnectingServer();

    if (fallback != null) {
      serversViewModel.setselectedServer(server: fallback);
      statusViewModel.setServerStatus(LoadStatus.loaded);
      statusViewModel.startAutoRefresh();
    } else {
      statusViewModel.setServerStatus(LoadStatus.error);
    }
  }

  Future<Result<Blocking>?> _runLoginQuery(Server serverForLogin) async {
    ProcessModal? process;
    if (showModal) {
      process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.connecting);
    }

    final bundle = createBundle(server: serverForLogin);
    // Track whether createSession was called so the post-auth probe can be
    // made with skipRenewal: true, preventing a duplicate session from being created
    // by clearAndRenewSid if a transient error occurs right after login.
    var sessionJustCreated = false;
    if (serverForLogin.apiVersion == SupportedApiVersions.v6) {
      final creds = await serversViewModel.fetchCredentials(
        serverForLogin.address,
      );
      final pw = creds.getOrNull()?.password ?? '';
      if (pw.isNotEmpty) {
        // Try existing session first to avoid creating unnecessary sessions.
        // Use skipRenewal: true so that no session renewal happens inside the
        // probe — if the existing session is expired, createSession below is
        // the sole place that creates a new session, preventing duplicates.
        final preCheck = await bundle.dns.fetchBlockingStatus(
          skipRenewal: true,
        );
        if (preCheck.isSuccess()) {
          process?.close();
          return preCheck;
        }
        // Only re-authenticate on auth errors (401/SidNotFoundException).
        // Transient failures (503/504/timeout) should not create a new session
        // as that would cause session multiplication on the Pi-hole side.
        final preCheckErr = preCheck.exceptionOrNull();
        if (!isReauthRequired(preCheckErr)) {
          process?.close();
          return Failure(
            preCheckErr ?? Exception('connection pre-check failed'),
          );
        }
        // Session is missing or expired — re-authenticate, prompting for a
        // TOTP code when the server requires 2FA.
        final login = await _createSessionWithTotp(bundle, pw, process);
        if (login.cancelled) {
          process?.close();
          return Failure(TotpCancelledException());
        }

        if (login.error != null) {
          process?.close();
          return Failure(login.error!);
        }
        sessionJustCreated = true;
      }
    }
    // Use skipRenewal: true when a session was just created above to prevent
    // clearAndRenewSid from creating a second session on transient errors.
    // Transient errors (e.g. network timeout) are still retried.
    final result = await bundle.dns.fetchBlockingStatus(
      skipRenewal: sessionJustCreated,
    );
    process?.close();
    return result;
  }

  /// Re-authenticates, prompting for a 6-digit TOTP code when the server
  /// requires 2FA and re-prompting on a rejected code.
  ///
  /// The first attempt sends the password only. A 2FA server answers with
  /// [TotpRequiredException]; the loop then collects a code via [resolveTotp]
  /// and retries with `password + totp`, looping on [TotpInvalidException].
  ///
  /// Returns `cancelled: true` when the user dismisses the prompt, otherwise
  /// the failing error (null on success).
  ///
  /// [process] is the "Connecting..." overlay; it is hidden while the TOTP
  /// prompt is shown (otherwise it floats on top and blocks the prompt) and
  /// re-shown while the entered code is validated.
  Future<({bool cancelled, Exception? error})> _createSessionWithTotp(
    RepositoryBundle bundle,
    String password,
    ProcessModal? process,
  ) async {
    final outcome = await runTotpLogin(
      auth: bundle.auth,
      password: password,
      resolveTotp: ({error}) async {
        // Hide the connecting overlay so the TOTP prompt is on top and usable.
        process?.close();
        final code = await resolveTotp(error: error);
        // Re-show the connecting overlay while the entered code is validated.
        if (code != null && context.mounted) {
          process?.open(AppLocalizations.of(context)!.connecting);
        }
        return code;
      },
    );
    return (
      cancelled: outcome.cancelled,
      error: outcome.result.exceptionOrNull(),
    );
  }

  Future<void> _onSuccess(Blocking blocking, Server connectedServer) async {
    serversViewModel.clearTotpReauthDeclined(connectedServer.address);

    if (serversViewModel.selectedServer == null &&
        appConfigViewModel.selectedTab == 1) {
      appConfigViewModel.setSelectedTab(4);
    }

    serversViewModel.setselectedServer(server: connectedServer);
    serversViewModel.updateselectedServerStatus(
      blocking.status == DnsBlockingStatus.enabled,
    );
    await WidgetChannel.sendBlockingUpdated(
      serverAddress: connectedServer.address,
    );

    statusViewModel.setServerStatus(LoadStatus.loaded);
    statusViewModel.startAutoRefresh();
  }

  Future<Server?> _ensurePinnedFingerprintIfNeeded(Server server) async {
    if (!context.mounted) return server;

    Uri uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return server;
    }

    final pin = server.pinnedCertificateSha256;
    final hasPin = pin != null && pin.trim().isNotEmpty;
    if (uri.scheme != 'https' ||
        server.ignoreCertificateErrors ||
        !server.allowUntrustedCert ||
        hasPin) {
      return server;
    }

    // If the platform TLS validation succeeds, treat the connection as verified
    // and do not require pin setup (user may still choose to pin manually).
    try {
      await fetchTlsCertificate(
        uri,
        allowBadCertificates: false,
        timeout: const Duration(seconds: 3),
      );
      return server;
    } on HandshakeException {
      // Untrusted certificate + allowUntrustedCert enabled + no pin:
      // prompt the user to pin before connecting.
    } catch (_) {
      // Network issues etc. are handled by the normal connection flow.
      return server;
    }

    if (!context.mounted) return null;
    return _openUpdatePinnedFingerprint(context, server);
  }

  bool _isSslError(Exception error) {
    return error is HttpStatusCodeException && error.statusCode == 495;
  }

  /// Handles a user-cancelled TOTP prompt.
  ///
  /// Never restarts auto-refresh on the same server being re-authenticated
  /// (that would re-prompt in a loop); falling back to a different, working
  /// server resumes its auto-refresh.
  void _onTotpCancelled(Server? fallback) {
    serversViewModel.markTotpReauthDeclined(server.address);

    if (fallback == null) {
      statusViewModel.setServerStatus(LoadStatus.error);
      return;
    }
    serversViewModel.setselectedServer(server: fallback);
    if (fallback != server) {
      statusViewModel.setServerStatus(LoadStatus.loading);
      statusViewModel.startAutoRefresh();
    } else {
      statusViewModel.setServerStatus(LoadStatus.error);
    }
  }

  Future<void> _onFailure(
    Server? fallback,
    Exception? error,
    LoadStatus previousStatus,
  ) async {
    if (fallback == null) {
      statusViewModel.setServerStatus(LoadStatus.error);
    } else {
      if (previousStatus == LoadStatus.loaded) {
        // The fallback was working before this attempt - resume it.
        serversViewModel.setselectedServer(server: fallback);
        statusViewModel.setServerStatus(LoadStatus.loading);
        statusViewModel.startAutoRefresh();
      } else {
        // The fallback was not healthy (e.g. a cancelled-2FA server).
        serversViewModel.setselectedServer(server: fallback);
        statusViewModel.setServerStatus(LoadStatus.error);
      }
    }

    // If the system back button is pressed and the user returns to the Home
    // screen before the connection completes (while the modal is still visible)
    if (!context.mounted) {
      if (useRootContextOnFailure) {
        final fallbackContext = globalNavigatorKey.currentContext!;
        showErrorSnackBar(
          context: fallbackContext,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(
            fallbackContext,
          )!.couldNotConnectServerFallback,
          duration: 5,
        );
      } else {
        return;
      }
    }

    BuildContext? targetContext;
    String? label;
    var duration = 3;

    if (useRootContextOnFailure) {
      if (context.mounted) {
        targetContext = context;
        label = AppLocalizations.of(context)!.cannotConnect;
        duration = 3;
      } else {
        targetContext = globalNavigatorKey.currentContext;
        if (targetContext != null) {
          label = AppLocalizations.of(
            targetContext,
          )!.couldNotConnectServerFallback;
          duration = 5;
        }
      }
    } else {
      if (context.mounted) {
        targetContext = context;
        label = AppLocalizations.of(context)!.couldNotConnectServerFallback;
        duration = 5;
      }
    }

    if (targetContext != null && label != null) {
      showErrorSnackBar(
        context: targetContext,
        appConfigViewModel: appConfigViewModel,
        label: label,
        duration: duration,
      );
    }

    if (error == null || !_isSslError(error)) return;
    if (targetContext == null || !targetContext.mounted) return;

    await _promptCertificateRecovery(targetContext);
  }

  // Caution snackbar + dialog offering a pin update (on mismatch) or edit,
  // then reconnects on a successful pin update. Returns true when the pin was
  // updated and a reconnect was attempted. Callers ensure the error is an SSL
  // error and [targetContext] is mounted.
  Future<bool> _promptCertificateRecovery(BuildContext targetContext) async {
    final isPinMismatch = await _isPinnedCertificateMismatch(server);

    if (!targetContext.mounted) return false;
    final loc = AppLocalizations.of(targetContext)!;

    showCautionSnackBar(
      context: targetContext,
      appConfigViewModel: appConfigViewModel,
      label: isPinMismatch
          ? loc.serverCertificatePinMismatchDetected
          : loc.serverCertificateIssueDetected,
      duration: 5,
    );

    final shouldEdit = await showDialog<bool>(
      context: targetContext,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.serverCertificateIssueTitle),
        content: Text(
          isPinMismatch
              ? loc.serverCertificatePinMismatchHelp
              : loc.serverCertificateIssueHelp,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              isPinMismatch ? loc.serverCertificateUpdatePin : loc.edit,
            ),
          ),
        ],
      ),
    );

    if (shouldEdit == true && targetContext.mounted) {
      if (isPinMismatch) {
        final updated = await _openUpdatePinnedFingerprint(
          targetContext,
          server,
        );
        if (updated != null && targetContext.mounted) {
          await ServerConnectionService(
            context: targetContext,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
            serversViewModel: serversViewModel,
            server: updated,
            createBundle: createBundle,
            resolveTotp: resolveTotp,
            useRootContextOnFailure: useRootContextOnFailure,
            showModal: showModal,
            fetchTlsCertificate: fetchTlsCertificate,
          ).connect();
          return true;
        }
      } else {
        _openEditServer(targetContext, server);
      }
    }
    return false;
  }

  /// Recovery entry for an already-selected server (e.g. auto-refresh hit a pin
  /// mismatch). Unlike [connect]/[_onFailure] it does not restart auto-refresh,
  /// so dismissing the dialog avoids looping on the same 495. Returns true when
  /// the pin was updated and a reconnect was attempted.
  Future<bool> showCertificateErrorRecovery(Exception error) async {
    if (!_isSslError(error) || !context.mounted) return false;
    return _promptCertificateRecovery(context);
  }

  Future<Server?> _openUpdatePinnedFingerprint(
    BuildContext context,
    Server server,
  ) async {
    Uri uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return null;
    }
    if (uri.scheme != 'https') return null;

    final loc = AppLocalizations.of(context)!;

    TlsCertificateInfo? certificateInfo;
    try {
      certificateInfo = await fetchTlsCertificate(
        uri,
        allowBadCertificates: true,
      );
    } catch (_) {
      certificateInfo = null;
    }

    if (!context.mounted) return null;

    if (certificateInfo == null) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.serverCertificateFetchFailed,
      );
      return null;
    }

    final info = certificateInfo;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => CertificateDetailsDialog(
        title: loc.serverCertificateUpdatePinTitle,
        description: loc.serverCertificateUpdatePinHelp,
        certificateInfo: info,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(loc.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return null;

    final updated = server.copyWith(pinnedCertificateSha256: info.sha256);
    try {
      await serversViewModel.editServer.runAsync(updated);
    } catch (e, s) {
      logger.e('Failed to save pinned certificate', error: e, stackTrace: s);
    }

    if (!context.mounted) return null;

    if (serversViewModel.editServer.errors.value == null) {
      showSuccessSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.editServerSuccessfully,
      );
      return updated;
    } else {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.cantSaveConnectionData,
      );
      return null;
    }
  }

  void _openEditServer(BuildContext context, Server server) {
    final width = MediaQuery.of(context).size.width;

    if (width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (context) => AddServerFullscreen(
          server: server,
          window: true,
          title: AppLocalizations.of(context)!.editConnection,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => AddServerFullscreen(
            server: server,
            window: false,
            title: AppLocalizations.of(context)!.editConnection,
          ),
        ),
      );
    }
  }

  Future<bool> _isPinnedCertificateMismatch(Server server) async {
    final pin = server.pinnedCertificateSha256;
    if (pin == null || pin.trim().isEmpty) return false;

    Uri uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return false;
    }
    if (uri.scheme != 'https') return false;

    // Only attempt mismatch detection when the app is configured to allow
    // untrusted certificates (pin fallback path).
    if (server.ignoreCertificateErrors) return false;
    if (!server.allowUntrustedCert) return false;

    try {
      final info = await fetchTlsCertificate(
        uri,
        allowBadCertificates: true,
        timeout: const Duration(seconds: 3),
      );
      if (info == null) return false;

      String normalize(String value) =>
          value.replaceAll(':', '').toLowerCase().trim();
      return normalize(info.sha256) != normalize(pin);
    } catch (_) {
      return false;
    }
  }
}
