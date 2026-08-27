import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/network/tls_certificate_repository.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';

void main() {
  CertificateInspection inspection({bool trusted = true}) =>
      CertificateInspection(
        sha256: 'aa:bb:cc',
        subject: 'CN=pi.hole',
        issuer: 'CN=test',
        startValidity: DateTime(2020),
        endValidity: DateTime(2030),
        trustedByPlatform: trusted,
      );

  group('TlsCertificateRepository', () {
    test('returns the inspector result', () async {
      final repo = TlsCertificateRepository(
        inspector: (uri, {timeout = const Duration(seconds: 5)}) async =>
            inspection(),
      );

      final result = await repo.inspect(Uri.parse('https://pi.hole'));

      expect(result, isNotNull);
      expect(result!.sha256, 'aa:bb:cc');
      expect(result.trustedByPlatform, true);
    });

    test('returns null when the inspector fails', () async {
      final repo = TlsCertificateRepository(
        inspector: (uri, {timeout = const Duration(seconds: 5)}) async => null,
      );

      expect(await repo.inspect(Uri.parse('https://pi.hole')), isNull);
    });

    test('forwards the uri and timeout to the inspector', () async {
      Uri? seenUri;
      Duration? seenTimeout;
      final repo = TlsCertificateRepository(
        inspector: (uri, {timeout = const Duration(seconds: 5)}) async {
          seenUri = uri;
          seenTimeout = timeout;
          return null;
        },
      );

      await repo.inspect(
        Uri.parse('https://pi.hole:8443'),
        timeout: const Duration(seconds: 3),
      );

      expect(seenUri, Uri.parse('https://pi.hole:8443'));
      expect(seenTimeout, const Duration(seconds: 3));
    });
  });
}
