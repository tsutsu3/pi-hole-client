import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/base.dart';
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/ui/home/home.dart';

import './helpers.dart';

void main() async {
  await initializeApp();

  group('PiHoleClient Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();

      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show pihole client widget', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildMainTestWidget(const PiHoleClient()),
      );

      expect(find.byType(PiHoleClient), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(Base), findsOneWidget);
      expect(find.byType(Home), findsOneWidget);
    });
  });
}
