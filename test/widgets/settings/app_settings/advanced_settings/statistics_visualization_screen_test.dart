import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/advanced_options.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/statistics_visualization_screen.dart';

import '../../../helpers.dart';
import '../../../utils.dart';

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
        'should change the statistics visualization mode',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const StatisticsVisualizationScreen(),
            ),
          );

          expect(find.byType(StatisticsVisualizationScreen), findsOneWidget);
          expect(find.text('Statistics display mode'), findsOneWidget);

          showText();

          expect(find.text('List'), findsOneWidget);
          expect(find.text('Pie chart'), findsOneWidget);
          await tester.tap(find.text('Pie chart'));
        },
      );

      testWidgets(
        'should change the ssl certificate check setting',
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
          await tester.tap(find.text("Don't check SSL certificate"));
          await tester.pumpAndSettle();
          expect(find.text('Restart the application'), findsOneWidget);
        },
      );
    },
  );
}
