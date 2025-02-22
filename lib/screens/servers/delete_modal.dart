// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:provider/provider.dart';

class DeleteModal extends StatelessWidget {
  const DeleteModal({
    required this.serverToDelete,
    super.key,
  });

  final Server serverToDelete;

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Future<void> removeServer() async {
      final deleted =
          await serversProvider.removeServer(serverToDelete.address);
      await Navigator.maybePop(context);
      if (deleted == true) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.connectionRemoved,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.connectionCannotBeRemoved,
        );
      }
    }

    return AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.delete,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppLocalizations.of(context)!.remove,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.removeWarning,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  serverToDelete.address,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => {Navigator.maybePop(context)},
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        TextButton(
          onPressed: removeServer,
          child: Text(AppLocalizations.of(context)!.remove),
        ),
      ],
    );
  }
}
