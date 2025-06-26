import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/logs/widgets/clients_filters_modal.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_filters_modal.dart';
import 'package:pi_hole_client/screens/logs/widgets/status_filters_modal.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Query logs screen tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show logs screen on mobile layout',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              LogsFiltersModal(
                statusBarHeight: 24.0,
                bottomNavBarHeight: 48.0,
                filterLogs: () {},
                window: true,
              ),
            ),
          );

          expect(find.byType(LogsFiltersModal), findsOneWidget);
        },
      );

      testWidgets(
        'should show date and time picker',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockFiltersProvider.startTime).thenReturn(null);
          when(testSetup.mockFiltersProvider.endTime).thenReturn(null);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              LogsFiltersModal(
                statusBarHeight: 24.0,
                bottomNavBarHeight: 48.0,
                filterLogs: () {},
                window: true,
              ),
            ),
          );

          expect(find.byType(LogsFiltersModal), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.text('From time'), findsOneWidget);
          expect(find.text('To time'), findsOneWidget);
          expect(find.text('Not selected'), findsNWidgets(2));
          await tester.tap(find.text('From time'));
          await tester.pumpAndSettle();

          expect(find.text('Select date'), findsOneWidget);
          expect(find.text('OK'), findsOneWidget);
          await tester.tap(find.text('OK'));
          await tester.pumpAndSettle();

          expect(find.text('Select start time'), findsOneWidget);
          expect(find.text('OK'), findsOneWidget);
          await tester.tap(find.text('OK'));
          when(testSetup.mockFiltersProvider.startTime)
              .thenReturn(DateTime.now());
          await tester.pumpAndSettle();

          expect(find.text('Not selected'), findsOneWidget);
        },
      );

      testWidgets(
        'should show advanced filter modal',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              LogsFiltersModal(
                statusBarHeight: 24.0,
                bottomNavBarHeight: 48.0,
                filterLogs: () {},
                window: true,
              ),
            ),
          );

          expect(find.byType(LogsFiltersModal), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.text('Advanced status filtering'), findsOneWidget);
          await tester.tap(find.text('Advanced status filtering'));
          await tester.pumpAndSettle();

          expect(find.byType(StatusFiltersModal), findsOneWidget);
          await tester.tap(find.text('Apply').last);
          await tester.pumpAndSettle();

          expect(find.byType(StatusFiltersModal), findsNothing);
        },
      );

      testWidgets(
        'should show clients filter modal',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              LogsFiltersModal(
                statusBarHeight: 24.0,
                bottomNavBarHeight: 48.0,
                filterLogs: () {},
                window: true,
              ),
            ),
          );

          expect(find.byType(LogsFiltersModal), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.text('Clients'), findsOneWidget);
          await tester.tap(find.text('Clients'));
          await tester.pumpAndSettle();

          expect(find.byType(ClientsFiltersModal), findsOneWidget);
          await tester.tap(find.text('Apply').last);
          await tester.pumpAndSettle();

          expect(find.byType(ClientsFiltersModal), findsNothing);
        },
      );
    },
  );
}
