import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/model/v6/action/action.dart'
    show Action;
import 'package:pi_hole_client/data/services/api/model/v6/auth/auth.dart'
    show Session;
import 'package:pi_hole_client/data/services/api/model/v6/auth/sessions.dart'
    show AuthSessions;
import 'package:pi_hole_client/data/services/api/model/v6/config/config.dart'
    show Config, ConfigData;
import 'package:pi_hole_client/data/services/api/model/v6/dhcp/dhcp.dart'
    show Dhcp;
import 'package:pi_hole_client/data/services/api/model/v6/dns/dns.dart'
    show Blocking;
import 'package:pi_hole_client/data/services/api/model/v6/domains/domains.dart'
    show Domains;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/client.dart'
    show InfoClient;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/ftl.dart'
    show InfoFtl;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/host.dart'
    show InfoHost;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/messages.dart'
    show InfoMessages;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/metrics.dart'
    show InfoMetrics;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/sensors.dart'
    show InfoSensors;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/system.dart'
    show InfoSystem;
import 'package:pi_hole_client/data/services/api/model/v6/ftl/version.dart'
    show InfoVersion;
import 'package:pi_hole_client/data/services/api/model/v6/groups/groups.dart'
    show Groups;
import 'package:pi_hole_client/data/services/api/model/v6/lists/lists.dart'
    show Lists;
import 'package:pi_hole_client/data/services/api/model/v6/metrics/history.dart'
    show History, HistoryClients;
import 'package:pi_hole_client/data/services/api/model/v6/metrics/query.dart'
    show Queries;
import 'package:pi_hole_client/data/services/api/model/v6/metrics/stats.dart'
    show StatsSummary, StatsTopClients, StatsTopDomains, StatsUpstreams;
import 'package:pi_hole_client/data/services/api/model/v6/network/devices.dart'
    show Devices;
import 'package:pi_hole_client/data/services/api/model/v6/network/gateway.dart'
    show Gateway;
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:result_dart/result_dart.dart';

import '../../models/auth.dart';

class FakePiholeV6ApiClient implements PiholeV6ApiClient {
  bool shouldFailPostAuth = false;
  bool shouldFailDeleteAuth = false;
  bool shouldFailGetAuthSessions = false;
  bool shouldFailDeleteAuthSession = false;

  @override
  void close() {}

  // ==========================================================================
  // Authentication
  // ==========================================================================
  @override
  Future<Result<Session>> postAuth({
    required String password,
  }) async {
    if (shouldFailPostAuth) {
      return Failure(Exception('Forced postAuth failure'));
    }
    return Success(kPostAuth);
  }

  @override
  Future<Result<Unit>> deleteAuth(String sid) async {
    if (shouldFailDeleteAuth) {
      return Failure(Exception('Forced deleteAuth failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<AuthSessions>> getAuthSessions(String sid) async {
    if (shouldFailGetAuthSessions) {
      return Failure(Exception('Forced getAuthSessions failure'));
    }
    return Success(kGetAuthSessions);
  }

  @override
  Future<Result<Unit>> deleteAuthSession(
    String sid, {
    required int id,
  }) async {
    if (shouldFailDeleteAuthSession) {
      return Failure(Exception('Forced deleteAuthSession failure'));
    }
    return const Success(unit);
  }

  // ==========================================================================
  // Metrics
  // ==========================================================================
  @override
  Future<Result<History>> getHistory(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<HistoryClients>> getHistoryClient(
    String sid, {
    int? count = 10,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Queries>> getQueries(
    String sid, {
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<StatsSummary>> getStatsSummary(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<StatsUpstreams>> getStatsUpstreams(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<StatsTopDomains>> getStatsTopDomains(
    String sid, {
    bool? blocked = false,
    int? count = 10,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<StatsTopClients>> getStatsTopClients(
    String sid, {
    bool? blocked = false,
    int? count = 10,
  }) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // DNS control
  // ==========================================================================
  @override
  Future<Result<Blocking>> getDnsBlocking(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Blocking>> postDnsBlocking(
    String sid, {
    bool? enabled = true,
    int? timer,
  }) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // Group management
  // ==========================================================================
  @override
  Future<Result<Groups>> getGroups(String sid) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // Domain management
  // ==========================================================================
  @override
  Future<Result<Domains>> getDomains(
    String sid, {
    DomainType? type,
    DomainKind? kind,
    String? domain,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Domains>> postDomains(
    String sid, {
    required DomainType type,
    required DomainKind kind,
    required String domain,
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Domains>> putDomains(
    String sid, {
    required DomainType type,
    required DomainKind kind,
    required String domain,
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> deleteDomains(
    String sid, {
    required DomainType type,
    required DomainKind kind,
    required String domain,
  }) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // List management
  // ==========================================================================
  @override
  Future<Result<Lists>> getLists(
    String sid, {
    String? adlist,
    ListType? type,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Lists>> postLists(
    String sid, {
    required String address,
    required ListType type,
    List<int>? groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Lists>> putLists(
    String sid, {
    required String adlist,
    required ListType type,
    List<int>? groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> deleteLists(
    String sid, {
    required String adlist,
    ListType? type,
  }) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // FTL information
  // ==========================================================================
  @override
  Future<Result<InfoClient>> getInfoClient(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoFtl>> getInfoFtl(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoHost>> getInfoHost(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoMessages>> getInfoMessages(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> deleteInfoMessages(
    String sid, {
    required int messageId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoMetrics>> getInfoMetrics(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoSensors>> getInfoSensors(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoSystem>> getInfoSystem(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<InfoVersion>> getInfoVersion(String sid) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // Network information
  // ==========================================================================
  @override
  Future<Result<Devices>> getNetworkDevices(
    String sid, {
    int? maxDevices = 999,
    int? maxAddresses = 25,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> deleteNetworkDevices(
    String sid, {
    required int deviceId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Gateway>> getNetworkGateway(
    String sid, {
    bool? isDetailed,
  }) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // Actions
  // ==========================================================================
  @override
  Future<Result<Action>> postActionFlushArp(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Action>> postActionFlushLogs(String sid) async {
    throw UnimplementedError();
  }

  @override
  Stream<Result<List<String>>> postActionGravity(String sid) async* {}

  @override
  Future<Result<Action>> postActionRestartdns(String sid) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // Pi-hole Configuration
  // ==========================================================================
  @override
  Future<Result<Config>> getConfigElement(
    String sid, {
    String? element,
    bool? isDetailed,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Config>> patchConfig(
    String sid, {
    required ConfigData body,
  }) async {
    throw UnimplementedError();
  }

  // ==========================================================================
  // DHCP
  // ==========================================================================
  @override
  Future<Result<Dhcp>> getDhcpLeases(String sid) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit>> deleteDhcpLeases(
    String sid, {
    required String ip,
  }) async {
    throw UnimplementedError();
  }
}
