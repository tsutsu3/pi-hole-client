import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/data/gateway/transport_security_logger.dart';
import 'package:pi_hole_client/data/model/v6/action/action.dart';
import 'package:pi_hole_client/data/model/v6/auth/auth.dart' show Session;
import 'package:pi_hole_client/data/model/v6/auth/sessions.dart';
import 'package:pi_hole_client/data/model/v6/clients/clients.dart';
import 'package:pi_hole_client/data/model/v6/config/config.dart'
    show Config, ConfigData, Dns;
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
import 'package:pi_hole_client/data/model/v6/network/devices.dart';
import 'package:pi_hole_client/data/model/v6/network/gateway.dart' show Gateway;
import 'package:pi_hole_client/data/model/v6/padd/padd.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/app_log.dart';
import 'package:pi_hole_client/domain/models_old/client.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/config.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/domain/models_old/dhcp.dart';
import 'package:pi_hole_client/domain/models_old/domain.dart';
import 'package:pi_hole_client/domain/models_old/gateway.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/domain/models_old/host.dart';
import 'package:pi_hole_client/domain/models_old/log.dart';
import 'package:pi_hole_client/domain/models_old/messages.dart';
import 'package:pi_hole_client/domain/models_old/metrics.dart';
import 'package:pi_hole_client/domain/models_old/overtime_data.dart';
import 'package:pi_hole_client/domain/models_old/realtime_status.dart';
import 'package:pi_hole_client/domain/models_old/search.dart';
import 'package:pi_hole_client/domain/models_old/sensors.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/models_old/sessions.dart';
import 'package:pi_hole_client/domain/models_old/subscriptions.dart';
import 'package:pi_hole_client/domain/models_old/system.dart';
import 'package:pi_hole_client/domain/models_old/version.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/misc.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';

class ApiGatewayV6 implements ApiGateway {
  /// Creates a new instance of the `ApiGatewayV5` class.
  ///
  /// Parameters:
  /// - `server` (`Server`): The pihole server object
  /// - `client` (`http.Client`): An optional HTTP client to use for requests. If not provided, a new client will be created. Add for testing purposes.
  ApiGatewayV6(Server server, {http.Client? client})
    : _server = server,
      _client =
          client ??
          IOClient(
            createHttpClient(
              allowSelfSignedCert: server.allowSelfSignedCert,
              ignoreCertificateErrors: server.ignoreCertificateErrors,
              pinnedCertificateSha256: server.pinnedCertificateSha256,
            ),
          ) {
    TransportSecurityLogger.logTransportSecurityPolicyOnce(server);
  }
  final Server _server;
  final http.Client _client;

  final unexpectedError = 'An unexpected error occurred.';
  final fetchError = 'Failed to fetch data from the server.';
  final notImplementedError = 'This feature is not implemented yet.';
  final postError = 'Failed to post data to the server.';
  final deleteError = 'Failed to delete data from the server.';
  final putError = 'Failed to put data to the server.';

  @override
  Server get server => _server;

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
    if (_server.sm.sid.isError()) {
      await _server.sm.loadSid();
    }
    final authHeaders = headers != null ? {...headers} : {};
    authHeaders['Content-Type'] = 'application/json';
    if (_server.sm.sid.isSuccess() && _server.sm.sid.getOrThrow().isNotEmpty) {
      authHeaders['X-FTL-SID'] = _server.sm.sid.getOrThrow();
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

      if (response.statusCode == 401 || response.statusCode == 403) {
        if (attempt >= maxRetries) {
          await WidgetChannel.sendSidInvalidated(server: _server);
          return response;
        }

        await loginQuery();
        continue;
      }

      return response;
    }

