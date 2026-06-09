import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/ui/core/services/server_connection_service.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> handleCertificateRecovery(
  BuildContext context,
  Exception error,
) async {
  final serversViewModel = Provider.of<ServersViewModel>(
    context,
    listen: false,
  );
  final server = serversViewModel.selectedServer;
  if (server == null) return;

  final service = ServerConnectionService(
    context: context,
    appConfigViewModel: Provider.of<AppConfigViewModel>(context, listen: false),
    statusViewModel: Provider.of<StatusViewModel>(context, listen: false),
    serversViewModel: serversViewModel,
    server: server,
    createBundle: Provider.of<CreateRepositoryBundle>(context, listen: false),
  );

  await service.showCertificateErrorRecovery(error);
}
