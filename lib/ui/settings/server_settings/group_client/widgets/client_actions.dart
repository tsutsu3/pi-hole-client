import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/clients_viewmodel.dart';

Future<void> deleteClient({
  required BuildContext context,
  required ClientsViewModel viewModel,
  required AppConfigViewModel appConfigViewModel,
  required ManagedClient client,
}) async {
  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.deleting);

  try {
    await viewModel.deleteClient.runAsync(client);
    if (!context.mounted) return;

    showSuccessSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.clientRemoved,
    );
  } catch (_) {
    if (!context.mounted) return;

    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.clientRemoveFailed,
    );
  } finally {
    process.close();
  }
}
