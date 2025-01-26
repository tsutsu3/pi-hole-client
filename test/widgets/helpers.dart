import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/query_types.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/api/v6/metrics/query.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:provider/provider.dart';

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

final overtimeData = OverTimeData.fromJson(
  {
    'domains_over_time': {
      '1733391300': 0,
      '1733391900': 0,
      '1733392500': 0,
      '1733393100': 0,
      '1733393700': 0,
      '1733394300': 0,
      '1733394900': 0,
      '1733395500': 0,
      '1733396100': 0,
      '1733396700': 3,
      '1733397300': 0,
      '1733397900': 0,
      '1733398500': 0,
      '1733399100': 0,
      '1733399700': 0,
      '1733400300': 2,
      '1733400900': 7,
      '1733401500': 0,
      '1733402100': 0,
      '1733402700': 0,
      '1733403300': 0,
      '1733403900': 2,
      '1733404500': 0,
      '1733405100': 0,
      '1733405700': 0,
      '1733406300': 0,
      '1733406900': 0,
      '1733407500': 2,
      '1733408100': 0,
      '1733408700': 0,
      '1733409300': 0,
      '1733409900': 0,
      '1733410500': 0,
      '1733411100': 0,
      '1733411700': 0,
      '1733412300': 0,
      '1733412900': 0,
      '1733413500': 0,
      '1733414100': 0,
      '1733414700': 0,
      '1733415300': 0,
      '1733415900': 0,
      '1733416500': 0,
      '1733417100': 0,
      '1733417700': 0,
      '1733418300': 0,
      '1733418900': 0,
      '1733419500': 0,
      '1733420100': 0,
      '1733420700': 0,
      '1733421300': 0,
      '1733421900': 0,
      '1733422500': 0,
      '1733423100': 0,
      '1733423700': 0,
      '1733424300': 0,
      '1733424900': 0,
      '1733425500': 0,
      '1733426100': 0,
      '1733426700': 0,
      '1733427300': 0,
      '1733427900': 0,
      '1733428500': 0,
      '1733429100': 0,
      '1733429700': 0,
      '1733430300': 0,
      '1733430900': 0,
      '1733431500': 0,
      '1733432100': 0,
      '1733432700': 0,
      '1733433300': 0,
      '1733433900': 0,
      '1733434500': 0,
      '1733435100': 0,
      '1733435700': 0,
      '1733436300': 0,
      '1733436900': 0,
      '1733437500': 0,
      '1733438100': 0,
      '1733438700': 0,
      '1733439300': 0,
      '1733439900': 0,
      '1733440500': 0,
      '1733441100': 0,
      '1733441700': 0,
      '1733442300': 0,
      '1733442900': 0,
      '1733443500': 0,
      '1733444100': 0,
      '1733444700': 0,
      '1733445300': 0,
      '1733445900': 0,
      '1733446500': 0,
      '1733447100': 0,
      '1733447700': 0,
      '1733448300': 0,
      '1733448900': 0,
      '1733449500': 0,
      '1733450100': 0,
      '1733450700': 0,
      '1733451300': 0,
      '1733451900': 0,
      '1733452500': 0,
      '1733453100': 0,
      '1733453700': 0,
      '1733454300': 0,
      '1733454900': 0,
      '1733455500': 0,
      '1733456100': 0,
      '1733456700': 0,
      '1733457300': 0,
      '1733457900': 0,
      '1733458500': 0,
      '1733459100': 0,
      '1733459700': 0,
      '1733460300': 0,
      '1733460900': 0,
      '1733461500': 0,
      '1733462100': 0,
      '1733462700': 0,
      '1733463300': 0,
      '1733463900': 0,
      '1733464500': 0,
      '1733465100': 0,
      '1733465700': 0,
      '1733466300': 0,
      '1733466900': 0,
      '1733467500': 0,
      '1733468100': 0,
      '1733468700': 0,
      '1733469300': 0,
      '1733469900': 0,
      '1733470500': 0,
      '1733471100': 0,
      '1733471700': 0,
      '1733472300': 0,
      '1733472900': 0,
      '1733473500': 0,
      '1733474100': 0,
      '1733474700': 0,
      '1733475300': 0,
      '1733475900': 0,
      '1733476500': 0,
      '1733477100': 0,
    },
    'ads_over_time': {
      '1733391300': 0,
      '1733391900': 0,
      '1733392500': 0,
      '1733393100': 0,
      '1733393700': 0,
      '1733394300': 0,
      '1733394900': 0,
      '1733395500': 0,
      '1733396100': 0,
      '1733396700': 0,
      '1733397300': 0,
      '1733397900': 0,
      '1733398500': 0,
      '1733399100': 0,
      '1733399700': 0,
      '1733400300': 0,
      '1733400900': 1,
      '1733401500': 0,
      '1733402100': 0,
      '1733402700': 0,
      '1733403300': 0,
      '1733403900': 0,
      '1733404500': 0,
      '1733405100': 0,
      '1733405700': 0,
      '1733406300': 0,
      '1733406900': 0,
      '1733407500': 0,
      '1733408100': 0,
      '1733408700': 0,
      '1733409300': 0,
      '1733409900': 0,
      '1733410500': 0,
      '1733411100': 0,
      '1733411700': 0,
      '1733412300': 0,
      '1733412900': 0,
      '1733413500': 0,
      '1733414100': 0,
      '1733414700': 0,
      '1733415300': 0,
      '1733415900': 0,
      '1733416500': 0,
      '1733417100': 0,
      '1733417700': 0,
      '1733418300': 0,
      '1733418900': 0,
      '1733419500': 0,
      '1733420100': 0,
      '1733420700': 0,
      '1733421300': 0,
      '1733421900': 0,
      '1733422500': 0,
      '1733423100': 0,
      '1733423700': 0,
      '1733424300': 0,
      '1733424900': 0,
      '1733425500': 0,
      '1733426100': 0,
      '1733426700': 0,
      '1733427300': 0,
      '1733427900': 0,
      '1733428500': 0,
      '1733429100': 0,
      '1733429700': 0,
      '1733430300': 0,
      '1733430900': 0,
      '1733431500': 0,
      '1733432100': 0,
      '1733432700': 0,
      '1733433300': 0,
      '1733433900': 0,
      '1733434500': 0,
      '1733435100': 0,
      '1733435700': 0,
      '1733436300': 0,
      '1733436900': 0,
      '1733437500': 0,
      '1733438100': 0,
      '1733438700': 0,
      '1733439300': 0,
      '1733439900': 0,
      '1733440500': 0,
      '1733441100': 0,
      '1733441700': 0,
      '1733442300': 0,
      '1733442900': 0,
      '1733443500': 0,
      '1733444100': 0,
      '1733444700': 0,
      '1733445300': 0,
      '1733445900': 0,
      '1733446500': 0,
      '1733447100': 0,
      '1733447700': 0,
      '1733448300': 0,
      '1733448900': 0,
      '1733449500': 0,
      '1733450100': 0,
      '1733450700': 0,
      '1733451300': 0,
      '1733451900': 0,
      '1733452500': 0,
      '1733453100': 0,
      '1733453700': 0,
      '1733454300': 0,
      '1733454900': 0,
      '1733455500': 0,
      '1733456100': 0,
      '1733456700': 0,
      '1733457300': 0,
      '1733457900': 0,
      '1733458500': 0,
      '1733459100': 0,
      '1733459700': 0,
      '1733460300': 0,
      '1733460900': 0,
      '1733461500': 0,
      '1733462100': 0,
      '1733462700': 0,
      '1733463300': 0,
      '1733463900': 0,
      '1733464500': 0,
      '1733465100': 0,
      '1733465700': 0,
      '1733466300': 0,
      '1733466900': 0,
      '1733467500': 0,
      '1733468100': 0,
      '1733468700': 0,
      '1733469300': 0,
      '1733469900': 0,
      '1733470500': 0,
      '1733471100': 0,
      '1733471700': 0,
      '1733472300': 0,
      '1733472900': 0,
      '1733473500': 0,
      '1733474100': 0,
      '1733474700': 0,
      '1733475300': 0,
      '1733475900': 0,
      '1733476500': 0,
      '1733477100': 0,
    },
    'clients': [
      {'name': '', 'ip': '172.26.0.1'},
      {'name': 'localhost', 'ip': '127.0.0.1'},
    ],
    'over_time': {
      '1733391300': [0, 0],
      '1733391900': [0, 0],
      '1733392500': [0, 0],
      '1733393100': [0, 0],
      '1733393700': [0, 0],
      '1733394300': [0, 0],
      '1733394900': [0, 0],
      '1733395500': [0, 0],
      '1733396100': [0, 0],
      '1733396700': [3, 0],
      '1733397300': [0, 0],
      '1733397900': [0, 0],
      '1733398500': [0, 0],
      '1733399100': [0, 0],
      '1733399700': [0, 0],
      '1733400300': [0, 2],
      '1733400900': [7, 0],
      '1733401500': [0, 0],
      '1733402100': [0, 0],
      '1733402700': [0, 0],
      '1733403300': [0, 0],
      '1733403900': [0, 2],
      '1733404500': [0, 0],
      '1733405100': [0, 0],
      '1733405700': [0, 0],
      '1733406300': [0, 0],
      '1733406900': [0, 0],
      '1733407500': [0, 2],
      '1733408100': [0, 0],
      '1733408700': [0, 0],
      '1733409300': [0, 0],
      '1733409900': [0, 0],
      '1733410500': [0, 0],
      '1733411100': [0, 0],
      '1733411700': [0, 0],
      '1733412300': [0, 0],
      '1733412900': [0, 0],
      '1733413500': [0, 0],
      '1733414100': [0, 0],
      '1733414700': [0, 0],
      '1733415300': [0, 0],
      '1733415900': [0, 0],
      '1733416500': [0, 0],
      '1733417100': [0, 0],
      '1733417700': [0, 0],
      '1733418300': [0, 0],
      '1733418900': [0, 0],
      '1733419500': [0, 0],
      '1733420100': [0, 0],
      '1733420700': [0, 0],
      '1733421300': [0, 0],
      '1733421900': [0, 0],
      '1733422500': [0, 0],
      '1733423100': [0, 0],
      '1733423700': [0, 0],
      '1733424300': [0, 0],
      '1733424900': [0, 0],
      '1733425500': [0, 0],
      '1733426100': [0, 0],
      '1733426700': [0, 0],
      '1733427300': [0, 0],
      '1733427900': [0, 0],
      '1733428500': [0, 0],
      '1733429100': [0, 0],
      '1733429700': [0, 0],
      '1733430300': [0, 0],
      '1733430900': [0, 0],
      '1733431500': [0, 0],
      '1733432100': [0, 0],
      '1733432700': [0, 0],
      '1733433300': [0, 0],
      '1733433900': [0, 0],
      '1733434500': [0, 0],
      '1733435100': [0, 0],
      '1733435700': [0, 0],
      '1733436300': [0, 0],
      '1733436900': [0, 0],
      '1733437500': [0, 0],
      '1733438100': [0, 0],
      '1733438700': [0, 0],
      '1733439300': [0, 0],
      '1733439900': [0, 0],
      '1733440500': [0, 0],
      '1733441100': [0, 0],
      '1733441700': [0, 0],
      '1733442300': [0, 0],
      '1733442900': [0, 0],
      '1733443500': [0, 0],
      '1733444100': [0, 0],
      '1733444700': [0, 0],
      '1733445300': [0, 0],
      '1733445900': [0, 0],
      '1733446500': [0, 0],
      '1733447100': [0, 0],
      '1733447700': [0, 0],
      '1733448300': [0, 0],
      '1733448900': [0, 0],
      '1733449500': [0, 0],
      '1733450100': [0, 0],
      '1733450700': [0, 0],
      '1733451300': [0, 0],
      '1733451900': [0, 0],
      '1733452500': [0, 0],
      '1733453100': [0, 0],
      '1733453700': [0, 0],
      '1733454300': [0, 0],
      '1733454900': [0, 0],
      '1733455500': [0, 0],
      '1733456100': [0, 0],
      '1733456700': [0, 0],
      '1733457300': [0, 0],
      '1733457900': [0, 0],
      '1733458500': [0, 0],
      '1733459100': [0, 0],
      '1733459700': [0, 0],
      '1733460300': [0, 0],
      '1733460900': [0, 0],
      '1733461500': [0, 0],
      '1733462100': [0, 0],
      '1733462700': [0, 0],
      '1733463300': [0, 0],
      '1733463900': [0, 0],
      '1733464500': [0, 0],
      '1733465100': [0, 0],
      '1733465700': [0, 0],
      '1733466300': [0, 0],
      '1733466900': [0, 0],
      '1733467500': [0, 0],
      '1733468100': [0, 0],
      '1733468700': [0, 0],
      '1733469300': [0, 0],
      '1733469900': [0, 0],
      '1733470500': [0, 0],
      '1733471100': [0, 0],
      '1733471700': [0, 0],
      '1733472300': [0, 0],
      '1733472900': [0, 0],
      '1733473500': [0, 0],
      '1733474100': [0, 0],
      '1733474700': [0, 0],
      '1733475300': [0, 0],
      '1733475900': [0, 0],
      '1733476500': [0, 0],
      '1733477100': [0, 0],
    },
  },
);

