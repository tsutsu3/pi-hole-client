import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/address_detail_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/more_detail_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/statistics_detail_screen.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Interface Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should show address screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const InterfaceScreen(),
          ),
        );

        expect(find.byType(InterfaceScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Addresses').first);
        await tester.pumpAndSettle();

        await tester
            .tap(find.text('Address: inet 127.0.0.1 / 8 (IPv4 loopback)'));
        await tester.pumpAndSettle();

        expect(find.byType(AddressDetailScreen), findsOneWidget);
      },
    );

    testWidgets(
      'should show statistics screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const InterfaceScreen(),
          ),
        );

        expect(find.byType(InterfaceScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Statistics').first);
        await tester.pumpAndSettle();

        expect(find.byType(StatisticsDetailScreen), findsOneWidget);
      },
    );

    testWidgets(
      'should show more detail screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const InterfaceScreen(),
          ),
        );

        expect(find.byType(InterfaceScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('More Details').first);
        await tester.pumpAndSettle();

        expect(find.byType(MoreDetailsScreen), findsOneWidget);
      },
    );
  });
}
