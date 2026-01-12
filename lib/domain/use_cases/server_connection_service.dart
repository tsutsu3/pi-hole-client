import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/servers/add_server_fullscreen.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

class ServerConnectionService {
  ServerConnectionService({
    required this.context,
    required this.appConfigProvider,
    required this.statusProvider,
    required this.serversProvider,
    required this.statusUpdateService,
    required this.server,
    this.useRootContextOnFailure = false,
    this.showModal = false,
  });

  final BuildContext context;
  final AppConfigProvider appConfigProvider;
  final StatusProvider statusProvider;
  final ServersProvider serversProvider;
  final StatusUpdateService statusUpdateService;
  final Server server;
  final bool useRootContextOnFailure;
  final bool showModal;

  Future<void> connect() async {
    final previouslySelectedServer = serversProvider.selectedServer;

    _startConnection();

    final result = await _runLoginQuery();

    // If another server (other than B) is selected while switching from server A to B, abort the process.
    // Without this check, it may appear as if the app is connected to B, even though a different server was actually selected.
    if (serversProvider.connectingServer != server) {
      logger.w(
        'Server switch interrupted: '
        '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
        '-> ${server.address}(${server.alias}) '
        '-> ${serversProvider.selectedServer?.address}(${serversProvider.selectedServer?.alias})',
      );
      return;
    }

    serversProvider.clearConnectingServer();

    if (result?.result == APiResponseType.success) {
      logger.d(
        '<*> Server connection successful: '
        '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
        '-> ${server.address}(${server.alias})',
      );
      _onSuccess(result!);
    } else {
      logger.d(
        'Fallback to previously selected server: '
        '${previouslySelectedServer?.address}(${previouslySelectedServer?.alias}) '
        '<- ${server.address}(${server.alias})',
      );
      await _onFailure(previouslySelectedServer, result);
    }
  }

  void _startConnection() {
    serversProvider.setConnectingServer(server);
    statusUpdateService.stopAutoRefresh();
    statusProvider.setServerStatus(LoadStatus.loading);
  }

  Future<LoginQueryResponse?> _runLoginQuery() async {
    ProcessModal? process;
    if (showModal) {
      process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.connecting);
    }

    final result = await serversProvider.loadApiGateway(server)?.loginQuery();
    process?.close();
    return result;
  }

  void _onSuccess(LoginQueryResponse result) {
    if (serversProvider.selectedServer == null &&
        appConfigProvider.selectedTab == 1) {
      appConfigProvider.setSelectedTab(4);
    }

    serversProvider.setselectedServer(
      server: Server(
        address: server.address,
        alias: server.alias,
        defaultServer: server.defaultServer,
        apiVersion: server.apiVersion,
        enabled: result.status == 'enabled',
        allowSelfSignedCert: server.allowSelfSignedCert,
        sm: server.sm,
      ),
    );

    statusProvider.setServerStatus(LoadStatus.loaded);
    statusUpdateService.startAutoRefresh();
  }

  Future<void> _onFailure(Server? fallback, LoginQueryResponse? result) async {
    if (fallback != null) {
      serversProvider.setselectedServer(server: fallback);
      statusProvider.setServerStatus(LoadStatus.loading);
      statusUpdateService.startAutoRefresh();
    } else {
      statusProvider.setServerStatus(LoadStatus.error);
    }

    // If the system back button is pressed and the user returns to the Home
    // screen before the connection completes (while the modal is still visible)
    if (!context.mounted) {
      if (useRootContextOnFailure) {
        final fallbackContext = globalNavigatorKey.currentContext!;
        showErrorSnackBar(
          context: fallbackContext,
          appConfigProvider: appConfigProvider,
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
        appConfigProvider: appConfigProvider,
        label: label,
        duration: duration,
      );
    }

    if (result?.result != APiResponseType.sslError) return;
    if (targetContext == null) return;
    if (!targetContext.mounted) return;

    final isPinMismatch = await _isPinnedCertificateMismatch(server);

    if (!targetContext.mounted) return;
    final loc = AppLocalizations.of(targetContext)!;

    showCautionSnackBar(
      context: targetContext,
      appConfigProvider: appConfigProvider,
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
        await _openUpdatePinnedFingerprint(targetContext, server);
      } else {
        _openEditServer(targetContext, server);
      }
    }
  }

  Future<void> _openUpdatePinnedFingerprint(
    BuildContext context,
    Server server,
  ) async {
    Uri uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return;
    }
    if (uri.scheme != 'https') return;

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

    if (!context.mounted) return;

    if (certificateInfo == null) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.serverCertificateFetchFailed,
      );
      return;
    }

    final info = certificateInfo;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.serverCertificateUpdatePinTitle),
        content: SelectableText(
          [
            loc.serverCertificateUpdatePinHelp,
            '',
            '${loc.tlsCertSubject}: ${info.subject}',
            '${loc.tlsCertIssuer}: ${info.issuer}',
            '${loc.tlsCertValidFrom}: ${info.startValidity.toIso8601String()}',
            '${loc.tlsCertValidUntil}: ${info.endValidity.toIso8601String()}',
            '',
            '${loc.tlsCertSha256}: ${info.sha256}',
          ].join('\n'),
        ),
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

    if (confirmed != true || !context.mounted) return;

    final updated = server.copyWith(pinnedCertificateSha256: info.sha256);
    final result = await serversProvider.editServer(updated);

    if (!context.mounted) return;

    if (result == true) {
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.editServerSuccessfully,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.cantSaveConnectionData,
      );
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
