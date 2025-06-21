import 'dart:io';

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
/// If [allowSelfSignedCert] is `true`, the client will accept all certificates,
/// including self-signed ones. Use with caution in production.
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
}) {
  final client = HttpClient();

  if (keepAlive) {
    client.idleTimeout = Duration.zero;
  }
  if (allowSelfSignedCert) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
  return client;
}
