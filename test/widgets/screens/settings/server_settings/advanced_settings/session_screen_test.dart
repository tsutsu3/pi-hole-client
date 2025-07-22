import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/services/api/shared/models/gateways.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/session_detail_screen.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Sessions Screen tests', () {
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

        when(testSetup.mockApiGatewayV6.getSessions()).thenAnswer(
          (_) async => SessionsResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const SessionsScreen(),
          ),
        );

        expect(find.byType(SessionsScreen), findsOneWidget);
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
            const SessionsScreen(),
          ),
        );

        expect(find.byType(SessionsScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('192.168.0.31'));
        await tester.pumpAndSettle();
        await tester.pump();

        expect(find.byType(SessionDetailScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsNothing);
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
            const SessionsScreen(),
          ),
        );

        expect(find.byType(SessionsScreen), findsOneWidget);
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
            const SessionsScreen(),
          ),
        );

        expect(find.byType(SessionsScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('192.168.0.30'));
        await tester.pumpAndSettle();

        expect(find.byType(SessionDetailScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();

        // Show remove modal
        expect(find.byType(DeleteModal), findsOneWidget);
        expect(find.text('Delete session'), findsOneWidget);
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Session removed successfully'), findsWidgets);
      },
    );
  });
}
