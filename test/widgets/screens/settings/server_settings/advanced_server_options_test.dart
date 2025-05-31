import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_server_options.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/interface_screen.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Advanced Server Settings Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should show interface screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Interface'));
        await tester.pumpAndSettle();
        expect(find.byType(InterfaceScreen), findsOneWidget);
      },
    );
  });
}
