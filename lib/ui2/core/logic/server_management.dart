import 'package:flutter/material.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui2/core/ui/modals/process_modal.dart';
import 'package:provider/provider.dart';

Future<void> enableServer(BuildContext context) async {
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider =
      Provider.of<AppConfigProvider>(context, listen: false);
  final apiGateway = serversProvider.selectedApiGateway;

  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.enablingServer);
  final result = await apiGateway?.enableServerRequest();
  process.close();

  if (!context.mounted) return;

  if (result?.result == APiResponseType.success) {
    serversProvider.updateselectedServerStatus(true);
    showSuccessSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.serverEnabled,
    );
  } else {
    showErrorSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.couldntEnableServer,
    );
  }
}

Future<void> disableServer(int time, BuildContext context) async {
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider =
      Provider.of<AppConfigProvider>(context, listen: false);
  final apiGateway = serversProvider.selectedApiGateway;

  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.disablingServer);
  final result = await apiGateway?.disableServerRequest(time);
  process.close();
  if (!context.mounted) return;
  if (result?.result == APiResponseType.success) {
    serversProvider.updateselectedServerStatus(false);
    showSuccessSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.serverDisabled,
    );
  } else {
    showErrorSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.couldntDisableServer,
    );
  }
}
