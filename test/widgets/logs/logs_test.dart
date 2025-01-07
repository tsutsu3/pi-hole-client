import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/query_types.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/api/v6/metrics/query.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/screens/logs/logs.dart';
import './logs_test.mocks.dart';

@GenerateMocks(
  [AppConfigProvider, FiltersProvider, ServersProvider, ApiGatewayV6],
)
void main() async {
// For loading the .env file
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final server = Server(
    address: 'address',
    alias: 'test',
    defaultServer: false,
    apiVersion: 'v6',
  );

  final data = {
    'queries': [
      {
        'id': 1,
        'time': DateTime.now().millisecondsSinceEpoch / 1000 - 600,
        'type': 'A',
        'domain': 'white.example.com',
        'cname': null,
        'status': 'FORWARDED',
        'client': {'ip': '192.168.100.2'},
        'dnssec': 'INSECURE',
        'reply': {'type': 'IP', 'time': 19},
        'list_id': null,
        'upstream': 'localhost#5353',
        'dbid': 112421354,
      },
    ],
    'cursor': 175881,
    'recordsTotal': 1234,
    'recordsFiltered': 1234,
    'draw': 1,
    'took': 0.003,
  };

  final queries = Queries.fromJson(data);

  group('Query logs screen tests', () {
    late MockApiGatewayV6 mockApiGatewayV6;
    late MockAppConfigProvider mockConfigProvider;
    late MockServersProvider mockServersProvider;
    late MockFiltersProvider mockFiltersProvider;

    setUp(() async {
      mockApiGatewayV6 = MockApiGatewayV6();
      mockConfigProvider = MockAppConfigProvider();
      mockServersProvider = MockServersProvider();
      mockFiltersProvider = MockFiltersProvider();

      // mock Apigateway
      when(mockApiGatewayV6.fetchLogs(any, any)).thenAnswer((_) async {
        return FetchLogsResponse(
          result: APiResponseType.success,
          data: queries.queries.map((query) => Log.fromV6(query)).toList(),
        );
      });
      when(mockApiGatewayV6.setWhiteBlacklist(any, any)).thenAnswer((_) async {
        return SetWhiteBlacklistResponse(
          result: APiResponseType.success,
          data: DomainResult(success: true, message: 'Added white.example.com'),
        );
      });

      // mock AppConfigProvider
      bool showingSnackbar = false;
      when(mockConfigProvider.showingSnackbar).thenReturn(showingSnackbar);
      when(mockConfigProvider.setShowingSnackbar(any)).thenAnswer((_) {});
      when(mockConfigProvider.logsPerQuery).thenReturn(2);
      when(mockServersProvider.colors).thenReturn(lightAppColors);

      // mock ServersProvider
      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(mockServersProvider.numShown).thenReturn(14);
      when(mockServersProvider.getQueryStatus(any))
          .thenReturn(queryStatusesV6[3 - 1]);

      // mock FiltersProvier
      when(mockFiltersProvider.statusSelected)
          .thenReturn([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
      when(mockFiltersProvider.selectedClients).thenReturn(['192.168.100.2']);
      when(mockFiltersProvider.selectedDomain).thenReturn('white.example.com');
      when(mockFiltersProvider.startTime).thenReturn(DateTime.now());
      when(mockFiltersProvider.endTime)
          .thenReturn(DateTime.now().add(const Duration(hours: 2)));
      when(mockFiltersProvider.resetFilters()).thenReturn(null);
      when(mockFiltersProvider.totalClients)
          .thenReturn(['localhost', '192.168.100.2']);
      when(mockFiltersProvider.resetTime()).thenReturn(null);
      when(mockFiltersProvider.resetStatus()).thenReturn(null);
      when(mockFiltersProvider.resetClients()).thenReturn(null);
      when(mockFiltersProvider.setSelectedDomain(null)).thenReturn(null);
      when(mockFiltersProvider.statusAllowedAndRetried)
          .thenReturn([3, 4, 13, 14, 15]);
    });

    testWidgets(
      'should mobile screen layout',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 400);
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
              ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
                create: (context) => mockFiltersProvider,
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
                body: Logs(),
              ),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              scaffoldMessengerKey: scaffoldMessengerKey,
            ),
          ),
        );

        // Show logs screen
        expect(find.byType(Logs), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('Query logs'), findsOneWidget);
        expect(
          find.text('Choose a query log to see its details.'),
          findsNothing,
        );
      },
    );

    testWidgets(
      'should set blacklist domains',
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
                  ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
                    create: (context) => mockFiltersProvider,
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
                    body: Logs(),
                  ),
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    AppLocalizations.delegate,
                  ],
                  scaffoldMessengerKey: scaffoldMessengerKey,
                ),
              );
            },
          ),
        );

        // Show logs screen
        expect(find.byType(Logs), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('Query logs'), findsOneWidget);
        expect(find.text('white.example.com'), findsOneWidget);
        expect(
          find.text('Choose a query log to see its details.'),
          findsOneWidget,
        );

        // Tap whitelist domain to open domain detail screen
        await tester.tap(find.text('white.example.com'));
        await tester.pumpAndSettle();
        expect(find.text('Log details'), findsOneWidget);

        // Tap blacklist button
        expect(find.byIcon(Icons.gpp_bad_rounded), findsOneWidget);
        await tester.tap(find.byIcon(Icons.gpp_bad_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        // Return to logs screen (Not raise Exception)
        expect(find.text('Domain added to blacklist.'), findsWidgets);
        expect(find.byType(Logs), findsOneWidget);
      },
    );
  });
}
