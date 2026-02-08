import 'package:pi_hole_client/data/services/api/utils/safe_dio_call.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';
import 'package:result_dart/result_dart.dart';

/// Service wrapper around the OpenAPI-generated v6 API client.
///
/// Wraps all generated Dio-based API calls with [safeDioCall] to provide
/// consistent error handling via [Result<T>].
///
/// Authentication is handled via the [PiholeV6Api.setApiKey] method:
/// ```dart
/// api.setApiKey('x_header_sid', sid);
/// ```
///
/// In Phase 3, Repositories will depend on this service to access the
/// Pi-hole v6 API. Domain model mapping will be added at that stage.
class PiholeV6Service {
  PiholeV6Service({required PiholeV6Api api}) : _api = api;

  final PiholeV6Api _api;

  // Lazy API instances
  late final _authApi = _api.getAuthenticationApi();
  late final _actionsApi = _api.getActionsApi();
  late final _clientApi = _api.getClientManagementApi();
  late final _dhcpApi = _api.getDHCPApi();
  late final _dnsApi = _api.getDNSControlApi();
  late final _domainApi = _api.getDomainManagementApi();
  late final _ftlApi = _api.getFTLInformationApi();
  late final _groupApi = _api.getGroupManagementApi();
  late final _listApi = _api.getListManagementApi();
  late final _metricsApi = _api.getMetricsApi();
  late final _networkApi = _api.getNetworkInformationApi();
  late final _configApi = _api.getPiHoleConfigurationApi();

  // ==========================================================================
  // Authentication
  // ==========================================================================

  Future<Result<GetAuth200Response>> postAuth({
    required String password,
  }) {
    return safeDioCall(() async {
      final response = await _authApi.addAuth(
        password: Password(password: password),
      );
      return response.requireData;
    });
  }

