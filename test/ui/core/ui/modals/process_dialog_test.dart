import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_dialog.dart';

import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('ProcessDialog', () {
    testWidgets('renders message text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ProcessDialog(message: 'Loading...'),
        ),
      );

      expect(find.text('Loading...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders as Dialog widget', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ProcessDialog(message: 'Please wait'),
        ),
      );

      expect(find.byType(Dialog), findsOneWidget);
    });
  });
}
