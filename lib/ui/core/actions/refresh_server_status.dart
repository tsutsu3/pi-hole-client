import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';

Future<dynamic> refreshServerStatus(BuildContext context) async {
  final statusViewModel = Provider.of<StatusViewModel>(context, listen: false);
  final serversViewModel = Provider.of<ServersViewModel>(context, listen: false);
  final appConfigViewModel = Provider.of<AppConfigViewModel>(
    context,
    listen: false,
  );
  final apiGateway = serversViewModel.selectedApiGateway;

  final result = await apiGateway?.realtimeStatus(clientCount: 0);
  if (!context.mounted) return;
  if (result?.result == APiResponseType.success) {
    serversViewModel.updateselectedServerStatus(
      result!.data?.status == 'enabled' ? true : false,
    );
    statusViewModel.setServerStatus(LoadStatus.loaded);
    statusViewModel.setRealtimeStatus(result.data!);
  } else if (result?.result == APiResponseType.sslError) {
    logger.w('SSL Error while fetching server status');
    statusViewModel.setServerStatus(LoadStatus.error);
    if (statusViewModel.getStatusLoading == LoadStatus.loading) {
      statusViewModel.setStatusLoading(LoadStatus.error);
    }
    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.sslErrorShort,
    );
  } else {
    logger.w('Error while fetching server status: ${result?.result.name}');
    statusViewModel.setServerStatus(LoadStatus.error);
    if (statusViewModel.getStatusLoading == LoadStatus.loading) {
      statusViewModel.setStatusLoading(LoadStatus.error);
    }
    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: AppLocalizations.of(context)!.couldNotConnectServer,
    );
  }
}
