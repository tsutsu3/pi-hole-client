import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';

/// Function signature for [inspectTlsCertificate] so tests can inject a fake.
typedef TlsCertificateInspector =
    Future<CertificateInspection?> Function(Uri uri, {Duration timeout});

/// Inspects a server's live TLS certificate in a single handshake.
///
/// Always accepts the certificate so the descriptive fields and fingerprint can
/// be read; whether the platform's trust store would have accepted it is
/// recorded in [CertificateInspection.trustedByPlatform] (the `onBadCertificate`
/// callback only fires when validation fails).
///
/// Returns `null` for non-HTTPS URLs, timeouts, or any connection error.
Future<CertificateInspection?> inspectTlsCertificate(
  Uri uri, {
  Duration timeout = const Duration(seconds: 3),
}) async {
  if (uri.scheme != 'https') return null;

  final host = uri.host;
  final port = uri.hasPort ? uri.port : 443;

  var trustedByPlatform = true;
  SecureSocket? socket;
  try {
    socket = await SecureSocket.connect(
      host,
      port,
      timeout: timeout,
      onBadCertificate: (_) {
        trustedByPlatform = false;
        return true;
      },
    );
    final certificate = socket.peerCertificate;
    if (certificate == null) return null;
    return CertificateInspection(
      sha256: sha256.convert(certificate.der).toString(),
      subject: certificate.subject,
      issuer: certificate.issuer,
      startValidity: certificate.startValidity,
      endValidity: certificate.endValidity,
      trustedByPlatform: trustedByPlatform,
    );
  } catch (_) {
    return null;
  } finally {
    socket?.destroy();
  }
}
