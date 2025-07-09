import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_appbar/switch_server_modal.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A widget that displays the current server label and allows the user to switch servers.
///
/// The [ServerLabel] widget shows the name of the currently connected server and provides
/// a button to open a modal dialog for switching between available servers. It uses various
/// providers to manage server status, configuration, and status updates. When the user taps
/// the widget, a modal dialog is presented to select a different server. Upon selection,
/// the widget handles disconnecting from the current server, connecting to the new server,
/// and updating the UI accordingly. The widget also displays a loading skeleton when the
/// server is not connected.
///
/// This widget is intended to be used in the app bar or header area of the application.
class ServerLabel extends StatelessWidget {
  const ServerLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final isServerLoading = context.select<StatusProvider, bool>(
      (p) => p.isServerLoading,
    );

    final serversProvider = context.watch<ServersProvider>();
    final statusProvider = context.read<StatusProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();
    final statusUpdateService = context.read<StatusUpdateService>();

    return InkWell(
      onTap: () {
        _openSwitchServerModal(
          context,
          appConfigProvider,
          statusProvider,
          serversProvider,
          statusUpdateService,
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Skeletonizer(
                enabled: isServerLoading,
                effect: ShimmerEffect(
                  baseColor: Theme.of(context).colorScheme.secondaryContainer,
                  highlightColor: Theme.of(context).colorScheme.surface,
                ),
                child: const _ServerLabelText(),
              ),
            ),
            Icon(
              Icons.sync_alt_rounded,
              color: Theme.of(context).listTileTheme.textColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Opens a modal dialog to allow the user to switch between servers.
  ///
  /// This function displays the [SwitchServerModal] dialog, allowing the user to select a server.
  /// When a server is selected, it:
  /// - Closes the dialog.
  /// - Stops the status auto-refresh to prevent updating the status of the previous server.
  /// - Restarts the status auto-refresh for the new server.
  ///
  /// Parameters:
  /// - [context]: The build context to display the dialog.
  /// - [appConfigProvider]: The provider for application configuration.
  /// - [statusProvider]: The provider for server status.
  /// - [serversProvider]: The provider for the list of servers.
  /// - [statusUpdateService]: The service responsible for updating server status.
  void _openSwitchServerModal(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
    ServersProvider serversProvider,
    StatusUpdateService statusUpdateService,
  ) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) => SwitchServerModal(
        onServerSelect: (server) async {
          Navigator.pop(dialogContext);

          final previouslySelectedServer = serversProvider.selectedServer;

          serversProvider.setConnectingServer(server);
          statusUpdateService.stopAutoRefresh();
          statusProvider.setServerStatus(LoadStatus.loading);

          final result =
              await serversProvider.loadApiGateway(server)?.loginQuery();

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
              '<*> Server connection successful: ${previouslySelectedServer?.address} -> ${server.address}',
            );
            // appScreensNotSelected Layout only. Go to settings
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
                enabled: result!.status == 'enabled',
                allowSelfSignedCert: server.allowSelfSignedCert,
                sm: server.sm,
              ),
            );
            statusProvider.setServerStatus(LoadStatus.loaded);

            statusUpdateService.startAutoRefresh();
          } else {
            logger.d(
              'Fallback to previously selected server: ${previouslySelectedServer?.address} <- ${server.address}',
            );

            if (previouslySelectedServer != null) {
              serversProvider.setselectedServer(
                server: previouslySelectedServer,
              );
              statusProvider.setServerStatus(LoadStatus.loading);
              statusUpdateService.startAutoRefresh();
            } else {
              statusProvider.setServerStatus(LoadStatus.error);
            }

            if (!context.mounted) return;
            showErrorSnackBar(
              context: context,
              appConfigProvider: appConfigProvider,
              label:
                  AppLocalizations.of(context)!.couldNotConnectServerFallback,
              duration: 5,
            );
          }
        },
      ),
    );
  }
}

class _ServerLabelText extends StatelessWidget {
  const _ServerLabelText();

  @override
  Widget build(BuildContext context) {
    final alias = context.select<ServersProvider, String>(
      (p) => p.selectedServer?.alias ?? '',
    );
    final address = context.select<ServersProvider, String>(
      (p) => p.selectedServer?.address ?? '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(alias, style: const TextStyle(fontSize: 20)),
        Text(
          address,
          style: TextStyle(
            color: Theme.of(context).listTileTheme.textColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
