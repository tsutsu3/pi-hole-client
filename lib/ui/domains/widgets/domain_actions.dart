import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';

Future<void> deleteDomain({
  required BuildContext context,
  required DomainsViewModel viewModel,
  required AppConfigViewModel appConfigViewModel,
  required Domain domain,
}) async {
  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.deleting);

  try {
    await viewModel.deleteDomain.runAsync(domain);
    if (!context.mounted) return;
    process.close();

    showSuccessSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.domainRemoved,
    );
  } catch (_) {
    if (!context.mounted) return;
    process.close();

    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.errorRemovingDomain,
    );
  }
}
