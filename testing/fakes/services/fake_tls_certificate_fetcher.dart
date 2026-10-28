import 'package:pi_hole_client/utils/tls_certificate.dart';

/// Returns a [TlsCertificateInfo] for tests.
TlsCertificateInfo fakeCertInfo({String sha256 = 'new:fingerprint'}) {
  return TlsCertificateInfo(
    sha256: sha256,
    subject: 'CN=pi.hole',
    issuer: 'CN=test',
    startValidity: DateTime(2020),
    endValidity: DateTime(2030),
  );
}

/// A recording [TlsCertificateFetcher] for the certificate-flow tests.
///
/// The strict probe (`allowBadCertificates: false`) returns [onStrict] or
/// throws [strictError]. The probe that accepts bad certificates returns
/// [onAllowBad] or throws [allowBadError].
class FakeTlsCertificateFetcher {
  FakeTlsCertificateFetcher({
    this.onStrict,
    this.strictError,
    this.onAllowBad,
    this.allowBadError,
  });

  final TlsCertificateInfo? onStrict;
  final Exception? strictError;
  final TlsCertificateInfo? onAllowBad;
  final Exception? allowBadError;
  int callCount = 0;

  Future<TlsCertificateInfo?> call(
    Uri uri, {
    required bool allowBadCertificates,
    Duration timeout = const Duration(seconds: 5),
  }) async {
    callCount++;

    if (!allowBadCertificates) {
      if (strictError != null) throw strictError!;
      return onStrict;
    }

    if (allowBadError != null) throw allowBadError!;
    return onAllowBad;
  }
}
