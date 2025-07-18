import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/dhcp_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/dhcp_screen/dhcp_detail_screen.dart';
import 'package:pi_hole_client/widgets/delete_modal.dart';
import 'package:pi_hole_client/widgets/error_message.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Dhcp Screen tests', () {
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

        when(testSetup.mockApiGatewayV6.getDhcps()).thenAnswer(
          (_) async => DhcpResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const DhcpScreen(),
          ),
        );

        expect(find.byType(DhcpScreen), findsOneWidget);
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
            const DhcpScreen(),
          ),
        );

        expect(find.byType(DhcpScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('192.168.1.51'));
        await tester.pumpAndSettle();
        await tester.pump();

        expect(find.byType(DhcpDetailScreen), findsOneWidget);
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
            const DhcpScreen(),
          ),
        );

        expect(find.byType(DhcpScreen), findsOneWidget);
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
            const DhcpScreen(),
          ),
        );

        expect(find.byType(DhcpScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('192.168.1.52'));
        await tester.pumpAndSettle();

        expect(find.byType(DhcpDetailScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();

        // Show remove modal
        expect(find.byType(DeleteModal), findsOneWidget);
        expect(find.text('Delete DHCP lease'), findsOneWidget);
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('DHCP lease removed successfully'), findsWidgets);
      },
    );
  });
}
