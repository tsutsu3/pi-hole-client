import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/screens/home/disable_modal.dart';
import 'package:pi_hole_client/screens/home/home.dart';

import '../helpers.dart';

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

      testWidgets(
        'should home screen be rendered (loading state)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          when(testSetup.mockStatusProvider.getStatusLoading).thenAnswer(
            (_) => LoadStatus.loading,
          );

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Home(),
            ),
          );

          expect(find.byType(Home), findsOneWidget);
          await tester.pump();

          expect(find.text('Loading stats...'), findsOneWidget);
        },
      );

      testWidgets(
        'should home screen be rendered (loading error state)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          when(testSetup.mockStatusProvider.getStatusLoading).thenAnswer(
            (_) => LoadStatus.error,
          );

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Home(),
            ),
          );

          expect(find.byType(Home), findsOneWidget);
          await tester.pump();

          expect(find.text('Stats could not be loaded'), findsOneWidget);
        },
      );

      testWidgets(
        'should show disable modal and snackbar when disable button is pressed',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

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
          await tester.pump();
          expect(find.byType(FloatingActionButton), findsOneWidget);

          await tester.tap(find.byType(FloatingActionButton));
          await tester.pumpAndSettle(const Duration(seconds: 3));

          expect(find.byType(DisableModal), findsOneWidget);
          await tester.tap(find.text('30 seconds').last);
          await tester.pump();
          await tester.tap(find.text('Accept').last);
          await tester.pump();
          await tester.pumpAndSettle(const Duration(seconds: 1));

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Server disabled successfully.'), findsOneWidget);
        },
      );

      testWidgets(
        'should show enabled snackbar when enable button is pressed',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          final serverV6 = Server(
            address: 'http://localhost:8081',
            alias: 'test v6',
            defaultServer: false,
            apiVersion: 'v6',
            enabled: false,
          );
          when(testSetup.mockServersProvider.selectedServer)
              .thenReturn(serverV6);

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
          await tester.pump();
          expect(find.byType(FloatingActionButton), findsOneWidget);

          await tester.tap(find.byType(FloatingActionButton));
          await tester.pumpAndSettle(const Duration(seconds: 3));

          expect(find.byType(DisableModal), findsNothing);
          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Server enabled successfully.'), findsOneWidget);
        },
      );
    },
  );
}
