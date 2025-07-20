import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/modals/process_modal.dart';

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
      _onFailure(previouslySelectedServer);
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

  void _onFailure(Server? fallback) {
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
          label: AppLocalizations.of(fallbackContext)!
              .couldNotConnectServerFallback,
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
          label =
              AppLocalizations.of(targetContext)!.couldNotConnectServerFallback;
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
  }
}
