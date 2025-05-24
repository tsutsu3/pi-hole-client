import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/subscription_types.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/api/v6/ftl/host.dart' show Host;
import 'package:pi_hole_client/models/api/v6/ftl/messages.dart';
import 'package:pi_hole_client/models/api/v6/ftl/metrics.dart';
import 'package:pi_hole_client/models/api/v6/ftl/sensors.dart' show Sensors;
import 'package:pi_hole_client/models/api/v6/ftl/system.dart' show System;
import 'package:pi_hole_client/models/api/v6/ftl/version.dart' show Version;
import 'package:pi_hole_client/models/api/v6/groups/groups.dart';
import 'package:pi_hole_client/models/api/v6/lists/lists.dart' show Lists;
import 'package:pi_hole_client/models/api/v6/lists/search.dart' show Search;
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/groups.dart';
import 'package:pi_hole_client/models/host.dart';
import 'package:pi_hole_client/models/messages.dart';
import 'package:pi_hole_client/models/metrics.dart';
import 'package:pi_hole_client/models/search.dart';
import 'package:pi_hole_client/models/sensors.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/models/system.dart';
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

  const unexpectedError = 'An unexpected error occurred.';
  const fetchError = 'Failed to fetch data from the server.';

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
        allowSelfSignedCert: true,
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

    test('Return success with valid password (no self signed cert)', () async {
      final server2 = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: false,
        sm: SecretManagerMock(sessinId, 'xxx123'),
      );
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server2, client: mockClient);

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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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

  group('updateDomain', () {
    late Server server;
    const singleData = {
      'domains': [
        {
          'domain': 'example.com',
          'unicode': 'example.com',
          'type': 'allow',
          'kind': 'exact',
          'comment': null,
          'groups': [],
          'enabled': true,
          'id': 299,
          'date_added': 1611239095,
          'date_modified': 1612163756,
        },
      ],
      'took': 0.012,
      'processed': null,
    };
    const badReqData = {
      'error': {
        'key': 'uri_error',
        'message': 'Invalid request: Specify list to modify more precisely',
        'hint': null,
      },
    };
    const domain = 'example.com';
    final encodedDomain = Uri.encodeComponent(domain);
    final reqData = DomainRequest(
      domain: domain,
      type: DomainType.allow,
      kind: DomainKind.exact,
      enabled: true,
      groups: [],
    );

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when adding or editing a subscription',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.put(
          Uri.parse(
            'http://example.com/api/domains/${reqData.type.name}/${reqData.kind.name}/$encodedDomain',
          ),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(singleData), 200));

      final response = await apiGateway.updateDomain(
        body: reqData,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(response.data?.domain, domain);
      expect(response.data?.type, 0);
      expect(response.data?.enabled, 1);
    });

    test('should return error when status code is 400 (Bad Request)', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.put(
          Uri.parse(
            'http://example.com/api/domains/${reqData.type.name}/${reqData.kind.name}/$encodedDomain',
          ),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(badReqData), 400));

      final response = await apiGateway.updateDomain(
        body: reqData,
      );

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return error when an unexpected exception is thrown',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.put(
          Uri.parse('http://example.com/api/domains'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.updateDomain(
        body: reqData,
      );

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
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
        allowSelfSignedCert: true,
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
        allowSelfSignedCert: true,
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

  group('fetchSensorsInfo', () {
    late Server server;
    const url = 'http://example.com/api/info/sensors';
    const data = {
      'sensors': {
        'list': [
          {
            'name': 'amdgpu',
            'path': 'hwmon1',
            'source': 'devices/pci0000:00/0000:00:08.1/0000:05:00.0',
            'temps': [
              {
                'name': 'edge',
                'value': 40,
                'max': null,
                'crit': null,
                'sensor': 'temp1',
              }
            ],
          },
        ],
        'cpu_temp': 48,
        'hot_limit': 60,
        'unit': 'C',
      },
      'took': 0.003,
    };

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
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
      final response = await apiGateway.fetchSensorsInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SensorsInfo.fromV6(Sensors.fromJson(data)).toJson(),
      );
    });
  });

  group('fetchSystemInfo', () {
    late Server server;
    const url = 'http://example.com/api/info/system';
    const data = {
      'system': {
        'uptime': 67906,
        'memory': {
          'ram': {
            'total': 10317877,
            'free': 308736,
            'used': 8920416,
            'available': 972304,
            '%used': 26.854,
          },
          'swap': {
            'total': 10317877,
            'used': 8920416,
            'free': 308736,
            '%used': 1.67,
          },
        },
        'procs': 1452,
        'cpu': {
          'nprocs': 8,
          'load': {
            'raw': [0.58837890625, 0.64990234375, 0.66748046875],
            'percent': [
              4.903157711029053,
              5.415853023529053,
              5.562337398529053,
            ],
          },
        },
      },
      'took': 0.003,
    };

    // FTL >= 6.1
    const dataNewV61 = {
      'system': {
        'uptime': 67906,
        'memory': {
          'ram': {
            'total': 10317877,
            'free': 308736,
            'used': 8920416,
            'available': 972304,
            '%used': 26.854,
          },
          'swap': {
            'total': 10317877,
            'used': 8920416,
            'free': 308736,
            '%used': 1.67,
          },
        },
        'procs': 1452,
        'cpu': {
          'nprocs': 8,
          '%cpu': 3.3232043958349604,
          'load': {
            'raw': [0.58837890625, 0.64990234375, 0.66748046875],
            'percent': [
              4.903157711029053,
              5.415853023529053,
              5.562337398529053,
            ],
          },
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
        allowSelfSignedCert: true,
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
      final response = await apiGateway.fetchSystemInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SystemInfo.fromV6(System.fromJson(data)).toJson(),
      );
    });

    test('should return cpuUsage from percentCpu when provided (FTL v6.1)',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      when(
        mockClient.get(
          Uri.parse(url),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataNewV61), 200));
      final response = await apiGateway.fetchSystemInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SystemInfo.fromV6(System.fromJson(dataNewV61)).toJson(),
      );
      expect(response.data?.cpuUsage, 3.3232043958349604);
    });
  });

  group('fetchAllServerInfo', () {
    late Server server;
    const dataVersion = {
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
          'local': 'null',
          'remote': 'null',
        },
      },
      'took': 0.014363765716552734,
    };
    const dataHost = {
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
    const dataSensor = {
      'sensors': {
        'list': [
          {
            'name': 'amdgpu',
            'path': 'hwmon1',
            'source': 'devices/pci0000:00/0000:00:08.1/0000:05:00.0',
            'temps': [
              {
                'name': 'edge',
                'value': 40,
                'max': null,
                'crit': null,
                'sensor': 'temp1',
              }
            ],
          },
        ],
        'cpu_temp': 48,
        'hot_limit': 60,
        'unit': 'C',
      },
      'took': 0.003,
    };
    const dataSystem = {
      'system': {
        'uptime': 67906,
        'memory': {
          'ram': {
            'total': 10317877,
            'free': 308736,
            'used': 8920416,
            'available': 972304,
            '%used': 26.854,
          },
          'swap': {
            'total': 10317877,
            'used': 8920416,
            'free': 308736,
            '%used': 1.67,
          },
        },
        'procs': 1452,
        'cpu': {
          'nprocs': 8,
          'load': {
            'raw': [0.58837890625, 0.64990234375, 0.66748046875],
            'percent': [
              4.903157711029053,
              5.415853023529053,
              5.562337398529053,
            ],
          },
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
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/sensors'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataSensor), 200));

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/host'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataHost), 200));

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/version'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataVersion), 200));

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/system'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataSystem), 200));

      final response = await apiGateway.fetchAllServerInfo();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.version?.toJson(),
        VersionInfo.fromV6(Version.fromJson(dataVersion)).toJson(),
      );
      expect(
        response.system?.toJson(),
        SystemInfo.fromV6(System.fromJson(dataSystem)).toJson(),
      );
      expect(
        response.host?.toJson(),
        HostInfo.fromV6(Host.fromJson(dataHost)).toJson(),
      );
      expect(
        response.sensors?.toJson(),
        SensorsInfo.fromV6(Sensors.fromJson(dataSensor)).toJson(),
      );
    });

    test('should return error when at least one fetch fail', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/sensors'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataSensor), 200));

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/host'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataHost), 200));

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/version'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(dataVersion), 200));

      // failed
      final dataSystemError = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/system'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(dataSystemError), 401),
      );

      final response = await apiGateway.fetchAllServerInfo();

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.version?.toJson(), null);
      expect(response.system?.toJson(), null);
      expect(response.host?.toJson(), null);
      expect(response.sensors?.toJson(), null);
    });
  });

  group('getSubscriptions', () {
    late Server server;
    const multiData = {
      'lists': [
        {
          'address':
              'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
          'comment': 'Migrated from /etc/pihole/adlists.list',
          'groups': [0],
          'enabled': true,
          'id': 1,
          'date_added': 1594670974,
          'date_modified': 1595279300,
          'type': 'block',
          'date_updated': 0,
          'number': 134553,
          'invalid_domains': 0,
          'abp_entries': 0,
          'status': 1,
        },
        {
          'address': 'https://mirror1.malwaredomains.com/files/justdomains',
          'comment': 'Migrated from /etc/pihole/adlists.list',
          'groups': [0],
          'enabled': true,
          'id': 2,
          'date_added': 1594670974,
          'date_modified': 1594670974,
          'type': 'block',
          'date_updated': 0,
          'number': 100,
          'invalid_domains': 0,
          'abp_entries': 0,
          'status': 3,
        }
      ],
      'took': 0.012,
    };
    const singleData = {
      'lists': [
        {
          'address':
              'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
          'comment': 'Migrated from /etc/pihole/adlists.list',
          'groups': [0],
          'enabled': true,
          'id': 1,
          'date_added': 1594670974,
          'date_modified': 1595279300,
          'type': 'block',
          'date_updated': 0,
          'number': 134553,
          'invalid_domains': 0,
          'abp_entries': 0,
          'status': 1,
        },
      ],
      'took': 0.012,
    };
    const noData = {'lists': [], 'took': 0.0006268024444580078};
    const erroData = {
      'error': {'key': 'unauthorized', 'message': 'Unauthorized', 'hint': null},
      'took': 0.003,
    };
    const address =
        'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when retrieving all lists', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(multiData), 200));

      final response = await apiGateway.getSubscriptions();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SubscriptionsInfo.fromV6(Lists.fromJson(multiData)).toJson(),
      );
    });

    test('should return success when retrieving a specific list', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/lists/$address'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(singleData), 200));

      final response = await apiGateway.getSubscriptions(url: address);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SubscriptionsInfo.fromV6(Lists.fromJson(singleData)).toJson(),
      );
    });

    test(
        'should return success when retrieving a specific list with type that matches',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/lists/$address?type=block'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(singleData), 200));

      final response = await apiGateway.getSubscriptions(
        url: address,
        stype: SubscriptionTypes.block,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SubscriptionsInfo.fromV6(Lists.fromJson(singleData)).toJson(),
      );
    });

    test(
        'should return success when retrieving a specific list with type that does not match',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/lists/$address?type=allow'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(noData), 200));

      final response = await apiGateway.getSubscriptions(
        url: address,
        stype: SubscriptionTypes.allow,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SubscriptionsInfo.fromV6(
          Lists.fromJson(noData),
        ).toJson(),
      );
    });

    test('should return an error when status code is 401', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(erroData), 401));

      final response = await apiGateway.getSubscriptions();

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return an error when an unexpected error occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getSubscriptions();

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });

  group('removeSubscription', () {
    late Server server;
    const notFoundData = {'took': 0.0006268024444580078};
    const badReqData = {
      'error': {
        'key': 'bad_request',
        'message':
            'Invalid request: Invalid type parameter (should be either "allow" or "block")',
        'hint': 'type=blocka',
      },
      'took': 0.00033593177795410156,
    };
    const address =
        'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts';
    final encodedAddress = Uri.encodeComponent(address);

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when removing a subscription without type',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/lists/$encodedAddress'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('', 204));

      final response = await apiGateway.removeSubscription(url: address);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
    });

    test(
        'should return success when removing a subscription with matching type',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/lists/$encodedAddress?type=block'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('', 204));

      final response = await apiGateway.removeSubscription(
        url: address,
        stype: SubscriptionTypes.block,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
    });

    test('should return error when status code is 404 (Not Found)', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/lists/$encodedAddress'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(notFoundData), 404));

      final response = await apiGateway.removeSubscription(url: address);

      expect(response.result, APiResponseType.notFound);
      expect(response.message, fetchError);
    });

    test('should return error when status code is 400 (Bad Request)', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/lists/$encodedAddress?type=xxx'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(badReqData), 400));

      final response =
          await apiGateway.removeSubscription(url: address, stype: 'xxx');

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
    });

    test('should return error when an unexpected exception is thrown',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/lists/$encodedAddress'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.removeSubscription(url: address);

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
    });
  });

  group('createSubscription', () {
    late Server server;
    const singleData = {
      'lists': [
        {
          'address': 'https://hosts-file.net/ad_servers.txt',
          'comment': 'Some comment for this list',
          'groups': [0],
          'enabled': true,
          'id': 106,
          'date_added': 1742739018,
          'date_modified': 1742739030,
          'type': 'block',
          'date_updated': 0,
          'number': 0,
          'invalid_domains': 0,
          'abp_entries': 0,
          'status': 0,
        }
      ],
      'processed': {
        'errors': [],
        'success': [
          {'item': 'https://hosts-file.net/ad_servers.txt'},
        ],
      },
      'took': 0.019428014755249023,
    };
    const badReqData = {
      'error': {
        'key': 'bad_request',
        'message':
            'Invalid request: Invalid type parameter (should be either "allow" or "block")',
        'hint': 'type=blocka',
      },
      'took': 0.00033593177795410156,
    };
    const address =
        'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts';
    final reqData = SubscriptionRequest(
      address: address,
      comment: 'Some comment for this list',
      type: 'block',
      groups: [0],
      enabled: true, // ignore: avoid_redundant_argument_values
    );

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when adding a subscription', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.post(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(singleData), 201));

      final response = await apiGateway.createSubscription(
        body: reqData,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SubscriptionsInfo.fromV6(Lists.fromJson(singleData)).toJson(),
      );
    });

    test(
        'should return error when status code is 201 (OK) but the subscription already exists',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      const alreadyData = {
        'lists': [
          {
            'address': 'https://hosts-file.net/ad_servers.txt',
            'comment': 'Some comment for this list',
            'groups': [0],
            'enabled': true,
            'id': 106,
            'date_added': 1742739018,
            'date_modified': 1742739030,
            'type': 'block',
            'date_updated': 0,
            'number': 0,
            'invalid_domains': 0,
            'abp_entries': 0,
            'status': 0,
          }
        ],
        'processed': {
          'errors': [
            {
              'item': 'https://hosts-file.net/ad_servers.txt',
              'error': 'UNIQUE constraint failed: adlist.address, adlist.type',
            },
          ],
          'success': [],
        },
        'took': 0.019428014755249023,
      };

      when(
        mockClient.post(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(alreadyData), 201));

      final response = await apiGateway.createSubscription(
        body: reqData,
      );

      expect(response.result, APiResponseType.alreadyAdded);
      expect(response.message, 'Failed to fetch data from the server.');
      expect(response.data?.toJson(), null);
    });

    test('should return error when status code is 400 (Bad Request)', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.post(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(badReqData), 400));

      final response = await apiGateway.createSubscription(
        body: reqData,
      );

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return error when an unexpected exception is thrown',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.post(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.createSubscription(body: reqData);

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });

  group('updateSubscription', () {
    late Server server;
    const singleData = {
      'lists': [
        {
          'address': 'https://hosts-file.net/ad_servers.txt',
          'comment': 'Some comment for this list',
          'groups': [0],
          'enabled': true,
          'id': 106,
          'date_added': 1742739018,
          'date_modified': 1742739030,
          'type': 'block',
          'date_updated': 0,
          'number': 0,
          'invalid_domains': 0,
          'abp_entries': 0,
          'status': 0,
        }
      ],
      'processed': {
        'errors': [],
        'success': [
          {'item': 'https://hosts-file.net/ad_servers.txt'},
        ],
      },
      'took': 0.019428014755249023,
    };
    const badReqData = {
      'error': {
        'key': 'bad_request',
        'message':
            'Invalid request: Invalid type parameter (should be either "allow" or "block")',
        'hint': 'type=blocka',
      },
      'took': 0.00033593177795410156,
    };
    const address =
        'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts';
    final encodedAddress = Uri.encodeComponent(address);
    final reqData = SubscriptionRequest(
      address: address,
      comment: 'Some comment for this list',
      type: 'block',
      groups: [0],
      enabled: true, // ignore: avoid_redundant_argument_values
    );

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when adding or editing a subscription',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.put(
          Uri.parse('http://example.com/api/lists/$encodedAddress'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(singleData), 200));

      final response = await apiGateway.updateSubscription(
        body: reqData,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SubscriptionsInfo.fromV6(Lists.fromJson(singleData)).toJson(),
      );
    });

    test('should return error when status code is 400 (Bad Request)', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.put(
          Uri.parse('http://example.com/api/lists/$encodedAddress'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(badReqData), 400));

      final response = await apiGateway.updateSubscription(
        body: reqData,
      );

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return error when an unexpected exception is thrown',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.put(
          Uri.parse('http://example.com/api/lists'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.updateSubscription(body: reqData);

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });

  group('searchSubscriptions', () {
    late Server server;
    const data = {
      'search': {
        'domains': [
          {
            'domain': 'blockeddomain.com',
            'comment': 'I needed to block this because of XYZ',
            'enabled': true,
            'type': 'allow',
            'kind': 'exact',
            'id': 7,
            'date_added': 1664624500,
            'date_modified': 1664624500,
            'groups': [0, 1, 2],
          }
        ],
        'gravity': [
          {
            'domain': 'doubleclick.net',
            'address':
                'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
            'comment': 'I needed to block this because of XYZ',
            'enabled': true,
            'id': 0,
            'type': 'allow',
            'date_added': 1664624500,
            'date_modified': 1664624500,
            'date_updated': 1664624500,
            'number': 7,
            'invalid_domains': 0,
            'abp_entries': 0,
            'status': 1,
            'groups': [0, 1, 2],
          }
        ],
        'parameters': {
          'partial': false,
          'N': 20,
          'domain': 'doubleclick.net',
          'debug': false,
        },
        'results': {
          'domains': {'exact': 1, 'regex': 2},
          'gravity': {'allow': 0, 'block': 1},
          'total': 4,
        },
      },
      'took': 0.003,
    };
    const errorData = {
      'error': {'key': 'unauthorized', 'message': 'Unauthorized', 'hint': null},
      'took': 0.003,
    };
    const domain = 'doubleclick.net';
    final encodedDomain = Uri.encodeComponent(domain);

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test(
        'should return success when searching for a subscription by exact domain',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/search/$encodedDomain'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.searchSubscriptions(domain: domain);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SearchInfo.fromV6(Search.fromJson(data)).toJson(),
      );
    });

    test('should return success when searching for a subscription with params',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse(
            'http://example.com/api/search/$encodedDomain?partial=true&N=100&debug=true',
          ),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.searchSubscriptions(
        domain: domain,
        partial: true,
        limit: 100,
        debug: true,
      );

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SearchInfo.fromV6(Search.fromJson(data)).toJson(),
      );
    });

    test(
        'should return success with empty data when no subscription matches the domain',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      const emptyData = {
        'search': {
          'domains': [],
          'gravity': [],
          'results': {
            'domains': {'exact': 0, 'regex': 0},
            'gravity': {'allow': 0, 'block': 0},
            'total': 0,
          },
          'parameters': {
            'N': 20,
            'partial': false,
            'domain': 'doubleclic/sssk.neta',
            'debug': false,
          },
        },
        'took': 0.0039408206939697266,
      };

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/search/$encodedDomain'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(emptyData), 200));

      final response = await apiGateway.searchSubscriptions(domain: domain);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        SearchInfo.fromV6(Search.fromJson(emptyData)).toJson(),
      );
    });

    test('should return error when status code is 401 (Unauthorized)',
        () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/search/$encodedDomain'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(errorData), 401));

      final response = await apiGateway.searchSubscriptions(domain: domain);

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return an error when an unexpected error occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/search/$encodedDomain'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.searchSubscriptions(domain: domain);

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });

  group('getGroups', () {
    late Server server;
    const multiData = {
      'groups': [
        {
          'name': 'Default',
          'comment': 'The default group',
          'enabled': true,
          'id': 0,
          'date_added': 1594670974,
          'date_modified': 1611157897,
        },
        {
          'name': 'a',
          'comment': null,
          'enabled': true,
          'id': 5,
          'date_added': 1604871899,
          'date_modified': 1604871899,
        }
      ],
      'took': 0.003,
    };
    const singleData = {
      'groups': [
        {
          'name': 'Default',
          'comment': 'The default group',
          'enabled': true,
          'id': 0,
          'date_added': 1594670974,
          'date_modified': 1611157897,
        },
      ],
      'took': 0.003,
    };
    const noData = {'groups': [], 'took': 0.0006268024444580078};
    const erroData = {
      'error': {'key': 'unauthorized', 'message': 'Unauthorized', 'hint': null},
      'took': 0.003,
    };
    const groupName = 'Default';

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when retrieving all groups', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/groups'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(multiData), 200));

      final response = await apiGateway.getGroups();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        GroupsInfo.fromV6(Groups.fromJson(multiData)).toJson(),
      );
    });

    test('should return success when retrieving a specific group', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/groups/$groupName'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(singleData), 200));

      final response = await apiGateway.getGroups(name: groupName);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        GroupsInfo.fromV6(Groups.fromJson(singleData)).toJson(),
      );
    });

    test('should return success when not match', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/groups/$groupName'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(noData), 200));

      final response = await apiGateway.getGroups(name: groupName);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        GroupsInfo.fromV6(Groups.fromJson(noData)).toJson(),
      );
    });

    test('should return an error when status code is 401', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/groups'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(erroData), 401));

      final response = await apiGateway.getGroups();

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return an error when an unexpected error occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/groups'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getGroups();

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });

  group('updateGravity', () {
    late Server server;

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test(
        'should emit progress and success when response is 200 with stream data',
        () async {
      final mockClient = MockClient();

      final bodyStream = Stream<List<int>>.fromIterable([
        utf8.encode('Line 1\nLine 2\n'),
        utf8.encode('Line 3\n'),
      ]);

      final mockResponse = http.StreamedResponse(bodyStream, 200);
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.send(any)).thenAnswer((_) async => mockResponse);

      final responses = <GravityResponse>[];

      await for (final res in apiGateway.updateGravity()) {
        responses.add(res);
      }

      expect(responses.length, 3); // progress + success
      expect(responses[0].data, ['Line 1', 'Line 2']);
      expect(responses[0].result, APiResponseType.progress);
      expect(responses[1].data, ['Line 3']);
      expect(responses[1].result, APiResponseType.progress);
      expect(responses[2].data, null);
      expect(responses[2].result, APiResponseType.success);
    });

    test('should emit error when status code is not 200', () async {
      final mockClient = MockClient();

      final bodyStream = Stream<List<int>>.fromIterable([
        utf8.encode('Unauthorized\n'),
      ]);

      final mockResponse = http.StreamedResponse(bodyStream, 401);
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.send(any)).thenAnswer((_) async => mockResponse);

      final responses = <GravityResponse>[];

      await for (final res in apiGateway.updateGravity()) {
        responses.add(res);
      }

      expect(responses.length, 1);
      expect(responses[0].result, APiResponseType.error);
      expect(responses[0].message, fetchError);
    });

    test('should emit error when an unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.send(any)).thenThrow(Exception('Unexpected error test'));

      final responses = <GravityResponse>[];

      await for (final res in apiGateway.updateGravity()) {
        responses.add(res);
      }

      expect(responses.length, 1);
      expect(responses[0].result, APiResponseType.error);
      expect(responses[0].message, unexpectedError);
    });
  });

  group('getMessages', () {
    late Server server;
    const data = {
      'messages': [
        {
          'id': 5,
          'timestamp': 1743936482,
          'type': 'LIST',
          'plain':
              'List with ID 10 (http://localhost:8989/test.txt) was inaccessible during last gravity run',
          'html':
              '<a href="groups/lists?listid=10">List with ID <strong>10</strong> (<code>http://localhost:8989/test.txt</code>)</a> was inaccessible during last gravity run',
        },
        {
          'id': 3,
          'timestamp': 123456789.123,
          'type': 'SUBNET',
          'plain': 'Rate-limiting 192.168.2.42 for at least 5 seconds',
          'html':
              'Client <code>192.168.2.42</code> has been rate-limited for at least 5 seconds (current limit: 1000 queries per 60 seconds)',
        }
      ],
      'took': 0.0005114078521728516,
    };
    const noData = {'messages': [], 'took': 0.0006268024444580078};
    const erroData = {
      'error': {'key': 'unauthorized', 'message': 'Unauthorized', 'hint': null},
      'took': 0.003,
    };

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when retrieving all messgaes', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/messages'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.getMessages();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        MessagesInfo.fromV6(Messages.fromJson(data)).toJson(),
      );
    });

    test('should return success when no data', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/messages'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(noData), 200));

      final response = await apiGateway.getMessages();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        MessagesInfo.fromV6(Messages.fromJson(noData)).toJson(),
      );
    });

    test('should return an error when status code is 401', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/messages'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(erroData), 401));

      final response = await apiGateway.getMessages();

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return an error when an unexpected error occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/messages'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getMessages();

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });

  group('removeMessages', () {
    late Server server;
    const id = 3;
    const noData = {'took': 0.0006268024444580078};
    const erroData = {
      'error': {'key': 'unauthorized', 'message': 'Unauthorized', 'hint': null},
      'took': 0.003,
    };

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success when id exist', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/info/messages/$id'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response('', 204));

      final response = await apiGateway.removeMessage(id);

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
    });

    test('should return success when no data', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/info/messages/$id'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(noData), 404));

      final response = await apiGateway.removeMessage(id);

      expect(response.result, APiResponseType.notFound);
      expect(response.message, 'Not found');
    });

    test('should return an error when status code is 401', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/info/messages/$id'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(erroData), 401));

      final response = await apiGateway.removeMessage(id);

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
    });

    test('should return an error when an unexpected error occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.delete(
          Uri.parse('http://example.com/api/info/messages/$id'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getMessages();

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
    });
  });

  group('getMetrics', () {
    late Server server;
    const data = {
      'metrics': {
        'dns': {
          'cache': {
            'size': 10000,
            'inserted': 4060,
            'evicted': 0,
            'expired': 0,
            'immortal': 0,
            'content': [
              {
                'type': 0,
                'name': 'OTHER',
                'count': {'valid': 0, 'stale': 0},
              },
              {
                'type': 1,
                'name': 'A',
                'count': {'valid': 14, 'stale': 3},
              },
              {
                'type': 28,
                'name': 'AAAA',
                'count': {'valid': 12, 'stale': 1},
              },
              {
                'type': 5,
                'name': 'CNAME',
                'count': {'valid': 5, 'stale': 3},
              },
              {
                'type': 43,
                'name': 'DS',
                'count': {'valid': 34, 'stale': 21},
              },
              {
                'type': 48,
                'name': 'DNSKEY',
                'count': {'valid': 1, 'stale': 0},
              }
            ],
          },
          'replies': {
            'optimized': 1,
            'local': 84,
            'auth': 0,
            'forwarded': 46,
            'unanswered': 0,
            'sum': 131,
          },
        },
        'dhcp': {
          'ack': 0,
          'nak': 0,
          'decline': 0,
          'offer': 0,
          'discover': 0,
          'inform': 0,
          'request': 0,
          'release': 0,
          'noanswer': 0,
          'bootp': 0,
          'pxe': 0,
          'leases': {
            'allocated_4': 0,
            'pruned_4': 0,
            'allocated_6': 0,
            'pruned_6': 0,
          },
        },
      },
      'took': 0.003,
    };
    const erroData = {
      'error': {'key': 'unauthorized', 'message': 'Unauthorized', 'hint': null},
      'took': 0.003,
    };

    setUp(() {
      server = Server(
        address: 'http://example.com',
        alias: 'example',
        defaultServer: true,
        apiVersion: SupportedApiVersions.v6,
        allowSelfSignedCert: true,
      );
      server.sm.savePassword('xxx123');
    });

    test('should return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/metrics'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.getMetrics();

      expect(response.result, APiResponseType.success);
      expect(response.message, null);
      expect(
        response.data?.toJson(),
        MetricsInfo.fromV6(Metrics.fromJson(data)).toJson(),
      );
    });

    test('should return an error when status code is 401', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/metrics'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(erroData), 401));

      final response = await apiGateway.getMetrics();

      expect(response.result, APiResponseType.error);
      expect(response.message, fetchError);
      expect(response.data?.toJson(), null);
    });

    test('should return an error when an unexpected error occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(
        mockClient.get(
          Uri.parse('http://example.com/api/info/metrics'),
          headers: anyNamed('headers'),
        ),
      ).thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.getMetrics();

      expect(response.result, APiResponseType.error);
      expect(response.message, unexpectedError);
      expect(response.data?.toJson(), null);
    });
  });
}
