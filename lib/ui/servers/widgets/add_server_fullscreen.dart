import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/urls.dart';
import 'package:pi_hole_client/ui/core/ui/modals/scan_token_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';
import 'package:pi_hole_client/utils/url.dart';
import 'package:provider/provider.dart';

class AddServerFullscreen extends StatefulWidget {
  const AddServerFullscreen({
    required this.window,
    required this.title,
    super.key,
    this.server,
    this.fetchTlsCertificate = fetchTlsCertificateInfo,
  });

  final Server? server;
  final bool window;
  final String title;
  final TlsCertificateFetcher fetchTlsCertificate;

  @override
  State<AddServerFullscreen> createState() => _AddServerFullscreenState();
}

enum ConnectionType { http, https }

class _AddServerFullscreenState extends State<AddServerFullscreen> {
  TextEditingController addressFieldController = TextEditingController();
  String? addressFieldError;
  TextEditingController portFieldController = TextEditingController();
  String? portFieldError;
  TextEditingController subrouteFieldController = TextEditingController();
  String? subrouteFieldError;
  TextEditingController aliasFieldController = TextEditingController();
  TextEditingController tokenFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  ConnectionType connectionType = ConnectionType.http;
  String piHoleVersion = SupportedApiVersions.v6;
  bool defaultCheckbox = false;
  bool allowUntrustedCert = true;
  bool ignoreCertificateErrors = false;
  String? pinnedCertificateSha256;

  bool allDataValid = false;

  String errorMessage = 'Failed';

  bool isTokenModalOpen = false;

  bool isConnecting = false;

  String? initToken;
  String? initPassword;
  bool _advancedOptionsExpanded = false;

  /// Whether the edit screen has finished loading the stored secrets. Always
  /// true in add mode; false until [_loadSecrets] completes in edit mode so the
  /// Save button can't fire (and overwrite credentials) before they are ready.
  bool _secretsLoaded = true;

  /// Whether [_loadSecrets] actually read the stored secrets. Stays false when
  /// the secure-storage read fails, so [_restoreSecrets] won't write back the
  /// empty placeholders and wipe a credential that is still present.
  bool _secretsLoadSucceeded = false;

  @override
  void initState() {
    super.initState();
    if (widget.server != null) {
      // Parse the stored URL with Uri so multi-segment subroutes (e.g.
      // `/api/v1`) survive and the host/port are extracted reliably instead of
      // via fragile manual `split` calls.
      final uri = Uri.parse(widget.server!.address);
      addressFieldController.text = uri.host;
      portFieldController.text = uri.hasPort ? '${uri.port}' : '';
      // A bare '/' carries no routing info and trips the subroute validator, so
      // normalise it to empty; otherwise keep the full path.
      subrouteFieldController.text = uri.path == '/' ? '' : uri.path;
      aliasFieldController.text = widget.server!.alias;
      connectionType = uri.scheme == 'https'
          ? ConnectionType.https
          : ConnectionType.http;
      piHoleVersion = widget.server!.apiVersion;
      defaultCheckbox = widget.server!.defaultServer;
      allowUntrustedCert = widget.server!.allowUntrustedCert;
      ignoreCertificateErrors = widget.server!.ignoreCertificateErrors;
      pinnedCertificateSha256 = widget.server!.pinnedCertificateSha256;
      // For edit mode, expand Advanced Options if HTTPS
      _advancedOptionsExpanded = connectionType == ConnectionType.https;
      _secretsLoaded = false;
      _loadSecrets();
    }
  }

  void checkDataValid() {
    if (addressFieldController.text != '' &&
        addressFieldError == null &&
        subrouteFieldError == null &&
        portFieldError == null &&
        aliasFieldController.text != '' &&
        tokenFieldController.text != '' &&
        passwordFieldController.text != '') {
      setState(() {
        allDataValid = true;
      });
    } else {
      setState(() {
        allDataValid = false;
      });
    }
  }

