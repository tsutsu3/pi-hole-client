import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/v6/totp_prompt_guard.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:provider/provider.dart';

/// Refreshes the selected server, in response to a user gesture (pull to
/// refresh, the app bar's refresh / try-reconnect action).
Future<void> refreshServerStatus(BuildContext context) async {
  final statusViewModel = Provider.of<StatusViewModel>(context, listen: false);
  final appConfigViewModel = Provider.of<AppConfigViewModel>(
    context,
    listen: false,
  );
  final serversViewModel = Provider.of<ServersViewModel>(
    context,
    listen: false,
  );

  final address = serversViewModel.selectedServer?.address;
  if (address != null) {
    context.read<TotpPromptGuard>().allowPrompt(address);
  }

  final success = await statusViewModel.refreshOnce();
  if (!context.mounted) return;

  if (!success) {
    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context).couldNotConnectServer,
    );
  }
}
