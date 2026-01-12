import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:pi_hole_client/utils/logger.dart';

int getAndroidVersion() {
  if (Platform.isAndroid) {
    final version = Platform.version.split('.').first;
    return int.tryParse(version) ?? -1;
  }
  return -1;
}

String convertTemperatureUnit(String? unit) {
  switch (unit) {
    case 'C':
      return '℃';
    case 'F':
      return '℉';
    case 'K':
      return 'K';
    default:
      return '';
  }
}

/// Creates an instance of [HttpClient] with configurable certificate validation
/// and connection keep-alive behavior.
///
/// If [allowSelfSignedCert] is `true`, the client will install a
/// `badCertificateCallback`. This callback is only invoked when the platform's
/// default TLS validation fails. When invoked, the callback can allow the
/// connection based on [pinnedCertificateSha256].
///
/// If [keepAlive] is `true`, idle connections are kept open indefinitely
/// (by setting `idleTimeout` to `Duration.zero`).
/// If `false`, the default `HttpClient` idle timeout is used.
///
/// - [allowSelfSignedCert]: Whether to allow self-signed certificates. Defaults to `true`.
/// - [keepAlive]: Whether to keep idle connections alive indefinitely. Defaults to `false`.
///
/// Returns an instance of [HttpClient].
HttpClient createHttpClient({
  bool allowSelfSignedCert = true,
  bool keepAlive = false,
  String? pinnedCertificateSha256,
}) {
  final client = HttpClient();

  client.maxConnectionsPerHost = 4;

  if (keepAlive) {
    client.idleTimeout = Duration.zero;
  }
  if (allowSelfSignedCert) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => _isCertificatePinned(
          pinnedCertificateSha256: pinnedCertificateSha256,
          certificateSha256: sha256.convert(cert.der).toString(),
          host: host,
          port: port,
        );
  }
  return client;
}

final Set<String> _loggedTlsDecisions = <String>{};

bool _isCertificatePinned({
  required String? pinnedCertificateSha256,
  required String certificateSha256,
  required String host,
  required int port,
}) {
  if (pinnedCertificateSha256 == null || pinnedCertificateSha256.isEmpty) {
    final logKey = 'untrusted-allowed:$host:$port';
    if (_loggedTlsDecisions.add(logKey)) {
      logger.w(
        'TLS validation failed for $host:$port; allowing untrusted certificate because no pin is set (legacy allowSelfSignedCert behavior).',
      );
    }
    // Backward compatible behavior: allow untrusted certificates when explicitly enabled.
    // Prefer certificate pinning to avoid accepting arbitrary self-signed certificates.
    return true;
  }

  String normalize(String value) => value.replaceAll(':', '').toLowerCase().trim();
  final matched =
      normalize(pinnedCertificateSha256) == normalize(certificateSha256);
  final logKey = 'pin-check:$host:$port:${normalize(pinnedCertificateSha256)}';
  if (_loggedTlsDecisions.add(logKey)) {
    logger.i(
      'TLS validation failed for $host:$port; using certificate pin check (matched=$matched).',
    );
  }
  return matched;
}
