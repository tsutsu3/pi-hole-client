import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/logs/logs.dart';

import '../helpers.dart';

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
              const Logs(),
            ),
          );

          // Show logs screen
          expect(find.byType(Logs), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.text('Query logs'), findsOneWidget);
          expect(
            find.text('Choose a query log to see its details.'),
            findsNothing,
          );
        },
      );

      testWidgets(
        'should set blacklist domains on tablet layout',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2176, 1600);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(const Logs()),
          );

          // Show logs screen
          expect(find.byType(Logs), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.text('Query logs'), findsOneWidget);
          expect(find.text('white.example.com'), findsWidgets);
          expect(
            find.text('Choose a query log to see its details.'),
            findsOneWidget,
          );

          // Tap whitelist domain to open domain detail screen
          await tester.tap(find.text('white.example.com').at(0));
          await tester.pumpAndSettle();
          expect(find.text('Log details'), findsOneWidget);

          // Tap blacklist button
          expect(find.byIcon(Icons.gpp_bad_rounded), findsOneWidget);
          await tester.tap(find.byIcon(Icons.gpp_bad_rounded));
          await tester.pump(const Duration(milliseconds: 1000));

          // Return to logs screen (Not raise Exception)
          expect(find.text('Domain added to blacklist.'), findsWidgets);
          expect(find.byType(Logs), findsOneWidget);
        },
      );
    },
  );
}
