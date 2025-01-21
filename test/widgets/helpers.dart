import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/query_types.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/api/v6/metrics/query.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:provider/provider.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './helpers.mocks.dart';

final serverV5 = Server(
  address: 'http://localhost:8080',
  alias: 'test v5',
  defaultServer: false,
  apiVersion: 'v5',
);

final serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
);

final domains = [
  Domain(
    id: 1,
    type: 0,
    domain: 'example.com',
    enabled: 1,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    comment: null,
    groups: [0],
  ),
];

final blackDomains = [
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
];

final whiteDomains = [
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
];

final queries = Queries.fromJson({
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
});

/// Initialize the app with the given environment file.
///
/// This function should be called before any other setup.
/// Call this function in the `main` function of the test file.
///
/// Parameters:
/// - `envFileName`: The name of the environment file.
///
/// Example:
/// ```dart
/// void main() async {
///   await initializeApp();
///   // ...
/// ```
Future<void> initializeApp() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  FlutterSecureStorage.setMockInitialValues({
    'http://localhost:8080_token': 'token123',
    'http://localhost:8081_password': 'password123',
  });
}

/// Helper class to setup the providers for the test.
///
/// This class should be used in the `setUp` method of the test.
///
/// Example:
/// ```dart
/// setUp(() {
///   // If you need to override the default mock behavior
///   final customApiGateway = MockApiGatewayV6();
///
///   testSetup = TestSetup(
///     server: server,
///     queries: queries,
///     customApiGatewayV6: customApiGateway,
///   );
///
///   // Initialize the mocks
///   testSetup.initializeMocks();
///
///   // Override the default mock behavior
///   when(customApiGateway.fetchLogs(any, any)).thenAnswer((_) async {
///     return FetchLogsResponse(
///       result: APiResponseType.success,
///       data: [],
///     );
///   });
/// });
/// });
@GenerateMocks([
  AppConfigProvider,
  ServersProvider,
  FiltersProvider,
  StatusProvider,
  DomainsListProvider,
  ApiGatewayV5,
  ApiGatewayV6,
])
class TestSetupHelper {
  late MockAppConfigProvider mockConfigProvider;
  late MockServersProvider mockServersProvider;
  late MockFiltersProvider mockFiltersProvider;
  late MockStatusProvider mockStatusProvider;
  late MockDomainsListProvider mockDomainsListProvider;

  late MockApiGatewayV5 mockApiGatewayV5;
  late MockApiGatewayV6 mockApiGatewayV6;

  TestSetupHelper({
    MockAppConfigProvider? customConfigProvider,
    MockServersProvider? customServersProvider,
    MockFiltersProvider? customFiltersProvider,
    MockStatusProvider? customStatusProvider,
    MockDomainsListProvider? customDomainsListProvider,
    MockApiGatewayV5? customApiGatewayV5,
    MockApiGatewayV6? customApiGatewayV6,
  }) {
    mockConfigProvider = customConfigProvider ?? MockAppConfigProvider();
    mockServersProvider = customServersProvider ?? MockServersProvider();
    mockFiltersProvider = customFiltersProvider ?? MockFiltersProvider();
    mockStatusProvider = customStatusProvider ?? MockStatusProvider();
    mockDomainsListProvider =
        customDomainsListProvider ?? MockDomainsListProvider();

    mockApiGatewayV5 = customApiGatewayV5 ?? MockApiGatewayV5();
    mockApiGatewayV6 = customApiGatewayV6 ?? MockApiGatewayV6();
  }

  void initializeMock({String useApiGatewayVersion = 'v5'}) {
    _initConfiProviderMock(useApiGatewayVersion);
    _initServerProviderMock(useApiGatewayVersion);
    _initFiltersProviderMock(useApiGatewayVersion);
    _initStatusProviderMock(useApiGatewayVersion);
    _initDomainListProviderMock(useApiGatewayVersion);
    _initApiGatewayV5Mock();
    _initApiGatewayV6Mock();
  }

