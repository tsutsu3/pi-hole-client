import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/groups.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/models/version.dart';

import 'api_gateway_v5_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  FlutterSecureStorage.setMockInitialValues({});

  // const unexpectedError = 'An unexpected error occurred.';
  const fetchError = 'Failed to fetch data from the server.';

  final dataError = {
    'error': {
      'key': 'unauthorized',
      'message': 'Unauthorized',
      'hint': null,
    },
    'took': 0.003,
  };

  group('loginQuery', () {
    late Server server;
    const sessinId = 'n9n9f6c3umrumfq2ese1lvu2pg';
    const url = 'http://example.com/admin/api.php?auth=xxx123&summaryRaw';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });
    test('Return success with valid auth token', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {})).thenAnswer(
        (_) async => http.Response(
          jsonEncode({
            'domains_being_blocked': 121,
            'dns_queries_today': 12,
            'ads_blocked_today': 1,
            'ads_percentage_today': 8.333333,
            'unique_domains': 11,
            'queries_forwarded': 9,
            'queries_cached': 2,
            'clients_ever_seen': 2,
            'unique_clients': 2,
            'dns_queries_all_types': 12,
            'reply_UNKNOWN': 0,
            'reply_NODATA': 0,
            'reply_NXDOMAIN': 1,
            'reply_CNAME': 0,
            'reply_IP': 10,
            'reply_DOMAIN': 1,
            'reply_RRNAME': 0,
            'reply_SERVFAIL': 0,
            'reply_REFUSED': 0,
            'reply_NOTIMP': 0,
            'reply_OTHER': 0,
            'reply_DNSSEC': 0,
            'reply_NONE': 0,
            'reply_BLOB': 0,
            'dns_queries_all_replies': 12,
            'privacy_level': 0,
            'status': 'enabled',
            'gravity_last_updated': {
              'file_exists': true,
              'absolute': 17329,
              'relative': {'days': 4, 'hours': 23, 'minutes': 41},
            },
          }),
          200,
        ),
      );

      when(
        mockClient.get(
          Uri.parse('http://example.com/admin/api.php?auth=xxx123&enable=0'),
          headers: {},
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode({'status': 'enabled'}),
          200,
          headers: {
            'set-cookie': 'sid=$sessinId; path=/; HttpOnly; SameSite=Strict',
          },
        ),
      );

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.success);
      expect(response.sid, sessinId);
      expect(response.status, 'enabled');
      expect(response.log, isNull);
    });

    test('Return error with invalid auth token', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode([]), 200));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.authError);
      expect(response.sid, isNull);
      expect(response.status, isNull);
      expect(response.log, isNotNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'auth_error');
      expect(response.log?.statusCode, '200');
      expect(response.log?.resBody, '[]');
    });

    test('Return error when accessing non Pi-hole server', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      // example.com's 404 page
      final htmlString = '''
        <!doctype html>
        <html>
        <head>
            <title>Example Domain</title>

            <meta charset='utf-8' />
            <meta http-equiv='Content-type' content='text/html; charset=utf-8' />
            <meta name='viewport' content='width=device-width, initial-scale=1' />
            <style type='text/css'>
            body {
                background-color: #f0f0f2;
                margin: 0;
                padding: 0;
                font-family: -apple-system, system-ui, BlinkMacSystemFont, 'Segoe UI', 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;

            }
            div {
                width: 600px;
                margin: 5em auto;
                padding: 2em;
                background-color: #fdfdff;
                border-radius: 0.5em;
                box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);
            }
            a:link, a:visited {
                color: #38488f;
                text-decoration: none;
            }
            @media (max-width: 700px) {
                div {
                    margin: 0 auto;
                    width: auto;
                }
            }
            </style>
        </head>

        <body>
        <div>
            <h1>Example Domain</h1>
            <p>This domain is for use in illustrative examples in documents. You may use this
            domain in literature without prior coordination or asking for permission.</p>
            <p><a href='https://www.iana.org/domains/example'>More information...</a></p>
        </div>
        </body>
        </html>
      '''
          .trimLeft();

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(htmlString, 404));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.noConnection);
      expect(response.sid, isNull);
      expect(response.status, isNull);
      expect(response.log, isNotNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'no_connection_2');
      expect(response.log?.statusCode, '404');
      expect(response.log?.resBody, htmlString);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.error);
      expect(response.sid, isNull);
      expect(response.status, isNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'Exception: Unexpected error test');
    });
  });

  group('realtimeStatus', () {
    late Server server;
    const url =
        'http://example.com/admin/api.php?auth=xxx123&summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {
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
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.realtimeStatus();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.realtimeStatus();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('disableServerRequest', () {
    late Server server;
    const url = 'http://example.com/admin/api.php?auth=xxx123&disable=5';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {'status': 'disabled'};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.disableServerRequest(5);

      expect(response.result, APiResponseType.success);
      expect(response.status, 'disabled');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.disableServerRequest(5);

      expect(response.result, APiResponseType.error);
      expect(response.status, isNull);
    });
  });

  group('enableServerRequest', () {
    late Server server;
    const url = 'http://example.com/admin/api.php?auth=xxx123&enable';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {'status': 'enabled'};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.enableServerRequest();

      expect(response.result, APiResponseType.success);
      expect(response.status, 'enabled');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.enableServerRequest();

      expect(response.result, APiResponseType.error);
      expect(response.status, isNull);
    });
  });

  group('fetchOverTimeData', () {
    late Server server;
    const url =
        'http://example.com/admin/api.php?auth=xxx123&overTimeData10mins&overTimeDataClients&getClientNames';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {
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
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.fetchOverTimeData();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.fetchOverTimeData();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('fetchLogs', () {
    late Server server;
    const url =
        'http://example.com/admin/api.php?auth=xxx123&getAllQueries&from=1733472267&until=1733479467';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {
        'data': [
          [
            '1733479389',
            'A',
            'google.com',
            '172.26.0.1',
            '2',
            '0',
            '4',
            '324',
            'N/A',
            '-1',
            'dns.google#53',
            '',
          ],
          [
            '1733479462',
            'A',
            'google.co.jp',
            '172.26.0.1',
            '2',
            '0',
            '4',
            '742',
            'N/A',
            '-1',
            'dns.google#53',
            '',
          ],
        ],
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final from = DateTime.fromMillisecondsSinceEpoch(1733472267 * 1000);
      final until = DateTime.fromMillisecondsSinceEpoch(1733479467 * 1000);
      final response = await apiGateway.fetchLogs(from, until);

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final from = DateTime.fromMillisecondsSinceEpoch(1733472267 * 1000);
      final until = DateTime.fromMillisecondsSinceEpoch(1733479467 * 1000);
      final response = await apiGateway.fetchLogs(from, until);

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('setWhiteBlacklist', () {
    late Server server;
    const url =
        'http://example.com/admin/api.php?auth=xxx123&list=black&add=google.com';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success when add new domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {'success': true, 'message': 'Added google.com'};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.success);
      expect(response.data!.toJson(), data);
      expect(response.message, isNull);
    });

    test('Return success when add exist domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {
        'success': true,
        'message': 'Not adding google.com as it is already on the list',
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.success);
      expect(response.data!.toJson(), data);
      expect(response.message, isNull);
    });

    test('Return error with invalid list type', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      const data =
          'Invalid list [supported: black, regex_black, white, regex_white]';
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
      expect(response.message, 'Invalid response format');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
      expect(response.message, isNull);
    });
  });

  group('getDomainLists', () {
    late Server server;
    final urls = [
      'http://example.com/admin/api.php?auth=xxx123&list=white',
      'http://example.com/admin/api.php?auth=xxx123&list=regex_white',
      'http://example.com/admin/api.php?auth=xxx123&list=black',
      'http://example.com/admin/api.php?auth=xxx123&list=regex_black',
    ];

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = [
        {
          'data': [
            {
              'id': 14,
              'type': 0,
              'domain': 'example.com',
              'enabled': 1,
              'date_added': 1733559182,
              'date_modified': 1733559182,
              'comment': '',
              'groups': [0],
            },
          ],
        },
        {'data': []},
        {
          'data': [
            {
              'id': 2,
              'type': 1,
              'domain': 'test.com',
              'enabled': 1,
              'date_added': 1733401118,
              'date_modified': 1733496612,
              'comment': '',
              'groups': [0],
            },
          ],
        },
        {'data': []},
      ];
      for (var i = 0; i < urls.length; i++) {
        when(mockClient.get(Uri.parse(urls[i]), headers: {}))
            .thenAnswer((_) async => http.Response(jsonEncode(data[i]), 200));
      }

      final response = await apiGateway.getDomainLists();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {'data': []};
      for (var i = 0; i < urls.length - 1; i++) {
        when(mockClient.get(Uri.parse(urls[i]), headers: {}))
            .thenAnswer((_) async => http.Response(jsonEncode(data), 200));
      }
      when(mockClient.get(Uri.parse(urls[3]), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getDomainLists();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('removeDomainFromList', () {
    late Server server;
    const url =
        'http://example.com/admin/api.php?auth=xxx123&list=white&sub=google.com';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {'success': true, 'message': null};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.removeDomainFromList(
        Domain(
          id: 1,
          domain: 'google.com',
          type: 0,
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: '',
          groups: [],
        ),
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, isNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.removeDomainFromList(
        Domain(
          id: 1,
          domain: 'google.com',
          type: 0,
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: '',
          groups: [],
        ),
      );

      expect(response.result, APiResponseType.error);
      expect(response.message, isNull);
    });
  });

  group('addDomainToList', () {
    late Server server;
    const url =
        'http://example.com/admin/api.php?auth=xxx123&list=black&add=google.com';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('Return success when add new domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {'success': true, 'message': 'Added google.com'};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.success);
    });

    test('Return success when add exist domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {
        'success': true,
        'message': 'Not adding google.com as it is already on the list',
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.alreadyAdded);
    });

    test('Return error with invalid list type', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      const data =
          'Invalid list [supported: black, regex_black, white, regex_white]';
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.error);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.error);
    });
  });

  group('fetchHostInfo', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.fetchHostInfo();

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('fetchSensorsInfo', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.fetchSensorsInfo();

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('fetchSystemInfo', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.fetchSystemInfo();

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('fetchVersionInfo', () {
    late Server server;
    const url = 'http://example.com/admin/api.php?auth=xxx123&versions';
    const data = {
      'core_update': false,
      'web_update': false,
      'FTL_update': false,
      'docker_update': true,
      'core_current': 'v5.18.3',
      'web_current': 'v5.21',
      'FTL_current': 'v5.25.2',
      'docker_current': '2024.07.0',
      'core_latest': 'v6.0.5',
      'web_latest': 'v6.0.2',
      'FTL_latest': 'v6.0.4',
      'docker_latest': '2025.03.0',
      'core_branch': 'master',
      'web_branch': 'master',
      'FTL_branch': 'master',
    };

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return success when use docker', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));
      final response = await apiGateway.fetchVersionInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(response.data?.toJson(), VersionInfo.fromJson(data).toJson());
      expect(response.data?.core.canUpdate, true);
      expect(response.data?.web.canUpdate, true);
      expect(response.data?.ftl.canUpdate, true);
      expect(response.data?.docker.canUpdate, true);
    });

    test('should return success when no use docker', () async {
      const dataNoDocker = {
        'core_update': true,
        'web_update': true,
        'FTL_update': true,
        'core_current': 'v5.18.3',
        'web_current': 'v5.21',
        'FTL_current': 'v5.25.2',
        'core_latest': 'v6.0.5',
        'web_latest': 'v6.0.2',
        'FTL_latest': 'v6.0.4',
        'core_branch': 'master',
        'web_branch': 'master',
        'FTL_branch': 'master',
      };

      const dataExpected = {
        'core_update': true,
        'web_update': true,
        'FTL_update': true,
        'core_current': 'v5.18.3',
        'web_current': 'v5.21',
        'FTL_current': 'v5.25.2',
        'docker_current': '',
        'core_latest': 'v6.0.5',
        'web_latest': 'v6.0.2',
        'FTL_latest': 'v6.0.4',
        'docker_latest': '',
        'core_branch': 'master',
        'web_branch': 'master',
        'FTL_branch': 'master',
      };

      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      when(mockClient.get(Uri.parse(url), headers: {})).thenAnswer(
        (_) async => http.Response(jsonEncode(dataNoDocker), 200),
      );
      final response = await apiGateway.fetchVersionInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        VersionInfo.fromJson(dataExpected).toJson(),
      );
      expect(response.data?.core.canUpdate, true);
      expect(response.data?.web.canUpdate, true);
      expect(response.data?.ftl.canUpdate, true);
      expect(response.data?.docker.canUpdate, false);
    });

    test('should return error when fetch fails', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(dataError), 401));
      final response = await apiGateway.fetchVersionInfo();

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data, null);
    });
  });

  group('fetchAllServerInfo', () {
    late Server server;
    const url = 'http://example.com/admin/api.php?auth=xxx123&versions';
    const data = {
      'core_update': false,
      'web_update': false,
      'FTL_update': false,
      'docker_update': true,
      'core_current': 'v5.18.3',
      'web_current': 'v5.21',
      'FTL_current': 'v5.25.2',
      'docker_current': '2024.07.0',
      'core_latest': 'v6.0.5',
      'web_latest': 'v6.0.2',
      'FTL_latest': 'v6.0.4',
      'docker_latest': '2025.03.0',
      'core_branch': 'master',
      'web_branch': 'master',
      'FTL_branch': 'master',
    };

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));
      final response = await apiGateway.fetchAllServerInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(response.version?.toJson(), VersionInfo.fromJson(data).toJson());
      expect(response.system?.toJson(), null);
      expect(response.sensors?.toJson(), null);
      expect(response.host?.toJson(), null);
    });

    test('should return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.fetchAllServerInfo();

      expect(response.result, APiResponseType.error);
    });
  });

  group('getSubscriptions', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.getSubscriptions();

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('removeSubscription', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.removeSubscription(
        url: 'http://not.exist.example.com',
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('createSubscription', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.createSubscription(
        body: SubscriptionRequest(
          address: 'http://not.exist.example.com',
          type: 'allow',
          groups: [0],
        ),
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('updateSubscription', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.updateSubscription(
        body: SubscriptionRequest(
          address: 'http://not.exist.example.com',
          type: 'allow',
          groups: [0],
        ),
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('searchSubscriptions', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.searchSubscriptions(
        domain: 'http://not.exist.example.com',
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('getGroups', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.getGroups();

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('removeGroup', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.removeGroup(
        name: 'http://not.exist.example.com',
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('createGroup', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.createGroup(
        body: GroupRequest(name: 'http://example.com/test.txt', enabled: true),
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });

  group('updateGroup', () {
    late Server server;
    const notSupportedMessage = 'Pi-hole v5 does not support this feature.';

    setUp(() async {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v5,
      );
      await server.sm.saveToken('xxx123');
    });

    test('should return notSupported when server is v5', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final response = await apiGateway.updateGroup(
        body: GroupRequest(name: 'http://example.com/test.txt', enabled: true),
      );

      expect(response.result, APiResponseType.notSupported);
      expect(response.message, notSupportedMessage);
    });
  });
}
