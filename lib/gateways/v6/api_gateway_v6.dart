import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/api/v6/auth/auth.dart' show Session;
import 'package:pi_hole_client/models/api/v6/dns/dns.dart' show Blocking;
import 'package:pi_hole_client/models/api/v6/domains/domains.dart'
    show AddDomains, Domains;
import 'package:pi_hole_client/models/api/v6/ftl/ftl.dart' show InfoFtl;
import 'package:pi_hole_client/models/api/v6/ftl/host.dart' show Host;
import 'package:pi_hole_client/models/api/v6/ftl/sensors.dart' show Sensors;
import 'package:pi_hole_client/models/api/v6/ftl/system.dart' show System;
import 'package:pi_hole_client/models/api/v6/ftl/version.dart' show Version;
import 'package:pi_hole_client/models/api/v6/metrics/history.dart'
    show History, HistoryClients;
import 'package:pi_hole_client/models/api/v6/metrics/query.dart' show Queries;
import 'package:pi_hole_client/models/api/v6/metrics/stats.dart'
    show StatsSummary, StatsTopClients, StatsTopDomains, StatsUpstreams;
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/host.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/sensors.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/system.dart';
import 'package:pi_hole_client/models/version.dart';

class ApiGatewayV6 implements ApiGateway {
  /// Creates a new instance of the `ApiGatewayV5` class.
  ///
  /// Parameters:
  /// - `server` (`Server`): The pihole server object
  /// - `client` (`http.Client`): An optional HTTP client to use for requests. If not provided, a new client will be created. Add for testing purposes.
  ApiGatewayV6(Server server, {http.Client? client})
      : _server = server,
        _client = client ?? http.Client();
  final Server _server;
  final http.Client _client;

  final unexpectedError = 'An unexpected error occurred.';
  final fetchError = 'Failed to fetch data from the server.';

  @override
  Server get server => _server;

  /// Sends an HTTP request using the specified method and parameters.
  ///
  /// This method sends an HTTP request to the specified URL using the provided
  /// method, headers, and body. It also handles authentication using the API key
  /// if provided. If the request fails due to a 401 response, it will retry the
  /// request once after re-authenticating with the server.
  ///
  /// Parameters:
  /// - [method] The HTTP method to use (e.g., 'GET', 'POST').
  /// - [url] The URL to send the request to.
  /// - [headers] The headers to send with the request.
  /// - [body] The body of the request.
  /// - [timeout] The timeout for the request in seconds. Default is 10 seconds.
  /// - [maxRetries] The number of times to retry the request if a 401 response is received. Default is 1.
  ///
  /// Returns
  /// - A `Response` object containing the response from the server.
  ///
  /// Exceptions:
  /// - Throws an exception if the request fails or times out.
  Future<Response> httpClient({
    required String method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int timeout = 10,
    int maxRetries = 1,
  }) async {
    if (_server.sm.sid == null) {
      await _server.sm.load();
    }
    final authHeaders = headers != null ? {...headers} : {};
    authHeaders['Content-Type'] = 'application/json';
    if (_server.sm.sid != null && _server.sm.sid!.isNotEmpty) {
      authHeaders['X-FTL-SID'] = _server.sm.sid;
    }

    final stringAuthHeaders = authHeaders.map(
      (key, value) => MapEntry(key.toString(), value.toString()),
    );

    for (var attempt = 0; attempt <= maxRetries; attempt++) {
      final response = await _sendRequest(
        method: method,
        url: url,
        headers: stringAuthHeaders,
        body: body,
        timeout: timeout,
      );

      if (response.statusCode == 401) {
        if (attempt >= maxRetries) {
          return response;
        }

        await loginQuery();
        continue;
      }

      return response;
    }

    throw Exception('Failed to execute HTTP request');
  }

