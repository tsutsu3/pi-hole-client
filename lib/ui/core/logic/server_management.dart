import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:provider/provider.dart';

Future<void> enableServer(BuildContext context) async {
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider = Provider.of<AppConfigProvider>(
    context,
    listen: false,
  );
  final bundle = Provider.of<RepositoryBundle?>(context, listen: false);
  if (bundle == null) return;

  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.enablingServer);
  final result = await bundle.dns.enableBlocking();
  process.close();

  if (!context.mounted) return;

  result.fold(
    (blocking) {
      serversProvider.updateselectedServerStatus(
        blocking.status == DnsBlockingStatus.enabled,
      );
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.serverEnabled,
      );
    },
    (error) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.couldntEnableServer,
      );
    },
  );
}

Future<void> disableServer(int time, BuildContext context) async {
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider = Provider.of<AppConfigProvider>(
    context,
    listen: false,
  );
  final bundle = Provider.of<RepositoryBundle?>(context, listen: false);
  if (bundle == null) return;

  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context)!.disablingServer);
  final result = await bundle.dns.disableBlocking(time);
  process.close();

  if (!context.mounted) return;

  result.fold(
    (blocking) {
      serversProvider.updateselectedServerStatus(false);
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.serverDisabled,
      );
    },
    (error) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.couldntDisableServer,
      );
    },
  );
}
