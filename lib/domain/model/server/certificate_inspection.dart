import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_inspection.freezed.dart';

/// A single observation of a server's live TLS certificate.
///
/// Produced by one handshake: descriptive fields for display, plus
/// [trustedByPlatform] for the trust verdict. The transport security status is
/// derived from this by `computeTransportSecurityStatus`.
@freezed
sealed class CertificateInspection with _$CertificateInspection {
  const factory CertificateInspection({
    /// SHA-256 fingerprint of the certificate DER bytes.
    required String sha256,
    required String subject,
    required String issuer,
    required DateTime startValidity,
    required DateTime endValidity,

    /// Whether the platform's trust store accepted the certificate.
    required bool trustedByPlatform,
  }) = _CertificateInspection;
}
