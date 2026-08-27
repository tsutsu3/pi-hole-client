import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/transport_security_indicator.dart';

import '../../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../../testing/fakes/repositories/network/fake_certificate_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

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

  CertificateInspection makeInspection({
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

  ServersViewModel makeViewModel({CertificateInspection? inspection}) {
    return ServersViewModel(
      FakeServerRepository(),
      certificateRepository: FakeCertificateRepository(inspection: inspection),
    );
  }

  Future<void> pumpIndicator(
    WidgetTester tester,
    Server server, {
    CertificateInspection? inspection,
  }) async {
    await tester.pumpWidget(
      buildTestApp(
        TransportSecurityIndicator(server: server),
        serversViewModel: makeViewModel(inspection: inspection),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('TransportSecurityIndicator', () {
    testWidgets('shows HTTP label for http scheme', (tester) async {
      await pumpIndicator(tester, makeServer(address: 'http://pi.hole'));
      expect(find.text('HTTP'), findsOneWidget);
    });

    testWidgets('shows cert-ignored icon when ignoreCertificateErrors=true', (
      tester,
    ) async {
      await pumpIndicator(
        tester,
        makeServer(address: 'https://pi.hole', ignoreCertificateErrors: true),
      );
      expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
    });

    testWidgets('shows unknown icon when not yet inspected', (tester) async {
      await pumpIndicator(tester, makeServer(address: 'https://pi.hole'));
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
    });

    testWidgets('trusted cert without pin shows verified icon', (tester) async {
      await pumpIndicator(
        tester,
        makeServer(address: 'https://pi.hole'),
        inspection: makeInspection(trusted: true),
      );
      expect(find.byIcon(Icons.verified_user), findsOneWidget);
    });

    testWidgets('trusted cert with pin shows pinned icon', (tester) async {
      await pumpIndicator(
        tester,
        makeServer(
          address: 'https://pi.hole',
          pinnedCertificateSha256: 'aa:bb:cc',
        ),
        inspection: makeInspection(trusted: true),
      );
      expect(find.byIcon(Icons.push_pin), findsOneWidget);
    });

    testWidgets('untrusted cert blocked shows gpp_bad icon', (tester) async {
      await pumpIndicator(
        tester,
        makeServer(address: 'https://pi.hole'),
        inspection: makeInspection(trusted: false),
      );
      expect(find.byIcon(Icons.gpp_bad), findsOneWidget);
    });

    testWidgets('untrusted cert with mismatching pin shows error icon', (
      tester,
    ) async {
      await pumpIndicator(
        tester,
        makeServer(
          address: 'https://pi.hole',
          allowUntrustedCert: true,
          pinnedCertificateSha256: 'aa:bb:cc',
        ),
        inspection: makeInspection(sha256: 'dd:ee:ff', trusted: false),
      );
      expect(find.byIcon(Icons.error), findsOneWidget);
    });
  });
}
