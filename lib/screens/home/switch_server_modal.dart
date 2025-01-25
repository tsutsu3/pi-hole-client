import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class SwitchServerModal extends StatelessWidget {
  const SwitchServerModal({required this.onServerSelect, super.key});

  final void Function(Server) onServerSelect;

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);

    return AlertDialog(
      scrollable: true,
      title: Column(
        children: [
          Icon(
            Icons.storage_rounded,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(AppLocalizations.of(context)!.switchServer),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: serversProvider.getServersList.length * 72,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: serversProvider.getServersList.length,
          itemBuilder: (context, index) => Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.maybePop(context);
                onServerSelect(serversProvider.getServersList[index]);
              },
              child: CustomListTile(
                label: serversProvider.getServersList[index].alias,
                description: serversProvider.getServersList[index].address,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
          ],
        ),
      ],
    );
  }
}
