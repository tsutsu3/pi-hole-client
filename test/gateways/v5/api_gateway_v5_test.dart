import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import './api_gateway_v5_test.mocks.dart';

// example.com's 404 page
final htmlString = '''
<!doctype html>
<html>
<head>
    <title>Example Domain</title>

    <meta charset="utf-8" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style type="text/css">
    body {
        background-color: #f0f0f2;
        margin: 0;
        padding: 0;
        font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

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
    <p><a href="https://www.iana.org/domains/example">More information...</a></p>
</div>
</body>
</html>
''';

@GenerateMocks([http.Client])
void main() {
  group('checkBasicAuth', () {
    late ApiGatewayV5 apiGateway;
    late Server server;

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
      apiGateway = ApiGatewayV5(server);
    });

    test('checkBasicAuth returns true for valid credentials', () {
      expect(apiGateway.checkBasicAuth('username', 'password'), isTrue);
    });

    test('checkBasicAuth returns false for invalid username', () {
      expect(apiGateway.checkBasicAuth('', 'password'), isFalse);
      expect(apiGateway.checkBasicAuth(null, 'password'), isFalse);
    });

    test('checkBasicAuth returns false for invalid blank blank password', () {
      expect(apiGateway.checkBasicAuth('username', ''), isFalse);
      expect(apiGateway.checkBasicAuth('username', null), isFalse);
    });
  });

  group('loginQuery', () {
    late Server server;
    final sessinId = 'n9n9f6c3umrumfq2ese1lvu2pg';
    final url = 'http://example.com/admin/api.php?auth=xxx123&summaryRaw';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
    });
    test('Return success with valid auth token', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(
              jsonEncode({
                "domains_being_blocked": 121,
                "dns_queries_today": 12,
                "ads_blocked_today": 1,
                "ads_percentage_today": 8.333333,
                "unique_domains": 11,
                "queries_forwarded": 9,
                "queries_cached": 2,
                "clients_ever_seen": 2,
                "unique_clients": 2,
                "dns_queries_all_types": 12,
                "reply_UNKNOWN": 0,
                "reply_NODATA": 0,
                "reply_NXDOMAIN": 1,
                "reply_CNAME": 0,
                "reply_IP": 10,
                "reply_DOMAIN": 1,
                "reply_RRNAME": 0,
                "reply_SERVFAIL": 0,
                "reply_REFUSED": 0,
                "reply_NOTIMP": 0,
                "reply_OTHER": 0,
                "reply_DNSSEC": 0,
                "reply_NONE": 0,
                "reply_BLOB": 0,
                "dns_queries_all_replies": 12,
                "privacy_level": 0,
                "status": "enabled",
                "gravity_last_updated": {
                  "file_exists": true,
                  "absolute": 17329,
                  "relative": {"days": 4, "hours": 23, "minutes": 41}
                }
              }),
              200));

      when(mockClient.get(
          Uri.parse('http://example.com/admin/api.php?auth=xxx123&enable=0'),
          headers: {})).thenAnswer((_) async => http.Response(
              jsonEncode({"status": "enabled"}), 200, headers: {
            'set-cookie':
                'PHPSESSID=$sessinId; path=/; HttpOnly; SameSite=Strict'
          }));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.success);
      expect(response.phpSessId, sessinId);
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
      expect(response.phpSessId, isNull);
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

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(htmlString, 404));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.noConnection);
      expect(response.phpSessId, isNull);
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
      expect(response.phpSessId, isNull);
      expect(response.status, isNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'Exception: Unexpected error test');
    });
  });

  group('realtimeStatus', () {
    late Server server;
    final url =
        'http://example.com/admin/api.php?auth=xxx123&summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {
        "domains_being_blocked": 121860,
        "dns_queries_today": 16,
        "ads_blocked_today": 1,
        "ads_percentage_today": 6.25,
        "unique_domains": 11,
        "queries_forwarded": 9,
        "queries_cached": 6,
        "clients_ever_seen": 2,
        "unique_clients": 2,
        "dns_queries_all_types": 16,
        "reply_UNKNOWN": 0,
        "reply_NODATA": 0,
        "reply_NXDOMAIN": 3,
        "reply_CNAME": 0,
        "reply_IP": 10,
        "reply_DOMAIN": 3,
        "reply_RRNAME": 0,
        "reply_SERVFAIL": 0,
        "reply_REFUSED": 0,
        "reply_NOTIMP": 0,
        "reply_OTHER": 0,
        "reply_DNSSEC": 0,
        "reply_NONE": 0,
        "reply_BLOB": 0,
        "dns_queries_all_replies": 16,
        "privacy_level": 0,
        "status": "enabled",
        "gravity_last_updated": {
          "file_exists": true,
          "absolute": 1732972589,
          "relative": {"days": 5, "hours": 18, "minutes": 14}
        },
        "top_queries": {
          "1.0.26.172.in-addr.arpa": 3,
          "8.8.8.8.in-addr.arpa": 3,
          "github.com": 2,
          "gitlab.com": 1,
          "sample.com": 1,
          "test.com": 1,
          "google.com": 1,
          "google.co.jp": 1,
          "yahoo.co.jp": 1,
          "fix.test.com": 1
        },
        "top_ads": {"test.com": 1},
        "top_sources": {"172.26.0.1": 10, "localhost|127.0.0.1": 6},
        "top_sources_blocked": {"172.26.0.1": 1},
        "forward_destinations": {
          "blocked|blocked": 6.25,
          "cached|cached": 37.5,
          "other|other": 0,
          "dns.google#53|8.8.8.8#53": 56.25
        },
        "querytypes": {
          "A (IPv4)": 62.5,
          "AAAA (IPv6)": 0,
          "ANY": 0,
          "SRV": 0,
          "SOA": 0,
          "PTR": 37.5,
          "TXT": 0,
          "NAPTR": 0,
          "MX": 0,
          "DS": 0,
          "RRSIG": 0,
          "DNSKEY": 0,
          "NS": 0,
          "OTHER": 0,
          "SVCB": 0,
          "HTTPS": 0
        }
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
    final url = 'http://example.com/admin/api.php?auth=xxx123&disable=5';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {"status": "disabled"};
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
    final url = 'http://example.com/admin/api.php?auth=xxx123&enable';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV5(server, client: mockClient);
      final data = {"status": "enabled"};
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
}
