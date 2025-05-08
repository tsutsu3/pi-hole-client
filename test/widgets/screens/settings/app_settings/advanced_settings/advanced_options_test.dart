import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/app_logs/app_logs.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/advanced_options.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/chart_visualization_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/reset_screen.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Advanced Options Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show advanced options screen',
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
          expect(find.text('Advanced settings'), findsOneWidget);

          expect(find.text('Security'), findsOneWidget);
          expect(find.text("Don't check SSL certificate"), findsOneWidget);
          expect(find.text('App unlock'), findsOneWidget);

          expect(find.text('Charts'), findsOneWidget);
          expect(find.text('Use reduced data'), findsOneWidget);
          expect(find.text('Hide zero values'), findsOneWidget);
          expect(find.text('Chart display mode'), findsOneWidget);

          expect(find.text('Others'), findsOneWidget);
          expect(find.text('App logs'), findsOneWidget);
          expect(find.text('Reset application'), findsOneWidget);
        },
      );

      testWidgets(
        'should show ssl certificate check setting',
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
          expect(find.text("Don't check SSL certificate"), findsOneWidget);
        },
      );

      testWidgets(
        'should show App Unlock screen',
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
          expect(find.text('App unlock'), findsOneWidget);
          await tester.tap(find.text('App unlock'));
          await tester.pumpAndSettle();
          expect(find.byType(AppUnlockSetupModal), findsOneWidget);
          expect(find.text('Status: disabled'), findsOneWidget);
        },
      );

      testWidgets(
        'should change reduse data setting',
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
          expect(find.text('Use reduced data'), findsOneWidget);
          await tester.tap(find.text('Use reduced data'));
          await tester.pumpAndSettle();
          expect(find.text('Settings updated successfully.'), findsOneWidget);
        },
      );

      testWidgets(
        'should change hide zero values setting',
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
          expect(find.text('Hide zero values'), findsOneWidget);
          await tester.tap(find.text('Hide zero values'));
          await tester.pumpAndSettle();
          expect(find.text('Settings updated successfully.'), findsOneWidget);
        },
      );

      testWidgets(
        'should show Statistics display mode screen',
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
          expect(find.text('Chart display mode'), findsOneWidget);
          await tester.tap(find.text('Chart display mode'));
          await tester.pumpAndSettle();
          expect(find.byType(ChartVisualizationScreen), findsOneWidget);
          expect(find.text('Chart display mode'), findsOneWidget);
          expect(find.text('Home Screen'), findsOneWidget);
          expect(find.text('Statistics Screen'), findsOneWidget);
        },
      );

      testWidgets(
        'should show App Logs screen',
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
          expect(find.text('App logs'), findsOneWidget);
          await tester.tap(find.text('App logs'));
          await tester.pumpAndSettle();
          expect(find.byType(AppLogs), findsOneWidget);
          expect(find.text('Logs'), findsOneWidget);
        },
      );

      testWidgets(
        'should show Reset Application screen',
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
          expect(find.text('Reset application'), findsOneWidget);
          await tester.tap(find.text('Reset application'));
          await tester.pumpAndSettle();
          expect(find.byType(ResetScreen), findsOneWidget);
          expect(find.text('Erase app data'), findsNWidgets(2));
        },
      );
    },
  );
}
