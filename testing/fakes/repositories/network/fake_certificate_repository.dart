import 'package:pi_hole_client/data/repositories/network/interfaces/certificate_repository.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';

class FakeCertificateRepository implements CertificateRepository {
  FakeCertificateRepository({this.inspection});

  /// Returned by [inspect]; `null` simulates a failed or timed-out handshake.
  CertificateInspection? inspection;

  int inspectCallCount = 0;
  Uri? lastInspectedUri;

  @override
  Future<CertificateInspection?> inspect(
    Uri uri, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    inspectCallCount++;
    lastInspectedUri = uri;
    return inspection;
  }
}