  void validateAddress(String? value) {
    if (value != null && value != '') {
      final ipAddress = RegExp(
        r'^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)(\.(?!$)|$)){4}$',
      );
      final domain = RegExp(
        r'^(([a-z0-9|-]+\.)*[a-z0-9|-]+\.[a-z]+)|((\w|-)+)$',
      );
      if (ipAddress.hasMatch(value) == true || domain.hasMatch(value) == true) {
        setState(() {
          addressFieldError = null;
        });
      } else {
        setState(() {
          addressFieldError = AppLocalizations.of(context)!.invalidAddress;
        });
      }
    } else {
      setState(() {
        addressFieldError = AppLocalizations.of(context)!.ipCannotEmpty;
      });
    }
    checkDataValid();
  }

  void validateSubroute(String? value) {
    if (value != null && value != '') {
      final subrouteRegexp = RegExp(r'^\/\b([A-Za-z0-9_\-~/]*)[^\/|\.|\:]$');
      if (subrouteRegexp.hasMatch(value) == true) {
        setState(() {
          subrouteFieldError = null;
        });
      } else {
        setState(() {
          subrouteFieldError = AppLocalizations.of(context)!.invalidSubroute;
        });
      }
    } else {
      setState(() {
        subrouteFieldError = null;
      });
    }
    checkDataValid();
  }

  void validatePort(String? value) {
    if (value != null && value != '') {
      if (int.tryParse(value) != null && int.parse(value) <= 65535) {
        setState(() {
          portFieldError = null;
        });
      } else {
        setState(() {
          portFieldError = AppLocalizations.of(context)!.invalidPort;
        });
      }
    } else {
      setState(() {
        portFieldError = null;
      });
    }
    checkDataValid();
  }

  Future<void> _loadSecrets() async {
    var password = '';
    var token = '';
    var loaded = false;
    if (widget.server != null) {
      try {
        final serversViewModel = context.read<ServersViewModel>();
        final result = await serversViewModel.fetchCredentials(
          widget.server!.address,
        );
        final creds = result.getOrNull();
        if (creds != null) {
          password = creds.password;
          token = creds.token;
          loaded = true;
        }
      } catch (e) {
        password = '';
        token = '';
      }
    }
    // Mark loaded on both the success and failure paths so the Save button is
    // never permanently disabled if the credential read throws.
    if (mounted) {
      setState(() {
        passwordFieldController.text = password;
        tokenFieldController.text = token;
        initToken = token;
        initPassword = password;
        _secretsLoadSucceeded = loaded;
        _secretsLoaded = true;
      });
    }
  }

  Future<void> _restoreSecrets() async {
    // Only restore when the original secrets were actually read. If the initial
    // load failed, initPassword/initToken are empty placeholders and writing
    // them back would wipe a credential that is still in secure storage.
    if (widget.server != null && _secretsLoadSucceeded) {
      final serversViewModel = context.read<ServersViewModel>();
      await serversViewModel.savePassword(
        widget.server!.address,
        initPassword ?? '',
      );
      await serversViewModel.saveToken(widget.server!.address, initToken ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final serversViewModel = Provider.of<ServersViewModel>(context);
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);
    final statusViewModel = context.read<StatusViewModel>();
    final appColors = Theme.of(context).extension<AppColors>()!;

    final mediaQuery = MediaQuery.of(context);

    /// Shows a snackbar with an error message
    void handleApiErrorResult({
      required BuildContext context,
      required AppConfigViewModel appConfigViewModel,
      required Exception error,
      required String version,
    }) {
      final loc = AppLocalizations.of(context)!;

      String label;

      if (error is HttpStatusCodeException) {
        switch (error.statusCode) {
          case 503:
            label = loc.checkAddress;
          case 504:
            label = loc.connectionTimeout;
          case 495:
            label = loc.sslErrorLong;
          case 401:
            label = version == SupportedApiVersions.v6
                ? loc.passwordNotValid
                : loc.tokenNotValid;
          default:
            label = loc.cantReachServer;
        }
      } else {
        label = loc.unknownError;
      }

      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: label,
      );

      appConfigViewModel.addLog(
        AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: error.toString(),
        ),
      );
    }

