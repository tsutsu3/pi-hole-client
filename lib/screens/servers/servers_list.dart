import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/servers/servers_tile_item.dart';
import 'package:provider/provider.dart';

class ServersList extends StatelessWidget {
  const ServersList({
    required this.context,
    required this.controllers,
    required this.onChange,
    required this.scrollController,
    required this.breakingWidth,
    super.key,
  });

  final BuildContext context;
  final List<ExpandableController> controllers;
  final Function(int) onChange;
  final ScrollController scrollController;
  final double breakingWidth;

  @override
  Widget build(BuildContext context) {
    final serversList = context.select<ServersProvider, List<Server>>(
      (p) => p.getServersList,
    );

    if (serversList.isNotEmpty) {
      return ListView(
        padding: const EdgeInsets.only(bottom: 80),
        children: [
          Wrap(
            children: serversList
                .asMap()
                .entries
                .map(
                  (s) => ServersTileItem(
                    breakingWidth: breakingWidth,
                    server: serversList[s.key],
                    index: s.key,
                    onChange: onChange,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 8),
        ],
      );
    } else {
      return SizedBox(
        height: double.maxFinite,
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.noSavedConnections,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }
  }
}
