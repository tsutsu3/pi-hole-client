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

/// The certificate checks, the pin dialog and the pin update, shared by the
/// add/edit screen, the connection flow and the server list.
///
/// The rules live in [CertificateCheckUseCase]. This class adds the UI: the
/// pin dialog, the snackbars and the save of a new pin.
class CertificateTrustFlow {
  const CertificateTrustFlow({
    required this.appConfigViewModel,
    this.tlsCertFetcher = fetchTlsCertificateInfo,
  });

  final AppConfigViewModel appConfigViewModel;
  final TlsCertificateFetcher tlsCertFetcher;

  CertificateCheckUseCase get _check =>
      CertificateCheckUseCase(tlsCertFetcher: tlsCertFetcher);

  /// Checks the certificate of [server] before the add/edit screen saves it.
  /// Nothing is written to the DB.
  ///
  /// Returns the server to save (possibly with a pinned fingerprint), or null
  /// when the user cancels or the certificate is blocked. A snackbar tells the
  /// user why it was blocked.
  ///
  /// See [CertificateCheckUseCase.checkBeforeSave] for the rules.
  Future<Server?> checkBeforeSave(BuildContext context, Server server) async {
    if (!context.mounted) return null;

    final outcome = await _check.checkBeforeSave(
      server,
      confirmPin: (info) => showConfirmPinModal(context, info),
    );
    if (!context.mounted) return null;

    return _checkedServer(context, outcome);
  }

  /// Checks the certificate of [server] before connecting to it.
  ///
  /// When the user must pin the certificate first
  /// ([CertificateCheckUseCase.needsPinBeforeConnect]), the pin is asked and
  /// saved with [pinAndSave].
  ///
  /// Returns the server to connect to, or null when the user cancels or the
  /// pin is not saved.
  Future<Server?> checkBeforeConnect(
    BuildContext context,
    Server server,
    ServersViewModel serversViewModel,
  ) async {
    if (!context.mounted) return server;
    if (!await _check.needsPinBeforeConnect(server)) return server;
    if (!context.mounted) return null;

    return pinAndSave(context, server, serversViewModel);
  }

  /// Whether the current certificate of [server] differs from its pin.
  Future<bool> isPinMismatch(Server server) =>
      _check.hasConfirmedPinMismatch(server);

  /// Asks the user to pin the current certificate of [server], then saves the
  /// new pin with [ServersViewModel.editServer].
  ///
  /// Returns the saved server, or null when the user cancels or the save
  /// fails. A snackbar tells the user the result of the save.
  Future<Server?> pinAndSave(
    BuildContext context,
    Server server,
    ServersViewModel serversViewModel,
  ) async {
    final outcome = await _check.repin(
      server,
      confirmPin: (info) => showConfirmPinModal(context, info),
    );
    if (!context.mounted) return null;

    final updated = _checkedServer(context, outcome);
    if (updated == null) return null;

    try {
      await serversViewModel.editServer.runAsync(updated);
    } catch (e, s) {
      logger.e('Failed to save pinned certificate', error: e, stackTrace: s);
    }
    if (!context.mounted) return null;

    final loc = AppLocalizations.of(context);
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

  /// Returns the checked server, or null when the check was cancelled or
  /// blocked. A blocked check shows the reason in a snackbar.
  Server? _checkedServer(
    BuildContext context,
    CertificateCheckOutcome outcome,
  ) {
    switch (outcome) {
      case CertificateResolved(:final server):
        return server;
      case CertificateCancelled():
        return null;
      case CertificateBlocked(:final reason):
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: reason.label(AppLocalizations.of(context)),
        );

        return null;
    }
  }
}
