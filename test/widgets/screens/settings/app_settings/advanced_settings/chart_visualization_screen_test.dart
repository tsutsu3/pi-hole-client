import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/chart_visualization_screen.dart';

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
              const ChartVisualizationScreen(),
            ),
          );

          expect(find.byType(ChartVisualizationScreen), findsOneWidget);
          expect(find.text('Chart display mode'), findsOneWidget);

          expect(find.text('Line Chart'), findsOneWidget);
          expect(find.text('Bar Chart'), findsOneWidget);
          await tester.tap(find.text('Bar Chart'));

          expect(find.text('List'), findsOneWidget);
          expect(find.text('Pie Chart'), findsOneWidget);
          await tester.tap(find.text('Pie Chart'));
        },
      );
    },
  );
}
