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

/// Creates an instance of [HttpClient] with an optional configuration to allow
/// self-signed certificates.
///
/// If [allowSelfSignedCert] is set to `true`, the client will accept all
/// certificates, including self-signed ones, by overriding the
/// `badCertificateCallback`. This can be useful for testing or connecting to
/// servers with self-signed certificates, but it should be used with caution
/// in production environments as it bypasses certificate validation.
///
/// - [allowSelfSignedCert]: A boolean flag indicating whether to allow
///   self-signed certificates. Defaults to `true`.
///
/// Returns an instance of [HttpClient].
HttpClient createHttpClient({bool allowSelfSignedCert = true}) {
  final client = HttpClient();
  if (allowSelfSignedCert) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
  return client;
}