  /// Build the test widget with the given setup helper.
  ///
  /// Example:
  /// ```dart
  /// testWidgets(
  ///   'should show the successful snackbar when adding a server',
  ///   (WidgetTester tester) async {
  ///     await tester.pumpWidget(
  ///       testSetup.buildTestWidget(
  ///         YourTestWidget(),  // Your test widget
  ///       ),
  ///     );
  /// );
  /// ```
  Widget buildTestWidget(Widget child) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ServersProvider>(
              create: (context) => mockServersProvider,
            ),
            ChangeNotifierProvider<AppConfigProvider>(
              create: (context) => mockConfigProvider,
            ),
            ChangeNotifierProvider<StatusProvider>(
              create: (context) => mockStatusProvider,
            ),
            ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
              create: (context) => mockDomainsListProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
              create: (context) => mockFiltersProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
              create: (context) => mockServersProvider,
              update: (context, appConfig, servers) =>
                  servers!..update(appConfig),
            ),
          ],
          child: MaterialApp(
            theme: lightTheme(lightDynamic),
            darkTheme: darkTheme(darkDynamic),
            themeMode: ThemeMode.light,
            home: Scaffold(
              body: child,
            ),
            locale: const Locale('en'),
            supportedLocales: const [
              Locale('en', ''),
              Locale('ja', ''),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            scaffoldMessengerKey: scaffoldMessengerKey,
          ),
        );
      },
    );
  }

  void _initConfiProviderMock(String useApiGatewayVersion) {
    when(mockConfigProvider.showingSnackbar).thenReturn(false);
    when(mockConfigProvider.logsPerQuery).thenReturn(2);
    when(mockConfigProvider.passCode).thenReturn(null);
    when(mockConfigProvider.useBiometrics).thenReturn(false);
    when(mockConfigProvider.overrideSslCheck).thenReturn(false);
    when(mockConfigProvider.reducedDataCharts).thenReturn(false);
    when(mockConfigProvider.hideZeroValues).thenReturn(false);
    when(mockConfigProvider.selectedTheme).thenReturn(ThemeMode.light);
    when(mockConfigProvider.setShowingSnackbar(any)).thenReturn(null);
    when(mockConfigProvider.setOverrideSslCheck(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.setReducedDataCharts(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.setHideZeroValues(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.restoreAppConfig()).thenAnswer((_) async => true);
  }

  void _initServerProviderMock(String useApiGatewayVersion) {
    when(mockServersProvider.selectedApiGateway).thenReturn(
      useApiGatewayVersion == 'v5'
          ? mockApiGatewayV5 as ApiGateway
          : mockApiGatewayV6 as ApiGateway,
    );
    when(mockServersProvider.selectedServer).thenReturn(
      useApiGatewayVersion == 'v5' ? serverV5 : serverV6,
    );
    when(mockServersProvider.colors).thenReturn(lightAppColors);
    when(mockServersProvider.numShown).thenReturn(
      useApiGatewayVersion == 'v5' ? 12 : 14,
    );
    when(mockServersProvider.getQueryStatus(any)).thenReturn(
      // forwarded
      useApiGatewayVersion == 'v5' ? queryStatusesV5[1] : queryStatusesV6[2],
    );
    when(mockServersProvider.checkUrlExists(any))
        .thenAnswer((_) async => {'result': 'success', 'exists': false});
    when(mockServersProvider.addServer(any)).thenAnswer((_) async => true);
    when(mockServersProvider.editServer(any)).thenAnswer((_) async => true);
    when(mockServersProvider.loadApiGateway(any)).thenReturn(
      useApiGatewayVersion == 'v5'
          ? mockApiGatewayV5 as ApiGateway
          : mockApiGatewayV6 as ApiGateway,
    );
    when(mockServersProvider.deleteDbData()).thenAnswer((_) async => true);
  }

  void _initFiltersProviderMock(String useApiGatewayVersion) {
    when(mockFiltersProvider.statusSelected).thenReturn(
      useApiGatewayVersion == 'v5'
          ? [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14]
          : [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    );
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
    when(mockFiltersProvider.statusAllowedAndRetried).thenReturn(
      useApiGatewayVersion == 'v5' ? [2, 3, 12, 13, 14] : [3, 4, 13, 14, 15],
    );
  }

  void _initStatusProviderMock(String useApiGatewayVersion) {}

  void _initDomainListProviderMock(String useApiGatewayVersion) {}

  void _initApiGatewayV5Mock() {
    when(mockApiGatewayV5.loginQuery()).thenAnswer(
      (_) async => LoginQueryResponse(
        result: APiResponseType.success,
        status: 'enabled',
        sid: 'sid123',
      ),
    );
  }

  void _initApiGatewayV6Mock() {
    when(mockApiGatewayV6.getDomainLists()).thenAnswer(
      (_) async => GetDomainLists(
        result: APiResponseType.success,
        data: DomainListResult(
          whitelist: domains,
          whitelistRegex: [],
          blacklist: domains,
          blacklistRegex: [],
        ),
      ),
    );

    when(mockApiGatewayV6.removeDomainFromList(any)).thenAnswer((_) async {
      return RemoveDomainFromListResponse(result: APiResponseType.success);
    });

    when(mockApiGatewayV6.addDomainToList(any)).thenAnswer((_) async {
      return AddDomainToListResponse(result: APiResponseType.success);
    });

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
  }
}
