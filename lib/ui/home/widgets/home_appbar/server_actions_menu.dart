import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/servers.dart';
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
/// - [ServersViewModel] for managing server selection.
/// - [StatusViewModel] for server connection status.
/// - [AppConfigViewModel] for app configuration and error handling.
class ServerActionsMenu extends StatelessWidget {
  const ServerActionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final serversViewModel = context.watch<ServersViewModel>();
    final statusViewModel = context.read<StatusViewModel>();
    final appConfigViewModel = context.read<AppConfigViewModel>();

    final isConnected = context.select<StatusViewModel, bool>(
      (p) => !p.isServerLoading,
    );
    final isServerSelected = context.select<ServersViewModel, bool>(
      (p) => p.selectedServer != null,
    );

    return PopupMenuButton(
      splashRadius: 20,
      itemBuilder: (context) => _buildPopupMenuItems(
        context,
        appConfigViewModel,
        statusViewModel,
        serversViewModel,
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
  /// - [appConfigViewModel]: The app configuration provider used for error handling.
  /// - [statusViewModel]: The status provider to read the current server connection status.
  /// - [serversViewModel]: The servers provider to access the selected server.
  ///
  /// Returns:
  /// A list of [PopupMenuEntry] widgets to be shown in the popup menu.
  List<PopupMenuEntry<void>> _buildPopupMenuItems(
    BuildContext context,
    AppConfigViewModel appConfigViewModel,
    StatusViewModel statusViewModel,
    ServersViewModel serversViewModel,
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
            appConfigViewModel,
            statusViewModel,
          ),
          child: _menuItem(
            Icons.refresh,
            AppLocalizations.of(context)!.refresh,
          ),
        ),
        PopupMenuItem(
          onTap: () =>
              openUrl('${serversViewModel.selectedServer!.address}/admin/'),
          child: _menuItem(
            Icons.web,
            AppLocalizations.of(context)!.openWebPanel,
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

    return [
      PopupMenuItem(
        onTap: () => _refresh(
          context,
          appConfigViewModel,
          statusViewModel,
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
    return Row(children: [Icon(icon), const SizedBox(width: 15), Text(label)]);
  }

  /// Refreshes the server status by delegating to [StatusViewModel].
  Future<void> _refresh(
    BuildContext context,
    AppConfigViewModel appConfigViewModel,
    StatusViewModel statusViewModel,
  ) async {
    final success = await statusViewModel.refreshOnce();
    if (!context.mounted) return;

    if (!success) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
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
