import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v6_not_supported_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/advanced_options.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/auto_refresh_time_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/logs_quantity_load_screen.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Advanced Options Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should close reset screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedOptions()),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);

      // Tap Reset application
      await tester.tap(find.text('Reset application'));
      await tester.pumpAndSettle();

      // Tap Elase all button
      expect(find.text('Erase app data'), findsNWidgets(2));
      await tester.pumpAndSettle(const Duration(seconds: 6));
      await tester.tap(find.text('ERASE ALL').last);

      // AUto close dialog
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Erase app data'), findsNothing);

      // Show StartInfoModal
      // expect(find.text('Getting Started'), findsOneWidget);
    });

    testWidgets('should open EnterPasscodeModal', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(testSetup.mockConfigProvider.passCode).thenReturn('1111');

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedOptions()),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);

      // Tap App unlock
      await tester.tap(find.text('App unlock'));
      await tester.pumpAndSettle();

      // Show Enter passcode screen
      expect(find.text('Enter passcode'), findsOneWidget);
    });

    testWidgets('should show Auto refresh time screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedOptions()),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Auto refresh time'));
      await tester.pumpAndSettle();
      expect(find.byType(AutoRefreshTimeScreen), findsOneWidget);
    });

    testWidgets('should show Logs quantity screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedOptions()),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Logs quantity per request'));
      await tester.pumpAndSettle();
      expect(find.byType(LogsQuantityLoadScreen), findsOneWidget);
      expect(find.byType(PiHoleV6NotSupportedScreen), findsOneWidget);
    });
  });

  group('Advanced Options Screen tests (v5)', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock();
    });
    testWidgets('should show Logs quantity screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedOptions()),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Logs quantity per request'));
      await tester.pumpAndSettle();
      expect(find.byType(LogsQuantityLoadScreen), findsOneWidget);
      expect(find.byType(PiHoleV6NotSupportedScreen), findsNothing);
    });
  });
}
