import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:provider/provider.dart';

/// A widget that displays action buttons for a server tile, including options to
/// connect, edit, delete, or set the server as default. The actions are presented
/// in a popup menu, and the connection status is shown if the server is selected.
///
/// Parameters:
/// - [server]: The server object containing the address and status.
/// - [onConnect]: Callback function to handle connecting to the server.
/// - [onEdit]: Callback function to handle editing the server.
/// - [onDelete]: Callback function to handle deleting the server.
/// - [onSetDefault]: Callback function to set the server as default.
class ServerTileActions extends StatelessWidget {
  const ServerTileActions({
    required this.server,
    required this.onConnect,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault,
    super.key,
  });

  final Server server;
  final VoidCallback onConnect;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;

  @override
  Widget build(BuildContext context) {
    final isServerConnected = context.select<StatusProvider, bool>(
      (p) => p.isServerConnected,
    );
    final selectedServer = context.select<ServersProvider, Server?>(
      (p) => p.selectedServer,
    );

    final isSelected = selectedServer?.address == server.address;
    final loc = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PopupMenuButton(
          itemBuilder: (context) => [
            _buildMenuItem(
              icon: Icons.star,
              text: server.defaultServer == true
                  ? loc.defaultConnection
                  : loc.setDefault,
              enabled: server.defaultServer == false,
              onTap: server.defaultServer == false ? onSetDefault : null,
            ),
            _buildMenuItem(
              icon: Icons.edit,
              text: loc.edit,
              onTap: onEdit,
            ),
            _buildMenuItem(
              icon: Icons.delete,
              text: loc.delete,
              onTap: onDelete,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: isSelected
              ? _ConnectionStatus(
                  isConnected: isServerConnected,
                )
              : FilledButton.icon(
                  onPressed: onConnect,
                  icon: const Icon(Icons.login),
                  label: Text(loc.connect),
                ),
        ),
      ],
    );
  }

  PopupMenuItem<void> _buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    bool enabled = true,
  }) {
    return PopupMenuItem(
      enabled: enabled,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Expanded(child: Text(text, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}

/// A widget that displays the connection status of a server.
///
/// Shows an icon and a label indicating whether the server is connected or disconnected.
/// The icon and text color change based on the connection status.
///
/// Parameters:
/// - [isConnected]: Whether the server is currently connected.
class _ConnectionStatus extends StatelessWidget {
  const _ConnectionStatus({
    required this.isConnected,
  });

  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final connectedColor = appColors.queryGreen;
    final disconnectedColor = appColors.queryOrange;

    final color = isConnected ? connectedColor : disconnectedColor;
    final label = isConnected ? loc.connected : loc.selectedDisconnected;

    return Row(
      children: [
        Icon(isConnected ? Icons.check : Icons.warning, color: color),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
