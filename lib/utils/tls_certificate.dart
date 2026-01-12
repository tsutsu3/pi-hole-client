import 'dart:io';

import 'package:crypto/crypto.dart';

class TlsCertificateInfo {
  const TlsCertificateInfo({
    required this.sha256,
    required this.subject,
    required this.issuer,
    required this.startValidity,
    required this.endValidity,
  });

  final String sha256;
  final String subject;
  final String issuer;
  final DateTime startValidity;
  final DateTime endValidity;
}

/// Fetches the server TLS certificate SHA-256 fingerprint (if available).
///
/// This function performs a TLS handshake using [SecureSocket.connect] and returns
/// a SHA-256 hash of the server certificate DER bytes.
///
/// It returns `null` for non-HTTPS URLs or when the certificate cannot be obtained.
///
/// When [allowBadCertificates] is `true`, the TLS handshake will accept untrusted
/// certificates so the fingerprint can be displayed to the user for manual verification.
Future<TlsCertificateInfo?> fetchTlsCertificateInfo(
  Uri uri, {
  required bool allowBadCertificates,
  Duration timeout = const Duration(seconds: 5),
}) async {
  if (uri.scheme != 'https') return null;

  final host = uri.host;
  final port = uri.hasPort ? uri.port : 443;

  SecureSocket? socket;
  try {
    socket = await SecureSocket.connect(
      host,
      port,
      timeout: timeout,
      onBadCertificate: allowBadCertificates ? (_) => true : null,
    );
    final certificate = socket.peerCertificate;
    if (certificate == null) return null;
    return TlsCertificateInfo(
      sha256: sha256.convert(certificate.der).toString(),
      subject: certificate.subject,
      issuer: certificate.issuer,
      startValidity: certificate.startValidity,
      endValidity: certificate.endValidity,
    );
  } finally {
    socket?.destroy();
  }
}
