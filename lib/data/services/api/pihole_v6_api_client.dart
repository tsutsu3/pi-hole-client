import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/action/action.dart' show Action;
import 'package:pi_hole_client/data/model/v6/auth/auth.dart' show Session;
import 'package:pi_hole_client/data/model/v6/auth/sessions.dart'
    show AuthSessions;
import 'package:pi_hole_client/data/model/v6/config/config.dart'
    show Config, ConfigData;
import 'package:pi_hole_client/data/model/v6/dhcp/dhcp.dart' show Dhcp;
import 'package:pi_hole_client/data/model/v6/dns/dns.dart' show Blocking;
import 'package:pi_hole_client/data/model/v6/domains/domains.dart' show Domains;
import 'package:pi_hole_client/data/model/v6/ftl/client.dart' show InfoClient;
import 'package:pi_hole_client/data/model/v6/ftl/ftl.dart' show InfoFtl;
import 'package:pi_hole_client/data/model/v6/ftl/host.dart' show InfoHost;
import 'package:pi_hole_client/data/model/v6/ftl/messages.dart'
    show InfoMessages;
import 'package:pi_hole_client/data/model/v6/ftl/metrics.dart' show InfoMetrics;
import 'package:pi_hole_client/data/model/v6/ftl/sensors.dart' show InfoSensors;
import 'package:pi_hole_client/data/model/v6/ftl/system.dart' show InfoSystem;
import 'package:pi_hole_client/data/model/v6/ftl/version.dart' show InfoVersion;
import 'package:pi_hole_client/data/model/v6/groups/groups.dart' show Groups;
import 'package:pi_hole_client/data/model/v6/lists/lists.dart' show Lists;
import 'package:pi_hole_client/data/model/v6/lists/search.dart' show Search;
import 'package:pi_hole_client/data/model/v6/metrics/history.dart'
    show History, HistoryClients;
import 'package:pi_hole_client/data/model/v6/metrics/query.dart' show Queries;
import 'package:pi_hole_client/data/model/v6/metrics/stats.dart'
    show StatsSummary, StatsTopClients, StatsTopDomains, StatsUpstreams;
import 'package:pi_hole_client/data/model/v6/network/devices.dart' show Devices;
import 'package:pi_hole_client/data/model/v6/network/gateway.dart' show Gateway;
import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/utils/safe_api_call.dart';
import 'package:pi_hole_client/utils/misc.dart';
import 'package:result_dart/result_dart.dart';

class PiholeV6ApiClient {
  PiholeV6ApiClient({
    required String url,
    http.Client? client,
    bool? allowSelfSignedCert,
    bool? ignoreCertificateErrors,
  }) : _url = url,
       _client =
           client ??
           IOClient(
             createHttpClient(
               allowSelfSignedCert: allowSelfSignedCert ?? true,
               ignoreCertificateErrors: ignoreCertificateErrors ?? false,
             ),
           );

  final String _url;
  final http.Client _client;

  void close() {
    _client.close();
  }

  // ==========================================================================
  // Authentication
  // ==========================================================================
  Future<Result<Session>> postAuth({required String password}) async {
    return safeApiCall<Session>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/auth',
        body: {'password': password},
      );

