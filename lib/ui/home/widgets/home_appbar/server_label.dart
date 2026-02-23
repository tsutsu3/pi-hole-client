import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection_service.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar/switch_server_modal.dart';
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
    final isServerLoading = context.select<StatusViewModel, bool>(
      (p) => p.isServerLoading,
    );

    final serversViewModel = context.watch<ServersViewModel>();
    final statusViewModel = context.read<StatusViewModel>();
    final appConfigViewModel = context.read<AppConfigViewModel>();

    return InkWell(
      onTap: () {
        _openSwitchServerModal(
          context,
          appConfigViewModel,
          statusViewModel,
          serversViewModel,
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
  /// - [appConfigViewModel]: The provider for application configuration.
  /// - [statusViewModel]: The provider for server status.
  /// - [serversViewModel]: The provider for the list of servers.
  /// - [statusViewModel]: The view model responsible for server status updates.
  void _openSwitchServerModal(
    BuildContext context,
    AppConfigViewModel appConfigViewModel,
    StatusViewModel statusViewModel,
    ServersViewModel serversViewModel,
  ) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) => SwitchServerModal(
        onServerSelect: (server) async {
          Navigator.pop(dialogContext);

          final service = ServerConnectionService(
            context: context,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
            serversViewModel: serversViewModel,
            server: server,
            secureStorageService: context.read<SecureStorageService>(),
            createBundle: context.read<CreateRepositoryBundle>(),
          );

          await service.connect();
        },
      ),
    );
  }
}

class _ServerLabelText extends StatelessWidget {
  const _ServerLabelText();

  @override
  Widget build(BuildContext context) {
    final alias = context.select<ServersViewModel, String>(
      (p) => p.selectedServer?.alias ?? '',
    );
    final address = context.select<ServersViewModel, String>(
      (p) => p.selectedServer?.address ?? '',
    );
    final serversViewModel = context.watch<ServersViewModel>();
    final selectedServer = serversViewModel.selectedServer;
    final hasUnverifiedCert =
        selectedServer != null &&
        serversViewModel.serversWithUnverifiedCertificates.any(
          (s) => s.address == selectedServer.address,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(alias, style: const TextStyle(fontSize: 20)),
            if (hasUnverifiedCert) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.warning_rounded,
                color: Theme.of(context).extension<AppColors>()!.queryOrange,
                size: 16,
              ),
            ],
          ],
        ),
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
