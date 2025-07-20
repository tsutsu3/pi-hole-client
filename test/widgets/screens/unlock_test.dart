import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/unlock.dart';
import 'package:pi_hole_client/ui2/core/ui/numeric_pad.dart';

import '../helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Unlock Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show lock screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Unlock(),
            ),
          );

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
        },
      );
    },
  );
}
