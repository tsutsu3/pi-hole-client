import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import './api_gateway_v6_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('loginQuery', () {
    late Server server;
    final sessinId = 'n9n9f6c3umrumfq2ese1lvu2pg';
    final urls = [
      'http://example.com/api/auth',
      'http://example.com/api/dns/blocking'
    ];

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          password: 'xxx123');
    });
    test('Return success with valid password', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.post(
        Uri.parse(urls[0]),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "session": {
              "valid": true,
              "totp": false,
              "sid": "n9n9f6c3umrumfq2ese1lvu2pg",
              "csrf": "Ux87YTIiMOf/GKCefVIOMw=",
              "validity": 300,
              "message": "correct password"
            },
            "took": 0.039638996124267578
          }),
          200));

      when(mockClient.get(
        Uri.parse(urls[1]),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({"blocking": "enabled", "timer": null, "took": 0.003}),
          200));

      final response = await apiGateway.loginQuery();

      expect(response.result, APiResponseType.success);
      expect(response.sid, sessinId);
      expect(response.status, 'enabled');
      expect(response.log, isNull);
    });

    test('Return error with invalid password', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.post(
        Uri.parse(urls[0]),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          jsonEncode({
            "session": {
              "valid": false,
              "totp": false,
              "sid": null,
              "validity": -1,
              "message": "password incorrect"
            },
            "took": 0.039638996124267578
          }),
          401));

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
      '''
          .trimLeft();

      when(mockClient.post(
        Uri.parse(urls[0]),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(htmlString, 404));

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

      when(mockClient.post(
        Uri.parse(urls[0]),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenThrow(Exception('Unexpected error test'));

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
          password: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = [
        {
          "queries": {
            "total": 7497,
            "blocked": 3465,
            "percent_blocked": 34.5,
            "unique_domains": 445,
            "forwarded": 4574,
            "cached": 9765,
            "types": {
              "A": 3643,
              "AAAA": 123,
              "ANY": 3423,
              "SRV": 345,
              "SOA": 7567,
              "PTR": 456,
              "TXT": 85,
              "NAPTR": 346,
              "MX": 457,
              "DS": 456,
              "RRSIG": 345,
              "DNSKEY": 55,
              "NS": 868,
              "SVCB": 645,
              "HTTPS": 4,
              "OTHER": 845
            },
            "status": {
              "UNKNOWN": 3,
              "GRAVITY": 72,
              "FORWARDED": 533,
              "CACHE": 32,
              "REGEX": 84,
              "DENYLIST": 31,
              "EXTERNAL_BLOCKED_IP": 0,
              "EXTERNAL_BLOCKED_NULL": 0,
              "EXTERNAL_BLOCKED_NXRA": 0,
              "GRAVITY_CNAME": 0,
              "REGEX_CNAME": 0,
              "DENYLIST_CNAME": 0,
              "RETRIED": 0,
              "RETRIED_DNSSEC": 0,
              "IN_PROGRESS": 0,
              "DBBUSY": 0,
              "SPECIAL_DOMAIN": 0,
              "CACHE_STALE": 0
            },
            "replies": {
              "UNKNOWN": 3,
              "NODATA": 72,
              "NXDOMAIN": 533,
              "CNAME": 32,
              "IP": 84,
              "DOMAIN": 31,
              "RRNAME": 0,
              "SERVFAIL": 0,
              "REFUSED": 0,
              "NOTIMP": 0,
              "OTHER": 0,
              "DNSSEC": 31,
              "NONE": 0,
              "BLOB": 0
            }
          },
          "clients": {"active": 10, "total": 22},
          "gravity": {
            "domains_being_blocked": 104756,
            "last_update": 1725194639
          },
          "took": 0.003
        },
        {
          "ftl": {
            "database": {
              "gravity": 67906,
              "groups": 6,
              "lists": 1,
              "clients": 5,
              "domains": {"allowed": 10, "denied": 3}
            },
            "privacy_level": 0,
            "clients": {"total": 10, "active": 8},
            "pid": 1234,
            "uptime": 123456789,
            "%mem": 0.1,
            "%cpu": 1.2,
            "allow_destructive": true,
            "dnsmasq": {
              "dns_cache_inserted": 8,
              "dns_cache_live_freed": 0,
              "dns_queries_forwarded": 2,
              "dns_auth_answered": 0,
              "dns_local_answered": 74,
              "dns_stale_answered": 0,
              "dns_unanswered": 0,
              "bootp": 0,
              "pxe": 0,
              "dhcp_ack": 0,
              "dhcp_decline": 0,
              "dhcp_discover": 0,
              "dhcp_inform": 0,
              "dhcp_nak": 0,
              "dhcp_offer": 0,
              "dhcp_release": 0,
              "dhcp_request": 0,
              "noanswer": 0,
              "leases_allocated_4": 0,
              "leases_pruned_4": 0,
              "leases_allocated_6": 0,
              "leases_pruned_6": 0,
              "tcp_connections": 0,
              "dnssec_max_crypto_use": 0,
              "dnssec_max_sig_fail": 0,
              "dnssec_max_work": 0
            }
          },
          "took": 0.003
        },
        {"blocking": "enabled", "timer": 15, "took": 0.003},
        {
          "domains": [
            {"domain": "pi-hole.net", "count": 8516}
          ],
          "total_queries": 29160,
          "blocked_queries": 6379,
          "took": 0.003
        },
        {
          "domains": [
            {"domain": "pi-hole.net", "count": 8516}
          ],
          "total_queries": 29160,
          "blocked_queries": 6379,
          "took": 0.003
        },
        {
          "clients": [
            {"ip": "192.168.0.44", "name": "raspberrypi.lan", "count": 5896}
          ],
          "total_queries": 29160,
          "blocked_queries": 6379,
          "took": 0.003
        },
        {
          "clients": [
            {"ip": "192.168.0.44", "name": "raspberrypi.lan", "count": 5896}
          ],
          "total_queries": 29160,
          "blocked_queries": 6379,
          "took": 0.003
        },
        {
          "upstreams": [
            {
              "ip": "blocklist",
              "name": "blocklist",
              "port": -1,
              "count": 0,
              "statistics": {"response": 0, "variance": 0}
            },
            {
              "ip": "cache",
              "name": "cache",
              "port": -1,
              "count": 2,
              "statistics": {"response": 0, "variance": 0}
            },
            {
              "ip": "8.8.8.8",
              "name": "dns.google",
              "port": 53,
              "count": 8,
              "statistics": {
                "response": 0.0516872935824924,
                "variance": 0.0049697216173868828
              }
            },
          ],
          "total_queries": 8,
          "forwarded_queries": 6,
          "took": 5.6982040405273438e-05
        }
      ];
      for (int i = 0; i < urls.length; i++) {
        when(mockClient.get(
          Uri.parse(urls[i]),
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response(jsonEncode(data[i]), 200));
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
    final url = 'http://example.com/admin/api.php?auth=xxx123&disable=5';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {"status": "disabled"};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.disableServerRequest(5);

      expect(response.result, APiResponseType.success);
      expect(response.status, 'disabled');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

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
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {"status": "enabled"};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.enableServerRequest();

      expect(response.result, APiResponseType.success);
      expect(response.status, 'enabled');
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.enableServerRequest();

      expect(response.result, APiResponseType.error);
      expect(response.status, isNull);
    });
  });

  group('fetchOverTimeData', () {
    late Server server;
    final url =
        'http://example.com/admin/api.php?auth=xxx123&overTimeData10mins&overTimeDataClients&getClientNames';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        "domains_over_time": {
          "1733391300": 0,
          "1733391900": 0,
          "1733392500": 0,
          "1733393100": 0,
          "1733393700": 0,
          "1733394300": 0,
          "1733394900": 0,
          "1733395500": 0,
          "1733396100": 0,
          "1733396700": 3,
          "1733397300": 0,
          "1733397900": 0,
          "1733398500": 0,
          "1733399100": 0,
          "1733399700": 0,
          "1733400300": 2,
          "1733400900": 7,
          "1733401500": 0,
          "1733402100": 0,
          "1733402700": 0,
          "1733403300": 0,
          "1733403900": 2,
          "1733404500": 0,
          "1733405100": 0,
          "1733405700": 0,
          "1733406300": 0,
          "1733406900": 0,
          "1733407500": 2,
          "1733408100": 0,
          "1733408700": 0,
          "1733409300": 0,
          "1733409900": 0,
          "1733410500": 0,
          "1733411100": 0,
          "1733411700": 0,
          "1733412300": 0,
          "1733412900": 0,
          "1733413500": 0,
          "1733414100": 0,
          "1733414700": 0,
          "1733415300": 0,
          "1733415900": 0,
          "1733416500": 0,
          "1733417100": 0,
          "1733417700": 0,
          "1733418300": 0,
          "1733418900": 0,
          "1733419500": 0,
          "1733420100": 0,
          "1733420700": 0,
          "1733421300": 0,
          "1733421900": 0,
          "1733422500": 0,
          "1733423100": 0,
          "1733423700": 0,
          "1733424300": 0,
          "1733424900": 0,
          "1733425500": 0,
          "1733426100": 0,
          "1733426700": 0,
          "1733427300": 0,
          "1733427900": 0,
          "1733428500": 0,
          "1733429100": 0,
          "1733429700": 0,
          "1733430300": 0,
          "1733430900": 0,
          "1733431500": 0,
          "1733432100": 0,
          "1733432700": 0,
          "1733433300": 0,
          "1733433900": 0,
          "1733434500": 0,
          "1733435100": 0,
          "1733435700": 0,
          "1733436300": 0,
          "1733436900": 0,
          "1733437500": 0,
          "1733438100": 0,
          "1733438700": 0,
          "1733439300": 0,
          "1733439900": 0,
          "1733440500": 0,
          "1733441100": 0,
          "1733441700": 0,
          "1733442300": 0,
          "1733442900": 0,
          "1733443500": 0,
          "1733444100": 0,
          "1733444700": 0,
          "1733445300": 0,
          "1733445900": 0,
          "1733446500": 0,
          "1733447100": 0,
          "1733447700": 0,
          "1733448300": 0,
          "1733448900": 0,
          "1733449500": 0,
          "1733450100": 0,
          "1733450700": 0,
          "1733451300": 0,
          "1733451900": 0,
          "1733452500": 0,
          "1733453100": 0,
          "1733453700": 0,
          "1733454300": 0,
          "1733454900": 0,
          "1733455500": 0,
          "1733456100": 0,
          "1733456700": 0,
          "1733457300": 0,
          "1733457900": 0,
          "1733458500": 0,
          "1733459100": 0,
          "1733459700": 0,
          "1733460300": 0,
          "1733460900": 0,
          "1733461500": 0,
          "1733462100": 0,
          "1733462700": 0,
          "1733463300": 0,
          "1733463900": 0,
          "1733464500": 0,
          "1733465100": 0,
          "1733465700": 0,
          "1733466300": 0,
          "1733466900": 0,
          "1733467500": 0,
          "1733468100": 0,
          "1733468700": 0,
          "1733469300": 0,
          "1733469900": 0,
          "1733470500": 0,
          "1733471100": 0,
          "1733471700": 0,
          "1733472300": 0,
          "1733472900": 0,
          "1733473500": 0,
          "1733474100": 0,
          "1733474700": 0,
          "1733475300": 0,
          "1733475900": 0,
          "1733476500": 0,
          "1733477100": 0
        },
        "ads_over_time": {
          "1733391300": 0,
          "1733391900": 0,
          "1733392500": 0,
          "1733393100": 0,
          "1733393700": 0,
          "1733394300": 0,
          "1733394900": 0,
          "1733395500": 0,
          "1733396100": 0,
          "1733396700": 0,
          "1733397300": 0,
          "1733397900": 0,
          "1733398500": 0,
          "1733399100": 0,
          "1733399700": 0,
          "1733400300": 0,
          "1733400900": 1,
          "1733401500": 0,
          "1733402100": 0,
          "1733402700": 0,
          "1733403300": 0,
          "1733403900": 0,
          "1733404500": 0,
          "1733405100": 0,
          "1733405700": 0,
          "1733406300": 0,
          "1733406900": 0,
          "1733407500": 0,
          "1733408100": 0,
          "1733408700": 0,
          "1733409300": 0,
          "1733409900": 0,
          "1733410500": 0,
          "1733411100": 0,
          "1733411700": 0,
          "1733412300": 0,
          "1733412900": 0,
          "1733413500": 0,
          "1733414100": 0,
          "1733414700": 0,
          "1733415300": 0,
          "1733415900": 0,
          "1733416500": 0,
          "1733417100": 0,
          "1733417700": 0,
          "1733418300": 0,
          "1733418900": 0,
          "1733419500": 0,
          "1733420100": 0,
          "1733420700": 0,
          "1733421300": 0,
          "1733421900": 0,
          "1733422500": 0,
          "1733423100": 0,
          "1733423700": 0,
          "1733424300": 0,
          "1733424900": 0,
          "1733425500": 0,
          "1733426100": 0,
          "1733426700": 0,
          "1733427300": 0,
          "1733427900": 0,
          "1733428500": 0,
          "1733429100": 0,
          "1733429700": 0,
          "1733430300": 0,
          "1733430900": 0,
          "1733431500": 0,
          "1733432100": 0,
          "1733432700": 0,
          "1733433300": 0,
          "1733433900": 0,
          "1733434500": 0,
          "1733435100": 0,
          "1733435700": 0,
          "1733436300": 0,
          "1733436900": 0,
          "1733437500": 0,
          "1733438100": 0,
          "1733438700": 0,
          "1733439300": 0,
          "1733439900": 0,
          "1733440500": 0,
          "1733441100": 0,
          "1733441700": 0,
          "1733442300": 0,
          "1733442900": 0,
          "1733443500": 0,
          "1733444100": 0,
          "1733444700": 0,
          "1733445300": 0,
          "1733445900": 0,
          "1733446500": 0,
          "1733447100": 0,
          "1733447700": 0,
          "1733448300": 0,
          "1733448900": 0,
          "1733449500": 0,
          "1733450100": 0,
          "1733450700": 0,
          "1733451300": 0,
          "1733451900": 0,
          "1733452500": 0,
          "1733453100": 0,
          "1733453700": 0,
          "1733454300": 0,
          "1733454900": 0,
          "1733455500": 0,
          "1733456100": 0,
          "1733456700": 0,
          "1733457300": 0,
          "1733457900": 0,
          "1733458500": 0,
          "1733459100": 0,
          "1733459700": 0,
          "1733460300": 0,
          "1733460900": 0,
          "1733461500": 0,
          "1733462100": 0,
          "1733462700": 0,
          "1733463300": 0,
          "1733463900": 0,
          "1733464500": 0,
          "1733465100": 0,
          "1733465700": 0,
          "1733466300": 0,
          "1733466900": 0,
          "1733467500": 0,
          "1733468100": 0,
          "1733468700": 0,
          "1733469300": 0,
          "1733469900": 0,
          "1733470500": 0,
          "1733471100": 0,
          "1733471700": 0,
          "1733472300": 0,
          "1733472900": 0,
          "1733473500": 0,
          "1733474100": 0,
          "1733474700": 0,
          "1733475300": 0,
          "1733475900": 0,
          "1733476500": 0,
          "1733477100": 0
        },
        "clients": [
          {"name": "", "ip": "172.26.0.1"},
          {"name": "localhost", "ip": "127.0.0.1"}
        ],
        "over_time": {
          "1733391300": [0, 0],
          "1733391900": [0, 0],
          "1733392500": [0, 0],
          "1733393100": [0, 0],
          "1733393700": [0, 0],
          "1733394300": [0, 0],
          "1733394900": [0, 0],
          "1733395500": [0, 0],
          "1733396100": [0, 0],
          "1733396700": [3, 0],
          "1733397300": [0, 0],
          "1733397900": [0, 0],
          "1733398500": [0, 0],
          "1733399100": [0, 0],
          "1733399700": [0, 0],
          "1733400300": [0, 2],
          "1733400900": [7, 0],
          "1733401500": [0, 0],
          "1733402100": [0, 0],
          "1733402700": [0, 0],
          "1733403300": [0, 0],
          "1733403900": [0, 2],
          "1733404500": [0, 0],
          "1733405100": [0, 0],
          "1733405700": [0, 0],
          "1733406300": [0, 0],
          "1733406900": [0, 0],
          "1733407500": [0, 2],
          "1733408100": [0, 0],
          "1733408700": [0, 0],
          "1733409300": [0, 0],
          "1733409900": [0, 0],
          "1733410500": [0, 0],
          "1733411100": [0, 0],
          "1733411700": [0, 0],
          "1733412300": [0, 0],
          "1733412900": [0, 0],
          "1733413500": [0, 0],
          "1733414100": [0, 0],
          "1733414700": [0, 0],
          "1733415300": [0, 0],
          "1733415900": [0, 0],
          "1733416500": [0, 0],
          "1733417100": [0, 0],
          "1733417700": [0, 0],
          "1733418300": [0, 0],
          "1733418900": [0, 0],
          "1733419500": [0, 0],
          "1733420100": [0, 0],
          "1733420700": [0, 0],
          "1733421300": [0, 0],
          "1733421900": [0, 0],
          "1733422500": [0, 0],
          "1733423100": [0, 0],
          "1733423700": [0, 0],
          "1733424300": [0, 0],
          "1733424900": [0, 0],
          "1733425500": [0, 0],
          "1733426100": [0, 0],
          "1733426700": [0, 0],
          "1733427300": [0, 0],
          "1733427900": [0, 0],
          "1733428500": [0, 0],
          "1733429100": [0, 0],
          "1733429700": [0, 0],
          "1733430300": [0, 0],
          "1733430900": [0, 0],
          "1733431500": [0, 0],
          "1733432100": [0, 0],
          "1733432700": [0, 0],
          "1733433300": [0, 0],
          "1733433900": [0, 0],
          "1733434500": [0, 0],
          "1733435100": [0, 0],
          "1733435700": [0, 0],
          "1733436300": [0, 0],
          "1733436900": [0, 0],
          "1733437500": [0, 0],
          "1733438100": [0, 0],
          "1733438700": [0, 0],
          "1733439300": [0, 0],
          "1733439900": [0, 0],
          "1733440500": [0, 0],
          "1733441100": [0, 0],
          "1733441700": [0, 0],
          "1733442300": [0, 0],
          "1733442900": [0, 0],
          "1733443500": [0, 0],
          "1733444100": [0, 0],
          "1733444700": [0, 0],
          "1733445300": [0, 0],
          "1733445900": [0, 0],
          "1733446500": [0, 0],
          "1733447100": [0, 0],
          "1733447700": [0, 0],
          "1733448300": [0, 0],
          "1733448900": [0, 0],
          "1733449500": [0, 0],
          "1733450100": [0, 0],
          "1733450700": [0, 0],
          "1733451300": [0, 0],
          "1733451900": [0, 0],
          "1733452500": [0, 0],
          "1733453100": [0, 0],
          "1733453700": [0, 0],
          "1733454300": [0, 0],
          "1733454900": [0, 0],
          "1733455500": [0, 0],
          "1733456100": [0, 0],
          "1733456700": [0, 0],
          "1733457300": [0, 0],
          "1733457900": [0, 0],
          "1733458500": [0, 0],
          "1733459100": [0, 0],
          "1733459700": [0, 0],
          "1733460300": [0, 0],
          "1733460900": [0, 0],
          "1733461500": [0, 0],
          "1733462100": [0, 0],
          "1733462700": [0, 0],
          "1733463300": [0, 0],
          "1733463900": [0, 0],
          "1733464500": [0, 0],
          "1733465100": [0, 0],
          "1733465700": [0, 0],
          "1733466300": [0, 0],
          "1733466900": [0, 0],
          "1733467500": [0, 0],
          "1733468100": [0, 0],
          "1733468700": [0, 0],
          "1733469300": [0, 0],
          "1733469900": [0, 0],
          "1733470500": [0, 0],
          "1733471100": [0, 0],
          "1733471700": [0, 0],
          "1733472300": [0, 0],
          "1733472900": [0, 0],
          "1733473500": [0, 0],
          "1733474100": [0, 0],
          "1733474700": [0, 0],
          "1733475300": [0, 0],
          "1733475900": [0, 0],
          "1733476500": [0, 0],
          "1733477100": [0, 0]
        }
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.fetchOverTimeData();

      expect(response.result, APiResponseType.success);
      expect(response.data, isNotNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.fetchOverTimeData();

      expect(response.result, APiResponseType.error);
      expect(response.data, isNull);
    });
  });

  group('fetchLogs', () {
    late Server server;
    final url =
        'http://example.com/admin/api.php?auth=xxx123&getAllQueries&from=1733472267&until=1733479467';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        "data": [
          [
            "1733479389",
            "A",
            "google.com",
            "172.26.0.1",
            "2",
            "0",
            "4",
            "324",
            "N/A",
            "-1",
            "dns.google#53",
            ""
          ],
          [
            "1733479462",
            "A",
            "google.co.jp",
            "172.26.0.1",
            "2",
            "0",
            "4",
            "742",
            "N/A",
            "-1",
            "dns.google#53",
            ""
          ]
        ]
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
      final apiGateway = ApiGatewayV6(server, client: mockClient);

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
    final url =
        'http://example.com/admin/api.php?auth=xxx123&list=black&add=google.com';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success when add new domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {"success": true, "message": "Added google.com"};
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
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        "success": true,
        "message": "Not adding google.com as it is already on the list"
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
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data =
          'Invalid list [supported: black, regex_black, white, regex_white]';
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

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
    final urls = [
      'http://example.com/admin/api.php?auth=xxx123&list=white',
      'http://example.com/admin/api.php?auth=xxx123&list=regex_white',
      'http://example.com/admin/api.php?auth=xxx123&list=black',
      'http://example.com/admin/api.php?auth=xxx123&list=regex_black'
    ];

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = [
        {
          "data": [
            {
              "id": 14,
              "type": 0,
              "domain": "example.com",
              "enabled": 1,
              "date_added": 1733559182,
              "date_modified": 1733559182,
              "comment": "",
              "groups": [0]
            }
          ]
        },
        {"data": []},
        {
          "data": [
            {
              "id": 2,
              "type": 1,
              "domain": "test.com",
              "enabled": 1,
              "date_added": 1733401118,
              "date_modified": 1733496612,
              "comment": "",
              "groups": [0]
            }
          ]
        },
        {"data": []},
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
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {"data": []};
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
    final url =
        'http://example.com/admin/api.php?auth=xxx123&list=white&sub=google.com';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {"success": true, "message": null};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway.removeDomainFromList(Domain(
          id: 1,
          domain: 'google.com',
          type: 0,
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: '',
          groups: []));

      expect(response.result, APiResponseType.success);
      expect(response.message, isNull);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway.removeDomainFromList(Domain(
          id: 1,
          domain: 'google.com',
          type: 0,
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: '',
          groups: []));

      expect(response.result, APiResponseType.error);
      expect(response.message, isNull);
    });
  });

  group('addDomainToList', () {
    late Server server;
    final url =
        'http://example.com/admin/api.php?auth=xxx123&list=black&add=google.com';

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v6,
          token: 'xxx123');
    });

    test('Return success when add new domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {"success": true, "message": "Added google.com"};
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({"list": "black", "domain": "google.com"});

      expect(response.result, APiResponseType.success);
    });

    test('Return success when add exist domain', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data = {
        "success": true,
        "message": "Not adding google.com as it is already on the list"
      };
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({"list": "black", "domain": "google.com"});

      expect(response.result, APiResponseType.alreadyAdded);
    });

    test('Return error with invalid list type', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);
      final data =
          'Invalid list [supported: black, regex_black, white, regex_white]';
      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));

      final response = await apiGateway
          .addDomainToList({"list": "black", "domain": "google.com"});

      expect(response.result, APiResponseType.error);
    });

    test('Return error when unexpected exception occurs', () async {
      final mockClient = MockClient();
      final apiGateway = ApiGatewayV6(server, client: mockClient);

      when(mockClient.get(Uri.parse(url), headers: {}))
          .thenThrow(Exception('Unexpected error test'));

      final response = await apiGateway
          .addDomainToList({"list": "black", "domain": "google.com"});

      expect(response.result, APiResponseType.error);
    });
  });
}
