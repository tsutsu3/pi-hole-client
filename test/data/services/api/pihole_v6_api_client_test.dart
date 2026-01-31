import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/config/config.dart';
import 'package:pi_hole_client/data/model/v6/network/gateway.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/helper/test_helper.dart';
import '../utils/mocks.mocks.dart';

void main() {
  const baseUrl = 'http://localhost:8080';
  const sid = 'sid12345';

  late PiholeV6ApiClient apiClient;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = PiholeV6ApiClient(url: baseUrl, client: mockClient);
  });

  // ==========================================================================
  // Authentication
  // ==========================================================================
  group('postAuth', () {
    final url = Uri.parse('$baseUrl/api/auth');

    test('returns Session on successful authentication', () async {
      final respJson = {
        'session': {
          'valid': true,
          'totp': false,
          'sid': 'n9n9f6c3umrumfq2ese1lvu2pg',
          'csrf': 'Ux87YTIiMOf/GKCefVIOMw=',
          'validity': 300,
          'message': 'correct password',
        },
        'took': 0.03,
      };
      final response = http.Response(jsonEncode(respJson), 200);

      mockPost(mockClient, url, response);

      final result = await apiClient.postAuth(password: 'pass123');

      expectSuccess(result, respJson);
    });

    test('returns error when password is incorrect (401)', () async {
      final response = http.Response(
        jsonEncode({
          'session': {
            'valid': false,
            'totp': false,
            'sid': null,
            'validity': -1,
            'message': 'password incorrect',
          },
          'took': 0.03,
        }),
        401,
      );

      mockPost(mockClient, url, response);

      final result = await apiClient.postAuth(password: 'wrongpass');

      expectHttpError(
        result,
        statusCode: 401,
        messageContains: 'password incorrect',
      );
    });
  });

  group('deleteAuth', () {
    final url = Uri.parse('$baseUrl/api/auth');

    test('deletes current session successfully', () async {
      final response = http.Response('', 204);

      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteAuth(sid);

      expectSuccess(result);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);

      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteAuth(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getAuthSessions', () {
    final url = Uri.parse('$baseUrl/api/auth/sessions');

    test('returns list of sessions on success', () async {
      const data = {
        'sessions': [
          {
            'id': 0,
            'current_session': false,
            'valid': false,
            'tls': {'login': false, 'mixed': false},
            'app': false,
            'cli': false,
            'login_at': 1580000000,
            'last_active': 1580000000,
            'valid_until': 1580000300,
            'remote_addr': '192.168.0.30',
            'user_agent': 'Dart/3.7 (dart:io)',
            'x_forwarded_for': null,
          },
          {
            'id': 1,
            'current_session': true,
            'valid': true,
            'tls': {'login': true, 'mixed': false},
            'app': false,
            'cli': false,
            'login_at': 1580000000,
            'last_active': 1580000000,
            'valid_until': 1580000300,
            'remote_addr': '192.168.0.31',
            'user_agent':
                'Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0',
            'x_forwarded_for': null,
          },
          {
            'id': 3,
            'current_session': false,
            'valid': false,
            'tls': {'login': false, 'mixed': true},
            'app': true,
            'cli': true,
            'login_at': 1580000000,
            'last_active': 1580000000,
            'valid_until': 1580000300,
            'remote_addr': '192.168.0.32',
            'user_agent': 'Dart/3.7 (dart:io)',
            'x_forwarded_for': null,
          },
        ],
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 200);

      mockGet(mockClient, url, response);

      final result = await apiClient.getAuthSessions(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);

      mockGet(mockClient, url, response);

      final result = await apiClient.getAuthSessions(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('deleteAuthSession', () {
    final url = Uri.parse('$baseUrl/api/auth/session/1');

    test('deletes session successfully', () async {
      final response = http.Response('', 204);

      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteAuthSession(sid, id: 1);

      expectSuccess(result);
    });

    test('returns error when missing session ID (400)', () async {
      const data = {
        'error': {
          'key': 'bad_request',
          'message': 'Session ID not in use',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 400);

      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteAuthSession(sid, id: 1);

      expectHttpError(
        result,
        statusCode: 400,
        messageContains: 'Session ID not in use',
      );
    });
  });

  // ==========================================================================
  // Metrics
  // ==========================================================================
  group('getHistory', () {
    final url = Uri.parse('$baseUrl/api/history');

    test('gets history data successfully', () async {
      final data = {
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
      };

      final response = http.Response(jsonEncode(data), 200);

      mockGet(mockClient, url, response);

      final result = await apiClient.getHistory(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);

      mockGet(mockClient, url, response);

      final result = await apiClient.getHistory(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getHistoryClient', () {
    final url = Uri.parse('$baseUrl/api/history/clients?N=10');

    test('gets client history data successfully', () async {
      final data = {
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
      };

      final response = http.Response(jsonEncode(data), 200);

      mockGet(mockClient, url, response);

      final result = await apiClient.getHistoryClient(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);

      mockGet(mockClient, url, response);

      final result = await apiClient.getHistoryClient(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getQueries', () {
    final url = Uri.parse(
      '$baseUrl/api/queries?from=1733472267&until=1733479467&length=100',
    );

    test('gets queries data successfully', () async {
      final data = {
        'queries': [
          {
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
            'id': 112421354,
            'ede': {'code': 0, 'text': null},
          },
          {
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
            'id': 112421355,
            'ede': {'code': 0, 'text': null},
          },
        ],
        'cursor': 175881,
        'recordsTotal': 1234,
        'recordsFiltered': 1234,
        'draw': 1,
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final from = DateTime.fromMillisecondsSinceEpoch(1733472267 * 1000);
      final until = DateTime.fromMillisecondsSinceEpoch(1733479467 * 1000);
      final result = await apiClient.getQueries(sid, from: from, until: until);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);

      mockGet(mockClient, url, response);

      final from = DateTime.fromMillisecondsSinceEpoch(1733472267 * 1000);
      final until = DateTime.fromMillisecondsSinceEpoch(1733479467 * 1000);
      final result = await apiClient.getQueries(sid, from: from, until: until);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getStatsSummary', () {
    final url = Uri.parse('$baseUrl/api/stats/summary');

    test('returns summary statistics', () async {
      final data = {
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
        'gravity': {'domains_being_blocked': 104756, 'last_update': 1725194639},
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getStatsSummary(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getStatsSummary(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getStatsUpstreams', () {
    final url = Uri.parse('$baseUrl/api/stats/upstreams');

    test('returns upstream statistics', () async {
      final data = {
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
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getStatsUpstreams(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getStatsUpstreams(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getStatsTopDomains', () {
    final url = Uri.parse('$baseUrl/api/stats/top_domains');

    test('returns non-block top domains statistics', () async {
      final fullUrl = Uri.parse('$url?blocked=false&count=10');
      final data = {
        'domains': [
          {'domain': 'pi-hole.net', 'count': 8516},
        ],
        'total_queries': 29160,
        'blocked_queries': 6379,
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getStatsTopDomains(sid);

      expectSuccess(result, data);
    });

    test('returns blocked top domains statistics', () async {
      final fullUrl = Uri.parse('$url?blocked=true&count=10');
      final data = {
        'domains': [
          {'domain': 'example.com', 'count': 1234},
        ],
        'total_queries': 5678,
        'blocked_queries': 1234,
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getStatsTopDomains(sid, blocked: true);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      final fullUrl = Uri.parse('$url?blocked=false&count=10');
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getStatsTopDomains(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getStatsTopClients', () {
    final url = Uri.parse('$baseUrl/api/stats/top_clients');

    test('returns non-block top clients statistics', () async {
      final fullUrl = Uri.parse('$url?blocked=false&count=10');
      final data = {
        'clients': [
          {'ip': '192.168.0.44', 'name': 'raspberrypi.lan', 'count': 5896},
        ],
        'total_queries': 29160,
        'blocked_queries': 6379,
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getStatsTopClients(sid);

      expectSuccess(result, data);
    });

    test('returns blocked top clients statistics', () async {
      final fullUrl = Uri.parse('$url?blocked=true&count=10');
      final data = {
        'clients': [
          {'ip': '192.168.0.44', 'name': 'raspberrypi.lan', 'count': 5896},
        ],
        'total_queries': 29160,
        'blocked_queries': 6379,
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getStatsTopClients(sid, blocked: true);

      expectSuccess(result, data);
    });
  });

  // ==========================================================================
  // DNS control
  // ==========================================================================
  group('getDnsBlocking', () {
    final url = Uri.parse('$baseUrl/api/dns/blocking');

    test('returns DNS blocking queries', () async {
      final data = {'blocking': 'enabled', 'timer': 15, 'took': 0.003};
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getDnsBlocking(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };

      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getDnsBlocking(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('postDnsBlocking', () {
    final url = Uri.parse('$baseUrl/api/dns/blocking');

    test('enables DNS blocking', () async {
      final data = {'blocking': 'enabled', 'timer': null, 'took': 0.003};
      final response = http.Response(jsonEncode(data), 200);
      mockPost(mockClient, url, response);

      final result = await apiClient.postDnsBlocking(sid);

      expectSuccess(result, data);
    });

    test('disables DNS blocking', () async {
      final data = {'blocking': 'disabled', 'timer': 30, 'took': 0.003};
      final response = http.Response(jsonEncode(data), 200);
      mockPost(mockClient, url, response);

      final result = await apiClient.postDnsBlocking(
        sid,
        enabled: false,
        timer: 30,
      );

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockPost(mockClient, url, response);

      final result = await apiClient.postDnsBlocking(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // Group management
  // ==========================================================================
  group('getGroups', () {
    final url = Uri.parse('$baseUrl/api/groups');

    test('returns list of groups', () async {
      final data = {
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
            'name': 'sample',
            'comment': null,
            'enabled': true,
            'id': 2,
            'date_added': 1604871899,
            'date_modified': 1604871899,
          },
        ],
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getGroups(sid);

      // The `processed` field is only included in POST responses.
      // Since the model includes this nullable field, we explicitly set it to null here
      // to match the expected structure and ensure proper deserialization behavior.
      final expected = Map<String, Object?>.from(data)..['processed'] = null;
      expectSuccess(result, expected);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getGroups(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // Domain management
  // ==========================================================================
  group('getDomains', () {
    final url = Uri.parse('$baseUrl/api/domains');

    test('returns list of all domains', () async {
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
            'type': 'deny',
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getDomains(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getDomains(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });
  group('postDomains', () {
    final url = Uri.parse('$baseUrl/api/domains');

    test('adds a new domain successfully', () async {
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
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${DomainType.deny.name}/${DomainKind.exact.name}',
      );
      final response = http.Response(jsonEncode(data), 201);
      mockPost(mockClient, fullUrl, response);

      final result = await apiClient.postDomains(
        sid,
        type: DomainType.deny,
        kind: DomainKind.exact,
        domain: 'google.com',
      );

      expectSuccess(result, data);
    });

    test('adds a new domain with params', () async {
      final data = {
        'domains': [
          {
            'domain': 'example.com',
            'unicode': 'example.com',
            'type': 'allow',
            'kind': 'regex',
            'comment': 'Test domain',
            'groups': [1, 2],
            'enabled': false,
            'id': 2,
            'date_added': 1734008144,
            'date_modified': 1734008144,
          },
        ],
        'processed': {
          'errors': [],
          'success': [
            {'item': 'example.com'},
          ],
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${DomainType.allow.name}/${DomainKind.regex.name}',
      );
      final response = http.Response(jsonEncode(data), 201);
      mockPost(mockClient, fullUrl, response);

      final result = await apiClient.postDomains(
        sid,
        type: DomainType.allow,
        kind: DomainKind.regex,
        domain: 'example.com',
        comment: 'Test domain',
        groups: [1, 2],
        enabled: false,
      );

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${DomainType.deny.name}/${DomainKind.exact.name}',
      );
      final response = http.Response(jsonEncode(data), 401);
      mockPost(mockClient, fullUrl, response);

      final result = await apiClient.postDomains(
        sid,
        type: DomainType.deny,
        kind: DomainKind.exact,
        domain: 'example.com',
      );

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('putDomains', () {
    final url = Uri.parse('$baseUrl/api/domains');

    test('updates an existing domain successfully', () async {
      const domain = 'example.com';
      final data = {
        'domains': [
          {
            'domain': domain,
            'unicode': domain,
            'type': 'allow',
            'kind': 'exact',
            'comment': 'test',
            'groups': [0, 1],
            'enabled': false,
            'id': 1,
            'date_added': 1734008144,
            'date_modified': 1734008144,
          },
        ],
        'processed': {
          'errors': [],
          'success': [
            {'item': 'example.com'},
          ],
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${DomainType.allow.name}/${DomainKind.exact.name}/${Uri.encodeComponent(domain)}',
      );
      final response = http.Response(jsonEncode(data), 200);
      mockPut(mockClient, fullUrl, response);

      final result = await apiClient.putDomains(
        sid,
        type: DomainType.allow,
        kind: DomainKind.exact,
        domain: domain,
        comment: 'test',
        groups: [0, 1],
        enabled: false,
      );

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${DomainType.allow.name}/${DomainKind.exact.name}/example.com',
      );
      final response = http.Response(jsonEncode(data), 401);
      mockPut(mockClient, fullUrl, response);

      final result = await apiClient.putDomains(
        sid,
        type: DomainType.allow,
        kind: DomainKind.exact,
        domain: 'example.com',
      );

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('deleteDomains', () {
    final url = Uri.parse('$baseUrl/api/domains');

    test('deletes an existing domain successfully', () async {
      const domain = 'example.com';
      final fullUrl = Uri.parse(
        '$url/${DomainType.allow.name}/${DomainKind.exact.name}/${Uri.encodeComponent(domain)}',
      );
      final response = http.Response('', 204);
      mockDelete(mockClient, fullUrl, response);

      final result = await apiClient.deleteDomains(
        sid,
        type: DomainType.allow,
        kind: DomainKind.exact,
        domain: domain,
      );

      expectSuccess(result);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${DomainType.allow.name}/${DomainKind.exact.name}/example.com',
      );
      final response = http.Response(jsonEncode(data), 401);
      mockDelete(mockClient, fullUrl, response);

      final result = await apiClient.deleteDomains(
        sid,
        type: DomainType.allow,
        kind: DomainKind.exact,
        domain: 'example.com',
      );

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // List management
  // ==========================================================================
  group('getLists', () {
    final url = Uri.parse('$baseUrl/api/lists');

    test('returns allow lists when ListType is null', () async {
      final data = <String, Object?>{
        'lists': [
          {
            'address': 'https://mirror1.malwaredomains.com/files/justdomains',
            'comment': 'Migrated from /etc/pihole/adlists.list',
            'groups': [0],
            'enabled': true,
            'id': 2,
            'date_added': 1594670974,
            'date_modified': 1594670974,
            'type': 'allow',
            'date_updated': 0,
            'number': 100,
            'invalid_domains': 0,
            'abp_entries': 0,
            'status': 3,
          },
        ],
        'took': 0.012,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getLists(sid);

      // The `processed` field is only included in POST responses.
      // Since the model includes this nullable field, we explicitly set it to null here
      final expected = Map<String, Object?>.from(data)..['processed'] = null;
      expectSuccess(result, expected);
    });

    test('returns block lists when ListType is ListType.block', () async {
      final data = {
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
      final fullUrl = Uri.parse('$url?type=${ListType.block.name}');
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getLists(sid, type: ListType.block);

      // The `processed` field is only included in POST responses.
      // Since the model includes this nullable field, we explicitly set it to null here
      final expected = Map<String, Object?>.from(data)..['processed'] = null;
      expectSuccess(result, expected);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getLists(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('postLists', () {
    final url = Uri.parse('$baseUrl/api/lists');

    test('adds a new allow list successfully', () async {
      final data = {
        'lists': [
          {
            'address': 'https://example.com/list.txt',
            'comment': null,
            'groups': [0],
            'enabled': true,
            'id': 1,
            'date_added': 1734008144,
            'date_modified': 1734008144,
            'type': 'allow',
            'date_updated': 0,
            'number': 100,
            'invalid_domains': 0,
            'abp_entries': 0,
            'status': 3,
          },
        ],
        'processed': {
          'errors': [],
          'success': [
            {'item': 'https://example.com/list.txt'},
          ],
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 201);
      mockPost(mockClient, url, response);

      final result = await apiClient.postLists(
        sid,
        address: 'https://example.com/list.txt',
        type: ListType.allow,
      );

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockPost(mockClient, url, response);

      final result = await apiClient.postLists(
        sid,
        address: 'https://example.com/list.txt',
        type: ListType.allow,
      );

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('putLists', () {
    final url = Uri.parse('$baseUrl/api/lists');

    test('updates an existing allow list successfully', () async {
      const address = 'https://example.com/list.txt';
      final data = {
        'lists': [
          {
            'address': address,
            'comment': 'Updated comment',
            'groups': [0, 1],
            'enabled': false,
            'id': 1,
            'date_added': 1734008144,
            'date_modified': 1734008144,
            'type': 'allow',
            'date_updated': 0,
            'number': 100,
            'invalid_domains': 0,
            'abp_entries': 0,
            'status': 3,
          },
        ],
        'processed': {
          'errors': [],
          'success': [
            {'item': address},
          ],
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${Uri.encodeComponent(address)}?type=${ListType.allow.name}',
      );
      final response = http.Response(jsonEncode(data), 200);
      mockPut(mockClient, fullUrl, response);

      final result = await apiClient.putLists(
        sid,
        adlist: address,
        type: ListType.allow,
        comment: 'Updated comment',
        groups: [0, 1],
        enabled: false,
      );

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${Uri.encodeComponent('https://example.com/list.txt')}?type=${ListType.allow.name}',
      );
      final response = http.Response(jsonEncode(data), 401);
      mockPut(mockClient, fullUrl, response);

      final result = await apiClient.putLists(
        sid,
        adlist: 'https://example.com/list.txt',
        type: ListType.allow,
      );

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('deleteLists', () {
    final url = Uri.parse('$baseUrl/api/lists');

    test('deletes an existing allow list successfully', () async {
      const address = 'https://example.com/list.txt';
      final fullUrl = Uri.parse(
        '$url/${Uri.encodeComponent(address)}?type=${ListType.allow.name}',
      );
      final response = http.Response('', 204);
      mockDelete(mockClient, fullUrl, response);

      final result = await apiClient.deleteLists(
        sid,
        adlist: address,
        type: ListType.allow,
      );

      expectSuccess(result);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse(
        '$url/${Uri.encodeComponent('https://example.com/list.txt')}?type=${ListType.allow.name}',
      );
      final response = http.Response(jsonEncode(data), 401);
      mockDelete(mockClient, fullUrl, response);

      final result = await apiClient.deleteLists(
        sid,
        adlist: 'https://example.com/list.txt',
        type: ListType.allow,
      );

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // FTL information
  // ==========================================================================
  group('getInfoClient', () {
    final url = Uri.parse('$baseUrl/api/info/client');

    test('returns client information', () async {
      final data = {
        'remote_addr': '127.0.0.1',
        'http_version': '1.1',
        'method': 'GET',
        'headers': [
          {'name': 'Accept', 'value': 'application/json'},
          {'name': 'Connection', 'value': 'keep-alive'},
          {'name': 'Pragma', 'value': 'no-cache'},
        ],
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoClient(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoClient(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getInfoFtl', () {
    final url = Uri.parse('$baseUrl/api/info/ftl');

    test('returns FTL information with FTL < 6.2', () async {
      final data = {
        'ftl': {
          'database': {
            'gravity': 67906,
            'groups': 6,
            'lists': 1,
            'clients': 5,
            'domains': {
              'allowed': {'total': 10, 'enabled': 10},
              'denied': {'total': 3, 'enabled': 3},
            },
            'regex': {
              'allowed': {'total': 2, 'enabled': 2},
              'denied': {'total': 1, 'enabled': 1},
            },
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
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoFtl(sid);

      expectSuccess(result, data);
    });

    test('returns FTL information with FTL >= 6.3', () async {
      final data = {
        'ftl': {
          'database': {
            'gravity': 67906,
            'groups': 6,
            'lists': 1,
            'clients': 5,
            'domains': {
              'allowed': {'total': 40, 'enabled': 10},
              'denied': {'total': 30, 'enabled': 3},
            },
            'regex': {
              'allowed': {'total': 20, 'enabled': 2},
              'denied': {'total': 10, 'enabled': 1},
            },
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
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoFtl(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoFtl(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getInfoHost', () {
    final url = Uri.parse('$baseUrl/api/info/host');

    test('returns host information', () async {
      final data = {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoHost(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoHost(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getInfoMessages', () {
    final url = Uri.parse('$baseUrl/api/info/messages');

    test('returns list of info messages', () async {
      final data = {
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
            'timestamp': 123456789,
            'type': 'SUBNET',
            'plain': 'Rate-limiting 192.168.2.42 for at least 5 seconds',
            'html':
                'Client <code>192.168.2.42</code> has been rate-limited for at least 5 seconds (current limit: 1000 queries per 60 seconds)',
          },
        ],
        'took': 0.0005114078521728516,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoMessages(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoMessages(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('deleteInfoMessages', () {
    final url = Uri.parse('$baseUrl/api/info/messages/1');

    test('deletes all info messages', () async {
      final response = http.Response('', 204);
      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteInfoMessages(sid, messageId: 1);

      expectSuccess(result);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteInfoMessages(sid, messageId: 1);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getInfoMetrics', () {
    final url = Uri.parse('$baseUrl/api/info/metrics');

    test('returns metrics information', () async {
      final data = {
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
                },
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoMetrics(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoMetrics(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getInfoSensors', () {
    final url = Uri.parse('$baseUrl/api/info/sensors');

    test('returns sensor information', () async {
      final data = {
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
                },
              ],
            },
          ],
          'cpu_temp': 48,
          'hot_limit': 60,
          'unit': 'C',
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoSensors(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoSensors(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getInfoSystem', () {
    final url = Uri.parse('$baseUrl/api/info/system');

    test('returns system information when ftl version < 6.1', () async {
      final data = <String, Object?>{
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoSystem(sid);

      // For FTL versions < 6.1, the '%cpu' field is not present in the response.
      // We expect it to be null in the result.
      final expected = {
        ...data,
        'system': {
          ...(data['system']! as Map<String, Object>),
          'cpu': {
            ...(data['system']! as Map)['cpu'] as Map<String, Object>,
            '%cpu': null,
          },
        },
      };
      expectSuccess(result, expected);
    });

    test('returns system information when ftl version >= 6.1', () async {
      final data = {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoSystem(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoSystem(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('fetInfoVersion', () {
    final url = Uri.parse('$baseUrl/api/info/version');

    test('returns version information', () async {
      final data = {
        'version': {
          'core': {
            'local': {
              'version': 'v6.0.5',
              'branch': 'master',
              'hash': '9fe687bd',
            },
            'remote': {'version': 'v6.0.5', 'hash': '9fe687bd'},
          },
          'web': {
            'local': {
              'version': 'v6.0.2',
              'branch': 'master',
              'hash': '25441178',
            },
            'remote': {'version': 'v6.0.2', 'hash': '25441178'},
          },
          'ftl': {
            'local': {
              'hash': 'b7eb53bf',
              'branch': 'master',
              'version': 'v6.0.4',
              'date': '2025-03-04 17:22:10 +0000',
            },
            'remote': {'version': 'v6.0.4', 'hash': 'b7eb53bf'},
          },
          'docker': {'local': 'null', 'remote': 'null'},
        },
        'took': 0.014363765716552734,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoVersion(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getInfoVersion(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // Network information
  // ==========================================================================
  group('getNetworkDevices', () {
    final url = Uri.parse(
      '$baseUrl/api/network/devices?max_devices=999&max_addresses=25',
    );

    test('returns network devices', () async {
      final data = {
        'devices': [
          {
            'id': 1,
            'hwaddr': '00:11:22:33:44:55',
            'interface': 'enp2s0',
            'firstSeen': 1664623620,
            'lastQuery': 1664688620,
            'numQueries': 585462,
            'macVendor': 'Digital Data Communications Asia Co.,Ltd',
            'ips': [
              {
                'ip': '192.168.1.51',
                'name': 'ubuntu-server',
                'lastSeen': 1664688620,
                'nameUpdated': 1664688620,
              },
            ],
          },
          {
            'id': 2,
            'hwaddr': '00:11:22:33:44:xx',
            'interface': 'enp2s0',
            'firstSeen': 1664523620,
            'lastQuery': 1664588620,
            'numQueries': 562,
            'macVendor': null,
            'ips': [
              {
                'ip': '192.168.1.52',
                'name': 'ubuntu-server',
                'lastSeen': 1664588620,
                'nameUpdated': 1654588620,
              },
              {
                'ip': '192.168.1.62',
                'name': null,
                'lastSeen': 1664488620,
                'nameUpdated': 1654488620,
              },
            ],
          },
        ],
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getNetworkDevices(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getNetworkDevices(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('deleteNetworkDevices', () {
    final url = Uri.parse('$baseUrl/api/network/devices');

    test('deletes a network device successfully', () async {
      const deviceId = 1;
      final fullUrl = Uri.parse('$url/$deviceId');
      final response = http.Response('', 204);
      mockDelete(mockClient, fullUrl, response);

      final result = await apiClient.deleteNetworkDevices(
        sid,
        deviceId: deviceId,
      );

      expectSuccess(result);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final fullUrl = Uri.parse('$url/1');
      final response = http.Response(jsonEncode(data), 401);
      mockDelete(mockClient, fullUrl, response);

      final result = await apiClient.deleteNetworkDevices(sid, deviceId: 1);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('getNetworkGateway', () {
    final url = Uri.parse('$baseUrl/api/network/gateway');

    test('get network gateway information', () async {
      final data = {
        'gateway': [
          {
            'family': 'inet',
            'interface': 'eth0',
            'address': '192.168.0.1',
            'local': ['192.168.0.22'],
          },
          {
            'family': 'inet6',
            'interface': 'eth0',
            'address': 'fe80::3587:2fff:f11a:1',
            'local': ['fe80::3587:2fff:f11a:4321'],
          },
        ],
        'took': 0.003,
        'interfaces': null,
        'routes': null,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getNetworkGateway(sid);

      expectSuccess(result, data);
    });

    test('get newtork gateway information when isDetailed is true', () async {
      final data = {
        'gateway': [
          {
            'family': 'inet',
            'interface': 'eth0',
            'address': '192.168.0.1',
            'local': ['192.168.0.22'],
          },
        ],
        'routes': [
          {
            'table': 254,
            'family': 'inet',
            'protocol': 'boot',
            'scope': 'universe',
            'type': 'unicast',
            'flags': ['onlink'],
            'iflags': 4,
            'gateway': '192.168.0.1',
            'oif': 'eth0',
            'dst': 'default',
          },
          {
            'table': 254,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'unicast',
            'flags': ['linkdown'],
            'iflags': 16,
            'dst': '172.17.0.0',
            'prefsrc': '172.17.0.1',
            'oif': 'docker0',
          },
          {
            'table': 254,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'unicast',
            'flags': ['linkdown'],
            'iflags': 16,
            'dst': '172.18.0.0',
            'prefsrc': '172.18.0.1',
            'oif': 'br-123456abcdef',
          },
          {
            'table': 254,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'unicast',
            'flags': [],
            'iflags': 0,
            'dst': '192.168.0.0',
            'prefsrc': '192.168.0.22',
            'oif': 'eth0',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'host',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': '127.0.0.0',
            'prefsrc': '127.0.0.1',
            'oif': 'lo',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'host',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': '127.0.0.1',
            'prefsrc': '127.0.0.1',
            'oif': 'lo',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'broadcast',
            'flags': [],
            'iflags': 0,
            'dst': '127.255.255.255',
            'prefsrc': '127.0.0.1',
            'oif': 'lo',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'host',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': '172.17.0.1',
            'prefsrc': '172.17.0.1',
            'oif': 'docker0',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'broadcast',
            'flags': ['linkdown'],
            'iflags': 16,
            'dst': '172.17.255.255',
            'prefsrc': '172.17.0.1',
            'oif': 'docker0',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'host',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': '172.18.0.1',
            'prefsrc': '172.18.0.1',
            'oif': 'br-123456abcdef',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'broadcast',
            'flags': ['linkdown'],
            'iflags': 16,
            'dst': '172.18.255.255',
            'prefsrc': '172.18.0.1',
            'oif': 'br-123456abcdef',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'host',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': '192.168.0.22',
            'prefsrc': '192.168.0.22',
            'oif': 'eth0',
          },
          {
            'table': 255,
            'family': 'inet',
            'protocol': 'kernel',
            'scope': 'link',
            'type': 'broadcast',
            'flags': [],
            'iflags': 0,
            'dst': '192.168.0.255',
            'prefsrc': '192.168.0.22',
            'oif': 'eth0',
          },
          {
            'table': 254,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'unicast',
            'flags': [],
            'iflags': 0,
            'dst': 'fe80::',
            'priority': 256,
            'oif': 'eth0',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
          {
            'table': 254,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'unicast',
            'flags': ['linkdown'],
            'iflags': 16,
            'dst': 'fe80::',
            'priority': 256,
            'oif': 'br-123456abcdef',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
          {
            'table': 255,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': '::1',
            'priority': 0,
            'oif': 'lo',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
          {
            'table': 255,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': 'fe80::50d8:b7ee:fe99:e19d',
            'priority': 0,
            'oif': 'br-123456abcdef',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
          {
            'table': 255,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'local',
            'flags': [],
            'iflags': 0,
            'dst': 'fex0::e13f:1ef:f1ba:3ede',
            'priority': 0,
            'oif': 'eth0',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
          {
            'table': 255,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'multicast',
            'flags': [],
            'iflags': 0,
            'dst': 'ff00::',
            'priority': 256,
            'oif': 'eth0',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
          {
            'table': 255,
            'family': 'inet6',
            'protocol': 'kernel',
            'scope': 'universe',
            'type': 'multicast',
            'flags': ['linkdown'],
            'iflags': 16,
            'dst': 'ff00::',
            'priority': 256,
            'oif': 'br-123456abcdef',
            'cstamp': 1745897374,
            'tstamp': 1745897374,
            'expires': 0,
            'error': 0,
            'used': 0,
            'pref': 0,
          },
        ],
        'interfaces': [
          {
            'name': 'lo',
            'index': 1,
            'family': 'unspec',
            'speed': null,
            'type': 'loopback',
            'flags': ['up', 'loopback', 'running', 'lower_up'],
            'ifname': 'lo',
            'txqlen': 1000,
            'state': 'unknown',
            'linkmode': 0,
            'mtu': 65536,
            'min_mtu': 0,
            'max_mtu': 0,
            'group': 0,
            'promiscuity': 0,
            'unknown': [61, 58, 63, 64, 59, 60, 32830, 32833],
            'num_tx_queues': 1,
            'gso_max_segs': 65535,
            'gso_max_size': 65536,
            'num_rx_queues': 1,
            'carrier': true,
            'carrier_changes': 0,
            'carrier_up_count': 0,
            'carrier_down_count': 0,
            'proto_down': false,
            'address': '00:00:00:00:00:00',
            'broadcast': '00:00:00:00:00:00',
            'qdisc': 'noqueue',
            'map': 0,
            'stats': {
              'rx_bytes': {'value': 359.680018, 'unit': 'M'},
              'tx_bytes': {'value': 359.680018, 'unit': 'M'},
              'bits': 64,
              'rx_packets': 4125956,
              'tx_packets': 4125956,
              'rx_errors': 0,
              'tx_errors': 0,
              'rx_dropped': 0,
              'tx_dropped': 0,
              'multicast': 0,
              'collisions': 0,
              'rx_length_errors': 0,
              'rx_over_errors': 0,
              'rx_crc_errors': 0,
              'rx_frame_errors': 0,
              'rx_fifo_errors': 0,
              'rx_missed_errors': 0,
              'tx_aborted_errors': 0,
              'tx_carrier_errors': 0,
              'tx_fifo_errors': 0,
              'tx_heartbeat_errors': 0,
              'tx_window_errors': 0,
              'rx_compressed': 0,
              'tx_compressed': 0,
              'rx_nohandler': 0,
            },
            'addresses': [
              {
                'index': 1,
                'family': 'inet',
                'scope': 'host',
                'flags': ['permanent'],
                'prefixlen': 8,
                'address': '127.0.0.1',
                'address_type': 'loopback',
                'local': '127.0.0.1',
                'local_type': 'loopback',
                'label': 'lo',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897376.65,
                'tstamp': 1745897376.65,
              },
              {
                'index': 1,
                'family': 'inet6',
                'scope': 'host',
                'flags': ['permanent'],
                'prefixlen': 128,
                'address': '::1',
                'address_type': 'loopback',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897376.65,
                'tstamp': 1745897376.65,
              },
            ],
          },
          {
            'name': 'eth0',
            'index': 2,
            'family': 'unspec',
            'speed': 1000,
            'type': 'ether',
            'flags': ['up', 'broadcast', 'running', 'multicast', 'lower_up'],
            'ifname': 'eth0',
            'txqlen': 1000,
            'state': 'up',
            'linkmode': 0,
            'mtu': 1500,
            'min_mtu': 68,
            'max_mtu': 1500,
            'group': 0,
            'promiscuity': 0,
            'unknown': [61, 58, 63, 64, 59, 60, 32830, 32833],
            'num_tx_queues': 5,
            'gso_max_segs': 65535,
            'gso_max_size': 65536,
            'num_rx_queues': 5,
            'carrier': true,
            'carrier_changes': 5,
            'carrier_up_count': 3,
            'carrier_down_count': 2,
            'proto_down': false,
            'address': 'f4:5e:02:ca:ef:e1',
            'broadcast': 'ff:ff:ff:ff:ff:ff',
            'perm_address': 'f4:5e:02:ca:ef:e1',
            'qdisc': 'mq',
            'map': 0,
            'parent_dev_name': 'fd580000.ethernet',
            'parent_dev_bus_name': 'platform',
            'stats': {
              'rx_bytes': {'value': 1.047893004, 'unit': 'G'},
              'tx_bytes': {'value': 679.96021, 'unit': 'M'},
              'bits': 64,
              'rx_packets': 4104288,
              'tx_packets': 3271447,
              'rx_errors': 0,
              'tx_errors': 0,
              'rx_dropped': 0,
              'tx_dropped': 11,
              'multicast': 326302,
              'collisions': 0,
              'rx_length_errors': 0,
              'rx_over_errors': 0,
              'rx_crc_errors': 0,
              'rx_frame_errors': 0,
              'rx_fifo_errors': 0,
              'rx_missed_errors': 0,
              'tx_aborted_errors': 0,
              'tx_carrier_errors': 0,
              'tx_fifo_errors': 0,
              'tx_heartbeat_errors': 0,
              'tx_window_errors': 0,
              'rx_compressed': 0,
              'tx_compressed': 0,
              'rx_nohandler': 0,
            },
            'addresses': [
              {
                'index': 2,
                'family': 'inet',
                'scope': 'universe',
                'flags': ['permanent'],
                'prefixlen': 24,
                'address': '192.168.0.22',
                'address_type': 'private',
                'local': '192.168.0.22',
                'local_type': 'private',
                'broadcast': '192.168.0.255',
                'broadcast_type': 'private',
                'label': 'eth0',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897378.81,
                'tstamp': 1745897378.81,
              },
              {
                'index': 2,
                'family': 'inet6',
                'scope': 'link',
                'flags': ['permanent'],
                'prefixlen': 64,
                'address': 'fex0::e13f:1ef:f1ba:3ede',
                'address_type': 'link-local (LL)',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897382.89,
                'tstamp': 1745897382.89,
                'unknown': [11],
              },
            ],
          },
          {
            'name': 'br-123456abcdef',
            'index': 3,
            'family': 'unspec',
            'speed': null,
            'type': 'ether',
            'flags': ['up', 'broadcast', 'multicast'],
            'ifname': 'br-123456abcdef',
            'txqlen': 0,
            'state': 'down',
            'linkmode': 0,
            'mtu': 1500,
            'min_mtu': 68,
            'max_mtu': 65535,
            'group': 0,
            'promiscuity': 0,
            'unknown': [61, 58, 63, 64, 59, 60, 32830, 32833],
            'num_tx_queues': 1,
            'gso_max_segs': 65535,
            'gso_max_size': 65536,
            'num_rx_queues': 1,
            'carrier': false,
            'carrier_changes': 3,
            'carrier_up_count': 1,
            'carrier_down_count': 2,
            'proto_down': false,
            'address': '52:d8:b7:88:e1:9d',
            'broadcast': 'ff:ff:ff:ff:ff:ff',
            'link_kind': 'bridge',
            'qdisc': 'noqueue',
            'map': 0,
            'stats': {
              'rx_bytes': {'value': 10.335767, 'unit': 'M'},
              'tx_bytes': {'value': 53.863054, 'unit': 'M'},
              'bits': 64,
              'rx_packets': 36305,
              'tx_packets': 50685,
              'rx_errors': 0,
              'tx_errors': 0,
              'rx_dropped': 0,
              'tx_dropped': 8,
              'multicast': 0,
              'collisions': 0,
              'rx_length_errors': 0,
              'rx_over_errors': 0,
              'rx_crc_errors': 0,
              'rx_frame_errors': 0,
              'rx_fifo_errors': 0,
              'rx_missed_errors': 0,
              'tx_aborted_errors': 0,
              'tx_carrier_errors': 0,
              'tx_fifo_errors': 0,
              'tx_heartbeat_errors': 0,
              'tx_window_errors': 0,
              'rx_compressed': 0,
              'tx_compressed': 0,
              'rx_nohandler': 0,
            },
            'addresses': [
              {
                'index': 3,
                'family': 'inet',
                'scope': 'universe',
                'flags': ['permanent'],
                'prefixlen': 16,
                'address': '172.18.0.1',
                'address_type': 'private',
                'local': '172.18.0.1',
                'local_type': 'private',
                'broadcast': '172.18.255.255',
                'broadcast_type': 'private',
                'label': 'br-123456abcdef',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897381.73,
                'tstamp': 1745897381.73,
              },
              {
                'index': 3,
                'family': 'inet6',
                'scope': 'link',
                'flags': ['permanent'],
                'prefixlen': 64,
                'address': 'fe80::50d8:b7ee:fe99:e19d',
                'address_type': 'link-local (LL)',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897443.92,
                'tstamp': 1745897443.92,
                'unknown': [11],
              },
            ],
          },
          {
            'name': 'docker0',
            'index': 4,
            'family': 'unspec',
            'speed': null,
            'type': 'ether',
            'flags': ['up', 'broadcast', 'multicast'],
            'ifname': 'docker0',
            'txqlen': 0,
            'state': 'down',
            'linkmode': 0,
            'mtu': 1500,
            'min_mtu': 68,
            'max_mtu': 65535,
            'group': 0,
            'promiscuity': 0,
            'unknown': [61, 58, 63, 64, 59, 60, 32830, 32833],
            'num_tx_queues': 1,
            'gso_max_segs': 65535,
            'gso_max_size': 65536,
            'num_rx_queues': 1,
            'carrier': false,
            'carrier_changes': 1,
            'carrier_up_count': 0,
            'carrier_down_count': 1,
            'proto_down': false,
            'address': '22:bb:b7:3d:d7:d8',
            'broadcast': 'ff:ff:ff:ff:ff:ff',
            'link_kind': 'bridge',
            'qdisc': 'noqueue',
            'map': 0,
            'stats': {
              'rx_bytes': {'value': 0, 'unit': ''},
              'tx_bytes': {'value': 0, 'unit': ''},
              'bits': 64,
              'rx_packets': 0,
              'tx_packets': 0,
              'rx_errors': 0,
              'tx_errors': 0,
              'rx_dropped': 0,
              'tx_dropped': 8,
              'multicast': 0,
              'collisions': 0,
              'rx_length_errors': 0,
              'rx_over_errors': 0,
              'rx_crc_errors': 0,
              'rx_frame_errors': 0,
              'rx_fifo_errors': 0,
              'rx_missed_errors': 0,
              'tx_aborted_errors': 0,
              'tx_carrier_errors': 0,
              'tx_fifo_errors': 0,
              'tx_heartbeat_errors': 0,
              'tx_window_errors': 0,
              'rx_compressed': 0,
              'tx_compressed': 0,
              'rx_nohandler': 0,
            },
            'addresses': [
              {
                'index': 4,
                'family': 'inet',
                'scope': 'universe',
                'flags': ['permanent'],
                'prefixlen': 16,
                'address': '172.17.0.1',
                'address_type': 'private',
                'local': '172.17.0.1',
                'local_type': 'private',
                'broadcast': '172.17.255.255',
                'broadcast_type': 'private',
                'label': 'docker0',
                'prefered': 4294967295,
                'valid': 4294967295,
                'cstamp': 1745897381.93,
                'tstamp': 1745897381.93,
              },
            ],
          },
        ],
        'took': 0.003313302993774414,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, Uri.parse('$url?detailed=true'), response);

      final result = await apiClient.getNetworkGateway(sid, isDetailed: true);

      // Use Gateway.fromJson(data).toJson() instead of raw `data`
      // to include all expected keys (with nulls for missing fields).
      // This ensures consistency with the model's full schema during comparison.
      expectSuccess(result, Gateway.fromJson(data).toJson());
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getNetworkGateway(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // Actions
  // ==========================================================================
  group('postActionFlushArp', () {
    final url = Uri.parse('$baseUrl/api/action/flush/arp');

    test('flushes ARP cache successfully', () async {
      final data = {'status': 'success', 'took': 0.003};
      final response = http.Response(jsonEncode(data), 200);
      mockPost(mockClient, url, response);

      final result = await apiClient.postActionFlushArp(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockPost(mockClient, url, response);

      final result = await apiClient.postActionFlushArp(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('postActionFlushLogs', () {
    final url = Uri.parse('$baseUrl/api/action/flush/logs');

    test('flushes logs successfully', () async {
      final data = {'status': 'success', 'took': 0.003};
      final response = http.Response(jsonEncode(data), 200);
      mockPost(mockClient, url, response);

      final result = await apiClient.postActionFlushLogs(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockPost(mockClient, url, response);

      final result = await apiClient.postActionFlushLogs(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('postActionGravity', () {
    final url = Uri.parse('$baseUrl/api/action/gravity');

    test('runs gravity successfully', () async {
      final data = Stream<List<int>>.fromIterable([
        utf8.encode('Line 1\nLine 2\n'),
        utf8.encode('Line 3\n'),
      ]);
      final response = http.StreamedResponse(data, 200);
      mockStreamedResponse(mockClient, url, response);

      final responses = <Result<List<String>>>[];

      await for (final res in apiClient.postActionGravity(sid)) {
        responses.add(res);
      }

      expect(responses.length, 3);
      expect(responses[0].isSuccess(), true);
      expect(responses[0].getOrNull(), ['Line 1', 'Line 2']);
      expect(responses[1].isSuccess(), true);
      expect(responses[1].getOrNull(), ['Line 3']);
      expect(responses[2].isSuccess(), true);
      expect(responses[2].getOrNull(), []);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.StreamedResponse(
        Stream<List<int>>.fromIterable([utf8.encode(jsonEncode(data))]),
        401,
      );
      mockStreamedResponse(mockClient, url, response);
      final result = await apiClient.postActionGravity(sid).toList();

      expect(result.length, 1);
      expect(result[0].isError(), true);
      final error = result[0].exceptionOrNull();
      expect(
        error,
        predicate(
          (e) =>
              e is HttpStatusCodeException &&
              e.statusCode == 401 &&
              e.message.contains('Unauthorized'),
        ),
      );
    });
  });

  group('postActionRestartDns', () {
    final url = Uri.parse('$baseUrl/api/action/restartdns');

    test('restarts DNS successfully', () async {
      final data = {'status': 'success', 'took': 0.003};
      final response = http.Response(jsonEncode(data), 200);
      mockPost(mockClient, url, response);

      final result = await apiClient.postActionRestartDns(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockPost(mockClient, url, response);

      final result = await apiClient.postActionRestartDns(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // Pi-hole Configuration
  // ==========================================================================
  group('getConfigElement', () {
    final url = Uri.parse('$baseUrl/api/config');

    test('gets a configuration all successfully', () async {
      final data = {
        'config': {
          'dns': {
            'upstreams': ['127.0.0.1#5353', '8.8.8.8'],
            'CNAMEdeepInspect': true,
            'blockESNI': true,
            'EDNS0ECS': true,
            'ignoreLocalhost': false,
            'showDNSSEC': true,
            'analyzeOnlyAandAAAA': false,
            'piholePTR': 'PI.HOLE',
            'replyWhenBusy': 'ALLOW',
            'blockTTL': 2,
            'hosts': ['192.168.2.123 mymusicbox'],
            'domainNeeded': true,
            'expandHosts': true,
            'domain': {'name': 'lan', 'local': null},
            'bogusPriv': true,
            'dnssec': true,
            'interface': 'eth0',
            'hostRecord': '',
            'listeningMode': 'local',
            'queryLogging': true,
            'cnameRecords': [
              '*.example.com,default.example.com',
              'hourly.yetanother.com,yetanother.com,3600',
            ],
            'port': 53,
            'localise': true,
            'cache': {
              'size': 10000,
              'optimizer': 3600,
              'upstreamBlockedTTL': 86400,
            },
            'revServers': ['true,192.168.0.0/24,192.168.0.1,lan'],
            'blocking': {'active': true, 'mode': 'NULL', 'edns': 'NONE'},
            'specialDomains': {
              'mozillaCanary': true,
              'iCloudPrivateRelay': true,
              'designatedResolver': true,
            },
            'reply': {
              'host': {
                'force4': false,
                'force6': false,
                'IPv4': '0.0.0.0',
                'IPv6': '::',
              },
              'blocking': {
                'force4': false,
                'force6': false,
                'IPv4': '0.0.0.0',
                'IPv6': '::',
              },
            },
            'rateLimit': {'count': 0, 'interval': 0},
          },
          'dhcp': {
            'active': false,
            'start': '192.168.0.10',
            'end': '192.168.0.250',
            'router': '192.168.0.1',
            'netmask': '0.0.0.0',
            'leaseTime': '24h',
            'ipv6': false,
            'rapidCommit': false,
            'multiDNS': false,
            'logging': false,
            'ignoreUnknownClients': false,
            'hosts': [
              '11:22:33:44:55:66,192.168.1.123',
              '11:22:33:44:55:67,192.168.1.124,hostname',
            ],
          },
          'ntp': {
            'ipv4': {'active': true, 'address': ''},
            'ipv6': {'active': true, 'address': ''},
            'sync': {
              'active': true,
              'server': 'pool.ntp.org',
              'interval': 3600,
              'count': 8,
              'rtc': {'set': true, 'device': '', 'utc': true},
            },
          },
          'resolver': {
            'resolveIPv4': true,
            'resolveIPv6': true,
            'networkNames': true,
            'refreshNames': 'IPV4_ONLY',
          },
          'database': {
            'DBimport': true,
            'maxDBdays': 365,
            'DBinterval': 60,
            'useWAL': true,
            'network': {'parseARPcache': true, 'expire': 365},
          },
          'webserver': {
            'domain': 'pi.hole',
            'acl': '+0.0.0.0/0,::/0',
            'port': '80,[::]:80',
            'threads': 0,
            'headers': [
              'X-DNS-Prefetch-Control: off',
              "Content-Security-Policy: default-src 'self' 'unsafe-inline';",
              'X-Frame-Options: DENY',
              'X-XSS-Protection: 0',
              'X-Content-Type-Options: nosniff',
              'Referrer-Policy: strict-origin-when-cross-origin',
            ],
            'serve_all': false,
            'advancedOpts': ['ssl_protocol_version=4'],
            'session': {'timeout': 300, 'restore': true},
            'tls': {'cert': '/etc/pihole/tls.pem', 'validity': 47},
            'paths': {
              'webroot': '/var/www/html',
              'webhome': '/admin/',
              'prefix': '',
            },
            'interface': {'boxed': true, 'theme': 'default-darker'},
            'api': {
              'max_sessions': 16,
              'prettyJSON': false,
              'password': '********',
              'pwhash': '',
              'totp_secret': '',
              'app_pwhash': '',
              'app_sudo': false,
              'cli_pw': true,
              'excludeClients': [r'1\.2\.3\.4', 'localhost', 'fe80::345'],
              'excludeDomains': [r'google\\.de', r'pi-hole\.net'],
              'maxHistory': 86400,
              'maxClients': 10,
              'client_history_global_max': true,
              'allow_destructive': true,
              'temp': {'limit': 60, 'unit': 'C'},
            },
          },
          'files': {
            'pid': '/run/pihole-FTL.pid',
            'database': '/etc/pihole/pihole-FTL.db',
            'gravity': '/etc/pihole/gravity.db',
            'gravity_tmp': '/tmp',
            'macvendor': '/etc/pihole/macvendor.db',
            'setupVars': '/etc/pihole/setupVars.conf',
            'pcap': '',
            'log': {
              'ftl': '/var/log/pihole/FTL.log',
              'dnsmasq': '/var/log/pihole/pihole.log',
              'webserver': '/var/log/pihole/webserver.log',
            },
          },
          'misc': {
            'nice': -10,
            'delay_startup': 10,
            'addr2line': true,
            'privacylevel': 0,
            'etc_dnsmasq_d': false,
            'dnsmasq_lines': [],
            'extraLogging': false,
            'readOnly': false,
            'normalizeCPU': false,
            'check': {'load': true, 'shmem': 90, 'disk': 90},
          },
          'debug': {
            'database': false,
            'networking': false,
            'locks': false,
            'queries': false,
            'flags': false,
            'shmem': false,
            'gc': false,
            'arp': false,
            'regex': false,
            'api': false,
            'tls': false,
            'overtime': false,
            'status': false,
            'caps': false,
            'dnssec': false,
            'vectors': false,
            'resolver': false,
            'edns0': false,
            'clients': false,
            'aliasclients': false,
            'events': false,
            'helper': false,
            'config': false,
            'inotify': false,
            'webserver': false,
            'extra': false,
            'reserved': false,
            'ntp': false,
            'netlink': false,
            'all': false,
          },
        },
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getConfigElement(sid);

      expectSuccess(result, data);
    });

    test('gets a specific configuration element successfully', () async {
      final fullUrl = Uri.parse('$url/dns/queryLogging');
      final data = {
        'config': {
          'dns': {'queryLogging': true},
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.getConfigElement(
        sid,
        element: 'dns/queryLogging',
      );

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getConfigElement(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('patchConfig', () {
    final url = Uri.parse('$baseUrl/api/config');

    test('updates a configuration element successfully', () async {
      final data = {
        'config': {
          'dns': {'queryLogging': false},
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockPatch(mockClient, url, response);

      final configData = ConfigData.fromJson({
        'dns': {'queryLogging': false},
      });
      final result = await apiClient.patchConfig(sid, body: configData);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockPatch(mockClient, url, response);

      final configData = ConfigData.fromJson({
        'dns': {'queryLogging': false},
      });
      final result = await apiClient.patchConfig(sid, body: configData);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  // ==========================================================================
  // DHCP
  // ==========================================================================
  group('getDhcpLeases', () {
    final url = Uri.parse('$baseUrl/api/dhcp/leases');

    test('gets DHCP leases successfully', () async {
      final data = {
        'leases': [
          {
            'expires': 1675671991,
            'name': 'raspberrypi',
            'hwaddr': '00:00:00:00:00:00',
            'ip': '192.168.2.111',
            'clientid': '00:00:00:00:00:00',
          },
        ],
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getDhcpLeases(sid);

      expectSuccess(result, data);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockGet(mockClient, url, response);

      final result = await apiClient.getDhcpLeases(sid);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });

  group('deleteDhcpLeases', () {
    const ip = '192.168.1.100';
    final url = Uri.parse(
      '$baseUrl/api/dhcp/leases/${Uri.encodeComponent(ip)}',
    );

    test('deletes DHCP leases successfully', () async {
      final response = http.Response(jsonEncode(''), 204);
      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteDhcpLeases(sid, ip: ip);

      expectSuccess(result);
    });

    test('returns error when unauthorized (401)', () async {
      const data = {
        'error': {
          'key': 'unauthorized',
          'message': 'Unauthorized',
          'hint': null,
        },
        'took': 0.003,
      };
      final response = http.Response(jsonEncode(data), 401);
      mockDelete(mockClient, url, response);

      final result = await apiClient.deleteDhcpLeases(sid, ip: ip);

      expectHttpError(result, statusCode: 401, messageContains: 'Unauthorized');
    });
  });
}
