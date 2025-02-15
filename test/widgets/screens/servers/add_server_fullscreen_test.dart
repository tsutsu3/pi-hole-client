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
      'should show the page with window',
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
              window: true,
              title: 'test',
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);
      },
    );

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
      'should show the error snackbar when adding a server (socket exception)',
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
          find.byType(TextField).at(1),
          '/test',
        ); // subroute
        await tester.enterText(
          find.byType(TextField).at(1),
          '8080',
        ); // port
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

    testWidgets(
      'should show the error snackbar when adding a server (timeout)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.addServer(any))
            .thenAnswer((_) async => false);
        when(testSetup.mockApiGatewayV6.loginQuery()).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.timeout,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'timeout',
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
          find.byType(TextField).at(1),
          '/test',
        ); // subroute
        await tester.enterText(
          find.byType(TextField).at(1),
          '8080',
        ); // port
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text(
            'Failed. Connection timeout. Check if server is reachable.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (noConnection)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.addServer(any))
            .thenAnswer((_) async => false);
        when(testSetup.mockApiGatewayV6.loginQuery()).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.noConnection,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'noConnection',
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
          find.byType(TextField).at(1),
          '/test',
        ); // subroute
        await tester.enterText(
          find.byType(TextField).at(1),
          '8080',
        ); // port
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("Can't reach the server. Check IP address and port."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (authError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.addServer(any))
            .thenAnswer((_) async => false);
        when(testSetup.mockApiGatewayV6.loginQuery()).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.authError,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'authError',
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
          find.byType(TextField).at(1),
          '/test',
        ); // subroute
        await tester.enterText(
          find.byType(TextField).at(1),
          '8080',
        ); // port
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Token not valid'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (sslError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.addServer(any))
            .thenAnswer((_) async => false);
        when(testSetup.mockApiGatewayV6.loginQuery()).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.sslError,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'sslError',
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
          find.byType(TextField).at(1),
          '/test',
        ); // subroute
        await tester.enterText(
          find.byType(TextField).at(1),
          '8080',
        ); // port
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("SSL error. Check if the server's certificate is valid."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (unknownError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.addServer(any))
            .thenAnswer((_) async => false);
        when(testSetup.mockApiGatewayV6.loginQuery()).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.alreadyAdded,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'unknownError',
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
          find.byType(TextField).at(1),
          '/test',
        ); // subroute
        await tester.enterText(
          find.byType(TextField).at(1),
          '8080',
        ); // port
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Unknown error.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show validation error when adding a server',
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

        await tester.enterText(
          find.byType(TextField).at(1),
          '@',
        ); // IP Address

        await tester.enterText(
          find.byType(TextField).at(2),
          '@',
        ); // subroute

        await tester.enterText(
          find.byType(TextField).at(3),
          '@',
        ); // port

        await tester.pump();
        await tester.pump();
        await tester.pump();

        expect(find.text('Invalid IP or domain'), findsOneWidget);
        expect(
          find.text(
            "Invalid subroute. Remember not to finish with a '/', '.' or ':'.",
          ),
          findsOneWidget,
        );
        expect(find.text('Invalid port'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the successful snackbar when editing a server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsNothing);
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (socketError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.socket,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'socketError',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Check address.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (timeout)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.timeout,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'timeout',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text(
            'Failed. Connection timeout. Check if server is reachable.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (noConnection)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.noConnection,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'noConnection',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("Can't reach the server. Check IP address and port."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (authError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.authError,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'AuthError',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Token not valid'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (sslError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.sslError,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'sslError',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("SSL error. Check if the server's certificate is valid."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (unknownError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockApiGatewayV6.loginQuery(refresh: true)).thenAnswer(
          (_) async => LoginQueryResponse(
            result: APiResponseType.alreadyAdded,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'unknownError',
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(4),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Unknown error.'), findsOneWidget);
      },
    );
  });
}
