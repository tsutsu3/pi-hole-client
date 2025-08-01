import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';

Future<dynamic> refreshServerStatus(BuildContext context) async {
  final statusProvider = Provider.of<StatusProvider>(context, listen: false);
  final serversProvider = Provider.of<ServersProvider>(context, listen: false);
  final appConfigProvider =
      Provider.of<AppConfigProvider>(context, listen: false);
  final apiGateway = serversProvider.selectedApiGateway;

  final result = await apiGateway?.realtimeStatus(clientCount: 0);
  if (!context.mounted) return;
  if (result?.result == APiResponseType.success) {
    serversProvider.updateselectedServerStatus(
      result!.data?.status == 'enabled' ? true : false,
    );
    statusProvider.setServerStatus(LoadStatus.loaded);
    statusProvider.setRealtimeStatus(result.data!);
  } else if (result?.result == APiResponseType.sslError) {
    logger.w(
      'SSL Error while fetching server status',
    );
    statusProvider.setServerStatus(LoadStatus.error);
    if (statusProvider.getStatusLoading == LoadStatus.loading) {
      statusProvider.setStatusLoading(LoadStatus.error);
    }
    showErrorSnackBar(
      context: context,
      appConfigProvider: appConfigProvider,
      label: AppLocalizations.of(context)!.sslErrorShort,
    );
  } else {
    logger.w(
      'Error while fetching server status: ${result?.result.name}',
    );
    statusProvider.setServerStatus(LoadStatus.error);
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
