import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/functions/convert.dart';
import 'package:pi_hole_client/models/api/v6/auth/auth.dart';
import 'package:pi_hole_client/models/api/v6/dns/dns.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/functions/encode_basic_auth.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/functions/logger.dart';

class ApiGatewayV6 implements ApiGateway {
  final Server server;
  final http.Client client;
  String? sid;

  /// Creates a new instance of the `ApiGatewayV5` class.
  ///
  /// Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `client` (`http.Client`): An optional HTTP client to use for requests. If not provided, a new client will be created. Add for testing purposes.
  ApiGatewayV6(this.server, {http.Client? client})
      : client = client ?? http.Client();

  /// Sends an HTTP request using the specified method and parameters.
  ///
  /// Parameters:
  /// - [method] The HTTP method to use (e.g., 'GET', 'POST').
  /// - [apiKey] The API key to use for authentication. Use v5 only.
  /// - [url] The URL to send the request to.
  /// - [headers] The headers to send with the request.
  /// - [body] The body of the request.
  /// - [timeout] The timeout for the request in seconds. Default is 10 seconds.
  /// - [sid] The session ID for the request.
  ///
  /// Returns
  /// - A `Response` object containing the response from the server.
  ///
  /// Exceptions:
  /// - Throws a `TimeoutException` if the request times out.
  Future<Response> httpClient({
    /// The HTTP method to use
    required String method,

    /// The URL to send the request to
    required String url,

    /// The headers to send with the request
    Map<String, String>? headers,

    /// The body of the request
    Map<String, dynamic>? body,

    /// The timeout for the request. Default is 10 seconds
    int timeout = 10,

    /// The number of times to retry the request if 401. Default is 1
    int maxRetries = 1,
  }) async {
    final Map<String, String> authHeaders = headers != null ? {...headers} : {};
    authHeaders['Content-Type'] = 'application/json';
    if (sid != null && sid!.isNotEmpty) {
      authHeaders['X-FTL-SID'] = sid!;
    }

    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      final response = await _sendRequest(
        method: method,
        url: url,
        headers: authHeaders,
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

    throw Exception("Failed to execute HTTP request");
  }

  Future<Response> _sendRequest({
    required String method,
    required String url,
    required Map<String, String> headers,
    Map<String, dynamic>? body,
    required int timeout,
  }) async {
    switch (method.toUpperCase()) {
      case 'POST':
        return await client
            .post(Uri.parse(url),
                headers: headers, body: body != null ? jsonEncode(body) : null)
            .timeout(Duration(seconds: timeout));

      case 'PUT':
        return await client
            .put(Uri.parse(url),
                headers: headers, body: body != null ? jsonEncode(body) : null)
            .timeout(Duration(seconds: timeout));

      case 'PATCH':
        return await client
            .patch(Uri.parse(url),
                headers: headers, body: body != null ? jsonEncode(body) : null)
            .timeout(Duration(seconds: timeout));

      case 'DELETE':
        return await client
            .delete(Uri.parse(url), headers: headers)
            .timeout(Duration(seconds: timeout));

      case 'GET':
      default:
        return await client
            .get(Uri.parse(url), headers: headers)
            .timeout(Duration(seconds: timeout));
    }
  }

  /// Handles the login process to a Pi-hole server using its API.
  ///
  /// This function performs the following steps:
  /// 1. Sends a GET request to verify the server's current status using the provided `address` and `token`.
  /// 2. Toggles the Pi-hole's status between enabled and disabled depending on the current status.
  /// 3. Validates the response to determine the success or failure of the login attempt.
  @override
  Future<LoginQueryResponse> loginQuery() async {
    try {
      final status = await httpClient(
        method: 'post',
        url: '${server.address}/api/auth',
        body: {'password': server.password},
        maxRetries: 0,
      );

      // Login
      if (status.statusCode == 200) {
        final statusParsed = Session.fromJson(jsonDecode(status.body));
        sid = statusParsed.session.sid;

        // Get DNS blocking status
        final enableOrDisable = await httpClient(
            method: 'get', url: '${server.address}/api/dns/blocking');
        if (enableOrDisable.statusCode == 200) {
          final enableOrDisableParsed =
              Blocking.fromJson(jsonDecode(enableOrDisable.body));
          return LoginQueryResponse(
              result: APiResponseType.success,
              status: enableOrDisableParsed.blocking,
              sid: sid);
        } else {
          return LoginQueryResponse(
              result: APiResponseType.authError,
              log: AppLog(
                  type: 'login',
                  dateTime: DateTime.now(),
                  statusCode: status.statusCode.toString(),
                  message: 'auth_error_1',
                  resBody: status.body));
        }
      } else if (status.statusCode == 404) {
        return LoginQueryResponse(
            result: APiResponseType.noConnection,
            log: AppLog(
                type: 'login',
                dateTime: DateTime.now(),
                statusCode: status.statusCode.toString(),
                message: 'no_connection_2',
                resBody: status.body));
      } else {
        return LoginQueryResponse(
            result: APiResponseType.authError,
            log: AppLog(
                type: 'login',
                dateTime: DateTime.now(),
                statusCode: status.statusCode.toString(),
                message: 'auth_error',
                resBody: status.body));
      }
    } on SocketException {
      return LoginQueryResponse(
          result: APiResponseType.socket,
          log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'SocketException'));
    } on TimeoutException {
      return LoginQueryResponse(
          result: APiResponseType.timeout,
          log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'TimeoutException'));
    } on HandshakeException {
      return LoginQueryResponse(
          result: APiResponseType.sslError,
          log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'HandshakeException'));
    } on FormatException {
      return LoginQueryResponse(
          result: APiResponseType.authError,
          log: AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              message: 'FormatException'));
    } catch (e) {
      return LoginQueryResponse(
          result: APiResponseType.error,
          log: AppLog(
              type: 'login', dateTime: DateTime.now(), message: e.toString()));
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
    throw UnimplementedError();
  }

  /// Disables a Pi-hole server
  ///
  /// This method sends a GET request to the specified Pi-hole server to disable
  @override
  Future<DisableServerResponse> disableServerRequest(int time) async {
    throw UnimplementedError();
  }

  /// Enables a Pi-hole server
  ///
  /// This method sends a GET request to the specified Pi-hole server to enable
  @override
  Future<EnableServerResponse> enableServerRequest() async {
    throw UnimplementedError();
  }

  /// Fetches over-time data from a Pi-hole server.
  ///
  /// This method retrieves various over-time data points from the specified
  /// Pi-hole server, including queries over time (in 10-minute intervals), client
  /// activity, and client names. The data is parsed and returned in a structured format.
  @override
  Future<FetchOverTimeDataResponse> fetchOverTimeData() async {
    throw UnimplementedError();
  }

  /// Fetches log data from a Pi-hole server within a specified time range.
  ///
  /// This method retrieves query logs from the given Pi-hole server for a
  /// specified time period. The logs are returned in a structured format
  /// for further analysis or display.
  @override
  Future<FetchLogsResponse> fetchLogs(DateTime from, DateTime until) async {
    throw UnimplementedError();
  }

  /// Adds a domain to the whitelist or blacklist on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to add the specified domain
  /// to either the whitelist or the blacklist, depending on the provided `list` parameter.
  /// It validates the server's response to confirm the operation's success.
  @override
  Future<SetWhiteBlacklistResponse> setWhiteBlacklist(
      String domain, String list) async {
    throw UnimplementedError();
  }

  /// Fetches domain lists (whitelist, blacklist, and regex-based lists) from a Pi-hole server.
  ///
  /// This method retrieves the whitelist, regex whitelist, blacklist, and regex blacklist
  /// from the specified Pi-hole server. Each list is processed and returned in a structured format.
  @override
  Future<GetDomainLists> getDomainLists() async {
    throw UnimplementedError();
  }

  /// Removes a domain from a specific list on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to remove the specified domain
  /// from the given list, which can be one of the following: whitelist, blacklist,
  /// regex whitelist, or regex blacklist. The operation's success or failure is determined
  /// by the server's response.
  @override
  Future<RemoveDomainFromListResponse> removeDomainFromList(
      Domain domain) async {
    throw UnimplementedError();
  }

  /// Adds a domain to a specified list on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to add a domain to a specified list,
  /// such as the whitelist, blacklist, regex whitelist, or regex blacklist. It checks the server's
  /// response to determine whether the operation was successful or if the domain already exists
  /// in the list.
  @override
  Future<AddDomainToListResponse> addDomainToList(
      Map<String, dynamic> domainData) async {
    throw UnimplementedError();
  }
}
