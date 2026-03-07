import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';

Future<void> deleteAdlist({
  required BuildContext context,
  required AdlistsViewModel viewModel,
  required AppConfigViewModel appConfigViewModel,
  required Adlist adlist,
}) async {
  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.deleting);

  try {
    await viewModel.deleteAdlist.runAsync(adlist);

    if (!context.mounted) return;
    process.close();

    await Navigator.maybePop(context);

    if (!context.mounted) return;
    showSuccessSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.adlistRemoved,
    );
  } catch (_) {
    if (!context.mounted) return;
    process.close();

    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.adlistDeleteError,
    );
  }
}
