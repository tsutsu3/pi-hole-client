import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/advanced_options.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Advanced Options Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should close reset modal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedOptions(),
          ),
        );

        expect(find.byType(AdvancedOptions), findsOneWidget);

        // Tap Reset application
        await tester.tap(find.text('Reset application'));
        await tester.pumpAndSettle();

        // Tap Elase all button
        expect(find.text('Erase app data'), findsOneWidget);
        await tester.pumpAndSettle(const Duration(seconds: 6));
        await tester.tap(find.text('ERASE ALL'));

        // AUto close dialog
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.text('Erase app data'), findsNothing);

        // Show StartInfoModal
        // expect(find.text('Getting Started'), findsOneWidget);
      },
    );

    testWidgets(
      'should open EnterPasscodeModal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockConfigProvider.passCode).thenReturn('1111');

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedOptions(),
          ),
        );

        expect(find.byType(AdvancedOptions), findsOneWidget);

        // Tap App unlock
        await tester.tap(find.text('App unlock'));
        await tester.pumpAndSettle();

        // Show Enter passcode screen
        expect(find.text('Enter passcode'), findsOneWidget);
      },
    );
  });
}
