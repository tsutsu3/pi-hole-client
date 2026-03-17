import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';

class DeleteServerModal extends StatelessWidget {
  const DeleteServerModal({required this.serverToDelete, super.key});

  final Server serverToDelete;

  @override
  Widget build(BuildContext context) {
    final serversViewModel = Provider.of<ServersViewModel>(context);
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    Future<void> removeServer() async {
      try {
        await serversViewModel.removeServer.runAsync(serverToDelete.address);
      } catch (e, s) {
        logger.e('Failed to remove server', error: e, stackTrace: s);
      }

      if (!context.mounted) return;
      await Navigator.maybePop(context);
      if (!context.mounted) return;

      if (serversViewModel.removeServer.errors.value == null) {
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.connectionRemoved,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
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
