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
    late MockClient mockClient;
    final sessinId = 'n9n9f6c3umrumfq2ese1lvu2pg';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
      apiGateway = ApiGatewayV5(server);
    });

    test('Success loginQuery', () async {
      mockClient = MockClient();
      when(mockClient.get(Uri.parse(
              'http://example.com/admin/api.php?auth=xxx123&summaryRaw')))
          .thenAnswer((_) async => http.Response(
              jsonEncode({
                "domains_being_blocked": 121860,
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
                  "absolute": 1732972589,
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
  });
}