final realtimeStatus = RealtimeStatus.fromJson(
  {
    'domains_being_blocked': 121860,
    'dns_queries_today': 16,
    'ads_blocked_today': 1,
    'ads_percentage_today': 6.25,
    'unique_domains': 11,
    'queries_forwarded': 9,
    'queries_cached': 6,
    'clients_ever_seen': 2,
    'unique_clients': 2,
    'dns_queries_all_types': 16,
    'reply_UNKNOWN': 0,
    'reply_NODATA': 0,
    'reply_NXDOMAIN': 3,
    'reply_CNAME': 0,
    'reply_IP': 10,
    'reply_DOMAIN': 3,
    'reply_RRNAME': 0,
    'reply_SERVFAIL': 0,
    'reply_REFUSED': 0,
    'reply_NOTIMP': 0,
    'reply_OTHER': 0,
    'reply_DNSSEC': 0,
    'reply_NONE': 0,
    'reply_BLOB': 0,
    'dns_queries_all_replies': 16,
    'privacy_level': 0,
    'status': 'enabled',
    'gravity_last_updated': {
      'file_exists': true,
      'absolute': 1732972589,
      'relative': {'days': 5, 'hours': 18, 'minutes': 14},
    },
    'top_queries': {
      '1.0.26.172.in-addr.arpa': 3,
      '8.8.8.8.in-addr.arpa': 3,
      'github.com': 2,
      'gitlab.com': 1,
      'sample.com': 1,
      'test.com': 1,
      'google.com': 1,
      'google.co.jp': 1,
      'yahoo.co.jp': 1,
      'fix.test.com': 1,
    },
    'top_ads': {'test.com': 1},
    'top_sources': {'172.26.0.1': 10, 'localhost|127.0.0.1': 6},
    'top_sources_blocked': {'172.26.0.1': 1},
    'forward_destinations': {
      'blocked|blocked': 6.25,
      'cached|cached': 37.5,
      'other|other': 0,
      'dns.google#53|8.8.8.8#53': 56.25,
    },
    'querytypes': {
      'A (IPv4)': 62.5,
      'AAAA (IPv6)': 0,
      'ANY': 0,
      'SRV': 0,
      'SOA': 0,
      'PTR': 37.5,
      'TXT': 0,
      'NAPTR': 0,
      'MX': 0,
      'DS': 0,
      'RRSIG': 0,
      'DNSKEY': 0,
      'NS': 0,
      'OTHER': 0,
      'SVCB': 0,
      'HTTPS': 0,
    },
  },
);

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
  await dotenv.load();

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
///   testSetup = TestSetupHelper(
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

  late MockAppConfigProvider mockConfigProvider;
  late MockServersProvider mockServersProvider;
  late MockFiltersProvider mockFiltersProvider;
  late MockStatusProvider mockStatusProvider;
  late MockDomainsListProvider mockDomainsListProvider;

  late MockApiGatewayV5 mockApiGatewayV5;
  late MockApiGatewayV6 mockApiGatewayV6;

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
  ///   },
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
            themeMode: mockConfigProvider.selectedTheme,
            home: Scaffold(
              body: child,
            ),
            locale: Locale(mockConfigProvider.selectedLanguage),
            supportedLocales: const [
              Locale('en', ''),
              Locale('es', ''),
              Locale('de', ''),
              Locale('pl', ''),
              Locale('ja', ''),
            ],
            localizationsDelegates: const [
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
    when(mockConfigProvider.statisticsVisualizationMode).thenReturn(0);
    when(mockConfigProvider.setShowingSnackbar(any)).thenReturn(null);
    when(mockConfigProvider.setOverrideSslCheck(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.setReducedDataCharts(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.setHideZeroValues(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.restoreAppConfig()).thenAnswer((_) async => true);
    when(mockConfigProvider.logs).thenReturn([
      AppLog(
        type: 'sample',
        dateTime: DateTime(2025, 01, 22, 10, 50, 31),
        message: 'message',
        statusCode: '200',
        resBody: 'body',
      ),
    ]);
    when(mockConfigProvider.selectedThemeNumber).thenReturn(0);
    when(mockConfigProvider.selectedLanguage).thenReturn('en');
    when(mockConfigProvider.getAutoRefreshTime).thenReturn(5);
    when(mockConfigProvider.selectedSettingsScreen).thenReturn(null);
    when(mockConfigProvider.selectedLanguageNumber).thenReturn(0);
    when(mockConfigProvider.getAppInfo).thenReturn(
      PackageInfo(
        appName: 'pi-hole client',
        packageName: 'io.github.tsutsu3.pi_hole_clien',
        version: '1.0.0',
        buildNumber: '1',
      ),
    );
    when(mockConfigProvider.setAutoRefreshTime(any))
        .thenAnswer((_) async => true);
    when(mockConfigProvider.colors).thenReturn(lightAppColors);
    when(mockConfigProvider.biometricsSupport).thenReturn(true);
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
    when(mockServersProvider.getServersList).thenReturn([serverV6]);
    when(mockServersProvider.colors).thenReturn(lightAppColors);
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

  void _initStatusProviderMock(String useApiGatewayVersion) {
    when(mockStatusProvider.getStatusLoading).thenReturn(LoadStatus.loaded);
    when(mockStatusProvider.isServerConnected).thenReturn(true);
    when(mockStatusProvider.getOvertimeData).thenReturn(overtimeData);
    when(mockStatusProvider.getOvertimeDataLoadStatus).thenReturn(1);
    when(mockStatusProvider.getOvertimeDataJson)
        .thenReturn(overtimeData.toJson());
    when(mockStatusProvider.getRealtimeStatus).thenReturn(realtimeStatus);
  }

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
        data: queries.queries.map(Log.fromV6).toList(),
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
