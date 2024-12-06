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
    late ApiGatewayV5 apiGateway;
    late Server server;
    final sessinId = 'n9n9f6c3umrumfq2ese1lvu2pg';
    final authUrl = 'http://example.com/admin/api.php?auth=xxx123&summaryRaw';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
      apiGateway = ApiGatewayV5(server);
    });

    test('Return success with valid auth token', () async {
      final mockClient = MockClient();
      when(mockClient.get(Uri.parse(authUrl)))
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

      when(mockClient.get(Uri.parse(
              'http://example.com/admin/api.php?auth=xxx123&enable=0')))
          .thenAnswer((_) async => http.Response(
                  jsonEncode({"status": "enabled"}), 200, headers: {
                'set-cookie':
                    'PHPSESSID=$sessinId; path=/; HttpOnly; SameSite=Strict'
              }));

      final response = await apiGateway.loginQuery(client: mockClient);

      expect(response.result, APiResponseType.success);
      expect(response.phpSessId, sessinId);
      expect(response.status, 'enabled');
      expect(response.log, isNull);
    });

    test('Return error with invalid auth token', () async {
      final mockClient = MockClient();
      when(mockClient.get(Uri.parse(authUrl)))
          .thenAnswer((_) async => http.Response(jsonEncode([]), 200));

      final response = await apiGateway.loginQuery(client: mockClient);

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
      when(mockClient.get(Uri.parse(authUrl)))
          .thenAnswer((_) async => http.Response(htmlString, 404));

      final response = await apiGateway.loginQuery(client: mockClient);

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
      when(mockClient.get(Uri.parse(authUrl)))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.loginQuery(client: mockClient);

      expect(response.result, APiResponseType.error);
      expect(response.phpSessId, isNull);
      expect(response.status, isNull);
      expect(response.log?.type, 'login');
      expect(response.log?.message, 'Exception: Unexpected error test');
    });
  });

  group('realtimeStatus', () {});

  group('disableServerRequest', () {});

  group('enableServerRequest', () {});
}
