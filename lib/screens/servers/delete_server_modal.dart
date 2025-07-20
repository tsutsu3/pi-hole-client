import 'package:flutter/material.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui2/core/ui/modals/delete_modal.dart';
import 'package:provider/provider.dart';

class DeleteServerModal extends StatelessWidget {
  const DeleteServerModal({
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

      if (!context.mounted) return;
      await Navigator.maybePop(context);
      if (!context.mounted) return;

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

    return DeleteModal(
      title: AppLocalizations.of(context)!.remove,
      message: AppLocalizations.of(context)!.removeWarning,
      onDelete: removeServer,
      submessage: serverToDelete.address,
    );
  }
}
