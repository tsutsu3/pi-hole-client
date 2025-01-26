import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/home/home.dart';

import '../helpers.dart';
import '../utils.dart';

void main() async {
  await initializeApp();

  group(
    'Home Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();

        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should home screen be rendered (all graphs are rendered)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Home(),
            ),
          );

          expect(find.byType(Home), findsOneWidget);
          // await tester.pump();
          // await tester.pump(const Duration(seconds: 3));
          await tester.pumpAndSettle(const Duration(seconds: 3));

          // Home App Bar
          // expect(find.byIcon(Icons.verified_user_rounded), findsOneWidget); // TODO
          // expect(find.byIcon(Icons.more_vert), findsOneWidget); // TODO
          expect(find.text('test v6'), findsWidgets); // TODO findsOne
          expect(
            find.text('http://localhost:8081'),
            findsWidgets,
          ); // TODO findsOne

          // titles
          expect(find.text('Total queries'), findsOneWidget);
          expect(find.text('Queries blocked'), findsOneWidget);
          expect(find.text('Percentage blocked'), findsOneWidget);
          expect(find.text('Domains on Adlists'), findsOneWidget);

          // queries graph
          // expect(
          //     find.text('Total queries lsat 24 hours'), findsOneWidget); // TODO

          // clients graph
          expect(find.text('Client activity last 24 hours'), findsOneWidget);
        },
      );
    },
  );
}
