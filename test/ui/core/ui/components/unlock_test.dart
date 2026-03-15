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

    testWidgets('shows compact layout when height is small', (tester) async {
      // Height 600 logical px -> height - 180 = 420 < 426 -> compact Row branch
      tester.view.physicalSize = const Size(1080, 600);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildTestApp(const Unlock()));
      await tester.pump();

      expect(find.byIcon(Icons.lock_open_rounded), findsOneWidget);
      expect(find.text('Enter code to unlock'), findsOneWidget);
    });

    testWidgets('shows large-screen layout when width exceeds medium', (
      tester,
    ) async {
      // 2560x1600 DPR 2.0 -> logical 1280x800 (>700 medium)
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildTestApp(const Unlock()));
      await tester.pump();

      expect(find.byType(Unlock), findsOneWidget);
      expect(find.byIcon(Icons.lock_open_rounded), findsOneWidget);
    });
  });
}
