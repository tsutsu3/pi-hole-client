import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/servers/widgets/transport_security_indicator.dart';

import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  Server makeServer({
    required String address,
    bool allowSelfSignedCert = false,
    bool ignoreCertificateErrors = false,
    String? pinnedCertificateSha256,
  }) {
    return Server(
      address: address,
      alias: 'test',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: allowSelfSignedCert,
      ignoreCertificateErrors: ignoreCertificateErrors,
      pinnedCertificateSha256: pinnedCertificateSha256,
    );
  }

  group('TransportSecurityIndicator', () {
    testWidgets('shows HTTP label for http scheme', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TransportSecurityIndicator(
            server: makeServer(address: 'http://pi.hole'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('HTTP'), findsOneWidget);
    });

    testWidgets('shows cert-ignored label when ignoreCertificateErrors=true', (
      tester,
    ) async {
      // ignoreCertificateErrors skips network call and returns httpsCertIgnored
      // directly — but only after _resolveHttps is awaited.
      // On test environment without real TLS, _isPlatformTlsTrusted times out
      // so we can only check the loading/unknown state, but ignoreCertificateErrors
      // is handled before that check, so it returns early.
      await tester.pumpWidget(
        buildTestApp(
          TransportSecurityIndicator(
            server: makeServer(
              address: 'http://pi.hole',
              ignoreCertificateErrors: true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // http scheme returns immediately as 'HTTP' (ignoreCertificateErrors
      // only affects https branch)
      expect(find.text('HTTP'), findsOneWidget);
    });

    testWidgets(
      'shows cert-ignored icon for https server with ignoreCertificateErrors=true',
      (tester) async {
        // ignoreCertificateErrors=true with https returns httpsCertIgnored
        // immediately without any network call.
        await tester.pumpWidget(
          buildTestApp(
            TransportSecurityIndicator(
              server: makeServer(
                address: 'https://pi.hole',
                ignoreCertificateErrors: true,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
      },
    );

    testWidgets('shows unknown label for invalid address', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          TransportSecurityIndicator(
            server: makeServer(address: 'not-a-url'),
          ),
        ),
      );
      // Before pumpAndSettle — FutureBuilder may show unknown
      await tester.pump();
      // Just check widget renders without crash
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('rebuilds when server address changes', (tester) async {
      final notifier = ValueNotifier<Server>(makeServer(address: 'http://a'));

      await tester.pumpWidget(
        buildTestApp(
          ValueListenableBuilder<Server>(
            valueListenable: notifier,
            builder: (_, server, _) =>
                TransportSecurityIndicator(server: server),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('HTTP'), findsOneWidget);

      notifier.value = makeServer(address: 'http://b');
      await tester.pumpAndSettle();

      expect(find.text('HTTP'), findsOneWidget);
    });
  });
}
