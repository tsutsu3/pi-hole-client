import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/servers/server_tile_actions.dart';
import 'package:pi_hole_client/screens/servers/server_tile_header.dart';
import 'package:pi_hole_client/screens/servers/servers_tile_item_controller.dart';
import 'package:provider/provider.dart';

class ServersTileItem extends StatefulWidget {
  const ServersTileItem({
    required this.server,
    required this.index,
    required this.onChange,
    required this.breakingWidth,
    super.key,
  });

  final Server server;
  final int index;
  final void Function(int) onChange;
  final double breakingWidth;

  @override
  State<ServersTileItem> createState() => _ServersTileItemState();
}

class _ServersTileItemState extends State<ServersTileItem>
    with SingleTickerProviderStateMixin, ServersTileItemController {
  @override
  Widget build(BuildContext context) {
    final serversListSize = context.select<ServersProvider, int>(
      (p) => p.getServersList.length,
    );

    final width = MediaQuery.of(context).size.width;

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.xLarge ? 0.5 : 1,
      child: Card(
        margin: width > ResponsiveConstants.xLarge
            ? _generateMargins(serversListSize, widget.index)
            : const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ServerTileHeader(server: widget.server),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: ServerTileActions(
                server: widget.server,
                onConnect: () => connectToServer(widget.server),
                onEdit: () => showEditModalOrPage(widget.server, width),
                onDelete: () => showDeleteModal(widget.server),
                onSetDefault: () => setDefaultServer(widget.server),
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets _generateMargins(int serversListSize, int index) {
    if (index == 0) {
      return const EdgeInsets.only(top: 16, left: 16, right: 8, bottom: 8);
    }
    if (index == 1) {
      return const EdgeInsets.only(top: 16, left: 8, right: 16, bottom: 8);
    } else if (index == serversListSize - 1 && (index + 1).isEven) {
      return const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 16);
    } else if (index == serversListSize - 1 && (index + 1).isOdd) {
      return const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 16);
    } else {
      if ((index + 1).isEven) {
        return const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8);
      } else {
        return const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8);
      }
    }
  }
}
