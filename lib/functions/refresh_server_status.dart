import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:provider/provider.dart';

Future<dynamic> refreshServerStatus(BuildContext context) async {
  final statusProvider = Provider.of<StatusProvider>(context, listen: false);
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider =
      Provider.of<AppConfigProvider>(context, listen: false);
  final apiGateway = serversProvider.selectedApiGateway;

  final result = await apiGateway?.realtimeStatus();
  if (!context.mounted) return;
  if (result?.result == APiResponseType.success) {
    serversProvider.updateselectedServerStatus(
      result!.data?.status == 'enabled' ? true : false,
    );
    statusProvider.setIsServerConnected(true);
    statusProvider.setRealtimeStatus(result.data!);
  } else if (result?.result == APiResponseType.sslError) {
    statusProvider.setIsServerConnected(false);
    if (statusProvider.getStatusLoading == LoadStatus.loading) {
      statusProvider.setStatusLoading(LoadStatus.error);
    }
    showErrorSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.sslErrorShort,
    );
  } else {
    statusProvider.setIsServerConnected(false);
    if (statusProvider.getStatusLoading == LoadStatus.loading) {
      statusProvider.setStatusLoading(LoadStatus.error);
    }
    showErrorSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.couldNotConnectServer,
    );
  }
}
