import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/settings/app_settings/auto_refresh_time_screen.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Auto refresh Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should save successfully',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const AutoRefreshTimeScreen(),
            ),
          );

          expect(find.byType(AutoRefreshTimeScreen), findsOneWidget);
          expect(find.text('Auto refresh time'), findsOneWidget);
          expect(find.byIcon(Icons.save_rounded), findsOneWidget);

          await tester.tap(find.text('30 seconds'));
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.save_rounded));
          await tester.pumpAndSettle();
          expect(find.byType(SnackBar), findsOneWidget);
          expect(
            find.text('Update time changed successfully.'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should save failed',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const AutoRefreshTimeScreen(),
            ),
          );

          when(testSetup.mockConfigProvider.setAutoRefreshTime(any))
              .thenAnswer((_) async => false);

          expect(find.byType(AutoRefreshTimeScreen), findsOneWidget);
          expect(find.text('Auto refresh time'), findsOneWidget);
          expect(find.byIcon(Icons.save_rounded), findsOneWidget);

          await tester.tap(find.text('30 seconds'));
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.save_rounded));
          await tester.pumpAndSettle();
          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Cannot change update time'), findsOneWidget);
        },
      );

      testWidgets(
        'should save successfully with custom time',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const AutoRefreshTimeScreen(),
            ),
          );

          expect(find.byType(AutoRefreshTimeScreen), findsOneWidget);
          expect(find.text('Auto refresh time'), findsOneWidget);
          expect(find.byIcon(Icons.save_rounded), findsOneWidget);

          await tester.tap(find.text('Custom'));
          await tester.pumpAndSettle();

          expect(find.byType(TextField), findsOneWidget);
          await tester.enterText(find.byType(TextField), '11');
          await tester.pumpAndSettle();

          expect(find.text('Value not valid'), findsNothing);

          await tester.tap(find.byIcon(Icons.save_rounded));
          await tester.pumpAndSettle();
          expect(find.byType(SnackBar), findsOneWidget);

          expect(
            find.text('Update time changed successfully.'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should save successfully with invalid custom time',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const AutoRefreshTimeScreen(),
            ),
          );

          expect(find.byType(AutoRefreshTimeScreen), findsOneWidget);
          expect(find.text('Auto refresh time'), findsOneWidget);
          expect(find.byIcon(Icons.save_rounded), findsOneWidget);

          await tester.tap(find.text('Custom'));
          await tester.pumpAndSettle();

          expect(find.byType(TextField), findsOneWidget);
          await tester.enterText(find.byType(TextField), 'aa');
          await tester.pumpAndSettle();

          expect(find.text('Value not valid'), findsOneWidget);
        },
      );
    },
  );
}
