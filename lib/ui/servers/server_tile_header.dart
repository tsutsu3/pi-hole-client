import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:provider/provider.dart';

/// A widget that displays the header section of a server tile, including:
///
/// - The server icon, which visually reflects the server's status:
///   - Green if selected and connected
///   - Orange if selected but disconnected
///   - With a star overlay if it's the default server
/// - The server's address and alias, styled according to the theme
///
/// Parameters:
/// - [server]: The server object containing the address, alias, and status.
class ServerTileHeader extends StatelessWidget {
  const ServerTileHeader({
    required this.server,
    super.key,
  });

  final Server server;

  @override
  Widget build(BuildContext context) {
    final selectedServer = context.select<ServersProvider, Server?>(
      (p) => p.selectedServer,
    );

    final isConnected = context.select<StatusProvider, bool>(
      (p) => p.getServerStatus == LoadStatus.loaded,
    );

    final isSelected = selectedServer?.address == server.address;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: _LeadingIcon(
                  isDefault: server.defaultServer,
                  isSelected: isSelected,
                  isConnected: isConnected,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      server.address,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 3),
                        Text(
                          server.alias,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A widget that displays a leading icon for a server tile, indicating its state.
///
/// The icon visually represents whether the server is the default, selected, and/or connected:
/// - If [isSelected] is true, the icon color changes to green if [isConnected] is true,
///   or orange if not connected.
/// - If [isDefault] is true, a small star icon is overlaid at the bottom right to indicate the default server.
///
/// Parameters:
/// - [isDefault]: Whether this server is the default server.
/// - [isSelected]: Whether this server is currently selected.
/// - [isConnected]: Whether this server is currently connected.
class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({
    required this.isDefault,
    required this.isSelected,
    required this.isConnected,
  });

  final bool isDefault;
  final bool isSelected;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final color = isSelected
        ? isConnected
            ? appColors.queryGreen
            : appColors.queryOrange
        : null;

    final icon = Icon(Icons.storage_rounded, color: color);

    if (!isDefault) return icon;

    return Stack(
      alignment: Alignment.center,
      children: [
        icon,
        SizedBox(
          width: 25,
          height: 25,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.star,
                  color: theme.colorScheme.onPrimaryContainer,
                  size: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
