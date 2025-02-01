import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/base.dart';
import 'package:pi_hole_client/widgets/bottom_nav_bar.dart';
import 'package:pi_hole_client/widgets/navigation_rail.dart';
import 'package:pi_hole_client/widgets/start_warning_modal.dart';

import './helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Base Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();

        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show important info modal when firt time access',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          when(testSetup.mockServersProvider.selectedServer).thenReturn(null);
          when(testSetup.mockConfigProvider.importantInfoReaden)
              .thenReturn(false);

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Base(),
            ),
          );

          expect(find.byType(Base), findsOneWidget);
          await tester.pumpAndSettle();

          expect(find.byType(StartInfoModal), findsOneWidget);
          expect(find.text('Getting Started'), findsOneWidget);
        },
      );

      testWidgets(
        'should show mobile layout',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          when(testSetup.mockServersProvider.selectedServer).thenReturn(null);

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Base(),
            ),
          );

          expect(find.byType(Base), findsOneWidget);
          await tester.pump();
          expect(find.byType(BottomNavBar), findsOneWidget);
          expect(find.byIcon(Icons.link_rounded), findsOneWidget);
          expect(find.text('Servers'), findsOneWidget);
        },
      );

      testWidgets(
        'should show tablet layout',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2560, 1600);
          tester.view.devicePixelRatio = 1.6;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          when(testSetup.mockServersProvider.selectedServer).thenReturn(null);

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Base(),
            ),
          );

          expect(find.byType(Base), findsOneWidget);
          await tester.pump();
          expect(find.byType(CustomNavigationRail), findsOneWidget);
          expect(find.byIcon(Icons.link_rounded), findsOneWidget);
          expect(find.text('Servers'), findsOneWidget);
        },
      );
    },
  );
}