      if (resp.statusCode == 200) {
        return Session.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteAuth(String sid) async {
    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: '/api/auth',
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<AuthSessions>> getAuthSessions(String sid) async {
    return safeApiCall<AuthSessions>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/auth/sessions',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return AuthSessions.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteAuthSession(String sid, {required int id}) async {
    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: '/api/auth/session/$id',
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Metrics
  // ==========================================================================
  Future<Result<History>> getHistory(String sid) async {
    return safeApiCall<History>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/history',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return History.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<HistoryClients>> getHistoryClient(
    String sid, {
    int? count = 10,
  }) async {
    return safeApiCall<HistoryClients>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/history/clients?N=$count',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return HistoryClients.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Queries>> getQueries(
    String sid, {
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
  }) async {
    final cursorPram = cursor == null ? '' : '&cursor=$cursor';

    return safeApiCall<Queries>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path:
            '/api/queries?from=${from.millisecondsSinceEpoch ~/ 1000}&until=${until.millisecondsSinceEpoch ~/ 1000}&length=$length$cursorPram',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Queries.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<StatsSummary>> getStatsSummary(String sid) async {
    return safeApiCall<StatsSummary>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/stats/summary',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return StatsSummary.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<StatsUpstreams>> getStatsUpstreams(String sid) async {
    return safeApiCall<StatsUpstreams>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/stats/upstreams',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return StatsUpstreams.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<StatsTopDomains>> getStatsTopDomains(
    String sid, {
    bool? blocked = false,
    int? count = 10,
  }) async {
    return safeApiCall<StatsTopDomains>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/stats/top_domains?blocked=$blocked&count=$count',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return StatsTopDomains.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<StatsTopClients>> getStatsTopClients(
    String sid, {
    bool? blocked = false,
    int? count = 10,
  }) async {
    return safeApiCall<StatsTopClients>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/stats/top_clients?blocked=$blocked&count=$count',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return StatsTopClients.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // DNS control
  // ==========================================================================
  Future<Result<Blocking>> getDnsBlocking(String sid) async {
    return safeApiCall<Blocking>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/dns/blocking',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Blocking.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Blocking>> postDnsBlocking(
    String sid, {
    bool? enabled = true,
    int? timer,
  }) async {
    return safeApiCall<Blocking>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/dns/blocking',
        sid: sid,
        body: {'blocking': enabled, 'timer': timer},
      );

      if (resp.statusCode == 200) {
        return Blocking.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Group management
  // ==========================================================================
  Future<Result<Groups>> getGroups(String sid) async {
    return safeApiCall<Groups>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/groups',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Groups.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Domain management
  // ==========================================================================
  Future<Result<Domains>> getDomains(
    String sid, {
    DomainType? type,
    DomainKind? kind,
    String? domain,
  }) async {
    final pathString = _buildPathString([
      if (type != null) type.name,
      if (kind != null) kind.name,
      if (domain != null) Uri.encodeComponent(domain),
    ]);

    final path = pathString.isNotEmpty
        ? '/api/domains/$pathString'
        : '/api/domains';

    return safeApiCall<Domains>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: path,
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Domains.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Domains>> postDomains(
    String sid, {
    required DomainType type,
    required DomainKind kind,
    required String domain,
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    return safeApiCall<Domains>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/domains/${type.name}/${kind.name}',
        sid: sid,
        body: {
          'domain': domain,
          'comment': comment,
          'groups': groups,
          'enabled': enabled,
        },
      );

      if (resp.statusCode == 201) {
        return Domains.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Domains>> putDomains(
    String sid, {
    required DomainType type,
    required DomainKind kind,
    required String domain,
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    return safeApiCall<Domains>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.put,
        path:
            '/api/domains/${type.name}/${kind.name}/${Uri.encodeComponent(domain)}',
        sid: sid,
        body: {
          'comment': comment,
          'groups': groups,
          'enabled': enabled,
          'type': type.name,
          'kind': kind.name,
        },
      );

      if (resp.statusCode == 200) {
        return Domains.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteDomains(
    String sid, {
    required DomainType type,
    required DomainKind kind,
    required String domain,
  }) async {
    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path:
            '/api/domains/${type.name}/${kind.name}/${Uri.encodeComponent(domain)}',
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // List management
  // ==========================================================================
  Future<Result<Lists>> getLists(
    String sid, {
    String? adlist,
    ListType? type,
  }) async {
    final pathString = _buildPathString([
      if (adlist != null) Uri.encodeComponent(adlist),
    ]);

    final queryString = _buildQueryString({
      if (type != null) 'type': type.name,
    });

    final tmpPath = pathString.isEmpty
        ? '/api/lists'
        : '/api/lists/$pathString';

    final path = queryString.isEmpty ? tmpPath : '$tmpPath?$queryString';

    return safeApiCall<Lists>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: path,
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Lists.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Lists>> postLists(
    String sid, {
    required String address,
    required ListType type,
    List<int>? groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    final queryString = _buildQueryString({'type': type.name});
    final path = queryString.isEmpty ? '/api/lists' : '/api/lists?$queryString';

    return safeApiCall<Lists>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: path,
        sid: sid,
        body: {
          'address': address,
          'type': type.name, // Not necessary, but just in case.
          'groups': groups,
          'comment': comment,
          'enabled': enabled,
        },
      );

      if (resp.statusCode == 201) {
        return Lists.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Lists>> putLists(
    String sid, {
    required String adlist,
    required ListType type,
    List<int>? groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    final queryString = _buildQueryString({'type': type.name});

    final tmpPath = '/api/lists/${Uri.encodeComponent(adlist)}';

    final path = queryString.isEmpty ? tmpPath : '$tmpPath?$queryString';

    return safeApiCall<Lists>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.put,
        path: path,
        sid: sid,
        body: {
          'type': type.name,
          'groups': groups,
          'comment': comment,
          'enabled': enabled,
        },
      );

      if (resp.statusCode == 200) {
        return Lists.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteLists(
    String sid, {
    required String adlist,
    required ListType type,
  }) async {
    final queryString = _buildQueryString({'type': type.name});

    final tmpPath = '/api/lists/${Uri.encodeComponent(adlist)}';

    final path = queryString.isEmpty ? tmpPath : '$tmpPath?$queryString';

    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: path,
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Search>> getSearch(
    String sid, {
    required String domain,
    bool? partial,
    int? limit,
  }) async {
    final queryString = _buildQueryString({
      if (partial != null) 'partial': partial.toString(),
      if (limit != null) 'N': limit.toString(),
    });
    final path = '/api/search/${Uri.encodeComponent(domain)}';
    final fullPath = queryString.isEmpty ? path : '$path?$queryString';

    return safeApiCall<Search>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: fullPath,
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Search.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // FTL information
  // ==========================================================================
  Future<Result<InfoClient>> getInfoClient(String sid) async {
    return safeApiCall<InfoClient>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/client',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoClient.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoFtl>> getInfoFtl(String sid) async {
    return safeApiCall<InfoFtl>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/ftl',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoFtl.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoHost>> getInfoHost(String sid) async {
    return safeApiCall<InfoHost>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/host',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoHost.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoMessages>> getInfoMessages(String sid) async {
    return safeApiCall<InfoMessages>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/messages',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoMessages.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteInfoMessages(
    String sid, {
    required int messageId,
  }) async {
    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: '/api/info/messages/$messageId',
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoMetrics>> getInfoMetrics(String sid) async {
    return safeApiCall<InfoMetrics>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/metrics',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoMetrics.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoSensors>> getInfoSensors(String sid) async {
    return safeApiCall<InfoSensors>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/sensors',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoSensors.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoSystem>> getInfoSystem(String sid) async {
    return safeApiCall<InfoSystem>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/system',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoSystem.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<InfoVersion>> getInfoVersion(String sid) async {
    return safeApiCall<InfoVersion>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/info/version',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return InfoVersion.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Network information
  // ==========================================================================
  Future<Result<Devices>> getNetworkDevices(
    String sid, {
    int? maxDevices = 999,
    int? maxAddresses = 25,
  }) async {
    return safeApiCall<Devices>(() async {
      final queryString = _buildQueryString({
        'max_devices': maxDevices,
        'max_addresses': maxAddresses,
      });

      final path = queryString.isEmpty
          ? '/api/network/devices'
          : '/api/network/devices?$queryString';

      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: path,
        sid: sid,
      );

      if (resp.statusCode == 200) {
        // Use allowMalformed to handle invalid UTF-8 characters in device
        // names or MAC vendor names
        final body = utf8.decode(resp.bodyBytes, allowMalformed: true);
        return Devices.fromJson(jsonDecode(body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteNetworkDevices(
    String sid, {
    required int deviceId,
  }) async {
    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: '/api/network/devices/$deviceId',
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Gateway>> getNetworkGateway(
    String sid, {
    bool? isDetailed,
  }) async {
    final queryString = _buildQueryString({
      if (isDetailed != null) 'detailed': isDetailed.toString(),
    });

    final path = queryString.isEmpty
        ? '/api/network/gateway'
        : '/api/network/gateway?$queryString';

    return safeApiCall<Gateway>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: path,
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Gateway.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Actions
  // ==========================================================================
  @Deprecated(
    'Deprecated in Pi-hole FTL v6.3+. Use [postActionFlushNetwork] instead.',
  )
  Future<Result<Action>> postActionFlushArp(String sid) async {
    return safeApiCall<Action>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/action/flush/arp',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Action.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Action>> postActionFlushNetwork(String sid) async {
    return safeApiCall<Action>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/action/flush/network',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Action.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Action>> postActionFlushLogs(String sid) async {
    return safeApiCall<Action>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/action/flush/logs',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Action.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Stream<Result<List<String>>> postActionGravity(String sid) async* {
    yield* safeApiCallStream<List<String>>(() async* {
      final resp = await _sendStreamingRequest(
        method: 'POST',
        path: '/api/action/gravity',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        final stream = resp.stream.transform(utf8.decoder);
        final buffer = StringBuffer();

        await for (final chunk in stream) {
          buffer.write(chunk);

          final rawLines = buffer.toString().split('\n');
          buffer.clear();

          if (!chunk.endsWith('\n')) {
            buffer.write(rawLines.removeLast());
          } else if (rawLines.isNotEmpty && rawLines.last.isEmpty) {
            rawLines.removeLast();
          }

          final trimmedLines = rawLines
              .map((line) => line.trimRight())
              .toList();

          if (trimmedLines.isNotEmpty) {
            yield trimmedLines;
          }
        }

        if (buffer.isNotEmpty) {
          yield [buffer.toString().trimRight()];
        }

        yield [];
      } else {
        final errorMessage = await resp.stream.bytesToString();
        throw HttpStatusCodeException(resp.statusCode, errorMessage);
      }
    });
  }

  Future<Result<Action>> postActionRestartDns(String sid) async {
    return safeApiCall<Action>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.post,
        path: '/api/action/restartdns',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Action.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Pi-hole Configuration
  // ==========================================================================
  Future<Result<Config>> getConfigElement(
    String sid, {
    String? element,
    bool? isDetailed,
  }) async {
    return safeApiCall<Config>(() async {
      final pathString = _buildPathString([if (element != null) element]);
      final queryString = _buildQueryString({
        if (isDetailed != null) 'detailed': isDetailed.toString(),
      });

      final tmp = pathString.isEmpty
          ? '/api/config'
          : '/api/config/$pathString';

      final path = queryString.isEmpty ? tmp : '$tmp?$queryString';

      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: path,
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Config.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Config>> patchConfig(
    String sid, {
    required ConfigData body,
    bool isRestart = true,
  }) async {
    return safeApiCall<Config>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.patch,
        path: '/api/config?restart=$isRestart',
        sid: sid,
        body: {'config': body.toJson()},
      );

      if (resp.statusCode == 200) {
        return Config.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> putConfigElement(
    String sid, {
    required String element,
    required String value,
    bool isRestart = true,
  }) async {
    return safeApiCall<Unit>(() async {
      final encodedElement = Uri.encodeComponent(element);
      final encodedValue = Uri.encodeComponent(value);
      final resp = await _sendRequest(
        method: HttpMethod.put,
        path: '/api/config/$encodedElement/$encodedValue?restart=$isRestart',
        sid: sid,
      );

      if (resp.statusCode == 201) return unit;
      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteConfigElement(
    String sid, {
    required String element,
    required String value,
    bool isRestart = true,
  }) async {
    return safeApiCall<Unit>(() async {
      final encodedElement = Uri.encodeComponent(element);
      final encodedValue = Uri.encodeComponent(value);
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: '/api/config/$encodedElement/$encodedValue?restart=$isRestart',
        sid: sid,
      );

      if (resp.statusCode == 204) return unit;
      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // DHCP
  // ==========================================================================
  Future<Result<Dhcp>> getDhcpLeases(String sid) async {
    return safeApiCall<Dhcp>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.get,
        path: '/api/dhcp/leases',
        sid: sid,
      );

      if (resp.statusCode == 200) {
        return Dhcp.fromJson(jsonDecode(resp.body));
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  Future<Result<Unit>> deleteDhcpLeases(
    String sid, {
    required String ip,
  }) async {
    return safeApiCall<Unit>(() async {
      final resp = await _sendRequest(
        method: HttpMethod.delete,
        path: '/api/dhcp/leases/${Uri.encodeComponent(ip)}',
        sid: sid,
      );

      if (resp.statusCode == 204) {
        return unit;
      }

      throw HttpStatusCodeException(resp.statusCode, resp.body);
    });
  }

  // ==========================================================================
  // Helper methods
  // ==========================================================================

  /// Sends an HTTP request to the Pi-hole API.
  Future<http.Response> _sendRequest({
    required HttpMethod method,
    required String path,
    int timeout = 10,
    String? sid,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(_url).resolve(path);

    final headers = <String, String>{
      'Content-Type': 'application/json',
      if (sid != null) 'X-FTL-SID': sid,
    };

    final encodedBody = body != null ? jsonEncode(body) : null;
    final duration = Duration(seconds: timeout);

    switch (method) {
      case HttpMethod.get:
        return _client.get(uri, headers: headers).timeout(duration);

      case HttpMethod.post:
        return _client
            .post(uri, headers: headers, body: encodedBody)
            .timeout(duration);

      case HttpMethod.put:
        return _client
            .put(uri, headers: headers, body: encodedBody)
            .timeout(duration);

      case HttpMethod.patch:
        return _client
            .patch(uri, headers: headers, body: encodedBody)
            .timeout(duration);

      case HttpMethod.delete:
        return _client.delete(uri, headers: headers).timeout(duration);
    }
  }

  /// Sends a streaming HTTP request to the Pi-hole API.
  Future<http.StreamedResponse> _sendStreamingRequest({
    required String method,
    required String path,
    int timeout = 10,
    String? sid,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(_url).resolve(path);
    final headers = <String, String>{
      'Content-Type': 'application/json',
      if (sid != null) 'X-FTL-SID': sid,
    };

    final request = http.Request(method.toUpperCase(), uri)
      ..headers.addAll(headers);

    if (body != null) {
      request.body = jsonEncode(body);
    }

    return _client.send(request).timeout(Duration(seconds: timeout));
  }

  /// Builds a query string from the provided parameters.
  ///
  /// Returns a string formatted as `key1=value1&key2=value2`, where
  /// only non-null and non-empty values are included.
  String _buildQueryString(Map<String, dynamic> params) {
    return params.entries
        .where((e) => e.value != null && e.value.toString().isNotEmpty)
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}',
        )
        .join('&');
  }

  /// Builds a path string from the provided parameters.
  ///
  /// Returns a string where each non-empty parameter is joined by a `/`.
  /// Example: `['block', 'regex']` becomes `block/regex`.
  String _buildPathString(List<String> params) {
    return params.where((param) => param.isNotEmpty).join('/');
  }
}
