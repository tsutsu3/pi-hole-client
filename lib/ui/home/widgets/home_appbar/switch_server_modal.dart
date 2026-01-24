import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:provider/provider.dart';

class SwitchServerModal extends StatelessWidget {
  const SwitchServerModal({required this.onServerSelect, super.key});

  final void Function(Server) onServerSelect;

  Widget? _buildCertStatusIcon(BuildContext context, Server server) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final colorScheme = Theme.of(context).extension<AppColors>()!;

    if (serversProvider.serversWithUnverifiedCertificates.any(
      (s) => s.address == server.address,
    )) {
      return Icon(
        Icons.warning_rounded,
        color: colorScheme.queryOrange,
        size: 16,
      );
    }
    return null;
  }

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
                trailing: _buildCertStatusIcon(
                  context,
                  serversProvider.getServersList[index],
                ),
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
