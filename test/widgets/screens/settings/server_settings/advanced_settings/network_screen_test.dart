import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/network_screen/network_detail_screen.dart';
import 'package:pi_hole_client/ui2/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui2/core/ui/modals/delete_modal.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Network Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should show error screen when fetching sessions fails',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.getDevices()).thenAnswer(
          (_) async => DevicesResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const NetworkScreen(),
          ),
        );

        expect(find.byType(NetworkScreen), findsOneWidget);
        await tester.pump();
        expect(find.byType(ErrorMessage), findsOneWidget);
      },
    );

    testWidgets(
      'should show detail screen with tap (in use)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const NetworkScreen(),
          ),
        );

        expect(find.byType(NetworkScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('192.168.1.51 (ubuntu-server)'));
        await tester.pumpAndSettle();
        await tester.pump();

        expect(find.byType(NetworkDetailScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
      },
    );

    testWidgets(
      'should refresh sessions on tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const NetworkScreen(),
          ),
        );

        expect(find.byType(NetworkScreen), findsOneWidget);
        await tester.pump();

        expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
        await tester.tap(find.byIcon(Icons.refresh_rounded));
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'should show delete session button with tap (not in use)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const NetworkScreen(),
          ),
        );

        expect(find.byType(NetworkScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('192.168.1.51 (ubuntu-server)'));
        await tester.pumpAndSettle();

        expect(find.byType(NetworkDetailScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();

        // Show remove modal
        expect(find.byType(DeleteModal), findsOneWidget);
        expect(find.text('Delete device'), findsOneWidget);
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Device removed successfully'), findsWidgets);
      },
    );
  });
}
