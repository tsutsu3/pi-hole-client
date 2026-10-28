import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/certificate_check_usecase.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/certificate_block_reason_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/confirm_pin_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';
import 'package:provider/provider.dart';

/// Asks the user to pin the current certificate of [server], then saves the
/// new pin with [ServersViewModel.editServer].
///
/// Returns the saved server, or null when the user cancels, the certificate
/// is blocked, or the save fails. A snackbar tells the user the result.
Future<Server?> pinAndSave(
  BuildContext context,
  Server server, {
  TlsCertificateFetcher tlsCertFetcher = fetchTlsCertificateInfo,
}) async {
  final appConfigViewModel = context.read<AppConfigViewModel>();
  final serversViewModel = context.read<ServersViewModel>();

  final outcome = await CertificateCheckUseCase(
    tlsCertFetcher: tlsCertFetcher,
  ).repin(server, confirmPin: (info) => showConfirmPinModal(context, info));
  if (!context.mounted) return null;

  final loc = AppLocalizations.of(context);
  final Server updated;
  switch (outcome) {
    case CertificateResolved(server: final pinned):
      updated = pinned;
    case CertificateCancelled():
      return null;
    case CertificateBlocked(:final reason):
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: reason.label(loc),
      );

      return null;
  }

  try {
    await serversViewModel.editServer.runAsync(updated);
  } catch (e, s) {
    logger.e('Failed to save pinned certificate', error: e, stackTrace: s);
  }
  if (!context.mounted) return null;

  if (serversViewModel.editServer.errors.value != null) {
    showErrorSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: loc.cantSaveConnectionData,
    );

    return null;
  }

  showSuccessSnackBar(
    context: context,
    appConfigViewModel: appConfigViewModel,
    label: loc.editServerSuccessfully,
  );

  return updated;
}
