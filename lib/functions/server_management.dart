// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';

void enableServer(BuildContext context) async {
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider =
      Provider.of<AppConfigProvider>(context, listen: false);
  final apiGateway = serversProvider.selectedApiGateway;

  final ProcessModal process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.enablingServer);
  final result =
      await apiGateway?.enableServerRequest(serversProvider.selectedServer!);
  process.close();
  if (result['result'] == 'success') {
    serversProvider.updateselectedServerStatus(true);
    showSnackBar(
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.serverEnabled,
        color: Colors.green);
  } else {
    showSnackBar(
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.couldntEnableServer,
        color: Colors.red);
  }
}

void disableServer(int time, BuildContext context) async {
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider =
      Provider.of<AppConfigProvider>(context, listen: false);
  final apiGateway = serversProvider.selectedApiGateway;

  final ProcessModal process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.disablingServer);
  final result = await apiGateway?.disableServerRequest(
      serversProvider.selectedServer!, time);
  process.close();
  if (!context.mounted) return;
  if (result['result'] == 'success') {
    serversProvider.updateselectedServerStatus(false);
    showSnackBar(
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.serverDisabled,
        color: Colors.green);
  } else {
    showSnackBar(
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.couldntDisableServer,
        color: Colors.red);
  }
}
