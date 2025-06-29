import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/switch_server_modal.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({required this.innerBoxIsScrolled, super.key});

  final bool innerBoxIsScrolled;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final serversProvider = context.watch<ServersProvider>();
    final statusProvider = context.watch<StatusProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();
    final statusUpdateService = context.read<StatusUpdateService>();

    return SliverAppBar.large(
      floating: true,
      centerTitle: false,
      forceElevated: innerBoxIsScrolled,
      leading: Icon(
        statusProvider.isServerConnected == true
            ? serversProvider.selectedServer!.enabled == true
                ? Icons.verified_user_rounded
                : Icons.gpp_bad_rounded
            : Icons.shield_rounded,
        size: 30,
        color: statusProvider.isServerConnected == true
            ? serversProvider.selectedServer!.enabled == true
                ? convertColor(serversProvider.colors, Colors.green)
                : convertColor(serversProvider.colors, Colors.red)
            : Colors.grey,
      ),
      title: InkWell(
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
                  enabled: !statusProvider.isServerConnected,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serversProvider.selectedServer!.alias,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        serversProvider.selectedServer!.address,
                        style: TextStyle(
                          color: Theme.of(context).listTileTheme.textColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.sync_alt_rounded,
                color: Theme.of(context).listTileTheme.textColor,
              ),
            ],
          ),
        ),
      ),
      actions: [
        PopupMenuButton(
          splashRadius: 20,
          itemBuilder: (context) => _buildPopupMenuItems(
            context,
            appConfigProvider,
            statusProvider,
            serversProvider,
          ),
        ),
      ],
    );
  }

  /// Builds a list of popup menu items to be displayed in the app bar menu.
  ///
  /// The menu content is dynamically determined based on the current server
  /// selection and connection status:
  ///
  /// - If no server is selected:
  ///   - Provides an option to select a server.
  /// - If a server is selected and connected:
  ///   - Provides options to refresh the status, open the web panel, or change the server.
  /// - If a server is selected but not connected:
  ///   - Provides options to try reconnecting or change the server.
  ///
  /// Parameters:
  /// - [context]: The build context used for localization and navigation.
  /// - [appConfigProvider]: The app configuration provider used for error handling.
  /// - [statusProvider]: The status provider to read the current server connection status.
  /// - [serversProvider]: The servers provider to access the selected server.
  ///
  /// Returns:
  /// A list of [PopupMenuEntry] widgets to be shown in the popup menu.
  List<PopupMenuEntry<void>> _buildPopupMenuItems(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
    ServersProvider serversProvider,
  ) {
    final isServerSelected = serversProvider.selectedServer != null;
    final isConnected = statusProvider.isServerConnected == true;

    if (!isServerSelected) {
      return [
        PopupMenuItem(
          onTap: () => _changeServer(context),
          child: _menuItem(
            Icons.storage_rounded,
            AppLocalizations.of(context)!.selectServer,
          ),
        ),
      ];
    }

    if (isConnected) {
      return [
        PopupMenuItem(
          onTap: () => _refresh(
            context,
            appConfigProvider,
            statusProvider,
            serversProvider,
          ),
          child:
              _menuItem(Icons.refresh, AppLocalizations.of(context)!.refresh),
        ),
        PopupMenuItem(
          onTap: () => openUrl(
            '${serversProvider.selectedServer!.address}/admin/',
          ),
          child:
              _menuItem(Icons.web, AppLocalizations.of(context)!.openWebPanel),
        ),
        PopupMenuItem(
          onTap: () => _changeServer(context),
          child: _menuItem(
            Icons.storage_rounded,
            AppLocalizations.of(context)!.changeServer,
          ),
        ),
      ];
    }

    return [
      PopupMenuItem(
        onTap: () => _refresh(
          context,
          appConfigProvider,
          statusProvider,
          serversProvider,
        ),
        child: _menuItem(
          Icons.refresh_rounded,
          AppLocalizations.of(context)!.tryReconnect,
        ),
      ),
      PopupMenuItem(
        onTap: () => _changeServer(context),
        child: _menuItem(
          Icons.storage_rounded,
          AppLocalizations.of(context)!.changeServer,
        ),
      ),
    ];
  }

  /// Returns a standard icon + label row used in popup menu items.
  Widget _menuItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 15),
        Text(label),
      ],
    );
  }

  /// Refreshes the real-time status of the currently selected server and updates the UI accordingly.
  ///
  /// This method performs the following actions:
  ///
  /// 1. Sets the main status loading indicator to `loading`.
  /// 2. Attempts to fetch the latest real-time status from the currently selected API gateway.
  /// 3. If the status fetch is successful:
  ///    - Updates the server's enabled/disabled status in the server provider.
  ///    - Marks the server as connected.
  ///    - Updates the real-time status in the status provider.
  /// 4. If the status fetch fails:
  ///    - Logs a warning message.
  ///    - Marks the server as disconnected.
  ///    - If the loading indicator is still `loading`, sets it to `error`.
  ///    - Displays an error snackbar to notify the user.
  ///
  /// UI updates are performed only if the [context] is still mounted.
  ///
  /// Parameters:
  /// - [context]: The build context used to show error messages and update the UI.
  /// - [appConfigProvider]: The application configuration provider used to access app settings.
  /// - [statusProvider]: The status provider used to manage the current status of the server
  /// - [serversProvider]: The servers provider used to access the currently selected server and its API gateway.
  ///
  /// Returns:
  /// A [Future] that completes when the refresh operation is done.
  Future<void> _refresh(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
    ServersProvider serversProvider,
  ) async {
    statusProvider.setStatusLoading(LoadStatus.loading);

    final result = await serversProvider.selectedApiGateway
        ?.realtimeStatus(clientCount: 0);
    if (!context.mounted) return;

    if (result?.result == APiResponseType.success) {
      serversProvider.updateselectedServerStatus(
        result!.data!.status == 'enabled' ? true : false,
      );
      statusProvider.setIsServerConnected(true);
      statusProvider.setRealtimeStatus(result.data!);
    } else {
      logger.w(
        'Error while fetching server status: ${result?.result.name}',
      );
      statusProvider.setIsServerConnected(false);
      if (statusProvider.getStatusLoading == LoadStatus.loading) {
        statusProvider.setStatusLoading(LoadStatus.error);
      }
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.couldNotConnectServer,
      );
    }
  }

  /// Navigates to the [ServersPage] screen, allowing the user to change the current server.
  ///
  /// This function pushes a new route onto the navigation stack, displaying the [ServersPage].
  ///
  /// [context] - The build context used to navigate to the new page.
  void _changeServer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServersPage()),
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
    logger.w('Error while connecting to server: ${result?.result.name}');

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
