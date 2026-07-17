import 'package:pi_hole_client/data/repositories/network/interfaces/certificate_repository.dart';
import 'package:pi_hole_client/data/services/network/tls_certificate_service.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';

/// [CertificateRepository] backed by a single TLS handshake.
class TlsCertificateRepository implements CertificateRepository {
  TlsCertificateRepository({TlsCertificateInspector? inspector})
    : _inspect = inspector ?? inspectTlsCertificate;

  final TlsCertificateInspector _inspect;

  @override
  Future<CertificateInspection?> inspect(
    Uri uri, {
    Duration timeout = const Duration(seconds: 3),
  }) {
    return _inspect(uri, timeout: timeout);
  }
}
