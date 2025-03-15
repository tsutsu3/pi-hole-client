import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/api/v6/ftl/host.dart';
import 'package:pi_hole_client/models/api/v6/ftl/version.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/host.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/version.dart';
import 'package:pi_hole_client/services/secret_manager.dart';

import 'api_gateway_v6_test.mocks.dart';

class SecretManagerMock implements SecretManager {
  SecretManagerMock(this._sid, this._password);
  String? _sid;
  String? _password;

  @override
  String? get sid => _sid;

  @override
  Future<String?>? get password async {
    try {
      return _password;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?>? get token async {
    try {
      return _sid;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> save(String sid) async {
    _sid = sid;
    return true;
  }

  @override
  Future<bool> load() async {
    return true;
  }

  @override
  Future<bool> delete() async {
    _sid = null;
    return true;
  }

  @override
  Future<bool> savePassword(String password) async {
    _password = password;
    return true;
  }

  @override
  Future<bool> saveToken(String token) async {
    _sid = token;
    return true;
  }

  @override
  Future<bool> deletePassword() async {
    _password = null;
    return true;
  }

  @override
  Future<bool> deleteToken() async {
    _sid = null;
    return true;
  }
}

@GenerateMocks([http.Client])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('loginQuery', () {
    late Server server;
    const sessinId = 'n9n9f6c3umrumfq2ese1lvu2pg';
    final urls = [
      'http://example.com/api/auth',
      'http://example.com/api/dns/blocking',
    ];

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        sm: SecretManagerMock(sessinId, 'xxx123'),
      );
    });
    test('Return success with valid password', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.post(
          Uri.parse(urls[0]),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode({
            'session': {
              'valid': true,
              'totp': false,
              'sid': 'n9n9f6c3umrumfq2ese1lvu2pg',
              'csrf': 'Ux87YTIiMOf/GKCefVIOMw=',
              'validity': 300,
              'message': 'correct password',
            },
            'took': 0.039638996124267578,
          }),
          200,
        ),
      );

      var callCount = 0;

      when(
        mockClient.get(
          Uri.parse(urls[1]),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async {
        callCount++;
        if (callCount == 1) {
          return http.Response(
            jsonEncode({
              'error': {
                'key': 'unauthorized',
                'message': 'Unauthorized',
                'hint': null,
              },
              'took': 4.1484832763671875e-05,
            }),
            401,
          );
        } else {
          // 2回目以降の呼び出し: 正常なレスポンスを返す
          return http.Response(
            jsonEncode({'blocking': 'enabled', 'timer': null, 'took': 0.003}),
            200,
          );
        }
      });

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.success);
      expect(response.sid, sessinId);
      expect(response.status, 'enabled');
      expect(response.log, isNull);
    });

