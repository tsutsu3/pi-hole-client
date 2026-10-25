import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

/// The certificate pin dialog and pin update, shared by the add/edit screen,
/// the connection flow and the server list.
class CertificateTrustFlow {
  const CertificateTrustFlow({
    required this.appConfigViewModel,
    this.fetch = fetchTlsCertificateInfo,
  });

  final AppConfigViewModel appConfigViewModel;
  final TlsCertificateFetcher fetch;

  /// Shows the certificate of [uri] and asks the user to pin it.
  ///
  /// Returns the SHA-256 fingerprint the user confirmed, or null when the user
  /// cancels. When the certificate cannot be fetched, shows an error snackbar
  /// and returns null.
  Future<String?> confirmPin(BuildContext context, Uri uri) async {
    TlsCertificateInfo? info;
    try {
      // Bad certificates are accepted here, so a failure means the port does
      // not speak TLS (e.g. HTTPS on a plain HTTP port) or a proxy blocks it.
      info = await fetch(uri, allowBadCertificates: true);
    } catch (_) {
      info = null;
    }
    if (!context.mounted) return null;

    final loc = AppLocalizations.of(context);
    if (info == null) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.serverCertificateHandshakeFailed,
      );

      return null;
    }

    final certificateInfo = info;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => CertificateDetailsDialog(
        title: loc.serverCertificateUpdatePinTitle,
        description: loc.serverCertificateUpdatePinHelp,
        certificateInfo: certificateInfo,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(loc.confirm),
          ),
        ],
      ),
    );

    return confirmed == true ? certificateInfo.sha256 : null;
  }

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
    final uri = Uri.tryParse(server.address);
    if (uri == null || uri.scheme != 'https') return null;

    final pin = await confirmPin(context, uri);
    if (pin == null || !context.mounted) return null;

    final updated = server.copyWith(pinnedCertificateSha256: pin);
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
}
