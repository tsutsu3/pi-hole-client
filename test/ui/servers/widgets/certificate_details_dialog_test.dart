import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  final certInfo = TlsCertificateInfo(
    sha256: 'AA:BB:CC:DD',
    subject: 'CN=pi.hole',
    issuer: 'CN=My CA',
    startValidity: DateTime(2024, 1, 1),
    endValidity: DateTime(2025, 1, 1),
  );

  group('CertificateDetailsDialog', () {
    testWidgets('renders title and certificate fields', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          CertificateDetailsDialog(
            title: 'Server Certificate',
            certificateInfo: certInfo,
          ),
        ),
      );

      expect(find.text('Server Certificate'), findsOneWidget);
      expect(find.text('SHA-256'), findsOneWidget);
      expect(find.text('AA:BB:CC:DD'), findsOneWidget);
      expect(find.text('Subject'), findsOneWidget);
      expect(find.text('CN=pi.hole'), findsOneWidget);
      expect(find.text('Issuer'), findsOneWidget);
      expect(find.text('CN=My CA'), findsOneWidget);
      expect(find.text('Valid from'), findsOneWidget);
      expect(find.text('Valid until'), findsOneWidget);
    });

    testWidgets('renders description when provided', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          CertificateDetailsDialog(
            title: 'Certificate',
            certificateInfo: certInfo,
            description: 'Please verify this certificate.',
          ),
        ),
      );

      expect(find.text('Please verify this certificate.'), findsOneWidget);
    });

    testWidgets('does not render description when null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          CertificateDetailsDialog(
            title: 'Certificate',
            certificateInfo: certInfo,
          ),
        ),
      );

      expect(find.text('Please verify this certificate.'), findsNothing);
    });

    testWidgets('renders action buttons when provided', (tester) async {
      var closeTapped = false;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => CertificateDetailsDialog(
              title: 'Certificate',
              certificateInfo: certInfo,
              actions: [
                TextButton(
                  onPressed: () => closeTapped = true,
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Close'), findsOneWidget);
      await tester.tap(find.text('Close'));
      await tester.pump();
      expect(closeTapped, isTrue);
    });

    testWidgets('confirm + cancel actions', (tester) async {
      var cancelled = false;
      var confirmed = false;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => CertificateDetailsDialog(
              title: 'Update Pin',
              description: 'Confirm the new certificate.',
              certificateInfo: certInfo,
              actions: [
                TextButton(
                  onPressed: () => cancelled = true,
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => confirmed = true,
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Cancel'));
      await tester.pump();
      expect(cancelled, isTrue);
      expect(confirmed, isFalse);

      await tester.tap(find.text('Confirm'));
      await tester.pump();
      expect(confirmed, isTrue);
    });
  });
}
