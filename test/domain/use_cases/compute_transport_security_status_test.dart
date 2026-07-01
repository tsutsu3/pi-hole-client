import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/use_cases/compute_transport_security_status.dart';

void main() {
  Server makeServer({
    required String address,
    bool allowUntrustedCert = false,
    bool ignoreCertificateErrors = false,
    String? pinnedCertificateSha256,
  }) {
    return Server(
      address: address,
      alias: 'test',
      apiVersion: 'v6',
      allowUntrustedCert: allowUntrustedCert,
      ignoreCertificateErrors: ignoreCertificateErrors,
      pinnedCertificateSha256: pinnedCertificateSha256,
    );
  }

  CertificateInspection obs({
    required bool trusted,
    String sha256 = 'aa:bb:cc',
  }) => CertificateInspection(
    sha256: sha256,
    subject: 'CN=pi.hole',
    issuer: 'CN=test',
    startValidity: DateTime(2020),
    endValidity: DateTime(2030),
    trustedByPlatform: trusted,
  );

  group('computeTransportSecurityStatus', () {
    test('http scheme returns http (no observation needed)', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(address: 'http://pi.hole'),
          null,
        ),
        TransportSecurityStatus.http,
      );
    });

    test('non-http/https scheme returns unknown', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(address: 'ftp://pi.hole'),
          null,
        ),
        TransportSecurityStatus.unknown,
      );
    });

    test('invalid address returns unknown', () {
      expect(
        computeTransportSecurityStatus(makeServer(address: 'not-a-url'), null),
        TransportSecurityStatus.unknown,
      );
    });

    test(
      'ignoreCertificateErrors returns certIgnored regardless of observation',
      () {
        expect(
          computeTransportSecurityStatus(
            makeServer(
              address: 'https://pi.hole',
              ignoreCertificateErrors: true,
            ),
            obs(trusted: true),
          ),
          TransportSecurityStatus.httpsCertIgnored,
        );
      },
    );

    test('https without observation returns unknown', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(address: 'https://pi.hole'),
          null,
        ),
        TransportSecurityStatus.unknown,
      );
    });

    test('trusted cert without pin returns verified', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(address: 'https://pi.hole'),
          obs(trusted: true),
        ),
        TransportSecurityStatus.httpsVerified,
      );
    });

    test('trusted cert with pin returns pinned', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(
            address: 'https://pi.hole',
            pinnedCertificateSha256: 'aa:bb:cc',
          ),
          obs(trusted: true),
        ),
        TransportSecurityStatus.httpsPinned,
      );
    });

    test('untrusted cert blocked when allowUntrustedCert is false', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(address: 'https://pi.hole'),
          obs(trusted: false),
        ),
        TransportSecurityStatus.httpsUntrustedBlocked,
      );
    });

    test('untrusted cert allowed without pin returns untrustedAllowed', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(address: 'https://pi.hole', allowUntrustedCert: true),
          obs(trusted: false),
        ),
        TransportSecurityStatus.httpsUntrustedAllowed,
      );
    });

    test('untrusted cert with matching pin returns pinned', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(
            address: 'https://pi.hole',
            allowUntrustedCert: true,
            pinnedCertificateSha256: 'aa:bb:cc',
          ),
          obs(sha256: 'aa:bb:cc', trusted: false),
        ),
        TransportSecurityStatus.httpsPinned,
      );
    });

    test('untrusted cert with mismatching pin returns pinMismatch', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(
            address: 'https://pi.hole',
            allowUntrustedCert: true,
            pinnedCertificateSha256: 'aa:bb:cc',
          ),
          obs(sha256: 'dd:ee:ff', trusted: false),
        ),
        TransportSecurityStatus.httpsPinMismatch,
      );
    });

    test('pin matching ignores colons and case', () {
      expect(
        computeTransportSecurityStatus(
          makeServer(
            address: 'https://pi.hole',
            allowUntrustedCert: true,
            pinnedCertificateSha256: 'AA:BB:CC',
          ),
          obs(sha256: 'aabbcc', trusted: false),
        ),
        TransportSecurityStatus.httpsPinned,
      );
    });
  });
}
