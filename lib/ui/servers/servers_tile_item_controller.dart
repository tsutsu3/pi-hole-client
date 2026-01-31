import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection_service.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/servers/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/delete_server_modal.dart';
import 'package:provider/provider.dart';

mixin ServersTileItemController<T extends StatefulWidget> on State<T> {
  /// Displays a modal dialog to confirm the deletion of the specified [server].
  ///
  /// This method schedules the display of a [DeleteServerModal] after the current frame,
  /// ensuring that the widget's [BuildContext] is still mounted before showing the dialog.
  /// The dialog is not dismissible by tapping outside its bounds.
  ///
  /// [server]: The server instance to be deleted, which will be passed to the modal.
  Future<void> showDeleteModal(Server server) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => DeleteServerModal(serverToDelete: server),
        barrierDismissible: false,
      );
    });
  }

  /// Displays the edit server modal or navigates to the edit server page based on the given [width].
  ///
  /// If [width] is greater than [ResponsiveConstants.medium], a fullscreen dialog is shown for editing the [server].
  /// Otherwise, navigates to a new page for editing the [server].
  ///
  /// The [server] parameter is the server to be edited, or `null` to add a new server.
  /// This method ensures the widget is still mounted before performing navigation or showing dialogs.
  ///
  /// Uses [AddServerFullscreen] widget for both dialog and page presentations.
  Future<void> showEditModalOrPage(Server? server, double width) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

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
    });
  }

  /// Sets the given [server] as the default server asynchronously.
  ///
  /// If the operation is successful, a success snackbar is shown with a localized message.
  /// If the operation fails, an error snackbar is displayed with a corresponding message.
  ///
  /// [server] - The [Server] instance to be set as the default server.
  Future<void> setDefaultServer(Server server) async {
    final serversProvider = context.read<ServersProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();

    final result = await serversProvider.setDefaultServer(server);

    if (!mounted) return;

    if (result == true) {
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.connectionDefaultSuccessfully,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.connectionDefaultFailed,
      );
    }
  }

  /// Attempts to connect to the specified [server].
  ///
  /// This method performs the following steps:
  /// - Shows a modal indicating the connection process has started.
  /// - Initiates a login query to the API gateway for the given [server].
  /// - If the connection is successful:
  ///   - Updates the connection status to connected.
  ///   - Closes the process modal.
  ///   - Displays a success snackbar notification.
  ///   - If no server is currently selected and the selected tab is 1,
  ///     switches to tab 4.
  ///   - Sets the selected server in the provider with updated properties.
  ///   - Starts a background task to handle additional connection setup.
  /// - If the connection fails:
  ///   - Closes the process modal.
  ///   - Displays an error snackbar notification.
  ///
  /// This method ensures UI feedback is provided throughout the connection
  /// process and handles state updates accordingly.
  ///
  /// Throws no exceptions directly, but relies on provider and service methods
  /// for error handling.
  Future<void> connectToServer(Server server) async {
    final serversProvider = context.read<ServersProvider>();
    final statusProvider = context.read<StatusProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();
    final statusUpdateService = context.read<StatusUpdateService>();

    final service = ServerConnectionService(
      context: context,
      appConfigProvider: appConfigProvider,
      statusProvider: statusProvider,
      serversProvider: serversProvider,
      statusUpdateService: statusUpdateService,
      server: server,
      showModal: true,
      useRootContextOnFailure: true,
    );

    await service.connect();
  }
}
