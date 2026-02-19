import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:provider/provider.dart';

Future<dynamic> refreshServerStatus(BuildContext context) async {
  final statusUpdateService = Provider.of<StatusUpdateService>(
    context,
    listen: false,
  );
  final appConfigViewModel = Provider.of<AppConfigViewModel>(
    context,
    listen: false,
  );

  final success = await statusUpdateService.refreshOnce();
  if (!context.mounted) return;

  if (!success) {
    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.couldNotConnectServer,
    );
  }
}
