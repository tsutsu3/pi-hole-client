import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/numeric_pad.dart';
import 'package:pi_hole_client/ui/core/ui/components/unlock.dart';

import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Unlock Screen Widget Tests', () {
    testWidgets('should show lock screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildTestApp(const Unlock()));

      expect(find.byType(Unlock), findsOneWidget);
      await tester.pump();
      expect(find.byIcon(Icons.lock_open_rounded), findsOneWidget);
      expect(find.text('Enter code to unlock'), findsOneWidget);

      // numeric pad
      expect(find.byType(NumericPad), findsOneWidget);
      for (var i = 0; i <= 9; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
      expect(find.byIcon(Icons.backspace), findsOneWidget);
    });
  });
}
