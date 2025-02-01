import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/logs/status_filters_modal.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Client filter modal tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should uncheck all filter',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const StatusFiltersModal(
                statusBarHeight: 24,
                bottomNavBarHeight: 48,
                statusSelected: [
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                  11,
                  12,
                  13,
                  14,
                  15,
                ],
                window: false,
              ),
            ),
          );

          expect(find.byType(StatusFiltersModal), findsOneWidget);
          expect(find.text('Logs status'), findsOneWidget);
          expect(find.text('Uncheck all'), findsOneWidget);
          expect(find.text('Close'), findsOneWidget);
          expect(find.text('Apply'), findsOneWidget);
          await tester.tap(find.text('Uncheck all'));
          await tester.pumpAndSettle();

          await tester.tap(find.text('Apply'));
          await tester.pumpAndSettle();
        },
      );

      testWidgets(
        'should check all clients',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const StatusFiltersModal(
                statusBarHeight: 24,
                bottomNavBarHeight: 48,
                statusSelected: [3, 4],
                window: false,
              ),
            ),
          );

          expect(find.byType(StatusFiltersModal), findsOneWidget);
          expect(find.text('Logs status'), findsOneWidget);
          expect(find.text('Check all'), findsOneWidget);
          expect(find.text('Close'), findsOneWidget);
          expect(find.text('Apply'), findsOneWidget);
          await tester.tap(find.text('Check all'));
          await tester.pumpAndSettle();

          await tester.tap(find.text('Apply'));
          await tester.pumpAndSettle();
        },
      );
    },
  );
}