  Future<Result<GetAuth200Response>> getAuth() {
    return safeDioCall(() async {
      final response = await _authApi.getAuth();
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteAuth() {
    return safeDioCall(() async {
      await _authApi.deleteGroups();
      return unit;
    });
  }

  Future<Result<GetAuthSessions200Response>> getAuthSessions() {
    return safeDioCall(() async {
      final response = await _authApi.getAuthSessions();
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteAuthSession({required int id}) {
    return safeDioCall(() async {
      await _authApi.deleteAuthSession(id: id);
      return unit;
    });
  }

  // ==========================================================================
  // Metrics
  // ==========================================================================

  Future<Result<GetActivityMetrics200Response>> getHistory() {
    return safeDioCall(() async {
      final response = await _metricsApi.getActivityMetrics();
      return response.requireData;
    });
  }

  Future<Result<GetClientMetrics200Response>> getHistoryClients() {
    return safeDioCall(() async {
      final response = await _metricsApi.getClientMetrics();
      return response.requireData;
    });
  }

  Future<Result<GetQueries200Response>> getQueries({
    num? from,
    num? until,
    int? length,
    int? cursor,
    String? domain,
    String? clientIp,
    String? clientName,
    String? upstream,
    String? type,
    String? status,
  }) {
    return safeDioCall(() async {
      final response = await _metricsApi.getQueries(
        from: from,
        until: until,
        length: length,
        cursor: cursor,
        domain: domain,
        clientIp: clientIp,
        clientName: clientName,
        upstream: upstream,
        type: type,
        status: status,
      );
      return response.requireData;
    });
  }

  Future<Result<GetMetricsSummary200Response>> getStatsSummary() {
    return safeDioCall(() async {
      final response = await _metricsApi.getMetricsSummary();
      return response.requireData;
    });
  }

  Future<Result<GetMetricsUpstreams200Response>> getStatsUpstreams() {
    return safeDioCall(() async {
      final response = await _metricsApi.getMetricsUpstreams();
      return response.requireData;
    });
  }

  Future<Result<GetMetricsTopDomains200Response>> getStatsTopDomains({
    bool? blocked,
    int? count,
  }) {
    return safeDioCall(() async {
      final response = await _metricsApi.getMetricsTopDomains(
        blocked: blocked,
        count: count,
      );
      return response.requireData;
    });
  }

  Future<Result<GetMetricsTopClients200Response>> getStatsTopClients({
    bool? blocked,
    int? count,
  }) {
    return safeDioCall(() async {
      final response = await _metricsApi.getMetricsTopClients(
        blocked: blocked,
        count: count,
      );
      return response.requireData;
    });
  }

  Future<Result<GetMetricsQueryTypes200Response>> getQueryTypes() {
    return safeDioCall(() async {
      final response = await _metricsApi.getMetricsQueryTypes();
      return response.requireData;
    });
  }

  // ==========================================================================
  // DNS Control
  // ==========================================================================

  Future<Result<GetBlocking200Response>> getDnsBlocking() {
    return safeDioCall(() async {
      final response = await _dnsApi.getBlocking();
      return response.requireData;
    });
  }

  Future<Result<GetBlocking200Response>> setDnsBlocking({
    SetBlockingRequest? request,
  }) {
    return safeDioCall(() async {
      final response = await _dnsApi.setBlocking(
        setBlockingRequest: request,
      );
      return response.requireData;
    });
  }

  // ==========================================================================
  // Groups
  // ==========================================================================

  Future<Result<GetGroups200Response>> getAllGroups() {
    return safeDioCall(() async {
      final response = await _groupApi.getAllGroups();
      return response.requireData;
    });
  }

  Future<Result<GetGroups200Response>> getGroups({
    required String name,
  }) {
    return safeDioCall(() async {
      final response = await _groupApi.getGroups(name: name);
      return response.requireData;
    });
  }

  Future<Result<ReplaceGroup200Response>> addGroup({
    GroupsPost? body,
  }) {
    return safeDioCall(() async {
      final response = await _groupApi.addGroup(groupsPost: body);
      return response.requireData;
    });
  }

  Future<Result<ReplaceGroup200Response>> replaceGroup({
    required String name,
    GroupsPut? body,
  }) {
    return safeDioCall(() async {
      final response = await _groupApi.replaceGroup(
        name: name,
        groupsPut: body,
      );
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteGroup({required String name}) {
    return safeDioCall(() async {
      await _groupApi.deleteGroup(name: name);
      return unit;
    });
  }

  // ==========================================================================
  // Domains
  // ==========================================================================

  Future<Result<GetDomains200Response>> getAllDomains() {
    return safeDioCall(() async {
      final response = await _domainApi.getAllDomains();
      return response.requireData;
    });
  }

  Future<Result<GetDomains200Response>> getDomainsByTypeKind({
    required String type,
    required String kind,
  }) {
    return safeDioCall(() async {
      final response = await _domainApi.getDomainsByTypeKind(
        type: type,
        kind: kind,
      );
      return response.requireData;
    });
  }

  Future<Result<GetDomains200Response>> getDomains({
    required String type,
    required String kind,
    required String domain,
  }) {
    return safeDioCall(() async {
      final response = await _domainApi.getDomains(
        type: type,
        kind: kind,
        domain: domain,
      );
      return response.requireData;
    });
  }

  Future<Result<ReplaceDomain200Response>> addDomain({
    required String type,
    required String kind,
    Post? body,
  }) {
    return safeDioCall(() async {
      final response = await _domainApi.addDomain(
        type: type,
        kind: kind,
        post: body,
      );
      return response.requireData;
    });
  }

  Future<Result<ReplaceDomain200Response>> replaceDomain({
    required String type,
    required String kind,
    required String domain,
    ReplaceDomainRequest? body,
  }) {
    return safeDioCall(() async {
      final response = await _domainApi.replaceDomain(
        type: type,
        kind: kind,
        domain: domain,
        replaceDomainRequest: body,
      );
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteDomain({
    required String type,
    required String kind,
    required String domain,
  }) {
    return safeDioCall(() async {
      await _domainApi.deleteDomain(
        type: type,
        kind: kind,
        domain: domain,
      );
      return unit;
    });
  }

  // ==========================================================================
  // Lists (Adlists/Subscriptions)
  // ==========================================================================

  Future<Result<GetLists200Response>> getAllLists({
    String? type,
  }) {
    return safeDioCall(() async {
      final response = await _listApi.getAllLists(type: type);
      return response.requireData;
    });
  }

  Future<Result<GetLists200Response>> getLists({
    required String list,
    String? type,
  }) {
    return safeDioCall(() async {
      final response = await _listApi.getLists(list: list, type: type);
      return response.requireData;
    });
  }

  Future<Result<ReplaceLists200Response>> addList({
    required String type,
    ListsPost? body,
  }) {
    return safeDioCall(() async {
      final response = await _listApi.addList(type: type, listsPost: body);
      return response.requireData;
    });
  }

  Future<Result<ReplaceLists200Response>> replaceList({
    required String list,
    required String type,
    ListsPut? body,
  }) {
    return safeDioCall(() async {
      final response = await _listApi.replaceLists(
        list: list,
        type: type,
        listsPut: body,
      );
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteList({
    required String list,
    required String type,
  }) {
    return safeDioCall(() async {
      await _listApi.deleteLists(list: list, type: type);
      return unit;
    });
  }

  Future<Result<GetSearch200Response>> searchDomainInLists({
    required String domain,
    int? n,
    bool? partial,
  }) {
    return safeDioCall(() async {
      final response = await _listApi.getSearch(
        domain: domain,
        N: n,
        partial: partial,
      );
      return response.requireData;
    });
  }

  // ==========================================================================
  // Clients
  // ==========================================================================

  Future<Result<GetClients200Response>> getAllClients() {
    return safeDioCall(() async {
      final response = await _clientApi.getAllClients();
      return response.requireData;
    });
  }

  Future<Result<GetClients200Response>> getClients({
    required String client,
  }) {
    return safeDioCall(() async {
      final response = await _clientApi.getClients(client: client);
      return response.requireData;
    });
  }

  Future<Result<ReplaceClient200Response>> addClient({
    AddClientRequest? body,
  }) {
    return safeDioCall(() async {
      final response = await _clientApi.addClient(addClientRequest: body);
      return response.requireData;
    });
  }

  Future<Result<ReplaceClient200Response>> replaceClient({
    required String client,
    ReplaceClientRequest? body,
  }) {
    return safeDioCall(() async {
      final response = await _clientApi.replaceClient(
        client: client,
        replaceClientRequest: body,
      );
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteClient({required String client}) {
    return safeDioCall(() async {
      await _clientApi.deleteClient(client: client);
      return unit;
    });
  }

  // ==========================================================================
  // FTL Information
  // ==========================================================================

  Future<Result<GetClient200Response>> getInfoClient() {
    return safeDioCall(() async {
      final response = await _ftlApi.getClient();
      return response.requireData;
    });
  }

  Future<Result<GetFtlinfo200Response>> getInfoFtl() {
    return safeDioCall(() async {
      final response = await _ftlApi.getFtlinfo();
      return response.requireData;
    });
  }

  Future<Result<GetHostinfo200Response>> getInfoHost() {
    return safeDioCall(() async {
      final response = await _ftlApi.getHostinfo();
      return response.requireData;
    });
  }

  Future<Result<GetMessages200Response>> getInfoMessages() {
    return safeDioCall(() async {
      final response = await _ftlApi.getMessages();
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteInfoMessage({required int messageId}) {
    return safeDioCall(() async {
      await _ftlApi.deleteMessage(messageId: messageId);
      return unit;
    });
  }

  Future<Result<GetMetricsinfo200Response>> getInfoMetrics() {
    return safeDioCall(() async {
      final response = await _ftlApi.getMetricsinfo();
      return response.requireData;
    });
  }

  Future<Result<GetSensors200Response>> getInfoSensors() {
    return safeDioCall(() async {
      final response = await _ftlApi.getSensors();
      return response.requireData;
    });
  }

  Future<Result<GetSysteminfo200Response>> getInfoSystem() {
    return safeDioCall(() async {
      final response = await _ftlApi.getSysteminfo();
      return response.requireData;
    });
  }

  Future<Result<GetVersion200Response>> getInfoVersion() {
    return safeDioCall(() async {
      final response = await _ftlApi.getVersion();
      return response.requireData;
    });
  }

  // ==========================================================================
  // Network Information
  // ==========================================================================

  Future<Result<GetNetwork200Response>> getNetworkDevices() {
    return safeDioCall(() async {
      final response = await _networkApi.getNetwork();
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteNetworkDevice({required int deviceId}) {
    return safeDioCall(() async {
      await _networkApi.deleteDevice(deviceId: deviceId);
      return unit;
    });
  }

  Future<Result<GetGateway200Response>> getNetworkGateway({
    bool? detailed,
  }) {
    return safeDioCall(() async {
      final response = await _networkApi.getGateway(detailed: detailed);
      return response.requireData;
    });
  }

  // ==========================================================================
  // Actions
  // ==========================================================================

  Future<Result<ActionRestartdns200Response>> actionFlushArp() {
    return safeDioCall(() async {
      // ignore: deprecated_member_use
      final response = await _actionsApi.actionFlusharp();
      return response.requireData;
    });
  }

  Future<Result<ActionRestartdns200Response>> actionFlushNetwork() {
    return safeDioCall(() async {
      final response = await _actionsApi.actionFlushnetwork();
      return response.requireData;
    });
  }

  Future<Result<ActionRestartdns200Response>> actionFlushLogs() {
    return safeDioCall(() async {
      final response = await _actionsApi.actionFlushlogs();
      return response.requireData;
    });
  }

  Future<Result<String>> actionGravity() {
    return safeDioCall(() async {
      final response = await _actionsApi.actionGravity();
      return response.requireData;
    });
  }

  Future<Result<ActionRestartdns200Response>> actionRestartDns() {
    return safeDioCall(() async {
      final response = await _actionsApi.actionRestartdns();
      return response.requireData;
    });
  }

  // ==========================================================================
  // Pi-hole Configuration
  // ==========================================================================

  Future<Result<GetConfig200Response>> getConfig() {
    return safeDioCall(() async {
      final response = await _configApi.getConfig();
      return response.requireData;
    });
  }

  Future<Result<GetConfig200Response>> patchConfig({
    GetConfig200Response? body,
    bool? restart,
  }) {
    return safeDioCall(() async {
      final response = await _configApi.patchConfig(
        getConfig200Response: body,
        restart: restart,
      );
      return response.requireData;
    });
  }

  // ==========================================================================
  // DHCP
  // ==========================================================================

  Future<Result<GetDhcp200Response>> getDhcpLeases() {
    return safeDioCall(() async {
      final response = await _dhcpApi.getDhcp();
      return response.requireData;
    });
  }

  Future<Result<Unit>> deleteDhcpLease({required String ip}) {
    return safeDioCall(() async {
      await _dhcpApi.deleteDhcp(ip: ip);
      return unit;
    });
  }
}
