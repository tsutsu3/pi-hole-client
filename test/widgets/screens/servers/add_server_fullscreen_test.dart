import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/screens/servers/add_server_fullscreen.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('Add Server Full Screen Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should show the successful snackbar when adding a server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(1),
          'localhost',
        ); // IP Address
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Connected to server successfully.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.addServer(any))
            .thenAnswer((_) async => false);
        when(testSetup.mockApiGatewayV6.loginQuery()).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.socket,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'SocketException',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(1),
          'localhost',
        ); // IP Address
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Check address.'), findsOneWidget);
      },
    );
  });
}
