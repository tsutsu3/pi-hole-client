import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/gateways/shared/models/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/servers/servers.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:provider/provider.dart';

/// A popup menu widget for server-related actions in the app bar.
///
/// The [ServerActionsMenu] displays a context-sensitive menu that allows users to:
/// - Select a server if none is selected.
/// - Refresh the server status, open the web panel, or change the server if a server is selected and connected.
/// - Try reconnecting or change the server if a server is selected but not connected.
///
/// The menu content is dynamically determined based on the current server selection and connection status.
/// This widget uses providers to access the current server, status, and app configuration.
///
/// Example usage:
/// ```dart
/// AppBar(
///   actions: [ServerActionsMenu()],
/// )
/// ```
///
/// See also:
/// - [ServersProvider] for managing server selection.
/// - [StatusProvider] for server connection status.
/// - [AppConfigProvider] for app configuration and error handling.
class ServerActionsMenu extends StatelessWidget {
  const ServerActionsMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final serversProvider = context.watch<ServersProvider>();
    final statusProvider = context.read<StatusProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();

    final isConnected = context.select<StatusProvider, bool>(
      (p) => !p.isServerLoading,
    );
    final isServerSelected = context.select<ServersProvider, bool>(
      (p) => p.selectedServer != null,
    );

    return PopupMenuButton(
      splashRadius: 20,
      itemBuilder: (context) => _buildPopupMenuItems(
        context,
        appConfigProvider,
        statusProvider,
        serversProvider,
        isConnected,
        isServerSelected,
      ),
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
    bool isConnected,
    bool isServerSelected,
  ) {
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
      statusProvider.setServerStatus(LoadStatus.loaded);
      statusProvider.setRealtimeStatus(result.data!);
    } else {
      logger.w(
        'Error while fetching server status: ${result?.result.name}',
      );
      statusProvider.setServerStatus(LoadStatus.error);
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
}
