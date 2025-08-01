import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';

import '../../../../testing/fakes/utils/test_helper.dart';
import 'mock_http_client.mocks.dart';

void main() {
  const baseUrl = 'http://localhost:8080';
  const sid = 'sid12345';

  late PiholeV5ApiClient apiClient;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = PiholeV5ApiClient(url: baseUrl, client: mockClient);
  });

  group('getSummaryRaw', () {
    final url = Uri.parse('$baseUrl/admin/api.php?auth=$sid&summaryRaw');

    test('gets summary raw data successfully', () async {
      final data = {
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
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getSummaryRaw(sid);

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.getSummaryRaw(sid);

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('postDnsBlocking', () {
    final url = Uri.parse('$baseUrl/admin/api.php?auth=$sid');

    test('enables DNS blocking successfully', () async {
      final fullUrl = Uri.parse('$url&enable');
      final data = {
        'status': 'enable',
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result = await apiClient.postDnsBlocking(sid, enabled: true);
      expectSuccess(result, data);
    });

    test('disables DNS blocking successfully', () async {
      final fullUrl = Uri.parse('$url&disable=0');
      final data = {
        'status': 'disable',
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, fullUrl, response);

      final result =
          await apiClient.postDnsBlocking(sid, enabled: false, timer: 0);
      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final fullUrl = Uri.parse('$url&disable=0');
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, fullUrl, response);

      final result =
          await apiClient.postDnsBlocking(sid, enabled: false, timer: 0);

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('getRealTimeStatus', () {
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes',
    );

    test('gets real-time status successfully', () async {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getRealTimeStatus(sid);

      expectSuccess(result, data);
    });

    test('gets real-time status with init data', () async {
      final data = {
        'domains_being_blocked': 221484,
        'dns_queries_today': 0,
        'ads_blocked_today': 0,
        'ads_percentage_today': 0,
        'unique_domains': 0,
        'queries_forwarded': 0,
        'queries_cached': 0,
        'clients_ever_seen': 0,
        'unique_clients': 0,
        'dns_queries_all_types': 0,
        'reply_UNKNOWN': 0,
        'reply_NODATA': 0,
        'reply_NXDOMAIN': 0,
        'reply_CNAME': 0,
        'reply_IP': 0,
        'reply_DOMAIN': 0,
        'reply_RRNAME': 0,
        'reply_SERVFAIL': 0,
        'reply_REFUSED': 0,
        'reply_NOTIMP': 0,
        'reply_OTHER': 0,
        'reply_DNSSEC': 0,
        'reply_NONE': 0,
        'reply_BLOB': 0,
        'dns_queries_all_replies': 0,
        'privacy_level': 0,
        'status': 'enabled',
        'gravity_last_updated': {
          'file_exists': true,
          'absolute': 1753436538,
          'relative': {'days': 6, 'hours': 22, 'minutes': 18},
        },
        'top_queries': [],
        'top_ads': [],
        'top_sources': [],
        'top_sources_blocked': [],
        'forward_destinations': {
          'blocked|blocked': 0,
          'cached|cached': 0,
          'other|other': 0,
        },
        'querytypes': {
          'A (IPv4)': 0,
          'AAAA (IPv6)': 0,
          'ANY': 0,
          'SRV': 0,
          'SOA': 0,
          'PTR': 0,
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getRealTimeStatus(sid);

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.getRealTimeStatus(sid);

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('getOverTimeData', () {
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&overTimeData10mins&overTimeDataClients&getClientNames',
    );

    test('gets over time data successfully', () async {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getOverTimeData(sid);

      expectSuccess(result, data);
    });

    test('gets over time data with init data', () async {
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
        'clients': [],
        'over_time': [],
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getOverTimeData(sid);

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.getOverTimeData(sid);

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('getQueries', () {
    const from = 1733472267;
    const until = 1733479467;
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&getAllQueries&from=$from&until=$until',
    );

    test('gets queries', () async {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getQueries(
        sid,
        from: DateTime.fromMillisecondsSinceEpoch(from * 1000),
        until: DateTime.fromMillisecondsSinceEpoch(until * 1000),
      );

      expectSuccess(result, data);
    });

    test('get queries with init data', () async {
      final data = {
        'data': [],
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getQueries(
        sid,
        from: DateTime.fromMillisecondsSinceEpoch(from * 1000),
        until: DateTime.fromMillisecondsSinceEpoch(until * 1000),
      );

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.getQueries(
        sid,
        from: DateTime.fromMillisecondsSinceEpoch(from * 1000),
        until: DateTime.fromMillisecondsSinceEpoch(until * 1000),
      );

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('postDomain', () {
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&list=white&add=${Uri.encodeComponent('example.com')}',
    );

    test('adds domain', () async {
      final data = {
        'success': true,
        'message': 'Added example.com',
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.postDomain(
        sid,
        domain: 'example.com',
        domainType: V5DomainType.white,
      );

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.postDomain(
        sid,
        domain: 'example.com',
        domainType: V5DomainType.white,
      );

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('getDomains', () {
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&list=white',
    );

    test('gets domains', () async {
      final data = {
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
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result =
          await apiClient.getDomains(sid, domainType: V5DomainType.white);

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result =
          await apiClient.getDomains(sid, domainType: V5DomainType.white);

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('deleteDomain', () {
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&list=white&sub=${Uri.encodeComponent('example.com')}',
    );

    test('deletes domain', () async {
      final data = {
        'success': true,
        'message': null,
      };
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.deleteDomain(
        sid,
        domain: 'example.com',
        domainType: V5DomainType.white,
      );

      expectSuccess(result, data);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.deleteDomain(
        sid,
        domain: 'example.com',
        domainType: V5DomainType.white,
      );

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });

  group('getVersions', () {
    final url = Uri.parse(
      '$baseUrl/admin/api.php?auth=$sid&versions',
    );

    test('gets versions with docker', () async {
      final data = {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getVersions(sid);

      expectSuccess(result, data);
    });

    test('gets versions without docker', () async {
      final data = {
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
      final response = http.Response(jsonEncode(data), 200);
      mockGet(mockClient, url, response);

      final result = await apiClient.getVersions(sid);

      final expected = {
        'docker_update': null,
        'docker_current': null,
        'docker_latest': null,
        ...data,
      };
      expectSuccess(result, expected);
    });

    test('returns error when unexpected error occurs', () async {
      final response = http.Response('Internal Server Error', 500);
      mockGet(mockClient, url, response);

      final result = await apiClient.getVersions(sid);

      expectError(
        result,
        statusCode: 500,
        messageContains: 'Internal Server Error',
      );
    });
  });
}
