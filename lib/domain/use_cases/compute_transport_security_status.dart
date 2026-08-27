import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';

/// Derives the transport security status shown on a server tile.
///
/// Pure and synchronous: no network or I/O. Configuration-only cases
/// (HTTP, ignore-certificate-errors) resolve without an inspection. HTTPS
/// trust/pin cases need [inspection]; a `null` inspection means the live
/// certificate has not been seen yet and resolves to
/// [TransportSecurityStatus.unknown].
TransportSecurityStatus computeTransportSecurityStatus(
  Server server,
  CertificateInspection? inspection,
) {
  final uri = _tryParseUri(server.address);
  if (uri == null) return TransportSecurityStatus.unknown;

  switch (uri.scheme) {
    case 'http':
      return TransportSecurityStatus.http;
    case 'https':
      return _resolveHttps(server, inspection);
    default:
      return TransportSecurityStatus.unknown;
  }
}

TransportSecurityStatus _resolveHttps(
  Server server,
  CertificateInspection? inspection,
) {
  if (server.ignoreCertificateErrors) {
    return TransportSecurityStatus.httpsCertIgnored;
  }

  if (inspection == null) return TransportSecurityStatus.unknown;

  if (inspection.trustedByPlatform) {
    return server.pinnedCertificateSha256?.isNotEmpty == true
        ? TransportSecurityStatus.httpsPinned
        : TransportSecurityStatus.httpsVerified;
  }

  return _resolveHttpsUntrusted(server, inspection);
}

TransportSecurityStatus _resolveHttpsUntrusted(
  Server server,
  CertificateInspection inspection,
) {
  if (!server.allowUntrustedCert) {
    return TransportSecurityStatus.httpsUntrustedBlocked;
  }

  final pin = server.pinnedCertificateSha256;
  if (pin == null || pin.isEmpty) {
    return TransportSecurityStatus.httpsUntrustedAllowed;
  }

  return _pinMatches(pinnedSha256: pin, certificateSha256: inspection.sha256)
      ? TransportSecurityStatus.httpsPinned
      : TransportSecurityStatus.httpsPinMismatch;
}

bool _pinMatches({
  required String pinnedSha256,
  required String certificateSha256,
}) {
  String normalize(String value) =>
      value.replaceAll(':', '').toLowerCase().trim();
  return normalize(pinnedSha256) == normalize(certificateSha256);
}

Uri? _tryParseUri(String address) {
  try {
    return Uri.parse(address);
  } catch (_) {
    return null;
  }
}
