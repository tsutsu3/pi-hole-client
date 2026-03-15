import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_dialog.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';

import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('ProcessModal', () {
    testWidgets('open shows process dialog after delay', (tester) async {
      late ProcessModal modal;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              modal = ProcessModal(context: context);
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      // Open the modal
      modal.open('Loading...');

      // Before the delay, dialog should not be visible
      await tester.pump();
      expect(find.byType(ProcessDialog), findsNothing);

      // After the delay (100ms default), dialog should appear
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ProcessDialog), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);

      // Cleanup - close before test ends
      modal.close();
      await tester.pumpAndSettle();
    });

    testWidgets('close removes the dialog overlay', (tester) async {
      late ProcessModal modal;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              modal = ProcessModal(context: context);
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      modal.open('Working...');
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ProcessDialog), findsOneWidget);

      modal.close();
      await tester.pump();
      expect(find.byType(ProcessDialog), findsNothing);
    });

    testWidgets('close before delay cancels the timer', (tester) async {
      late ProcessModal modal;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              modal = ProcessModal(context: context);
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      modal.open('Fast close');
      // Close immediately before delay fires
      modal.close();

      await tester.pump(const Duration(milliseconds: 200));
      // Dialog should never have appeared
      expect(find.byType(ProcessDialog), findsNothing);
    });
  });
}
