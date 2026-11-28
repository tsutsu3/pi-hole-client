import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/disable_duration_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
import 'package:provider/provider.dart';

Future<void> enableServer(BuildContext context) async {
  final serversViewModel = Provider.of<ServersViewModel>(
    context,
    listen: false,
  );
  final appConfigViewModel = Provider.of<AppConfigViewModel>(
    context,
    listen: false,
  );
  final bundle = Provider.of<RepositoryBundle?>(context, listen: false);
  if (bundle == null) return;

  final serverAddress = serversViewModel.selectedServer?.address;

  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context).enablingServer);
  final result = await bundle.dns.enableBlocking();
  process.close();

  if (!context.mounted) return;

  result.fold(
    (blocking) {
      serversViewModel.updateselectedServerStatus(
        blocking.status == DnsBlockingStatus.enabled,
      );
      showSuccessSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context).serverEnabled,
      );
    },
    (error) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context).couldntEnableServer,
      );
    },
  );

  if (result.isSuccess() && serverAddress != null) {
    await WidgetChannel.sendBlockingUpdated(serverAddress: serverAddress);
  }
}

Future<void> disableServer(int time, BuildContext context) async {
  final serversViewModel = Provider.of<ServersViewModel>(
    context,
    listen: false,
  );
  final appConfigViewModel = Provider.of<AppConfigViewModel>(
    context,
    listen: false,
  );
  final bundle = Provider.of<RepositoryBundle?>(context, listen: false);
  if (bundle == null) return;

  final serverAddress = serversViewModel.selectedServer?.address;

  if (await showDisableCooldownIfActive(context)) return;
  if (!context.mounted) return;

  final process = ProcessModal(context: context);
  process.open(AppLocalizations.of(context).disablingServer);
  final result = await bundle.dns.disableBlocking(time);
  process.close();
  if (result.isSuccess() && serverAddress != null) {
    await WidgetChannel.sendDisableRecorded(serverAddress);
  }

  if (!context.mounted) return;

  result.fold(
    (blocking) {
      serversViewModel.updateselectedServerStatus(false);
      showSuccessSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context).serverDisabled,
      );
    },
    (error) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context).couldntDisableServer,
      );
    },
  );

  if (result.isSuccess() && serverAddress != null) {
    await WidgetChannel.sendBlockingUpdated(serverAddress: serverAddress);
    if (time > 0) {
      await WidgetChannel.scheduleBlockingRefresh(
        serverAddress: serverAddress,
        delaySeconds: time,
      );
    }
  }
}

/// Disable limit (Advanced settings > Disable timers, Android only).
///
/// If Pi-hole on the selected server can't be disabled yet, shows how long
/// to wait and returns true.
Future<bool> showDisableCooldownIfActive(BuildContext context) async {
  final appConfigViewModel = Provider.of<AppConfigViewModel>(
    context,
    listen: false,
  );
  if (appConfigViewModel.disableCooldown <= 0) return false;
  final serverAddress = Provider.of<ServersViewModel>(
    context,
    listen: false,
  ).selectedServer?.address;
  if (serverAddress == null) return false;

  final remaining = await WidgetChannel.getDisableCooldownRemaining(
    serverAddress,
  );
  if (remaining == Duration.zero || !context.mounted) return false;

  showErrorSnackBar(
    context: context,
    appConfigViewModel: appConfigViewModel,
    label: AppLocalizations.of(
      context,
    ).disableCooldownActive(remainingTimeLabel(remaining)),
  );
  return true;
}
