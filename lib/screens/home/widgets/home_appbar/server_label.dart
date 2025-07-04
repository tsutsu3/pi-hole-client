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
    final isServerConnected = context.select<StatusProvider, bool>(
      (p) => p.isServerConnected,
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
                enabled: !isServerConnected,
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
  /// - Connects to the newly selected server by calling [_connectToServer].
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

          // Prevent the previous server's status from being refreshed during server switching.
          // Without this, the auto-refresh might update the status using the previous server's data
          // before the new connection completes, causing the UI to briefly show outdated information.
          statusUpdateService.stopAutoRefresh();

          await _connectToServer(
            context,
            appConfigProvider,
            statusProvider,
            serversProvider,
            statusUpdateService,
            server,
          );

          statusUpdateService.startAutoRefresh();
        },
      ),
    );
  }

  /// Attempts to connect to the given [server], updating the status and UI accordingly.
  ///
  /// This method performs the following steps:
  /// 1. Sets both the main status and overtime data loading indicators to `loading`.
  /// 2. Attempts to log in to the API gateway for the provided [server].
  /// 3. If the login is successful:
  ///    - Marks the server as connected.
  ///    - Delegates to [_handleServerConnectSuccess] to update server and fetch data.
  /// 4. If the login fails:
  ///    - Marks the server as disconnected.
  ///    - Delegates to [_handleServerConnectFailure] to show an error and fallback status.
  ///
  /// This method ensures that UI-related updates only occur if [context] is still mounted.
  ///
  /// Parameters:
  /// - [context]: The current [BuildContext], used for UI interaction.
  /// - [appConfigProvider]: The app configuration provider for snackbar control.
  /// - [statusProvider]: Provider managing realtime and overtime status states.
  /// - [serversProvider]: Provider managing the selected server and gateway logic.
  /// - [statusUpdateService]: Fallback status refresher service.
  /// - [server]: The [Server] instance to attempt connecting to.
  ///
  /// Returns:
  /// A [Future] that completes once the full connection process has finished.
  Future<void> _connectToServer(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
    ServersProvider serversProvider,
    StatusUpdateService statusUpdateService,
    Server server,
  ) async {
    statusProvider.setStatusLoading(LoadStatus.loading);
    statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loading);
    statusProvider.setIsServerConnected(false);

    final result = await serversProvider.loadApiGateway(server)?.loginQuery();
    if (!context.mounted) return;

    if (result?.result == APiResponseType.success) {
      statusProvider.setIsServerConnected(true);
      await _handleServerConnectSuccess(
        statusProvider,
        serversProvider,
        server,
        result,
      );
    } else {
      await _handleServerConnectFailure(
        context,
        appConfigProvider,
        statusProvider,
        statusUpdateService,
        result,
      );
    }
  }

  /// Handles the logic for a successful server login.
  ///
  /// This method updates the selected server in the provider, and then concurrently
  /// fetches the real-time status and overtime data from the API gateway. It then updates
  /// the corresponding providers based on the result of each API call.
  ///
  /// Parameters:
  /// - [statusProvider]: Provider for updating the realtime and overtime status.
  /// - [serversProvider]: Provider used to set the selected server and resolve the gateway.
  /// - [server]: The connected [Server] instance.
  /// - [result]: The successful login response containing server state information.
  ///
  /// Returns:
  /// A [Future] that completes after the status data has been fetched and applied.
  Future<void> _handleServerConnectSuccess(
    StatusProvider statusProvider,
    ServersProvider serversProvider,
    Server server,
    LoginQueryResponse? result,
  ) async {
    serversProvider.setselectedServer(
      server: Server(
        address: server.address,
        alias: server.alias,
        defaultServer: server.defaultServer,
        apiVersion: server.apiVersion,
        enabled: result?.status == 'enabled',
        allowSelfSignedCert: server.allowSelfSignedCert,
      ),
    );

    final apiGateway = serversProvider.selectedApiGateway;
    if (apiGateway == null) {
      logger.w('Selected API Gateway is null');
      return;
    }

    final results = await Future.wait([
      apiGateway.realtimeStatus(clientCount: 0),
      apiGateway.fetchOverTimeData(),
    ]);

    final statusResult = results[0] as RealtimeStatusResponse;
    final overtimeDataResult = results[1] as FetchOverTimeDataResponse;

    if (statusResult.result == APiResponseType.success) {
      statusProvider.setRealtimeStatus(statusResult.data!);
      statusProvider.setStatusLoading(LoadStatus.loaded);
    } else {
      logger.w(
        'Error while fetching realtime status: ${statusResult.result.name}',
      );
      statusProvider.setStatusLoading(LoadStatus.error);
    }

    if (overtimeDataResult.result == APiResponseType.success) {
      statusProvider.setOvertimeData(overtimeDataResult.data!);
      statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loaded);
    } else {
      logger.w(
        'Error while fetching overtime data: ${overtimeDataResult.result.name}',
      );
      statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);
    }
  }

  /// Handles the failure case for server login attempts.
  ///
  /// This method logs the failure, sets both main and overtime status loading indicators
  /// to `error`, shows a localized error snackbar, and triggers a one-time fallback
  /// status refresh using the [statusUpdateService].
  ///
  /// Parameters:
  /// - [context]: The [BuildContext] used to show the snackbar.
  /// - [appConfigProvider]: The app configuration provider for snackbar control.
  /// - [statusProvider]: The provider used to update error status.
  /// - [statusUpdateService]: The service used to trigger a one-time fallback refresh.
  /// - [result]: The login failure response used for logging (nullable).
  ///
  /// Returns:
  /// A [Future] that completes once the error state and fallback logic has finished.
  Future<void> _handleServerConnectFailure(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
    StatusUpdateService statusUpdateService,
    LoginQueryResponse? result,
  ) async {
    /// Returns immediately if either the main status or overtime data has already finished loading.
    /// This prevents any actions from being taken if the user has switched to another server while loading.
    if (statusProvider.getStatusLoading == LoadStatus.loaded ||
        statusProvider.getOvertimeDataLoadStatus == LoadStatus.loaded) {
      logger.i(
        'Status or overtime data already loaded, skipping error handling.',
      );
      return;
    }

    logger.w(
      'Error while connecting to server: ${result?.result.name}. Falling back to the previous server and triggering refresh.',
    );

    statusProvider.setStatusLoading(LoadStatus.error);
    statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);

    showErrorSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.couldNotConnectServerFallback,
      duration: 5,
    );

    await statusUpdateService.refreshOnce();
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
