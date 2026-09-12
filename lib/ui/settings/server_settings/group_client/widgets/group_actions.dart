import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';

Future<void> deleteGroup({
  required BuildContext context,
  required GroupsViewModel viewModel,
  required AppConfigViewModel appConfigViewModel,
  required Group group,
}) async {
  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.deleting);

  try {
    await viewModel.deleteGroup.runAsync(group);
    if (!context.mounted) return;

    showSuccessSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.groupRemoved,
    );
  } catch (_) {
    if (!context.mounted) return;

    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.groupRemoveFailed,
    );
  } finally {
    process.close();
  }
}