    Future<String?> ensurePinnedFingerprint({
      required BuildContext context,
      required Uri uri,
      required String? existingPin,
    }) async {
      if (existingPin != null && existingPin.isNotEmpty) {
        return existingPin;
      }

      try {
        // If the certificate is trusted by the platform, pin it automatically.
        final info = await widget.fetchTlsCertificate(
          uri,
          allowBadCertificates: false,
        );
        if (info != null) {
          return info.sha256;
        }
        return '';
      } on HandshakeException {
        // Untrusted certificate (likely self-signed). Retrieve fingerprint for user verification.
      } catch (_) {
        // Fall back to existing behavior without pin prompt on non-TLS failures.
        return '';
      }

      TlsCertificateInfo? certificateInfo;
      try {
        certificateInfo = await widget.fetchTlsCertificate(
          uri,
          allowBadCertificates: true,
        );
      } catch (_) {
        // If we cannot obtain the fingerprint, block the connection.
        // This typically happens with reverse proxies where certificate
        // pinning cannot work reliably.
        return null;
      }
      if (!context.mounted || certificateInfo == null) {
        return null;
      }

      final info = certificateInfo;
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => CertificateDetailsDialog(
          title: AppLocalizations.of(dialogContext)!.allowUntrustedCert,
          description: AppLocalizations.of(
            dialogContext,
          )!.serverCertificateUpdatePinHelp,
          certificateInfo: info,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: Text(AppLocalizations.of(dialogContext)!.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text(AppLocalizations.of(dialogContext)!.confirm),
            ),
          ],
        ),
      );

      return confirmed == true ? info.sha256 : null;
    }

    /// Validates and updates the server's certificate configuration.
    ///
    /// This method handles certificate validation and pinning for HTTPS connections.
    /// It returns the updated Server object if validation succeeds, or null if the
    /// user cancels or validation fails.
    ///
    /// Parameters:
    /// - [serverObj]: The server object to validate
    /// - [onValidationFailed]: Optional callback for handling additional cleanup on failure
    Future<Server?> validateAndUpdateServerCertificate({
      required Server serverObj,
      VoidCallback? onValidationFailed,
    }) async {
      if (connectionType != ConnectionType.https || ignoreCertificateErrors) {
        // ignore: avoid_redundant_argument_values
        return serverObj.copyWith(pinnedCertificateSha256: null);
      }

      final uri = Uri.parse(serverObj.address);

      if (allowUntrustedCert) {
        // Allow self-signed: prompt user to pin the certificate
        if (!context.mounted) return null;
        final pin = await ensurePinnedFingerprint(
          context: context,
          uri: uri,
          existingPin: serverObj.pinnedCertificateSha256,
        );
        if (!context.mounted) return null;
        if (pin == null) {
          onValidationFailed?.call();
          return null;
        }
        return serverObj.copyWith(
          pinnedCertificateSha256: pin.isEmpty ? null : pin,
        );
      } else {
        // Strict mode: verify certificate is trusted by the platform
        try {
          await widget.fetchTlsCertificate(uri, allowBadCertificates: false);
          // Certificate is trusted, proceed without pin
          // ignore: avoid_redundant_argument_values
          return serverObj.copyWith(pinnedCertificateSha256: null);
        } on HandshakeException {
          // Certificate not trusted - block connection
          if (!context.mounted) return null;
          onValidationFailed?.call();
          if (!context.mounted) return null;
          showErrorSnackBar(
            context: context,
            appConfigViewModel: appConfigViewModel,
            label: AppLocalizations.of(context)!.sslErrorLong,
          );
          return null;
        } catch (e) {
          // Other network errors - let connection test handle them
          // ignore: avoid_redundant_argument_values
          return serverObj.copyWith(pinnedCertificateSha256: null);
        }
      }
    }

    Future<void> connect() async {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        isConnecting = true;
      });
      if (!allowUntrustedCert) {
        pinnedCertificateSha256 = null;
      }

      final url =
          '${connectionType.name}://${addressFieldController.text}${portFieldController.text != '' ? ':${portFieldController.text}' : ''}${subrouteFieldController.text}';
      final exists = await serversViewModel.checkUrlExists(url);

      if (!context.mounted) return;
      final createBundle = context.read<CreateRepositoryBundle>();

      if (exists['result'] == 'success' && exists['exists'] == true) {
        setState(() {
          isConnecting = false;
        });
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.connectionAlreadyExists,
        );
      } else if (exists['result'] == 'fail') {
        setState(() {
          isConnecting = false;
        });
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.cannotCheckUrlSaved,
        );
      } else {
        var serverObj = Server(
          address: url,
          alias: aliasFieldController.text,
          apiVersion: piHoleVersion,
          allowUntrustedCert: allowUntrustedCert,
          ignoreCertificateErrors: ignoreCertificateErrors,
          pinnedCertificateSha256: pinnedCertificateSha256,
        );
        await serversViewModel.savePassword(url, passwordFieldController.text);
        await serversViewModel.saveToken(url, tokenFieldController.text);

        serverObj =
            await validateAndUpdateServerCertificate(
              serverObj: serverObj,
              onValidationFailed: () {
                setState(() {
                  isConnecting = false;
                });
              },
            ) ??
            serverObj;

        final bundle = createBundle(server: serverObj);
        if (serverObj.apiVersion == SupportedApiVersions.v6) {
          final authResult = await bundle.auth.createSession(
            passwordFieldController.text,
          );
          if (authResult.isError()) {
            if (mounted) {
              setState(() {
                isConnecting = false;
              });
              await _restoreSecrets();
              await serversViewModel.deletePassword(url);
              await serversViewModel.deleteToken(url);
              if (!context.mounted) return;
              handleApiErrorResult(
                context: context,
                appConfigViewModel: appConfigViewModel,
                error: authResult.exceptionOrNull()!,
                version: piHoleVersion,
              );
            }
            return;
          }
        }
        // Use skipRenewal: true because the session was just created above.
        // Retrying with clearAndRenewSid would create a duplicate session.
        // Transient errors (e.g. network timeout) are still retried.
        final result = await bundle.dns.fetchBlockingStatus(skipRenewal: true);
        if (!context.mounted) return;
        if (result.isSuccess()) {
          await Navigator.maybePop(context);
          if (!context.mounted) return;
          showSuccessSnackBar(
            context: context,
            appConfigViewModel: appConfigViewModel,
            label: AppLocalizations.of(context)!.connectedSuccessfully,
          );
          try {
            await serversViewModel.addServer.runAsync(
              serverObj.copyWith(defaultServer: defaultCheckbox),
            );
          } catch (e, s) {
            logger.e('Failed to save server', error: e, stackTrace: s);
          }
        } else {
          if (mounted) {
            setState(() {
              isConnecting = false;
            });
            await _restoreSecrets();

            await serversViewModel.deletePassword(url);
            await serversViewModel.deleteToken(url);
            if (!context.mounted) return;

            handleApiErrorResult(
              context: context,
              appConfigViewModel: appConfigViewModel,
              error: result.exceptionOrNull()!,
              version: piHoleVersion,
            );
          } else {
            isConnecting = false;
          }
        }
      }
    }

    Future<void> save() async {
      FocusManager.instance.primaryFocus?.unfocus();
      final saveCreateBundle = context.read<CreateRepositoryBundle>();
      setState(() {
        isConnecting = true;
      });

      if (!allowUntrustedCert) {
        pinnedCertificateSha256 = null;
      }

      final oldServer = widget.server!;
      final oldAddress = oldServer.address;
      final newUrl =
          '${connectionType.name}://${addressFieldController.text}${portFieldController.text != '' ? ':${portFieldController.text}' : ''}${subrouteFieldController.text}';
      // Normalised comparison: a host-case-only or trailing-slash difference is
      // NOT an address change and must stay on the in-place editServer path.
      final isAddressChanged = !isSameEndpoint(oldAddress, newUrl);

      // When the address (primary key) changes, make sure the new URL is not
      // already used by another server before doing anything destructive.
      if (isAddressChanged) {
        final exists = await serversViewModel.checkUrlExists(newUrl);
        if (!context.mounted) return;
        if (exists['result'] == 'success' && exists['exists'] == true) {
          setState(() {
            isConnecting = false;
          });
          showErrorSnackBar(
            context: context,
            appConfigViewModel: appConfigViewModel,
            label: AppLocalizations.of(context)!.connectionAlreadyExists,
          );
          return;
        } else if (exists['result'] == 'fail') {
          setState(() {
            isConnecting = false;
          });
          showErrorSnackBar(
            context: context,
            appConfigViewModel: appConfigViewModel,
            label: AppLocalizations.of(context)!.cannotCheckUrlSaved,
          );
          return;
        }
      }

      final targetAddress = isAddressChanged ? newUrl : oldAddress;

      // When the address changes the target is effectively a different host, so
      // any pinned certificate carried over from the old server is stale. Reset
      // it to null so the certificate check re-runs against the new host
      // instead of silently reusing the old fingerprint.
      if (isAddressChanged) {
        pinnedCertificateSha256 = null;
      }

      var serverObj = Server(
        address: targetAddress,
        alias: aliasFieldController.text,
        apiVersion: piHoleVersion,
        allowUntrustedCert: allowUntrustedCert,
        ignoreCertificateErrors: ignoreCertificateErrors,
        pinnedCertificateSha256: pinnedCertificateSha256,
      );
      if (serversViewModel.selectedServer != null) {
        statusViewModel.stopAutoRefresh();
      }

      // Validate certificate BEFORE connection test (same as connect())
      final updatedServer = await validateAndUpdateServerCertificate(
        serverObj: serverObj,
        onValidationFailed: () {
          setState(() {
            isConnecting = false;
          });
          if (serversViewModel.selectedServer != null) {
            statusViewModel.startAutoRefresh();
          }
        },
      );

      if (updatedServer == null) {
        return;
      }

      serverObj = updatedServer;

      await serversViewModel.savePassword(
        targetAddress,
        passwordFieldController.text,
      );
      await serversViewModel.saveToken(
        targetAddress,
        tokenFieldController.text,
      );

      // Rolls back everything written for THIS save attempt on failure, always
      // leaving the old server (row, credentials, session) untouched.
      //
      // - Address change: remove the credentials and SID written under the new
      //   address plus the freshly created remote session.
      // - Same address: restore the old credentials and, when a new session was
      //   created during this attempt, tear it down so it does not leak.
      Future<void> rollbackFailedSave({
        required RepositoryBundle bundle,
        required bool sessionCreated,
      }) async {
        Future<void> deleteNewSession() async {
          if (!sessionCreated) return;
          try {
            await bundle.auth.deleteCurrentSession();
          } catch (e, s) {
            logger.w(
              'Failed to delete new session on server',
              error: e,
              stackTrace: s,
            );
          }
        }

        if (isAddressChanged) {
          await serversViewModel.deletePassword(targetAddress);
          await serversViewModel.deleteToken(targetAddress);
          await serversViewModel.deleteSid(targetAddress);
          await deleteNewSession();
        } else {
          await deleteNewSession();
          await _restoreSecrets();
        }
      }

      Future<void> handleSaveError(Exception e) async {
        if (context.mounted) {
          setState(() {
            isConnecting = false;
          });
          await _restoreSecrets();
          if (context.mounted) {
            handleApiErrorResult(
              context: context,
              appConfigViewModel: appConfigViewModel,
              error: e,
              version: piHoleVersion,
            );
          }
        }
        if (serversViewModel.selectedServer != null) {
          statusViewModel.startAutoRefresh();
        }
      }

      final bundle = saveCreateBundle(server: serverObj);
      var sessionJustCreated = false;
      if (serverObj.apiVersion == SupportedApiVersions.v6) {
        if (isAddressChanged) {
          // The new address has no existing session, so always create one.
          final authResult = await bundle.auth.createSession(
            passwordFieldController.text,
          );
          if (authResult.isError()) {
            await rollbackFailedSave(bundle: bundle, sessionCreated: false);
            await handleSaveError(authResult.exceptionOrNull()!);
            return;
          }
          sessionJustCreated = true;
        } else if (passwordFieldController.text != (initPassword ?? '')) {
          // Same address but the password was edited. Validate it now by
          // creating a session: an unverified (possibly wrong) password would
          // otherwise silently overwrite the known-good one and lock the user
          // out the moment the current SID is invalidated.
          final authResult = await bundle.auth.createSession(
            passwordFieldController.text,
          );
          if (authResult.isError()) {
            await handleSaveError(authResult.exceptionOrNull()!);
            return;
          }
          sessionJustCreated = true;
        } else {
          // Same address, unchanged password: reuse the existing session if it
          // is still valid. Only re-authenticate on 401/SidNotFoundException to
          // avoid session multiplication when the server is temporarily
          // unreachable (503/504/timeout).
          final preCheck = await bundle.dns.fetchBlockingStatus(
            skipRenewal: true,
          );
          if (preCheck.isError()) {
            final err = preCheck.exceptionOrNull();
            if (!isReauthRequired(err)) {
              await handleSaveError(err!);
              return;
            }
            final authResult = await bundle.auth.createSession(
              passwordFieldController.text,
            );
            if (authResult.isError()) {
              await handleSaveError(authResult.exceptionOrNull()!);
              return;
            }
            sessionJustCreated = true;
          }
        }
      }
      // skipRenewal: true only when a new session was just created above to
      // avoid creating a duplicate session on transient retry failures.
      final result = await bundle.dns.fetchBlockingStatus(
        skipRenewal: sessionJustCreated,
      );

      if (result.isSuccess()) {
        final server = serverObj.copyWith(defaultServer: defaultCheckbox);

        Object? cmdError;
        try {
          if (isAddressChanged) {
            await serversViewModel.replaceServer.runAsync((
              oldAddress: oldAddress,
              newServer: server,
            ));
            cmdError = serversViewModel.replaceServer.errors.value;
          } else {
            await serversViewModel.editServer.runAsync(server);
            cmdError = serversViewModel.editServer.errors.value;
          }
        } catch (e, s) {
          logger.e('Failed to save server', error: e, stackTrace: s);
          cmdError = e;
        }

        if (cmdError == null) {
          // The old v6 session is orphaned on an address change or a switch
          // away from v6 (e.g. v6 -> v5). Run only after the DB commit so a
          // failed save can't kill a live session.
          final oldWasV6 = oldServer.apiVersion == SupportedApiVersions.v6;
          final newIsV6 = serverObj.apiVersion == SupportedApiVersions.v6;

          // 1. Log out the old v6 session.
          if (oldWasV6 && (isAddressChanged || !newIsV6)) {
            try {
              final oldBundle = saveCreateBundle(server: oldServer);
              await oldBundle.auth.deleteCurrentSession();
            } catch (e, s) {
              logger.w(
                'Failed to delete old session on server',
                error: e,
                stackTrace: s,
              );
            }
          }

          // 2. Now safe to drop the old server's credentials.
          if (isAddressChanged) {
            // New credentials already live under the new address; remove the
            // stale ones left behind under the old address.
            await serversViewModel.deleteToken(oldAddress);
            await serversViewModel.deletePassword(oldAddress);
            await serversViewModel.deleteSid(oldAddress);
          } else if (oldWasV6 && !newIsV6) {
            // Same address, v6 -> v5: the SID is now unused.
            await serversViewModel.deleteSid(targetAddress);
          }
          if (context.mounted) {
            await Navigator.maybePop(context);
            if (!context.mounted) return;

            showSuccessSnackBar(
              context: context,
              appConfigViewModel: appConfigViewModel,
              label: AppLocalizations.of(context)!.editServerSuccessfully,
            );
          }
        } else {
          // DB write failed: roll back this attempt's artifacts; the old
          // server (row, credentials, session) is left fully intact.
          await rollbackFailedSave(
            bundle: bundle,
            sessionCreated: sessionJustCreated,
          );
          if (context.mounted) {
            setState(() {
              isConnecting = false;
            });
            showErrorSnackBar(
              context: context,
              appConfigViewModel: appConfigViewModel,
              label: AppLocalizations.of(context)!.cantSaveConnectionData,
            );
          }
        }
      } else {
        await rollbackFailedSave(
          bundle: bundle,
          sessionCreated: sessionJustCreated,
        );
        if (context.mounted) {
          setState(() {
            isConnecting = false;
          });

          handleApiErrorResult(
            context: context,
            appConfigViewModel: appConfigViewModel,
            error: result.exceptionOrNull()!,
            version: piHoleVersion,
          );
        } else {
          isConnecting = false;
        }
      }

      if (serversViewModel.selectedServer != null) {
        statusViewModel.startAutoRefresh();
      }
    }

    bool validData() {
      if (addressFieldController.text != '' &&
          subrouteFieldError == null &&
          addressFieldError == null &&
          portFieldError == null &&
          aliasFieldController.text != '') {
        if (widget.server != null) {
          if (!_secretsLoaded) return false;
          final hasCredential = piHoleVersion == SupportedApiVersions.v6
              ? passwordFieldController.text != ''
              : tokenFieldController.text != '';
          if (!hasCredential) return false;
        }
        return true;
      } else {
        return false;
      }
    }

    void openScanTokenModal() {
      showDialog(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (context) => ScanTokenModal(
          qrScanned: (value) =>
              setState(() => tokenFieldController.text = value),
        ),
      );
    }

    Widget buildV5Settings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: tokenFieldController,
                    onChanged: (value) => checkDataValid(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.token,
                    ),
                  ),
                ),
                if (Platform.isAndroid || Platform.isIOS) ...[
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: openScanTokenModal,
                    icon: const Icon(Icons.qr_code_rounded),
                    tooltip: AppLocalizations.of(context)!.scanQrCode,
                  ),
                ],
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.tokenInstructions,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget buildV6Settings(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordFieldController,
                    onChanged: (value) => checkDataValid(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.password,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget formItems() {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.05),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${connectionType.name}://${addressFieldController.text}${portFieldController.text != '' ? ':${portFieldController.text}' : ''}${subrouteFieldController.text}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SectionLabel(
                  label: AppLocalizations.of(context)!.connection,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: aliasFieldController,
                    onChanged: (value) => checkDataValid(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.badge_outlined),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.serverName,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  child: SegmentedButton<ConnectionType>(
                    segments: const [
                      ButtonSegment(
                        value: ConnectionType.http,
                        label: Text('HTTP'),
                      ),
                      ButtonSegment(
                        value: ConnectionType.https,
                        label: Text('HTTPS'),
                      ),
                    ],
                    selected: <ConnectionType>{connectionType},
                    onSelectionChanged: (value) => setState(() {
                      connectionType = value.first;
                      // Expand Advanced Options when HTTPS is selected, collapse for HTTP
                      _advancedOptionsExpanded =
                          connectionType == ConnectionType.https;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    onChanged: validateAddress,
                    controller: addressFieldController,
                    decoration: InputDecoration(
                      errorText: addressFieldError,
                      prefixIcon: const Icon(Icons.link),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.address,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    onChanged: validatePort,
                    controller: portFieldController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: portFieldError,
                      prefixIcon: const Icon(Icons.numbers),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.port,
                    ),
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    key: ValueKey(_advancedOptionsExpanded),
                    tilePadding: EdgeInsets.zero,
                    initiallyExpanded: _advancedOptionsExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _advancedOptionsExpanded = expanded;
                      });
                    },
                    title: SectionLabel(
                      label: AppLocalizations.of(context)!.advancedOptions,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    children: [
                      TextFormField(
                        onChanged: validateSubroute,
                        controller: subrouteFieldController,
                        decoration: InputDecoration(
                          errorText: subrouteFieldError,
                          prefixIcon: const Icon(Icons.route_rounded),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: AppLocalizations.of(
                            context,
                          )!.subrouteField,
                          hintText: AppLocalizations.of(
                            context,
                          )!.subrouteExample,
                          helperText: AppLocalizations.of(
                            context,
                          )!.subrouteHelper,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        contentPadding: const EdgeInsets.only(right: 8),
                        value: allowUntrustedCert,
                        onChanged:
                            connectionType == ConnectionType.https &&
                                !ignoreCertificateErrors
                            ? (v) => setState(() {
                                allowUntrustedCert = v!;
                                if (!allowUntrustedCert) {
                                  pinnedCertificateSha256 = null;
                                }
                              })
                            : null,
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.allowUntrustedCert,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.help_outline_rounded),
                              onPressed: () => openUrl(Urls.certConfigGuide),
                              tooltip: AppLocalizations.of(
                                context,
                              )!.learnMoreAboutCertificates,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          AppLocalizations.of(
                            context,
                          )!.allowUntrustedCertDescription,
                          style: TextStyle(
                            fontSize: 12,
                            color: appColors.queryOrange,
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        contentPadding: const EdgeInsets.only(right: 8),
                        value: ignoreCertificateErrors,
                        onChanged: connectionType == ConnectionType.https
                            ? (v) =>
                                  setState(() => ignoreCertificateErrors = v!)
                            : null,
                        title: Text(
                          AppLocalizations.of(context)!.dontCheckCertificate,
                        ),
                        subtitle: Text(
                          AppLocalizations.of(
                            context,
                          )!.dontCheckCertificateDescription,
                          style: TextStyle(
                            fontSize: 12,
                            color: appColors.queryRed,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SectionLabel(
                  label: AppLocalizations.of(context)!.version,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.versionDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  child: SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: SupportedApiVersions.v5,
                        label: Text(SupportedApiVersions.v5),
                      ),
                      ButtonSegment(
                        value: SupportedApiVersions.v6,
                        label: Text(SupportedApiVersions.v6),
                      ),
                    ],
                    selected: <String>{piHoleVersion},
                    onSelectionChanged: (value) =>
                        setState(() => piHoleVersion = value.first),
                  ),
                ),
                SectionLabel(
                  label: AppLocalizations.of(context)!.authentication,
                  padding: const EdgeInsets.only(top: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: piHoleVersion == SupportedApiVersions.v5
                      ? buildV5Settings(context)
                      : buildV6Settings(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: defaultCheckbox,
                      onChanged: (value) => {
                        setState(() => defaultCheckbox = !defaultCheckbox),
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState(() => defaultCheckbox = !defaultCheckbox),
                      },
                      child: Text(
                        AppLocalizations.of(context)!.defaultConnection,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (widget.window == true) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 24),
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.maybePop(context),
                          icon: const Icon(Icons.clear_rounded),
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => openUrl(Urls.createAConnection),
                          icon: const Icon(Icons.help_outline_rounded),
                          tooltip: AppLocalizations.of(
                            context,
                          )!.howCreateConnection,
                        ),
                        IconButton(
                          tooltip: widget.server != null
                              ? AppLocalizations.of(context)!.save
                              : AppLocalizations.of(context)!.connect,
                          onPressed: validData()
                              ? widget.server != null
                                    ? save
                                    : connect
                              : null,
                          icon: widget.server != null
                              ? const Icon(Icons.save_rounded)
                              : const Icon(Icons.login_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: formItems()),
            ],
          ),
        ),
      );
    } else {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                IconButton(
                  onPressed: () => openUrl(Urls.createAConnection),
                  icon: const Icon(Icons.help_outline_rounded),
                  tooltip: AppLocalizations.of(context)!.howCreateConnection,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    tooltip: widget.server != null
                        ? AppLocalizations.of(context)!.save
                        : AppLocalizations.of(context)!.connect,
                    onPressed: validData()
                        ? widget.server != null
                              ? save
                              : connect
                        : null,
                    icon: widget.server != null
                        ? const Icon(Icons.save_rounded)
                        : const Icon(Icons.login_rounded),
                  ),
                ),
              ],
              toolbarHeight: 70,
            ),
            body: formItems(),
          ),
          AnimatedOpacity(
            opacity: isConnecting == true ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: IgnorePointer(
              ignoring: isConnecting == true ? false : true,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height,
                  color: const Color.fromRGBO(0, 0, 0, 0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(color: Colors.white),
                      const SizedBox(height: 30),
                      Text(
                        AppLocalizations.of(context)!.connecting,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