    test('Return success with exist sid', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse(urls[1]),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          jsonEncode({'blocking': 'enabled', 'timer': null, 'took': 0.003}),
          200,
        );
      });

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.success);
      expect(response.sid, sessinId);
      expect(response.status, 'enabled');
      expect(response.log, isNull);
    });

    test('Return error with invalid password', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse(urls[1]),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          jsonEncode({
            'error': {
              'key': 'unauthorized',
              'message': 'Unauthorized',
              'hint': null,
            },
            'took': 4.1484832763671875e-05,
          }),
          401,
        );
      });

      when(
        mockClient.post(
          Uri.parse(urls[0]),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode({
            'session': {
              'valid': false,
              'totp': false,
              'sid': null,
              'validity': -1,
              'message': 'password incorrect',
            },
            'took': 0.039638996124267578,
          }),
          401,
        ),
      );

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.authError);
      expect(response.sid, isNull);
      expect(response.status, isNull);
      expect(response.log, isNotNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'auth_error');
      expect(response.log?.statusCode, '401');
      expect(response.log?.resBody, isNotNull);
    });

    test('Return error when accessing non Pi-hole server', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
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

      when(
        mockClient.get(
          Uri.parse(urls[1]),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          jsonEncode({
            'error': {
              'key': 'unauthorized',
              'message': 'Unauthorized',
              'hint': null,
            },
            'took': 4.1484832763671875e-05,
          }),
          401,
        );
      });

      when(
        mockClient.post(
          Uri.parse(urls[0]),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(htmlString, 404));

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
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse(urls[1]),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          jsonEncode({
            'error': {
              'key': 'unauthorized',
              'message': 'Unauthorized',
              'hint': null,
            },
            'took': 4.1484832763671875e-05,
          }),
          401,
        );
      });

      when(
        mockClient.post(
          Uri.parse(urls[0]),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.error);
      expect(response.sid, isNull);
      expect(response.status, isNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'Exception: Unexpected error test');
    });

    test('Return success with refresh true', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse(urls[0]),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '',
          204,
        ),
      );

      when(
        mockClient.post(
          Uri.parse(urls[0]),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode({
            'session': {
              'valid': true,
              'totp': false,
              'sid': 'n9n9f6c3umrumfq2ese1lvu2pg',
              'csrf': 'Ux87YTIiMOf/GKCefVIOMw=',
              'validity': 300,
              'message': 'correct password',
            },
            'took': 0.039638996124267578,
          }),
          200,
        ),
      );

      var callCount = 0;

      when(
        mockClient.get(
          Uri.parse(urls[1]),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async {
        callCount++;
        if (callCount == 1) {
          return http.Response(
            jsonEncode({
              'error': {
                'key': 'unauthorized',
                'message': 'Unauthorized',
                'hint': null,
              },
              'took': 4.1484832763671875e-05,
            }),
            401,
          );
        } else {
          // 2回目以降の呼び出し: 正常なレスポンスを返す
          return http.Response(
            jsonEncode({'blocking': 'enabled', 'timer': null, 'took': 0.003}),
            200,
          );
        }
      });

      final response = await apiGateway.loginQuery(refresh: true);

      expect(response.result, APiResponseType.success);
      expect(response.sid, sessinId);
      expect(response.status, 'enabled');
      expect(response.log, isNull);
    });
  });

  group('realtimeStatus', () {
    late Server server;
    final urls = [
      'http://example.com/api/stats/summary',
      'http://example.com/api/info/ftl',
      'http://example.com/api/dns/blocking',
      'http://example.com/api/stats/top_domains',
      'http://example.com/api/stats/top_domains?blocked=true',
      'http://example.com/api/stats/top_clients',
      'http://example.com/api/stats/top_clients?blocked=true',
      'http://example.com/api/stats/upstreams',
    ];

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
      server.sm.savePassword('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = [
        {
          'queries': {
            'total': 7497,
            'blocked': 3465,
            'percent_blocked': 34.5,
            'unique_domains': 445,
            'forwarded': 4574,
            'cached': 9765,
            'types': {
              'A': 3643,
              'AAAA': 123,
              'ANY': 3423,
              'SRV': 345,
              'SOA': 7567,
              'PTR': 456,
              'TXT': 85,
              'NAPTR': 346,
              'MX': 457,
              'DS': 456,
              'RRSIG': 345,
              'DNSKEY': 55,
              'NS': 868,
              'SVCB': 645,
              'HTTPS': 4,
              'OTHER': 845,
            },
            'status': {
              'UNKNOWN': 3,
              'GRAVITY': 72,
              'FORWARDED': 533,
              'CACHE': 32,
              'REGEX': 84,
              'DENYLIST': 31,
              'EXTERNAL_BLOCKED_IP': 0,
              'EXTERNAL_BLOCKED_NULL': 0,
              'EXTERNAL_BLOCKED_NXRA': 0,
              'GRAVITY_CNAME': 0,
              'REGEX_CNAME': 0,
              'DENYLIST_CNAME': 0,
              'RETRIED': 0,
              'RETRIED_DNSSEC': 0,
              'IN_PROGRESS': 0,
              'DBBUSY': 0,
              'SPECIAL_DOMAIN': 0,
              'CACHE_STALE': 0,
            },
            'replies': {
              'UNKNOWN': 3,
              'NODATA': 72,
              'NXDOMAIN': 533,
              'CNAME': 32,
              'IP': 84,
              'DOMAIN': 31,
              'RRNAME': 0,
              'SERVFAIL': 0,
              'REFUSED': 0,
              'NOTIMP': 0,
              'OTHER': 0,
              'DNSSEC': 31,
              'NONE': 0,
              'BLOB': 0,
            },
          },
          'clients': {'active': 10, 'total': 22},
          'gravity': {
            'domains_being_blocked': 104756,
            'last_update': 1725194639,
          },
          'took': 0.003,
        },
        {
          'ftl': {
            'database': {
              'gravity': 67906,
              'groups': 6,
              'lists': 1,
              'clients': 5,
              'domains': {'allowed': 10, 'denied': 3},
            },
            'privacy_level': 0,
            'clients': {'total': 10, 'active': 8},
            'pid': 1234,
            'uptime': 123456789,
            '%mem': 0.1,
            '%cpu': 1.2,
            'allow_destructive': true,
            'dnsmasq': {
              'dns_cache_inserted': 8,
              'dns_cache_live_freed': 0,
              'dns_queries_forwarded': 2,
              'dns_auth_answered': 0,
              'dns_local_answered': 74,
              'dns_stale_answered': 0,
              'dns_unanswered': 0,
              'bootp': 0,
              'pxe': 0,
              'dhcp_ack': 0,
              'dhcp_decline': 0,
              'dhcp_discover': 0,
              'dhcp_inform': 0,
              'dhcp_nak': 0,
              'dhcp_offer': 0,
              'dhcp_release': 0,
              'dhcp_request': 0,
              'noanswer': 0,
              'leases_allocated_4': 0,
              'leases_pruned_4': 0,
              'leases_allocated_6': 0,
              'leases_pruned_6': 0,
              'tcp_connections': 0,
              'dnssec_max_crypto_use': 0,
              'dnssec_max_sig_fail': 0,
              'dnssec_max_work': 0,
            },
          },
          'took': 0.003,
        },
        {'blocking': 'enabled', 'timer': 15, 'took': 0.003},
        {
          'domains': [
            {'domain': 'pi-hole.net', 'count': 8516},
          ],
          'total_queries': 29160,
          'blocked_queries': 6379,
          'took': 0.003,
        },
        {
          'domains': [
            {'domain': 'pi-hole.net', 'count': 8516},
          ],
          'total_queries': 29160,
          'blocked_queries': 6379,
          'took': 0.003,
        },
        {
          'clients': [
            {'ip': '192.168.0.44', 'name': 'raspberrypi.lan', 'count': 5896},
          ],
          'total_queries': 29160,
          'blocked_queries': 6379,
          'took': 0.003,
        },
        {
          'clients': [
            {'ip': '192.168.0.44', 'name': 'raspberrypi.lan', 'count': 5896},
          ],
          'total_queries': 29160,
          'blocked_queries': 6379,
          'took': 0.003,
        },
        {
          'upstreams': [
            {
              'ip': 'blocklist',
              'name': 'blocklist',
              'port': -1,
              'count': 0,
              'statistics': {'response': 0, 'variance': 0},
            },
            {
              'ip': 'cache',
              'name': 'cache',
              'port': -1,
              'count': 2,
              'statistics': {'response': 0, 'variance': 0},
            },
            {
              'ip': '8.8.8.8',
              'name': 'dns.google',
              'port': 53,
              'count': 8,
              'statistics': {
                'response': 0.0516872935824924,
                'variance': 0.0049697216173868828,
              },
            },
          ],
          'total_queries': 8,
          'forwarded_queries': 6,
          'took': 5.6982040405273438e-05,
        },
      ];
      for (var i = 0; i < urls.length; i++) {
        when(
          mockClient.get(
            Uri.parse(urls[i]),
            headers: anyNamed('headers'),
          ),
        ).thenAnswer((_) async => http.Response(jsonEncode(data[i]), 200));
      }

      final response = await apiGateway.realtimeStatus();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      for (final url in urls) {
        when(mockClient.get(Uri.parse(url), headers: {}))
            .thenThrow(Exception('Unexpected error test'));
      }

      final response = await apiGateway.realtimeStatus();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('disableServerRequest', () {
    late Server server;
    const url = 'http://example.com/api/dns/blocking';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
      server.sm.savePassword('xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {'blocking': 'disabled', 'timer': 15, 'took': 0.003};
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({'blocking': false, 'timer': 15}),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.disableServerRequest(15);

      expect(response.result, APiResponseType.success);
      expect(response.status, 'disabled');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({'blocking': false, 'timer': 15}),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.disableServerRequest(5);

      expect(response.result, APiResponseType.error);
      expect(response.status, isNull);
    });
  });

  group('enableServerRequest', () {
    late Server server;
    const url = 'http://example.com/api/dns/blocking';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {'blocking': 'enabled', 'timer': null, 'took': 0.03};
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({'blocking': true, 'timer': null}),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.enableServerRequest();

      expect(response.result, APiResponseType.success);
      expect(response.status, 'enabled');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({'blocking': true, 'timer': null}),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.enableServerRequest();

      expect(response.result, APiResponseType.error);
      expect(response.status, isNull);
    });
  });

  group('fetchOverTimeData', () {
    late Server server;
    final urls = [
      'http://example.com/api/history',
      'http://example.com/api/history/clients',
    ];
    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = [
        {
          'history': [
            {
              'timestamp': 1511819900.539157,
              'total': 2134,
              'cached': 525,
              'blocked': 413,
              'forwarded': 1196,
            },
            {
              'timestamp': 1511820500.583821,
              'total': 2014,
              'cached': 52,
              'blocked': 43,
              'forwarded': 1910,
            },
          ],
          'took': 0.003,
        },
        {
          'clients': {
            '127.0.0.1': {'name': 'localhost', 'total': 13428},
            '::1': {'name': 'ip6-localnet', 'total': 2100},
            '192.168.1.1': {'name': null, 'total': 254},
            '::': {'name': 'pi.hole', 'total': 29},
            '0.0.0.0': {'name': 'other clients', 'total': 14},
          },
          'history': [
            {
              'timestamp': 1511819900.539157,
              'data': {
                '127.0.0.1': 35,
                '::1': 63,
                '192.168.1.1': 20,
                '::': 9,
                '0.0.0.0': 0,
              },
            },
            {
              'timestamp': 1511820500.583821,
              'data': {'127.0.0.1': 10, '::1': 44, '192.168.1.1': 56, '::': 52},
            },
          ],
          'took': 0.003,
        },
      ];

      for (var i = 0; i < urls.length; i++) {
        when(
          mockClient.get(
            Uri.parse(urls[i]),
            headers: anyNamed('headers'),
          ),
        ).thenAnswer((_) async => http.Response(jsonEncode(data[i]), 200));
      }

      final response = await apiGateway.fetchOverTimeData();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      for (final url in urls) {
        when(mockClient.get(Uri.parse(url), headers: {}))
            .thenThrow(Exception('Unexpected error test'));
      }

      final response = await apiGateway.fetchOverTimeData();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('fetchLogs', () {
    late Server server;
    const url =
        'http://example.com/api/queries?from=1733472267&until=1733479467';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'queries': [
          {
            'id': 1,
            'time': 1581907991.539157,
            'type': 'A',
            'domain': 'community.stoplight.io',
            'cname': null,
            'status': 'FORWARDED',
            'client': {'ip': '192.168.0.14', 'name': 'desktop.lan'},
            'dnssec': 'INSECURE',
            'reply': {'type': 'IP', 'time': 19},
            'list_id': null,
            'upstream': 'localhost#5353',
            'dbid': 112421354,
          },
          {
            'id': 2,
            'time': 1581907871.583821,
            'type': 'AAAA',
            'domain': 'api.github.com',
            'cname': null,
            'status': 'FORWARDED',
            'client': {'ip': '127.0.0.1', 'name': 'localhost'},
            'dnssec': 'UNKNOWN',
            'reply': {'type': 'IP', 'time': 12.3},
            'list_id': null,
            'upstream': 'localhost#5353',
            'dbid': 112421355,
          },
        ],
        'cursor': 175881,
        'recordsTotal': 1234,
        'recordsFiltered': 1234,
        'draw': 1,
        'took': 0.003,
      };
      when(mockClient.get(Uri.parse(url), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final from = DateTime.fromMillisecondsSinceEpoch(1733472267 * 1000);
      final until = DateTime.fromMillisecondsSinceEpoch(1733479467 * 1000);
      final response = await apiGateway.fetchLogs(from, until);

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: anyNamed('headers')))
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
    const url = 'http://example.com/api/domains/deny/exact';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success when add new domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'domains': [
          {
            'domain': 'google.com',
            'unicode': 'google.com',
            'type': 'deny',
            'kind': 'exact',
            'comment': null,
            'groups': [0],
            'enabled': true,
            'id': 1,
            'date_added': 1734008144,
            'date_modified': 1734008144,
          },
        ],
        'processed': {
          'errors': [],
          'success': [
            {'item': 'google.com'},
          ],
        },
        'took': 0.0042212009429931641,
      };
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({
            'domain': 'google.com',
            'comment': null,
            'groups': [0],
            'enabled': true,
          }),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 201));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.success);
      expect(
        response.data!.toJson(),
        {'success': true, 'message': 'Added google.com'},
      );
      expect(response.message, isNull);
    });

    test('Return success when add exist domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'domains': [
          {
            'domain': 'google.com',
            'unicode': 'google.com',
            'type': 'deny',
            'kind': 'exact',
            'comment': null,
            'groups': [0],
            'enabled': true,
            'id': 8,
            'date_added': 1734005851,
            'date_modified': 1734005851,
          },
        ],
        'processed': {
          'errors': [
            {
              'item': 'google.com',
              'error':
                  'UNIQUE constraint failed: domainlist.domain, domainlist.type',
            },
          ],
          'success': [],
        },
        'took': 0.000306844711303711,
      };
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({
            'domain': 'google.com',
            'comment': null,
            'groups': [0],
            'enabled': true,
          }),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 201));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.success);
      expect(response.data!.toJson(), {
        'success': false,
        'message':
            'UNIQUE constraint failed: domainlist.domain, domainlist.type',
      });
      expect(response.message, isNull);
    });

    test('Return error with invalid list type', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'error': {
          'key': 'uri_error',
          'message': 'Invalid request: Specify list to modify more precisely',
          'hint': '/api/domains/xxxx/exact',
        },
        'took': 0.00055241584777832031,
      };
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: {
            'domain': 'google.com',
            'comment': null,
            'groups': [0],
            'enabled': true,
          },
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response =
          await apiGateway.setWhiteBlacklist('google.com', 'black');

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
      expect(response.message, isNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

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
    const url = 'http://example.com/api/domains';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'domains': [
          {
            'domain': 'allowed.com',
            'unicode': 'allowed.com',
            'type': 'allow',
            'kind': 'exact',
            'comment': null,
            'groups': [0],
            'enabled': true,
            'id': 299,
            'date_added': 1611239095,
            'date_modified': 1612163756,
          },
          {
            'domain': 'xn--4ca.com',
            'unicode': 'ä.com',
            'type': 'allow',
            'kind': 'regex',
            'comment': 'Some text',
            'groups': [0],
            'enabled': true,
            'id': 305,
            'date_added': 1611240635,
            'date_modified': 1611241276,
          },
        ],
        'took': 0.012,
        'processed': null,
      };
      when(mockClient.get(Uri.parse(url), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.getDomainLists();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getDomainLists();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('removeDomainFromList', () {
    late Server server;
    const url = 'http://example.com/api/domains/allow/exact/google.com';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {'success': true, 'message': null};
      when(mockClient.delete(Uri.parse(url), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 204));

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
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.delete(Uri.parse(url), headers: anyNamed('headers')))
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
    const url = 'http://example.com/api/domains/deny/exact';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
    });

    test('Return success when add new domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'domains': [
          {
            'domain': 'google.com',
            'unicode': 'google.com',
            'type': 'deny',
            'kind': 'exact',
            'comment': null,
            'groups': [0],
            'enabled': true,
            'id': 1,
            'date_added': 1734008144,
            'date_modified': 1734008144,
          },
        ],
        'processed': {
          'errors': [],
          'success': [
            {'item': 'google.com'},
          ],
        },
        'took': 0.0042212009429931641,
      };
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({
            'domain': 'google.com',
            'comment': null,
            'groups': [0],
            'enabled': true,
          }),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 201));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.success);
    });

    test('Return success when add exist domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'domains': [
          {
            'domain': 'google.com',
            'unicode': 'google.com',
            'type': 'deny',
            'kind': 'exact',
            'comment': null,
            'groups': [0],
            'enabled': true,
            'id': 8,
            'date_added': 1734005851,
            'date_modified': 1734005851,
          },
        ],
        'processed': {
          'errors': [
            {
              'item': 'google.com',
              'error':
                  'UNIQUE constraint failed: domainlist.domain, domainlist.type',
            },
          ],
          'success': [],
        },
        'took': 0.000306844711303711,
      };
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: jsonEncode({
            'domain': 'google.com',
            'comment': null,
            'groups': [0],
            'enabled': true,
          }),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 201));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.alreadyAdded);
    });

    test('Return error with invalid list type', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        'error': {
          'key': 'uri_error',
          'message': 'Invalid request: Specify list to modify more precisely',
          'hint': '/api/domains/xxxx/exact',
        },
        'took': 0.00055241584777832031,
      };
      when(
        mockClient.post(
          Uri.parse(url),
          headers: anyNamed('headers'),
          body: {
            'domain': 'google.com',
            'comment': null,
            'groups': [0],
            'enabled': true,
          },
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.error);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway
          .addDomainToList({'list': 'black', 'domain': 'google.com'});

      expect(response.result, APiResponseType.error);
    });
  });

  group('fetchVersionInfo', () {
    late Server server;
    const url = 'http://example.com/api/info/version';
    const data = {
      'version': {
        'core': {
          'local': {
            'version': 'v6.0.5',
            'branch': 'master',
            'hash': '9fe687bd',
          },
          'remote': {
            'version': 'v6.0.5',
            'hash': '9fe687bd',
          },
        },
        'web': {
          'local': {
            'version': 'v6.0.2',
            'branch': 'master',
            'hash': '25441178',
          },
          'remote': {
            'version': 'v6.0.2',
            'hash': '25441178',
          },
        },
        'ftl': {
          'local': {
            'hash': 'b7eb53bf',
            'branch': 'master',
            'version': 'v6.0.4',
            'date': '2025-03-04 17:22:10 +0000',
          },
          'remote': {
            'version': 'v6.0.4',
            'hash': 'b7eb53bf',
          },
        },
        'docker': {
          'local': '2025.03.0',
          'remote': '2025.03.0',
        },
      },
      'took': 0.014363765716552734,
    };

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when use docker', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      when(
        mockClient.get(
          Uri.parse(url),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));
      final response = await apiGateway.fetchVersionInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        VersionInfo.fromV6(Version.fromJson(data)).toJson(),
      );
    });

    test('should return success when no use docker', () async {
      const dataNoDocker = {
        'version': {
          'core': {
            'local': {
              'version': 'v6.0.4',
              'branch': 'master',
              'hash': '9fe687xxx',
            },
            'remote': {
              'version': 'v6.0.5',
              'hash': '9fe687bd',
            },
          },
          'web': {
            'local': {
              'version': 'v6.0.1',
              'branch': 'master',
              'hash': '254411xxx',
            },
            'remote': {
              'version': 'v6.0.2',
              'hash': '25441178',
            },
          },
          'ftl': {
            'local': {
              'hash': 'b7eb5xxx',
              'branch': 'master',
              'version': 'v6.0.3',
              'date': '2025-03-01 17:22:10 +0000',
            },
            'remote': {
              'version': 'v6.0.4',
              'hash': 'b7eb53bf',
            },
          },
          'docker': {
            'local': null,
            'remote': null,
          },
        },
        'took': 0.014363765716552734,
      };

      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      when(
        mockClient.get(
          Uri.parse(url),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataNoDocker), 200));
      final response = await apiGateway.fetchVersionInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        VersionInfo.fromV6(Version.fromJson(dataNoDocker)).toJson(),
      );
      expect(response.data?.core.canUpdate, true);
      expect(response.data?.web.canUpdate, true);
      expect(response.data?.ftl.canUpdate, true);
      expect(response.data?.docker.canUpdate, false);
    });
  });

  group('fetchHostInfo', () {
    late Server server;
    const url = 'http://example.com/api/info/host';
    const data = {
      'host': {
        'uname': {
          'domainname': '(none)',
          'machine': 'x86_64',
          'nodename': 'raspberrypi',
          'release': '5.15.0-52-generic',
          'sysname': 'Linux',
          'version': '#58-Ubuntu SMP Thu Oct 13 08:03:55 UTC 2022',
        },
        'model': 'Raspberry Pi Model 4B',
        'dmi': {
          'bios': {'vendor': 'American Megatrends Inc.'},
          'board': {
            'name': 'Raspberry Pi 4 Model B Rev 1.4',
            'vendor': 'Raspberry Pi Foundation',
            'version': '0x14',
          },
          'product': {
            'name': 'Raspberry Pi 4 Model B Rev 1.4',
            'version': '0x14',
            'family': 'Raspberry Pi 4 Model B Rev 1.4',
          },
          'sys': {'vendor': 'Raspberry Pi Foundation'},
        },
      },
      'took': 0.003,
    };

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      when(
        mockClient.get(
          Uri.parse(url),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));
      final response = await apiGateway.fetchHostInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        HostInfo.fromV6(Host.fromJson(data)).toJson(),
      );
    });
  });
}
