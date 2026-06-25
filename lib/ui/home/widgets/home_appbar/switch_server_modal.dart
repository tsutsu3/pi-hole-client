import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:provider/provider.dart';

class SwitchServerModal extends StatelessWidget {
  const SwitchServerModal({required this.onServerSelect, super.key});

  final void Function(Server) onServerSelect;

  Widget? _buildCertStatusIcon(BuildContext context, Server server) {
    final serversViewModel = Provider.of<ServersViewModel>(context);
    final colorScheme = Theme.of(context).extension<AppColors>()!;

    if (serversViewModel.serversWithUnverifiedCertificates.any(
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
    final serversViewModel = Provider.of<ServersViewModel>(context);

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
        height: serversViewModel.getServersList.length * 72,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: serversViewModel.getServersList.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(serversViewModel.getServersList[index].alias),
            subtitle: Text(serversViewModel.getServersList[index].address),
            trailing: _buildCertStatusIcon(
              context,
              serversViewModel.getServersList[index],
            ),
            onTap: () {
              Navigator.maybePop(context);
              onServerSelect(serversViewModel.getServersList[index]);
            },
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
