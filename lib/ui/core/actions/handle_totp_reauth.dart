import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/services/server_connection_service.dart';
import 'package:pi_hole_client/ui/core/ui/components/totp_input_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:provider/provider.dart';

/// Re-authenticates the selected server after a background refresh detected an
/// expired 2FA session (TotpRequiredException).
///
/// Prompts for a TOTP code via [ServerConnectionService.connect], which reconnects
/// and restarts auto-refresh on success.
///
/// Returns true only when the reconnect succeeded. On cancel or failure the
/// server is left in an error state, so the caller must not trigger a follow-up
/// refresh (which would re-detect the missing 2FA session and re-prompt).
Future<bool> handleTotpReauth(BuildContext context) async {
  final serversViewModel = context.read<ServersViewModel>();
  final server = serversViewModel.selectedServer;
  if (server == null) return false;

  // The user already cancelled 2FA for this server. Don't auto-prompt again
  if (serversViewModel.isTotpReauthDeclined(server.address)) return false;

  final statusViewModel = context.read<StatusViewModel>();

  final service = ServerConnectionService(
    context: context,
    appConfigViewModel: context.read<AppConfigViewModel>(),
    statusViewModel: statusViewModel,
    serversViewModel: serversViewModel,
    server: server,
    createBundle: context.read<CreateRepositoryBundle>(),
    resolveTotp: ({error}) => showTotpInputModal(context, error: error),
    useRootContextOnFailure: true,
    showModal: true,
  );

  await service.connect();
  return statusViewModel.getServerStatus == LoadStatus.loaded;
}
