import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
// import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/servers/add_server_fullscreen.dart';
import 'package:provider/provider.dart';

import 'add_server_fullscreen_test.mocks.dart';

@GenerateMocks(
  [AppConfigProvider, ServersProvider, ApiGatewayV5],
)
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('Add Server Full Screen Widget Tests', () {
    late MockAppConfigProvider mockAppConfigProvider;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV5 mockApiGatewayV5;

    // final server = Server(
    //   address: 'http://localhost',
    //   alias: 'v5',
    //   defaultServer: false,
    //   apiVersion: 'v5',
    // );

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});

      mockAppConfigProvider = MockAppConfigProvider();
      mockServersProvider = MockServersProvider();
      mockApiGatewayV5 = MockApiGatewayV5();

      when(mockApiGatewayV5.loginQuery()).thenAnswer(
        (_) async => LoginQueryResponse(
          result: APiResponseType.success,
          status: 'enabled',
          sid: 'sid123',
        ),
      );

      const showingSnackbar = false;
      when(mockAppConfigProvider.showingSnackbar).thenReturn(showingSnackbar);
      when(mockAppConfigProvider.setShowingSnackbar(any)).thenAnswer((_) {});

      when(mockServersProvider.checkUrlExists(any))
          .thenAnswer((_) async => {'result': 'success', 'exists': false});
      when(mockServersProvider.addServer(any)).thenAnswer((_) async => true);
      when(mockServersProvider.editServer(any)).thenAnswer((_) async => true);
      when(mockServersProvider.loadApiGateway(any))
          .thenReturn(mockApiGatewayV5);
    });

    testWidgets(
      'should show the successful snackbar when adding a server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(600, 1000);
        tester.view.devicePixelRatio = 1.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<ServersProvider>(
                    create: (context) => mockServersProvider,
                  ),
                  ChangeNotifierProvider<AppConfigProvider>(
                    create: (context) => mockAppConfigProvider,
                  ),
                  ChangeNotifierProxyProvider<AppConfigProvider,
                      ServersProvider>(
                    create: (context) => mockServersProvider,
                    update: (context, appConfig, servers) =>
                        servers!..update(appConfig),
                  ),
                ],
                child: MaterialApp(
                  theme: lightTheme(lightDynamic),
                  darkTheme: darkTheme(darkDynamic),
                  themeMode: ThemeMode.light,
                  home: const Scaffold(
                    body: AddServerFullscreen(
                      window: false,
                      title: 'test',
                    ),
                  ),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    AppLocalizations.delegate,
                  ],
                  scaffoldMessengerKey: scaffoldMessengerKey,
                ),
              );
            },
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v5'); // Alias
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
        tester.view.physicalSize = const Size(600, 1000);
        tester.view.devicePixelRatio = 1.0;

        when(mockServersProvider.addServer(any)).thenAnswer((_) async => false);
        when(mockApiGatewayV5.loginQuery()).thenAnswer(
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
          DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<ServersProvider>(
                    create: (context) => mockServersProvider,
                  ),
                  ChangeNotifierProvider<AppConfigProvider>(
                    create: (context) => mockAppConfigProvider,
                  ),
                  ChangeNotifierProxyProvider<AppConfigProvider,
                      ServersProvider>(
                    create: (context) => mockServersProvider,
                    update: (context, appConfig, servers) =>
                        servers!..update(appConfig),
                  ),
                ],
                child: MaterialApp(
                  theme: lightTheme(lightDynamic),
                  darkTheme: darkTheme(darkDynamic),
                  themeMode: ThemeMode.light,
                  home: const Scaffold(
                    body: AddServerFullscreen(
                      window: false,
                      title: 'test',
                    ),
                  ),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    AppLocalizations.delegate,
                  ],
                  scaffoldMessengerKey: scaffoldMessengerKey,
                ),
              );
            },
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v5'); // Alias
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
