import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/app_logs/app_log_details_modal.dart';
import 'package:pi_hole_client/screens/app_logs/app_logs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../helpers.dart';

void main() async {
  initializeApp();

  group(
    'App Log Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show AppLogs screen with one log',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const AppLogs(),
            ),
          );

          expect(find.byType(AppLogs), findsOneWidget);
          await tester.pump();

          expect(find.text('Logs'), findsOneWidget);
          expect(find.byIcon(Icons.share), findsOneWidget);

          expect(find.text('sample'), findsOneWidget);
          expect(find.text('message'), findsOneWidget);
          expect(find.text('2025-01-22 10:50:31.000'), findsOneWidget);

          // TODO: show snackbar
          // TODO: check clipboard data
          // await tester.tap(find.byIcon(Icons.share));
          // await tester.pump(const Duration(seconds: 1));
          // await tester.pumpAndSettle(const Duration(seconds: 1));
          // expect(find.text('Logs copied to clipboard'), findsOneWidget);

          await tester.tap(find.text('sample'));
          await tester.pumpAndSettle();
          expect(find.byType(AppLogDetailsModal), findsOneWidget);
          expect(find.text('Log details'), findsOneWidget);

          // Message tab is selected by default
          expect(find.text('sample'), findsOneWidget);

          await tester.tap(find.text('Status code'));
          await tester.pumpAndSettle();
          expect(find.text('200'), findsOneWidget);

          await tester.tap(find.text('Body'));
          await tester.pumpAndSettle();
          expect(find.text('body'), findsOneWidget);
        },
      );

      testWidgets(
        'should show blank screen (no app logs)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;

          when(testSetup.mockConfigProvider.logs).thenReturn([]);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const AppLogs(),
            ),
          );

          expect(find.byType(AppLogs), findsOneWidget);
          await tester.pump();

          expect(find.text('Logs'), findsOneWidget);

          // check log message
          expect(find.text('sample'), findsNothing);

          // can't tap on share icon because there are no logs
          await tester.tap(find.byIcon(Icons.share));
          await tester.pumpAndSettle();
          expect(find.text('Logs copied to clipboard'), findsNothing);
        },
      );
    },
  );
}