    throw Exception('Failed to execute HTTP request');
  }

  Future<http.StreamedResponse> httpClientStream({
    required String method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int timeout = 10,
    int maxRetries = 1,
  }) async {
    if (_server.sm.sid.isError()) {
      await _server.sm.loadSid();
    }
    final authHeaders = headers != null ? {...headers} : {};
    authHeaders['Content-Type'] = 'application/json';
    if (_server.sm.sid.isSuccess() && _server.sm.sid.getOrThrow().isNotEmpty) {
      authHeaders['X-FTL-SID'] = _server.sm.sid.getOrThrow();
    }

    final stringAuthHeaders = authHeaders.map(
      (key, value) => MapEntry(key.toString(), value.toString()),
    );

    for (var attempt = 0; attempt <= maxRetries; attempt++) {
      final request = http.Request(method.toUpperCase(), Uri.parse(url));
      request.headers.addAll(stringAuthHeaders);
      if (body != null) {
        request.body = jsonEncode(body);
      }

      final streamedResponse = await _client
          .send(request)
          .timeout(Duration(seconds: timeout));

      if (streamedResponse.statusCode == 401 ||
          streamedResponse.statusCode == 403) {
        if (attempt >= maxRetries) {
          await WidgetChannel.sendSidInvalidated(server: _server);
          return streamedResponse;
        }

        await loginQuery();
        continue;
      }

      return streamedResponse;
    }

    throw Exception('Failed to execute streamed HTTP request');
  }

  @override
  void close() {
    _client.close();
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
          await _server.sm.deleteSid();
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
        final enableOrDisableParsed = Blocking.fromJson(
          jsonDecode(enableOrDisable.body),
        );

        // If the server allows unauthenticated access (no password set), we may
        // get a 200 response without ever having a SID. In that case, persist an
        // empty SID so downstream callers don't fail trying to read it.
        var cachedSid = _server.sm.sid.getOrNull();
        if (cachedSid == null) {
          await _server.sm.saveSid('');
          cachedSid = '';
          logger.i('Login not required (no password configured)');
        } else {
          if (cachedSid == '') {
            logger.i('Reusing empty session ID login (no password configured)');
          } else {
            logger.i('Reusing session ID login');
          }
        }

        await WidgetChannel.sendSidUpdated(server: _server, sid: cachedSid);

        return LoginQueryResponse(
          result: APiResponseType.success,
          status: enableOrDisableParsed.blocking,
          sid: cachedSid,
        );
      }

      // 2.login
      final status = await httpClient(
        method: 'post',
        url: '${_server.address}/api/auth',
        body: {'password': (await _server.sm.password).getOrThrow()},
        maxRetries: 0,
      );

      if (status.statusCode == 200) {
        logger.i('Login successful with new session ID');
        final statusParsed = Session.fromJson(jsonDecode(status.body));
        await _server.sm.saveSid(statusParsed.session.sid);

        // 3. Get DNS blocking status
        final enableOrDisable = await httpClient(
          method: 'get',
          url: '${_server.address}/api/dns/blocking',
        );
        if (enableOrDisable.statusCode == 200) {
          final enableOrDisableParsed = Blocking.fromJson(
            jsonDecode(enableOrDisable.body),
          );
          await WidgetChannel.sendSidUpdated(
            server: _server,
            sid: statusParsed.session.sid,
          );

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
  Future<RealtimeStatusResponse> realtimeStatus({int? clientCount}) async {
    try {
      final count = clientCount ?? 10;

      final response = await Future.wait([
        httpClient(method: 'get', url: '${_server.address}/api/stats/summary'),
        httpClient(method: 'get', url: '${_server.address}/api/info/ftl'),
        httpClient(method: 'get', url: '${_server.address}/api/dns/blocking'),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/upstreams',
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
          url: '${_server.address}/api/stats/top_clients?count=$count',
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/stats/top_clients?blocked=true',
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
        final upstreams = StatsUpstreams.fromJson(jsonDecode(response[3].body));

        final topPermittedDomains = StatsTopDomains.fromJson(
          jsonDecode(response[4].body),
        );
        final topBlockedDomains = StatsTopDomains.fromJson(
          jsonDecode(response[5].body),
        );
        final topClients = StatsTopClients.fromJson(
          jsonDecode(response[6].body),
        );
        final topBlockedClients = StatsTopClients.fromJson(
          jsonDecode(response[7].body),
        );

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
      logger.e('Error fetching real-time status: $e');
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
        await WidgetChannel.sendBlockingUpdated(server: _server);
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
        await WidgetChannel.sendBlockingUpdated(server: _server);
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
  Future<FetchOverTimeDataResponse> fetchOverTimeData({
    int? clientCount,
  }) async {
    final count = clientCount ?? 10;

    try {
      final response = await Future.wait([
        httpClient(method: 'get', url: '${_server.address}/api/history'),
        httpClient(
          method: 'get',
          url: '${_server.address}/api/history/clients?N=$count',
        ),
      ]);

      if (response[0].statusCode == 200 && response[1].statusCode == 200) {
        final history = History.fromJson(jsonDecode(response[0].body));
        final historyClients = HistoryClients.fromJson(
          jsonDecode(response[1].body),
        );
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
      logger.e('Error fetching over-time data: $e');
      return FetchOverTimeDataResponse(result: APiResponseType.error);
    }
  }

  /// Fetches log data from a Pi-hole server within a specified time range.
  ///
  /// This method retrieves query logs from the given Pi-hole server for a
  /// specified time period. The logs are returned in a structured format
  /// for further analysis or display.
  @override
  Future<FetchLogsResponse> fetchLogs(
    DateTime from,
    DateTime until, {
    int? size,
    int? cursor,
  }) async {
    try {
      final length = size ?? 100;
      final cursorPram = cursor == null ? '' : '&cursor=$cursor';

      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/api/queries?from=${from.millisecondsSinceEpoch ~/ 1000}&until=${until.millisecondsSinceEpoch ~/ 1000}&length=$length$cursorPram',
        timeout: 20,
      );
      if (response.statusCode == 200) {
        final queries = Queries.fromJson(jsonDecode(response.body));
        return FetchLogsResponse(
          result: APiResponseType.success,
          data: LogsInfo.fromV6(queries),
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
        final domains = Domains.fromJson(jsonDecode(response.body));
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
        final domains = Domains.fromJson(jsonDecode(response.body));

        if (domains.domains.length != 1 || domains.processed == null) {
          return AddDomainToListResponse(result: APiResponseType.error);
        }

        if (domains.processed!.success.isNotEmpty) {
          return AddDomainToListResponse(result: APiResponseType.success);
        }

        if (domains.processed!.errors.isNotEmpty &&
            domains.processed!.errors[0].error.contains(
              'UNIQUE constraint failed:',
            )) {
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

  /// Updates an existing domain.
  @override
  Future<DomainResponse> updateDomain({required DomainRequest body}) async {
    try {
      final results = await httpClient(
        method: 'put',
        url:
            '${_server.address}/api/domains/${body.type.name}/${body.kind.name}/${Uri.encodeComponent(body.domain)}',
        body: body.toJson(),
      );

      if (results.statusCode == 200) {
        final domains = Domains.fromJson(jsonDecode(results.body));

        return DomainResponse(
          result: APiResponseType.success,
          data: Domain.fromV6(domains.domains.first),
        );
      } else {
        return DomainResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return DomainResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
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
        final host = InfoHost.fromJson(jsonDecode(results.body));

        return HostResponse(
          result: APiResponseType.success,
          data: HostInfo.fromV6(host),
        );
      } else {
        return HostResponse(result: APiResponseType.error, message: fetchError);
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
        final sensors = InfoSensors.fromJson(jsonDecode(results.body));

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
        final system = InfoSystem.fromJson(jsonDecode(results.body));

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
        final version = InfoVersion.fromJson(jsonDecode(results.body));

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

  @override
  Future<SubscriptionsResponse> getSubscriptions({
    String? url,
    String? stype,
  }) async {
    try {
      var requestUrl = '${_server.address}/api/lists';
      if (url != null) {
        requestUrl += '/$url';
      }
      if (stype != null) {
        requestUrl += '?type=${Uri.encodeComponent(stype)}';
      }

      final results = await httpClient(method: 'get', url: requestUrl);

      if (results.statusCode == 200) {
        final lists = Lists.fromJson(jsonDecode(results.body));

        return SubscriptionsResponse(
          result: APiResponseType.success,
          data: SubscriptionsInfo.fromV6(lists),
        );
      } else {
        return SubscriptionsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SubscriptionsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<RemoveSubscriptionResponse> removeSubscription({
    required String url,
    required String stype,
  }) async {
    try {
      final requestUrl =
          '${_server.address}/api/lists/${Uri.encodeComponent(url)}?type=${Uri.encodeComponent(stype)}';

      final results = await httpClient(method: 'delete', url: requestUrl);

      if (results.statusCode == 204) {
        return RemoveSubscriptionResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return RemoveSubscriptionResponse(
          result: APiResponseType.notFound,
          message: fetchError,
        );
      } else {
        return RemoveSubscriptionResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return RemoveSubscriptionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<SubscriptionsResponse> createSubscription({
    required SubscriptionRequest body,
  }) async {
    try {
      final results = await httpClient(
        method: 'post',
        url:
            '${_server.address}/api/lists?type=${Uri.encodeComponent(body.type)}',
        body: body.toJson(),
      );

      if (results.statusCode == 201) {
        final lists = Lists.fromJson(jsonDecode(results.body));

        // e.g. UNIQUE constraint failed
        if (lists.processed?.errors.isNotEmpty == true) {
          return SubscriptionsResponse(
            result: APiResponseType.alreadyAdded,
            message: fetchError,
          );
        }

        return SubscriptionsResponse(
          result: APiResponseType.success,
          data: SubscriptionsInfo.fromV6(lists),
        );
      } else {
        return SubscriptionsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SubscriptionsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<SubscriptionsResponse> updateSubscription({
    required SubscriptionRequest body,
  }) async {
    try {
      final results = await httpClient(
        method: 'put',
        url:
            '${_server.address}/api/lists/${Uri.encodeComponent(body.address)}?type=${Uri.encodeComponent(body.type)}',
        body: body.toJson(),
      );

      if (results.statusCode == 200) {
        final lists = Lists.fromJson(jsonDecode(results.body));

        return SubscriptionsResponse(
          result: APiResponseType.success,
          data: SubscriptionsInfo.fromV6(lists),
        );
      } else {
        return SubscriptionsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SubscriptionsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<SearchResponse> searchSubscriptions({
    required String domain,
    bool? partial,
    int? limit,
    bool? debug,
  }) async {
    try {
      final queryParams = <String, String>{};

      if (partial != null) queryParams['partial'] = partial.toString();
      if (limit != null) queryParams['N'] = limit.toString();
      if (debug != null) queryParams['debug'] = debug.toString();

      final uri = Uri.parse(_server.address).replace(
        path: '/api/search/${Uri.encodeComponent(domain)}',
        queryParameters: queryParams.isEmpty ? null : queryParams,
      );

      final results = await httpClient(method: 'get', url: uri.toString());

      if (results.statusCode == 200) {
        final search = Search.fromJson(jsonDecode(results.body));

        return SearchResponse(
          result: APiResponseType.success,
          data: SearchInfo.fromV6(search),
        );
      } else {
        return SearchResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SearchResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<GroupsResponse> getGroups({String? name}) async {
    try {
      var requestUrl = '${_server.address}/api/groups';
      if (name != null) {
        requestUrl += '/${Uri.encodeComponent(name)}';
      }

      final results = await httpClient(method: 'get', url: requestUrl);

      if (results.statusCode == 200) {
        final groups = Groups.fromJson(jsonDecode(results.body));

        return GroupsResponse(
          result: APiResponseType.success,
          data: GroupsInfo.fromV6(groups),
        );
      } else {
        return GroupsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return GroupsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<RemoveGroupResponse> removeGroup({required String name}) async {
    try {
      final requestUrl =
          '${_server.address}/api/groups/${Uri.encodeComponent(name)}';
      final results = await httpClient(method: 'delete', url: requestUrl);

      if (results.statusCode == 204) {
        return RemoveGroupResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return RemoveGroupResponse(
          result: APiResponseType.notFound,
          message: fetchError,
        );
      } else {
        return RemoveGroupResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return RemoveGroupResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<GroupsResponse> createGroup({required GroupRequest body}) async {
    try {
      final results = await httpClient(
        method: 'post',
        url: '${_server.address}/api/groups',
        body: body.toJson(),
      );

      if (results.statusCode == 201) {
        final groups = Groups.fromJson(jsonDecode(results.body));

        if (groups.processed?.errors.isNotEmpty == true) {
          return GroupsResponse(
            result: APiResponseType.alreadyAdded,
            message: fetchError,
          );
        }

        return GroupsResponse(
          result: APiResponseType.success,
          data: GroupsInfo.fromV6(groups),
        );
      } else {
        return GroupsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return GroupsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<GroupsResponse> updateGroup({
    required String name,
    required GroupRequest body,
  }) async {
    try {
      final results = await httpClient(
        method: 'put',
        url: '${_server.address}/api/groups/${Uri.encodeComponent(name)}',
        body: body.toJson(),
      );

      if (results.statusCode == 200) {
        final groups = Groups.fromJson(jsonDecode(results.body));

        return GroupsResponse(
          result: APiResponseType.success,
          data: GroupsInfo.fromV6(groups),
        );
      } else {
        return GroupsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return GroupsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ClientsResponse> getClients({String? client}) async {
    try {
      var requestUrl = '${_server.address}/api/clients';
      if (client != null) {
        requestUrl += '/${Uri.encodeComponent(client)}';
      }

      final results = await httpClient(method: 'get', url: requestUrl);

      if (results.statusCode == 200) {
        final payload = jsonDecode(results.body) as Map<String, dynamic>;
        return ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo.fromV6(Clients.fromJson(payload)),
        );
      } else {
        return ClientsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return ClientsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<RemoveClientResponse> removeClient({required String client}) async {
    try {
      final requestUrl =
          '${_server.address}/api/clients/${Uri.encodeComponent(client)}';
      final results = await httpClient(method: 'delete', url: requestUrl);

      if (results.statusCode == 204) {
        return RemoveClientResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return RemoveClientResponse(
          result: APiResponseType.notFound,
          message: fetchError,
        );
      } else {
        return RemoveClientResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return RemoveClientResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ClientsResponse> createClient({required ClientRequest body}) async {
    try {
      final results = await httpClient(
        method: 'post',
        url: '${_server.address}/api/clients',
        body: body.toJson(),
      );

      if (results.statusCode == 201 || results.statusCode == 200) {
        final payload = jsonDecode(results.body) as Map<String, dynamic>;
        final processed = payload['processed'] as Map<String, dynamic>?;
        final errors = processed?['errors'] as List<dynamic>?;
        if (errors != null && errors.isNotEmpty) {
          return ClientsResponse(
            result: APiResponseType.alreadyAdded,
            message: fetchError,
          );
        }

        return ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo.fromV6(Clients.fromJson(payload)),
        );
      } else {
        return ClientsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return ClientsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ClientsResponse> updateClient({
    required String client,
    required ClientRequest body,
  }) async {
    try {
      final results = await httpClient(
        method: 'put',
        url: '${_server.address}/api/clients/${Uri.encodeComponent(client)}',
        body: body.toJson(includeClient: false),
      );

      if (results.statusCode == 200) {
        final payload = jsonDecode(results.body) as Map<String, dynamic>;
        return ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo.fromV6(Clients.fromJson(payload)),
        );
      } else {
        return ClientsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return ClientsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Stream<GravityResponse> updateGravity() async* {
    try {
      final response = await httpClientStream(
        method: 'POST',
        url: '${_server.address}/api/action/gravity',
      );

      if (response.statusCode == 200) {
        final stream = response.stream.transform(utf8.decoder);
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
            yield GravityResponse(
              result: APiResponseType.progress,
              data: trimmedLines,
            );
          }
        }

        if (buffer.isNotEmpty) {
          yield GravityResponse(
            result: APiResponseType.progress,
            data: [buffer.toString().trimRight()],
          );
        }

        yield GravityResponse(result: APiResponseType.success);
      } else {
        yield GravityResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      yield GravityResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<MessagesResponse> getMessages() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/messages',
      );

      if (results.statusCode == 200) {
        final messages = InfoMessages.fromJson(jsonDecode(results.body));

        return MessagesResponse(
          result: APiResponseType.success,
          data: MessagesInfo.fromV6(messages),
        );
      } else {
        return MessagesResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return MessagesResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<RemoveMessageResponse> removeMessage(int id) async {
    try {
      final results = await httpClient(
        method: 'delete',
        url: '${_server.address}/api/info/messages/$id',
      );

      if (results.statusCode == 204) {
        return RemoveMessageResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return RemoveMessageResponse(
          result: APiResponseType.notFound,
          message: 'Not found',
        );
      } else {
        return RemoveMessageResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return RemoveMessageResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<MetricsResponse> getMetrics() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/metrics',
      );

      if (results.statusCode == 200) {
        final metrics = InfoMetrics.fromJson(jsonDecode(results.body));

        return MetricsResponse(
          result: APiResponseType.success,
          data: MetricsInfo.fromV6(metrics),
        );
      } else {
        return MetricsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return MetricsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<PaddResponse> getPadd({bool? full}) async {
    try {
      var requestUrl = '${_server.address}/api/padd';
      if (full != null) {
        requestUrl += '?full=$full';
      }

      final results = await httpClient(method: 'get', url: requestUrl);

      if (results.statusCode == 200) {
        final info = Padd.fromJson(jsonDecode(results.body));

        return PaddResponse(result: APiResponseType.success, data: info);
      } else {
        return PaddResponse(result: APiResponseType.error, message: fetchError);
      }
    } catch (e) {
      return PaddResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<GatewayResponse> getGateway({bool? isDetailed}) async {
    try {
      final queryParamString = isDetailed == true ? '?detailed=true' : '';
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/network/gateway$queryParamString',
      );

      if (results.statusCode == 200) {
        final gateway = Gateway.fromJson(jsonDecode(results.body));

        return GatewayResponse(
          result: APiResponseType.success,
          data: GatewayInfo.fromV6(gateway),
        );
      } else {
        return GatewayResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return GatewayResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<DevicesResponse> getDevices({
    int? maxDevices,
    int? maxAddresses,
  }) async {
    try {
      final queryParams = <String, String>{};

      if (maxDevices != null) {
        queryParams['max_devices'] = maxDevices.toString();
      } else {
        queryParams['max_devices'] = '999'; // Pi-hole web UI default
      }

      if (maxAddresses != null) {
        queryParams['max_addresses'] = maxAddresses.toString();
      } else {
        queryParams['max_addresses'] = '25'; // Pi-hole web UI default
      }

      final uri = Uri.parse(
        '${_server.address}/api/network/devices',
      ).replace(queryParameters: queryParams.isEmpty ? null : queryParams);

      final results = await httpClient(method: 'get', url: uri.toString());

      if (results.statusCode == 200) {
        final devices = Devices.fromJson(jsonDecode(results.body));

        return DevicesResponse(
          result: APiResponseType.success,
          data: DevicesInfo.fromV6(devices),
        );
      } else {
        return DevicesResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return DevicesResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<DeleteDeviceResponse> deleteDevice(int id) async {
    try {
      final results = await httpClient(
        method: 'delete',
        url: '${_server.address}/api/network/devices/$id',
      );

      if (results.statusCode == 204) {
        return DeleteDeviceResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return DeleteDeviceResponse(
          result: APiResponseType.notFound,
          message: 'Not found',
        );
      } else {
        return DeleteDeviceResponse(
          result: APiResponseType.error,
          message: deleteError,
        );
      }
    } catch (e) {
      return DeleteDeviceResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ConfigurationResponse> getConfiguration({
    String? element,
    bool? isDetailed,
  }) async {
    try {
      var elem = '';
      if (element != null && element.startsWith('/')) {
        elem = element.substring(1);
      } else {
        elem = element ?? '';
      }

      if (isDetailed == true) {
        return ConfigurationResponse(
          result: APiResponseType.error,
          message: notImplementedError,
        );
      }
      final queryParamString = isDetailed == true ? '?detailed=true' : '';
      final results = await httpClient(
        method: 'get',
        url:
            '${_server.address}/api/config/${Uri.encodeComponent(elem)}$queryParamString',
      );

      if (results.statusCode == 200) {
        final config = Config.fromJson(jsonDecode(results.body));

        return ConfigurationResponse(
          result: APiResponseType.success,
          data: ConfigInfo.fromV6(config),
        );
      } else {
        return ConfigurationResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return ConfigurationResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ConfigurationResponse> patchConfiguration(
    ConfigData body, {
    bool isRestart = true,
  }) async {
    try {
      final results = await httpClient(
        method: 'patch',
        url: '${_server.address}/api/config?restart=$isRestart',
        body: {'config': body.toJson()},
      );

      if (results.statusCode == 200) {
        final config = Config.fromJson(jsonDecode(results.body));

        return ConfigurationResponse(
          result: APiResponseType.success,
          data: ConfigInfo.fromV6(config),
        );
      } else {
        return ConfigurationResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return ConfigurationResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<DeleteConfigResponse> deleteConfiguration({
    required String element,
    required String value,
    bool isRestart = true,
  }) async {
    try {
      final results = await httpClient(
        method: 'delete',
        url:
            '${_server.address}/api/config/${Uri.encodeComponent(element)}/${Uri.encodeComponent(value)}?restart=$isRestart',
      );

      if (results.statusCode == 204) {
        return DeleteConfigResponse(result: APiResponseType.success);
      } else {
        return DeleteConfigResponse(
          result: APiResponseType.error,
          message: deleteError,
        );
      }
    } catch (e) {
      return DeleteConfigResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<PutConfigResponse> putConfiguration({
    required String element,
    required String value,
    bool isRestart = true,
  }) async {
    try {
      final results = await httpClient(
        method: 'put',
        url:
            '${_server.address}/api/config/${Uri.encodeComponent(element)}/${Uri.encodeComponent(value)}?restart=$isRestart',
      );

      if (results.statusCode == 201) {
        return PutConfigResponse(result: APiResponseType.success);
      } else {
        return PutConfigResponse(
          result: APiResponseType.error,
          message: putError,
        );
      }
    } catch (e) {
      return PutConfigResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ConfigurationResponse> patchDnsQueryLoggingConfig(
    bool status, {
    bool isRestart = true,
  }) async {
    return patchConfiguration(
      ConfigData(dns: Dns(queryLogging: status)),
      isRestart: isRestart,
    );
  }

  @override
  Future<LocalDnsResponse> getLocalDns() async {
    final resp = await getConfiguration(element: 'dns/hosts');

    if (resp.result == APiResponseType.success) {
      final hosts = resp.data?.dns?.hosts ?? [];

      return LocalDnsResponse(
        result: APiResponseType.success,
        data: hosts.map((e) {
          final parts = e.split(' ');
          return LocalDns(
            ip: parts.isNotEmpty ? parts.first : '',
            name: parts.length > 1 ? parts.sublist(1).join(' ') : '',
          );
        }).toList(),
      );
    } else {
      return LocalDnsResponse(result: resp.result, message: resp.message);
    }
  }

  @override
  Future<AddLocalDnsResponse> addLocalDns({
    required String ip,
    required String name,
    bool isRestart = true,
  }) async {
    final resp = await putConfiguration(
      element: 'dns/hosts',
      value: '$ip $name',
      isRestart: isRestart,
    );

    if (resp.result == APiResponseType.success) {
      return AddLocalDnsResponse(result: APiResponseType.success);
    } else {
      return AddLocalDnsResponse(result: resp.result, message: resp.message);
    }
  }

  @override
  Future<LocalDnsResponse> updateLocalDns({
    required String ip,
    required String name,
    bool isRestart = true,
    String? oldIp,
  }) async {
    // TODO: 1. Get, 2: Delete oldIP, 3: Add new IP

    // 1. Get current local DNS entries
    final currentResp = await getLocalDns();

    if (currentResp.result != APiResponseType.success) {
      return LocalDnsResponse(
        result: currentResp.result,
        message: currentResp.message,
      );
    }

    // 2. Prepare updated local DNS entries
    final currentHosts = currentResp.data ?? [];
    final existingIndex = currentHosts.indexWhere(
      (element) => element.ip == (oldIp ?? ip),
    );

    if (existingIndex != -1) {
      // Update existing entry
      currentHosts[existingIndex] = LocalDns(ip: ip, name: name);
    } else {
      // Add new entry
      currentHosts.add(LocalDns(ip: ip, name: name));
    }

    final newHosts = currentHosts.map((e) => '${e.ip} ${e.name}').toList();

    // 3. Update the configuration
    final configResp = await patchConfiguration(
      ConfigData(dns: Dns(hosts: newHosts)),
      isRestart: isRestart,
    );

    if (configResp.result == APiResponseType.success) {
      return LocalDnsResponse(
        result: APiResponseType.success,
        data: currentHosts,
      );
    } else {
      return LocalDnsResponse(
        result: configResp.result,
        message: configResp.message,
      );
    }
  }

  @override
  Future<DeleteLocalDnsResponse> deleteLocalDns({
    required String ip,
    required String name,
    bool isRestart = true,
  }) async {
    final resp = await deleteConfiguration(
      element: 'dns/hosts',
      value: '$ip $name',
      isRestart: isRestart,
    );

    if (resp.result == APiResponseType.success) {
      return DeleteLocalDnsResponse(result: APiResponseType.success);
    } else {
      return DeleteLocalDnsResponse(result: resp.result, message: resp.message);
    }
  }

  @override
  Future<ActionResponse> flushArp() async {
    try {
      final results = await httpClient(
        method: 'post',
        url: '${_server.address}/api/action/flush/arp',
      );

      if (results.statusCode == 200) {
        final action = Action.fromJson(jsonDecode(results.body));

        return ActionResponse(
          result: APiResponseType.success,
          data: action.status,
        );
      } else {
        logger.e('Flush ARP failed: ${results.statusCode} - ${results.body}');
        return ActionResponse(
          result: APiResponseType.error,
          message: postError,
        );
      }
    } catch (e) {
      return ActionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ActionResponse> flushNetwork() async {
    try {
      final results = await httpClient(
        method: 'post',
        url: '${_server.address}/api/action/flush/network',
      );

      if (results.statusCode == 200) {
        final action = Action.fromJson(jsonDecode(results.body));

        return ActionResponse(
          result: APiResponseType.success,
          data: action.status,
        );
      } else if (results.statusCode == 404) {
        // Pi-hole < v6.3
        return ActionResponse(
          result: APiResponseType.notFound,
          message: 'Flush network is not supported on this Pi-hole version.',
        );
      } else {
        logger.e(
          'Flush Network failed: ${results.statusCode} - ${results.body}',
        );
        return ActionResponse(
          result: APiResponseType.error,
          message: postError,
        );
      }
    } catch (e) {
      return ActionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ActionResponse> flushLogs() async {
    try {
      final results = await httpClient(
        method: 'post',
        url: '${_server.address}/api/action/flush/logs',
      );

      if (results.statusCode == 200) {
        final action = Action.fromJson(jsonDecode(results.body));

        return ActionResponse(
          result: APiResponseType.success,
          data: action.status,
        );
      } else {
        logger.e('Flush logs failed: ${results.statusCode} - ${results.body}');
        return ActionResponse(
          result: APiResponseType.error,
          message: postError,
        );
      }
    } catch (e) {
      return ActionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ActionResponse> restartDns() async {
    try {
      final results = await httpClient(
        method: 'post',
        url: '${_server.address}/api/action/restartdns',
      );

      if (results.statusCode == 200) {
        final action = Action.fromJson(jsonDecode(results.body));

        return ActionResponse(
          result: APiResponseType.success,
          data: action.status,
        );
      } else {
        logger.e(
          'Failed to restart DNS: ${results.statusCode} - ${results.body}',
        );
        return ActionResponse(
          result: APiResponseType.error,
          message: postError,
        );
      }
    } catch (e) {
      return ActionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<SessionsResponse> getSessions() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/auth/sessions',
      );

      if (results.statusCode == 200) {
        final sessions = AuthSessions.fromJson(jsonDecode(results.body));

        return SessionsResponse(
          result: APiResponseType.success,
          data: SessionsInfo.fromV6(sessions),
        );
      } else {
        return SessionsResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return SessionsResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<DeleteSessionResponse> deleteSession(int id) async {
    try {
      final results = await httpClient(
        method: 'delete',
        url: '${_server.address}/api/auth/session/$id',
      );

      if (results.statusCode == 204) {
        return DeleteSessionResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return DeleteSessionResponse(
          result: APiResponseType.notFound,
          message: 'Session not found',
        );
      } else {
        return DeleteSessionResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return DeleteSessionResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<ClientResponse> getClient() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/info/client',
      );

      if (results.statusCode == 200) {
        final client = InfoClient.fromJson(jsonDecode(results.body));

        return ClientResponse(
          result: APiResponseType.success,
          data: ClientInfo.fromV6(client),
        );
      } else {
        return ClientResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return ClientResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<DhcpResponse> getDhcps() async {
    try {
      final results = await httpClient(
        method: 'get',
        url: '${_server.address}/api/dhcp/leases',
      );

      if (results.statusCode == 200) {
        final dhcp = Dhcp.fromJson(jsonDecode(results.body));

        return DhcpResponse(
          result: APiResponseType.success,
          data: DhcpsInfo.fromV6(dhcp),
        );
      } else {
        return DhcpResponse(result: APiResponseType.error, message: fetchError);
      }
    } catch (e) {
      return DhcpResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }

  @override
  Future<DeleteDhcpResponse> deleteDhcp(String ip) async {
    try {
      final results = await httpClient(
        method: 'delete',
        url: '${_server.address}/api/dhcp/leases/$ip',
      );

      if (results.statusCode == 204) {
        return DeleteDhcpResponse(result: APiResponseType.success);
      } else if (results.statusCode == 404) {
        return DeleteDhcpResponse(
          result: APiResponseType.notFound,
          message: 'Lease not found',
        );
      } else {
        return DeleteDhcpResponse(
          result: APiResponseType.error,
          message: fetchError,
        );
      }
    } catch (e) {
      return DeleteDhcpResponse(
        result: APiResponseType.error,
        message: unexpectedError,
      );
    }
  }
}
