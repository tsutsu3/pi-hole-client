import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

/// Shows the certificate [info] and asks the user whether to pin it.
/// Returns true when the user confirms.
Future<bool> showConfirmPinModal(
  BuildContext context,
  TlsCertificateInfo info,
) async {
  if (!context.mounted) return false;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      final loc = AppLocalizations.of(dialogContext);

      return CertificateDetailsDialog(
        title: loc.serverCertificateUpdatePinTitle,
        description: loc.serverCertificateUpdatePinHelp,
        certificateInfo: info,
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
      );
    },
  );

  return confirmed == true;
}
