import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/domains/domain_details_screen.dart';
import 'package:pi_hole_client/screens/domains/domains.dart';
import 'package:provider/provider.dart';

import 'domains_test.mocks.dart';

@GenerateMocks(
  [AppConfigProvider, ServersProvider, ApiGatewayV6],
)
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final server = Server(
    address: 'address',
    alias: 'test',
    defaultServer: false,
    apiVersion: 'v6',
  );

  group('DomainLists Widget Tests', () {
    late MockApiGatewayV6 mockApiGatewayV6;
    late MockAppConfigProvider mockConfigProvider;
    late MockServersProvider mockServersProvider;
    late DomainsListProvider domainsListProvider;

    setUp(() async {
      mockApiGatewayV6 = MockApiGatewayV6();
      mockConfigProvider = MockAppConfigProvider();
      mockServersProvider = MockServersProvider();

      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(mockServersProvider.colors).thenReturn(lightAppColors);

      when(mockApiGatewayV6.getDomainLists()).thenAnswer((_) async {
        return GetDomainLists(
          result: APiResponseType.success,
          data: DomainListResult(
            blacklist: [
              Domain(
                id: 3,
                type: 1,
                domain: 'black01.example.com',
                enabled: 1,
                dateAdded: DateTime.now(),
                dateModified: DateTime.now(),
                comment: null,
                groups: [0],
              ),
            ],
            whitelist: [
              Domain(
                id: 1,
                type: 1,
                domain: 'white01.example.com',
                enabled: 1,
                dateAdded: DateTime.now(),
                dateModified: DateTime.now(),
                comment: null,
                groups: [0],
              ),
              Domain(
                id: 2,
                type: 1,
                domain: 'white02.example.com',
                enabled: 1,
                dateAdded: DateTime.now(),
                dateModified: DateTime.now(),
                comment: null,
                groups: [0],
              ),
            ],
            whitelistRegex: [],
            blacklistRegex: [],
          ),
        );
      });
      when(mockApiGatewayV6.removeDomainFromList(any)).thenAnswer((_) async {
        return RemoveDomainFromListResponse(result: APiResponseType.success);
      });
      when(mockApiGatewayV6.addDomainToList(any)).thenAnswer((_) async {
        return AddDomainToListResponse(result: APiResponseType.success);
      });

      const showingSnackbar = false;
      when(mockConfigProvider.showingSnackbar).thenReturn(showingSnackbar);
      when(mockConfigProvider.setShowingSnackbar(any)).thenAnswer((_) {});
      when(mockConfigProvider.colors).thenReturn(lightAppColors);

      domainsListProvider =
          DomainsListProvider(serversProvider: mockServersProvider);
    });

    testWidgets(
      'should delete a domain from whitelist and show confirmation modal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1000, 400);
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
                  ChangeNotifierProxyProvider<ServersProvider,
                      DomainsListProvider>(
                    create: (context) => domainsListProvider,
                    update: (context, serverConfig, servers) =>
                        servers!..update(serverConfig),
                  ),
                  ChangeNotifierProvider<AppConfigProvider>(
                    create: (context) => mockConfigProvider,
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
                    body: DomainLists(),
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

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsOneWidget);
        expect(
          find.text('Choose a domain to see its details.'),
          findsOneWidget,
        );

        // Tap whitelist domain to open domain detail screen
        await tester.tap(find.text('white01.example.com'));
        await tester.pumpAndSettle();
        expect(find.byType(DomainDetailsScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        // Tap delete button
        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();
        expect(
          find.text('Are you sure you want to delete this domain?'),
          findsOneWidget,
        );
        expect(find.text('Confirm'), findsOneWidget);

        // Tap confirm button
        await tester.tap(find.text('Confirm'));
        // await tester.pump(const Duration(milliseconds: 1000));
        await tester.pumpAndSettle();
        // expect(find.text('Domain removed successfully'), findsWidgets);

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
      },
    );

    testWidgets(
      'should delete a domain with mobile screen size',
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
                  ChangeNotifierProxyProvider<ServersProvider,
                      DomainsListProvider>(
                    create: (context) => domainsListProvider,
                    update: (context, serverConfig, servers) =>
                        servers!..update(serverConfig),
                  ),
                  ChangeNotifierProvider<AppConfigProvider>(
                    create: (context) => mockConfigProvider,
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
                    body: DomainLists(),
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

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsOneWidget);
        expect(
          find.text('Choose a domain to see its details.'),
          findsNothing,
        );

        // Tap whitelist domain to open domain detail screen
        await tester.tap(find.text('white01.example.com'));
        await tester.pumpAndSettle();
        expect(find.byType(DomainDetailsScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        // Tap delete button
        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();
        expect(
          find.text('Are you sure you want to delete this domain?'),
          findsOneWidget,
        );
        expect(find.text('Confirm'), findsOneWidget);

        // Tap confirm button
        await tester.tap(find.text('Confirm'));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.text('Domain removed successfully'), findsWidgets);

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
      },
    );

    testWidgets(
      'should filter domains list by search term',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1000, 400);
        tester.view.devicePixelRatio = 1.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<ServersProvider>(
                create: (context) => mockServersProvider,
              ),
              ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
                create: (context) => domainsListProvider,
                update: (context, serverConfig, servers) =>
                    servers!..update(serverConfig),
              ),
              ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => mockConfigProvider,
              ),
              ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
                create: (context) => mockServersProvider,
                update: (context, appConfig, servers) =>
                    servers!..update(appConfig),
              ),
            ],
            child: MaterialApp(
              home: const Scaffold(
                body: DomainLists(),
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              scaffoldMessengerKey: scaffoldMessengerKey,
            ),
          ),
        );

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('Domains'), findsOneWidget);
        expect(find.byIcon(Icons.search), findsOneWidget);
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsOneWidget);

        // Tap search button and input search term
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField), 'white01');
        await tester.pumpAndSettle();

        // Filtered domains list
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsNothing);

        // Tap close button
        await tester.tap(find.byIcon(Icons.close_rounded));
        await tester.pumpAndSettle();

        // Reset search term
        expect(find.text('Domains'), findsOneWidget);
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsOneWidget);
      },
    );

    testWidgets(
      'should add a domain to whitelist',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1000, 400);
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
                  ChangeNotifierProxyProvider<ServersProvider,
                      DomainsListProvider>(
                    create: (context) => domainsListProvider,
                    update: (context, serverConfig, servers) =>
                        servers!..update(serverConfig),
                  ),
                  ChangeNotifierProvider<AppConfigProvider>(
                    create: (context) => mockConfigProvider,
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
                    body: DomainLists(),
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

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('Domains'), findsOneWidget);

        // Tap add button
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        expect(find.text('Add domain'), findsOneWidget);
        await tester.enterText(find.byType(TextField), 'white03.example.com');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Add'));
        await tester.pumpAndSettle();

        // Show whiltelist domains screen
        expect(find.text('Domain added successfully'), findsWidgets);
        expect(find.byType(DomainLists), findsOneWidget);
      },
    );
  });
}
