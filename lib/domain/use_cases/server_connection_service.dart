import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/globals.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';
import 'package:result_dart/result_dart.dart';

class ServerConnectionService {
  ServerConnectionService({
    required this.context,
    required this.appConfigViewModel,
    required this.statusViewModel,
    required this.serversViewModel,
    required this.server,
    required this.secureStorageService,
    required this.createBundle,
    this.useRootContextOnFailure = false,
    this.showModal = false,
  });

  final BuildContext context;
  final AppConfigViewModel appConfigViewModel;
  final StatusViewModel statusViewModel;
  final ServersViewModel serversViewModel;
  final Server server;
  final SecureStorageService secureStorageService;
  final CreateRepositoryBundle createBundle;
  final bool useRootContextOnFailure;
  final bool showModal;

  Future<void> connect() async {
    final previouslySelectedServer = serversViewModel.selectedServer;

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
      logger.d(
        'Fallback to previously selected server: '
        '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
        '<- ${server.address}(${server.alias})',
      );
      final error = result?.exceptionOrNull();
      await _onFailure(previouslySelectedServer, error);
      return;
    }

    logger.d(
      '<*> Server connection successful: '
      '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
      '-> ${server.address}(${server.alias})',
    );
    _onSuccess(result.getOrNull()!, serverForLogin);
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

    final bundle = createBundle(
      server: serverForLogin,
      storage: secureStorageService,
    );
    if (serverForLogin.apiVersion == 'v6') {
      final creds = SessionCredentialService(
        secureStorageService,
        serverForLogin.address,
      );
      final pw = await creds.password;
      if (pw.isSuccess()) {
        final authResult = await bundle.auth.createSession(pw.getOrNull()!);
        if (authResult.isError()) {
          process?.close();
          return Failure(
            authResult.exceptionOrNull() ?? Exception('Auth failed'),
          );
        }
      }
    }
    final result = await bundle.dns.fetchBlockingStatus();
    process?.close();
    return result;
  }

  void _onSuccess(Blocking blocking, Server connectedServer) {
    if (serversViewModel.selectedServer == null &&
        appConfigViewModel.selectedTab == 1) {
      appConfigViewModel.setSelectedTab(4);
    }

    serversViewModel.setselectedServer(server: connectedServer);
    serversViewModel.updateselectedServerStatus(
      blocking.status == DnsBlockingStatus.enabled,
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
        !server.allowSelfSignedCert ||
        hasPin) {
      return server;
    }

    // If the platform TLS validation succeeds, treat the connection as verified
    // and do not require pin setup (user may still choose to pin manually).
    try {
      await fetchTlsCertificateInfo(
        uri,
        allowBadCertificates: false,
        timeout: const Duration(seconds: 3),
      );
      return server;
    } on HandshakeException {
      // Untrusted certificate + allowSelfSignedCert enabled + no pin:
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

  Future<void> _onFailure(Server? fallback, Exception? error) async {
    if (fallback != null) {
      serversViewModel.setselectedServer(server: fallback);
      statusViewModel.setServerStatus(LoadStatus.loading);
      statusViewModel.startAutoRefresh();
    } else {
      statusViewModel.setServerStatus(LoadStatus.error);
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
    if (targetContext == null) return;
    if (!targetContext.mounted) return;

    final isPinMismatch = await _isPinnedCertificateMismatch(server);

    if (!targetContext.mounted) return;
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
            secureStorageService: secureStorageService,
            createBundle: createBundle,
            useRootContextOnFailure: useRootContextOnFailure,
            showModal: showModal,
          ).connect();
        }
      } else {
        _openEditServer(targetContext, server);
      }
    }
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
      certificateInfo = await fetchTlsCertificateInfo(
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
    final result = await serversViewModel.editServer(updated);

    if (!context.mounted) return null;

    if (result == true) {
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
    if (!server.allowSelfSignedCert) return false;

    try {
      final info = await fetchTlsCertificateInfo(
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