  /// Handles the login process to a Pi-hole server using its API.
  @override
  Future<LoginQueryResponse> loginQuery({bool refresh = false}) async {
    try {
      // If the refresh flag is set, delete the session
      if (refresh) {
        final deleteResp = await httpClient(
          method: 'delete',
          url: '${_server.address}/api/auth',
          maxRetries: 0,
        );
        if (deleteResp.statusCode == 204) {
          await _server.sm.delete();
          logger.d('Logout successful. Session deleted.');
        }
      }

      // 1. Get DNS blocking status
      // If the session ID is already available, use it to get the status
      // Otherwise, re-login to get the session ID
      final enableOrDisable = await httpClient(
        method: 'get',
        url: '${_server.address}/api/dns/blocking',
        maxRetries: 0,
      );
      if (enableOrDisable.statusCode == 200) {
        logger.i('Reusing session ID login');
        final enableOrDisableParsed =
            Blocking.fromJson(jsonDecode(enableOrDisable.body));
        return LoginQueryResponse(
          result: APiResponseType.success,
          status: enableOrDisableParsed.blocking,
          sid: _server.sm.sid,
        );
      }

      // 2.login
      final status = await httpClient(
        method: 'post',
        url: '${_server.address}/api/auth',
        body: {'password': await _server.sm.password},
        maxRetries: 0,
      );

      if (status.statusCode == 200) {
        logger.i('Login successful with new session ID');
        final statusParsed = Session.fromJson(jsonDecode(status.body));
        await _server.sm.save(statusParsed.session.sid);

        // 3. Get DNS blocking status
        final enableOrDisable = await httpClient(
          method: 'get',
          url: '${_server.address}/api/dns/blocking',
        );
        if (enableOrDisable.statusCode == 200) {
          final enableOrDisableParsed =
              Blocking.fromJson(jsonDecode(enableOrDisable.body));
          return LoginQueryResponse(
            result: APiResponseType.success,
            status: enableOrDisableParsed.blocking,
            sid: statusParsed.session.sid,
          );
        } else {
          return LoginQueryResponse(
            result: APiResponseType.authError,
            log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              statusCode: status.statusCode.toString(),
              message: 'auth_error_1',
              resBody: status.body,
            ),
          );
        }
      } else if (status.statusCode == 404) {
        return LoginQueryResponse(
          result: APiResponseType.noConnection,
          log: AppLog(
            type: 'login',
            dateTime: DateTime.now(),
            statusCode: status.statusCode.toString(),
            message: 'no_connection_2',
            resBody: status.body,
          ),
        );
      } else {
        return LoginQueryResponse(
          result: APiResponseType.authError,
          log: AppLog(
            type: 'login',
            dateTime: DateTime.now(),
            statusCode: status.statusCode.toString(),
            message: 'auth_error',
            resBody: status.body,
          ),
        );
      }
    } on SocketException {
      return LoginQueryResponse(
        result: APiResponseType.socket,
        log: AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: 'SocketException',
        ),
      );
    } on TimeoutException {
      return LoginQueryResponse(
        result: APiResponseType.timeout,
        log: AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: 'TimeoutException',
        ),
      );
    } on HandshakeException {
      return LoginQueryResponse(
        result: APiResponseType.sslError,
        log: AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: 'HandshakeException',
        ),
      );
    } on FormatException {
      return LoginQueryResponse(
        result: APiResponseType.authError,
        log: AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: 'FormatException',
        ),
      );
    } catch (e) {
      return LoginQueryResponse(
        result: APiResponseType.error,
        log: AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: e.toString(),
        ),
      );
    }
  }

  /// Fetches real-time status information from a Pi-hole server.
  ///
  /// This method sends a GET request to the specified Pi-hole server to retrieve
  /// detailed status and metrics, including top items, forward destinations,
  /// query sources, and query types. It parses the response and returns the
  /// data in a structured format.
  @override
  Future<RealtimeStatusResponse> realtimeStatus() async {
    try {
      final response = await Future.wait([
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/summary',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/info/ftl',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/dns/blocking',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/top_domains',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/top_domains?blocked=true',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/top_clients',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/top_clients?blocked=true',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/upstreams',
        ),
      ]);
      if (response[0].statusCode == 200 &&
          response[1].statusCode == 200 &&
          response[2].statusCode == 200 &&
          response[3].statusCode == 200 &&
          response[4].statusCode == 200 &&
          response[5].statusCode == 200 &&
          response[6].statusCode == 200 &&
          response[7].statusCode == 200) {
        final summary = StatsSummary.fromJson(jsonDecode(response[0].body));
        final infoFtl = InfoFtl.fromJson(jsonDecode(response[1].body));
        final blocking = Blocking.fromJson(jsonDecode(response[2].body));
        final topPermittedDomains =
            StatsTopDomains.fromJson(jsonDecode(response[3].body));
        final topBlockedDomains =
            StatsTopDomains.fromJson(jsonDecode(response[4].body));
        final topClients =
            StatsTopClients.fromJson(jsonDecode(response[5].body));
        final topBlockedClients =
            StatsTopClients.fromJson(jsonDecode(response[6].body));
        final upstreams = StatsUpstreams.fromJson(jsonDecode(response[7].body));

        return RealtimeStatusResponse(
          result: APiResponseType.success,
          data: RealtimeStatus.fromV6(
            summary,
            infoFtl,
            blocking,
            topPermittedDomains,
            topBlockedDomains,
            topClients,
            topBlockedClients,
            upstreams,
          ),
        );
      } else {
        return RealtimeStatusResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return RealtimeStatusResponse(result: APiResponseType.socket);
    } on TimeoutException {
      return RealtimeStatusResponse(result: APiResponseType.timeout);
    } on HandshakeException {
      return RealtimeStatusResponse(result: APiResponseType.sslError);
    } catch (e) {
      return RealtimeStatusResponse(result: APiResponseType.error);
    }
  }

  /// Disables a Pi-hole server
  ///
  /// This method sends a GET request to the specified Pi-hole server to disable
  @override
  Future<DisableServerResponse> disableServerRequest(int time) async {
    try {
      final response = await httpClient(
        method: 'post',
        url: '${_server.address}/api/dns/blocking',
        body: {'blocking': false, 'timer': time},
      );
      if (response.statusCode == 200) {
        final body = Blocking.fromJson(jsonDecode(response.body));
        return DisableServerResponse(
          result: APiResponseType.success,
          status: body.blocking,
        );
      } else {
        return DisableServerResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return DisableServerResponse(result: APiResponseType.noConnection);
    } on TimeoutException {
      return DisableServerResponse(result: APiResponseType.noConnection);
    } on HandshakeException {
      return DisableServerResponse(result: APiResponseType.sslError);
    } catch (e) {
      return DisableServerResponse(result: APiResponseType.error);
    }
  }

  /// Enables a Pi-hole server
  ///
  /// This method sends a GET request to the specified Pi-hole server to enable
  @override
  Future<EnableServerResponse> enableServerRequest() async {
    try {
      final response = await httpClient(
        method: 'post',
        url: '${_server.address}/api/dns/blocking',
        body: {'blocking': true, 'timer': null},
      );
      if (response.statusCode == 200) {
        final body = Blocking.fromJson(jsonDecode(response.body));
        return EnableServerResponse(
          result: APiResponseType.success,
          status: body.blocking,
        );
      } else {
        return EnableServerResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return EnableServerResponse(result: APiResponseType.noConnection);
    } on TimeoutException {
      return EnableServerResponse(result: APiResponseType.noConnection);
    } on HandshakeException {
      return EnableServerResponse(result: APiResponseType.sslError);
    } catch (e) {
      return EnableServerResponse(result: APiResponseType.error);
    }
  }

  /// Fetches over-time data from a Pi-hole server.
  ///
  /// This method retrieves various over-time data points from the specified
  /// Pi-hole server, including queries over time (in 10-minute intervals), client
  /// activity, and client names. The data is parsed and returned in a structured format.
  @override
  Future<FetchOverTimeDataResponse> fetchOverTimeData() async {
    try {
      final response = await Future.wait([
        httpClient(
          method: 'get',
          url: '${_server.address}/api/history',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/history/clients',
        ),
      ]);

      if (response[0].statusCode == 200 && response[1].statusCode == 200) {
        final history = History.fromJson(jsonDecode(response[0].body));
        final historyClients =
            HistoryClients.fromJson(jsonDecode(response[1].body));
        return FetchOverTimeDataResponse(
          result: APiResponseType.success,
          data: OverTimeData.fromV6(history, historyClients),
        );
      } else {
        return FetchOverTimeDataResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return FetchOverTimeDataResponse(result: APiResponseType.socket);
    } on TimeoutException {
      return FetchOverTimeDataResponse(result: APiResponseType.timeout);
    } on HandshakeException {
      return FetchOverTimeDataResponse(result: APiResponseType.sslError);
    } catch (e) {
      return FetchOverTimeDataResponse(result: APiResponseType.error);
    }
  }

  /// Fetches log data from a Pi-hole server within a specified time range.
  ///
  /// This method retrieves query logs from the given Pi-hole server for a
  /// specified time period. The logs are returned in a structured format
  /// for further analysis or display.
  @override
  Future<FetchLogsResponse> fetchLogs(DateTime from, DateTime until) async {
    try {
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/api/queries?from=${from.millisecondsSinceEpoch ~/ 1000}&until=${until.millisecondsSinceEpoch ~/ 1000}',
        timeout: 20,
      );
      if (response.statusCode == 200) {
        final queries = Queries.fromJson(jsonDecode(response.body));
        logger.d('Queries: ${queries.queries.map((e) => e.toJson()).toList()}');
        return FetchLogsResponse(
          result: APiResponseType.success,
          data: queries.queries.map(Log.fromV6).toList(),
        );
      } else {
        return FetchLogsResponse(result: APiResponseType.error);
      }
    } on FormatException {
      return FetchLogsResponse(result: APiResponseType.authError);
    } on SocketException {
      return FetchLogsResponse(result: APiResponseType.socket);
    } on TimeoutException {
      return FetchLogsResponse(result: APiResponseType.timeout);
    } on HandshakeException {
      return FetchLogsResponse(result: APiResponseType.sslError);
    } catch (e) {
      return FetchLogsResponse(result: APiResponseType.error);
    }
  }

  /// Adds a domain to the whitelist or blacklist on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to add the specified domain
  /// to either the whitelist or the blacklist, depending on the provided `list` parameter.
  /// It validates the server's response to confirm the operation's success.
  @override
  Future<SetWhiteBlacklistResponse> setWhiteBlacklist(
    String domain,
    String list,
  ) async {
    try {
      final types = {
        'white': ['allow', 'exact'],
        'black': ['deny', 'exact'],
        'regex_white': ['allow', 'regex'],
        'regex_black': ['deny', 'regex'],
      };
      final response = await httpClient(
        method: 'post',
        url:
            '${_server.address}/api/domains/${types[list]?[0]}/${types[list]?[1]}',
        body: {
          'domain': domain,
          'comment': null,
          'groups': [0], // Array of group IDs
          'enabled': true,
        },
      );
      if (response.statusCode == 201) {
        final domains = AddDomains.fromJson(jsonDecode(response.body));
        return SetWhiteBlacklistResponse(
          result: APiResponseType.success,
          data: DomainResult.fromV6(domains),
        );
      } else {
        return SetWhiteBlacklistResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return SetWhiteBlacklistResponse(result: APiResponseType.socket);
    } on TimeoutException {
      return SetWhiteBlacklistResponse(result: APiResponseType.timeout);
    } on HandshakeException {
      return SetWhiteBlacklistResponse(result: APiResponseType.sslError);
    } catch (e) {
      return SetWhiteBlacklistResponse(result: APiResponseType.error);
    }
  }

  /// Fetches domain lists (whitelist, blacklist, and regex-based lists) from a Pi-hole server.
  ///
  /// This method retrieves the whitelist, regex whitelist, blacklist, and regex blacklist
  /// from the specified Pi-hole server. Each list is processed and returned in a structured format.
  @override
  Future<GetDomainLists> getDomainLists() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/domains',
      );

      if (results.statusCode == 200) {
        final domains = Domains.fromJson(jsonDecode(results.body));

        return GetDomainLists(
          result: APiResponseType.success,
          data: DomainListResult.fromV6(domains),
        );
      } else {
        return GetDomainLists(result: APiResponseType.error);
      }
    } on SocketException {
      return GetDomainLists(result: APiResponseType.socket);
    } on TimeoutException {
      return GetDomainLists(result: APiResponseType.timeout);
    } on HandshakeException {
      return GetDomainLists(result: APiResponseType.sslError);
    } on FormatException {
      return GetDomainLists(result: APiResponseType.authError);
    } catch (e) {
      return GetDomainLists(result: APiResponseType.error);
    }
  }

  /// Removes a domain from a specific list on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to remove the specified domain
  /// from the given list, which can be one of the following: whitelist, blacklist,
  /// regex whitelist, or regex blacklist. The operation's success or failure is determined
  /// by the server's response.
  @override
  Future<RemoveDomainFromListResponse> removeDomainFromList(
    Domain domain,
  ) async {
    List<String> getType(int type) {
      switch (type) {
        case 0:
          return ['allow', 'exact'];

        case 1:
          return ['deny', 'exact'];

        case 2:
          return ['allow', 'regex'];

        case 3:
          return ['deny', 'regex'];

        default:
          return ['', ''];
      }
    }

    final name = getType(domain.type)[1] == 'regex'
        ? Uri.encodeComponent(domain.domain)
        : domain.domain;

    try {
      final response = await httpClient(
        method: 'delete',
        url:
            '${_server.address}/api/domains/${getType(domain.type)[0]}/${getType(domain.type)[1]}/$name',
      );
      if (response.statusCode == 204) {
        return RemoveDomainFromListResponse(result: APiResponseType.success);
      } else if (response.statusCode == 404) {
        return RemoveDomainFromListResponse(
          result: APiResponseType.error,
          message: 'not_exists',
        );
      } else {
        return RemoveDomainFromListResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return RemoveDomainFromListResponse(result: APiResponseType.noConnection);
    } on TimeoutException {
      return RemoveDomainFromListResponse(result: APiResponseType.noConnection);
    } on HandshakeException {
      return RemoveDomainFromListResponse(result: APiResponseType.sslError);
    } catch (e) {
      return RemoveDomainFromListResponse(result: APiResponseType.error);
    }
  }

  /// Adds a domain to a specified list on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to add a domain to a specified list,
  /// such as the whitelist, blacklist, regex whitelist, or regex blacklist. It checks the server's
  /// response to determine whether the operation was successful or if the domain already exists
  /// in the list.
  @override
  Future<AddDomainToListResponse> addDomainToList(
    Map<String, dynamic> domainData,
  ) async {
    try {
      final types = {
        'white': ['allow', 'exact'],
        'black': ['deny', 'exact'],
        'regex_white': ['allow', 'regex'],
        'regex_black': ['deny', 'regex'],
      };
      final response = await httpClient(
        method: 'post',
        url:
            '${_server.address}/api/domains/${types[domainData['list']]?[0]}/${types[domainData['list']]?[1]}',
        body: {
          'domain': domainData['domain'],
          'comment': null,
          'groups': [0], // Array of group IDs
          'enabled': true,
        },
      );
      if (response.statusCode == 201) {
        final domains = AddDomains.fromJson(jsonDecode(response.body));

        if (domains.domains.length != 1) {
          return AddDomainToListResponse(result: APiResponseType.error);
        }

        if (domains.processed.success.isNotEmpty) {
          return AddDomainToListResponse(result: APiResponseType.success);
        }

        if (domains.processed.errors.isNotEmpty &&
            domains.processed.errors[0].error
                .contains('UNIQUE constraint failed:')) {
          return AddDomainToListResponse(result: APiResponseType.alreadyAdded);
        }
        return AddDomainToListResponse(result: APiResponseType.error);
      } else {
        return AddDomainToListResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return AddDomainToListResponse(result: APiResponseType.socket);
    } on TimeoutException {
      return AddDomainToListResponse(result: APiResponseType.timeout);
    } on HandshakeException {
      return AddDomainToListResponse(result: APiResponseType.sslError);
    } catch (e) {
      return AddDomainToListResponse(result: APiResponseType.error);
    }
  }

  Future<Response> _sendRequest({
    required String method,
    required String url,
    required Map<String, String> headers,
    required int timeout,
    Map<String, dynamic>? body,
  }) async {
    switch (method.toUpperCase()) {
      case 'POST':
        return _client
            .post(
              Uri.parse(url),
              headers: headers,
              body: body != null ? jsonEncode(body) : null,
            )
            .timeout(Duration(seconds: timeout));

      case 'PUT':
        return _client
            .put(
              Uri.parse(url),
              headers: headers,
              body: body != null ? jsonEncode(body) : null,
            )
            .timeout(Duration(seconds: timeout));

      case 'PATCH':
        return _client
            .patch(
              Uri.parse(url),
              headers: headers,
              body: body != null ? jsonEncode(body) : null,
            )
            .timeout(Duration(seconds: timeout));

      case 'DELETE':
        return _client
            .delete(Uri.parse(url), headers: headers)
            .timeout(Duration(seconds: timeout));

      case 'GET':
      default:
        return _client
            .get(Uri.parse(url), headers: headers)
            .timeout(Duration(seconds: timeout));
    }
  }

  @override
  Future<HostResponse> fetchHostInfo() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/host',
      );

      if (results.statusCode == 200) {
        final host = Host.fromJson(jsonDecode(results.body));

        return HostResponse(
          result: APiResponseType.success,
          data: HostInfo.fromV6(host),
        );
      } else {
        return HostResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return HostResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<SensorsResponse> fetchSensorsInfo() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/sensors',
      );

      if (results.statusCode == 200) {
        final sensors = Sensors.fromJson(jsonDecode(results.body));

        return SensorsResponse(
          result: APiResponseType.success,
          data: SensorsInfo.fromV6(sensors),
        );
      } else {
        return SensorsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SensorsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<SystemResponse> fetchSystemInfo() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/system',
      );

      if (results.statusCode == 200) {
        final system = System.fromJson(jsonDecode(results.body));

        return SystemResponse(
          result: APiResponseType.success,
          data: SystemInfo.fromV6(system),
        );
      } else {
        return SystemResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SystemResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<VersionResponse> fetchVersionInfo() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/version',
      );

      if (results.statusCode == 200) {
        final version = Version.fromJson(jsonDecode(results.body));

        return VersionResponse(
          result: APiResponseType.success,
          data: VersionInfo.fromV6(version),
        );
      } else {
        return VersionResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return VersionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<PiHoleServerInfoResponse> fetchAllServerInfo() async {
    try {
      final results = await Future.wait<BaseInfoResponse<dynamic>>([
        fetchHostInfo(),
        fetchSensorsInfo(),
        fetchSystemInfo(),
        fetchVersionInfo(),
      ]);

      if (results[0].result == APiResponseType.success &&
          results[1].result == APiResponseType.success &&
          results[2].result == APiResponseType.success &&
          results[3].result == APiResponseType.success) {
        return PiHoleServerInfoResponse(
          result: APiResponseType.success,
          host: results[0].data,
          sensors: results[1].data,
          system: results[2].data,
          version: results[3].data,
        );
      } else {
        return PiHoleServerInfoResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return PiHoleServerInfoResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }
}
