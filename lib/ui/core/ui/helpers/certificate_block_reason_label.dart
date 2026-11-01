import 'package:pi_hole_client/domain/use_cases/server_connection/certificate_check_usecase.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

extension CertificateBlockReasonLabel on CertificateBlockReason {
  /// The message that tells the user why a certificate check was blocked.
  String label(AppLocalizations loc) => switch (this) {
    CertificateBlockReason.invalidAddress => loc.invalidAddress,
    CertificateBlockReason.notTls => loc.serverCertificateHandshakeFailed,
    CertificateBlockReason.untrusted => loc.sslErrorLong,
  };
}
