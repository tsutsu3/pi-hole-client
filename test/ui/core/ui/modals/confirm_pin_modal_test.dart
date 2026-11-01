import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/modals/confirm_pin_modal.dart';

import '../../../../../testing/fakes/services/fake_tls_certificate_fetcher.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('showConfirmPinModal', () {
    /// Opens the modal, taps [button] and returns the modal result.
    Future<bool> tapInModal(WidgetTester tester, String button) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
        ),
      );

      final result = showConfirmPinModal(ctx, fakeCertInfo());
      await tester.pumpAndSettle();

      expect(find.text('Update pinned fingerprint'), findsOneWidget);
      await tester.tap(find.text(button));
      await tester.pumpAndSettle();

      return result;
    }

    testWidgets('Confirm returns true', (tester) async {
      expect(await tapInModal(tester, 'Confirm'), isTrue);
    });

    testWidgets('Cancel returns false', (tester) async {
      expect(await tapInModal(tester, 'Cancel'), isFalse);
    });
  });
}
