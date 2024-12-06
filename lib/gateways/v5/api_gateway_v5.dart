import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/functions/encode_basic_auth.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/functions/logger.dart';

class ApiGatewayV5 implements ApiGateway {
  final Server server;
  final http.Client client;

  /// Creates a new instance of the `ApiGatewayV5` class.
  ///
  /// Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `client` (`http.Client`): An optional HTTP client to use for requests. If not provided, a new client will be created. Add for testing purposes.
  ApiGatewayV5(this.server, {http.Client? client})
      : client = client ?? http.Client();

  /// Checks if both the username and password are non-null and non-empty.
  ///
  /// Parameters:
  ///   - username: The username to check.
  ///   - password: The password to check.
  ///
  /// Returns:
  /// - `true` if both the username and password are provided and not empty,
  /// `false` otherwise.
  bool checkBasicAuth(String? username, String? password) {
    if (username != null &&
        password != null &&
        username != '' &&
        password != '') {
      return true;
    } else {
      return false;
    }
  }

  /// Sends an HTTP request using the specified method and parameters.
  ///
  /// Parameters:
  /// - [method] The HTTP method to use (e.g., 'GET', 'POST').
  /// - [apiKey] The API key to use for authentication. Use v5 only.
  /// - [url] The URL to send the request to.
  /// - [headers] The headers to send with the request.
  /// - [body] The body of the request.
  /// - [timeout] The timeout for the request in seconds. Default is 10 seconds.
  /// - [basicAuth] Basic authentication `username` and `password`.
  ///
  /// Returns
  /// - A `Response` object containing the response from the server.
  ///
  /// Exceptions:
  /// - Throws a `TimeoutException` if the request times out.
  Future<Response> httpClient({
    /// The HTTP method to use
    required String method,

    /// The API key to use for authentication. Use v5 only
    String? apiKey,

    /// The URL to send the request to
    required String url,

    /// The headers to send with the request
    Map<String, String>? headers,

    /// The body of the request
    Map<String, dynamic>? body,

    /// The timeout for the request. Default is 10 seconds
    int timeout = 10,

    /// The basic authentication credentials to use for authentication
    Map<String, dynamic>? basicAuth,
  }) async {
    final Map<String, String> authHeaders = headers != null ? {...headers} : {};

    if (basicAuth != null &&
        checkBasicAuth(basicAuth['username'], basicAuth['password'])) {
      authHeaders['Authorization'] =
          'Basic ${encodeBasicAuth(basicAuth['username'], basicAuth['password'])}';
    }

    switch (method.toUpperCase()) {
      case 'POST':
        return await client
            .post(Uri.parse(url), headers: authHeaders, body: body)
            .timeout(Duration(seconds: timeout));

      case 'GET':
      default:
        return await client
            .get(Uri.parse(url), headers: authHeaders)
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
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&summaryRaw',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      if (status.statusCode == 200) {
        final statusParsed = jsonDecode(status.body);
        if (statusParsed.runtimeType != List &&
            statusParsed['status'] != null) {
          final enableOrDisable = await httpClient(
              method: 'get',
              url: statusParsed['status'] == 'enabled'
                  ? '${server.address}/admin/api.php?auth=${server.token}&enable=0'
                  : '${server.address}/admin/api.php?auth=${server.token}&disable=0',
              basicAuth: {
                'username': server.basicAuthUser,
                'password': server.basicAuthPassword
              });
          if (enableOrDisable.statusCode == 200) {
            if (enableOrDisable.body == 'Not authorized!' ||
                enableOrDisable.body ==
                    'Session expired! Please re-login on the Pi-hole dashboard.' ||
                //  enableOrDisable.body == []) {
                enableOrDisable.body.isEmpty) {
              logger.i(enableOrDisable.body);
              return LoginQueryResponse(
                  result: APiResponseType.authError,
                  log: AppLog(
                      type: 'login',
                      dateTime: DateTime.now(),
                      statusCode: status.statusCode.toString(),
                      message: 'auth_error_1',
                      resBody: status.body));
            } else {
              final enableOrDisableParsed = jsonDecode(enableOrDisable.body);
              if (enableOrDisableParsed.runtimeType != List) {
                final phpSessId = enableOrDisable.headers['set-cookie']!
                    .split(';')[0]
                    .split('=')[1];
                return LoginQueryResponse(
                    result: APiResponseType.success,
                    status: statusParsed['status'],
                    phpSessId: phpSessId);
              } else {
                return LoginQueryResponse(
                    result: APiResponseType.authError,
                    log: AppLog(
                        type: 'login',
                        dateTime: DateTime.now(),
                        statusCode: status.statusCode.toString(),
                        message: 'auth_error_2',
                        resBody: status.body));
              }
            }
          } else {
            return LoginQueryResponse(
                result: APiResponseType.authError,
                log: AppLog(
                    type: 'login',
                    dateTime: DateTime.now(),
                    statusCode: status.statusCode.toString(),
                    message: 'auth_error_3',
                    resBody: status.body));
          }
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
      } else {
        return LoginQueryResponse(
            result: APiResponseType.noConnection,
            log: AppLog(
                type: 'login',
                dateTime: DateTime.now(),
                statusCode: status.statusCode.toString(),
                message: 'no_connection_2',
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
    try {
      final response = await httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      if (body['status'] != null) {
        return RealtimeStatusResponse(
            result: APiResponseType.success,
            data: RealtimeStatus.fromJson(body));
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
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&disable=$time',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      if (body.runtimeType != List && body['status'] != null) {
        return DisableServerResponse(
            result: APiResponseType.success, status: body['status']);
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
          method: 'get',
          url: '${server.address}/admin/api.php?auth=${server.token}&enable',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      if (body.runtimeType != List && body['status'] != null) {
        return EnableServerResponse(
            result: APiResponseType.success, status: body['status']);
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
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `socket`, `timeout`, `ssl_error`, `error`).
  ///   - `data`: An `OverTimeData` object containing the server's over-time data if the operation is successful.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  // TODO: Hardcoded 10 minutes? The error occuer if the time is set anything other than 10 minutes.
  @override
  Future<FetchOverTimeDataResponse> fetchOverTimeData() async {
    try {
      final response = await httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&overTimeData10mins&overTimeDataClients&getClientNames',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      var data = OverTimeData.fromJson(body);
      return FetchOverTimeDataResponse(
          result: APiResponseType.success, data: data);
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
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `from` (`DateTime`): The start date and time for the log data.
  /// - `until` (`DateTime`): The end date and time for the log data.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `token`, `socket`, `timeout`, `ssl_error`, `error`).
  ///   - `data`: A list of log entries if the operation is successful.
  ///
  /// ### Exceptions:
  /// - `FormatException`: Malformed response body or unexpected data format.
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  @override
  Future fetchLogs(DateTime from, DateTime until) async {
    try {
      final response = await httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&getAllQueries&from=${from.millisecondsSinceEpoch ~/ 1000}&until=${until.millisecondsSinceEpoch ~/ 1000}',
          timeout: 20,
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      return {'result': 'success', 'data': body['data']};
    } on FormatException {
      return {'result': 'token'};
    } on SocketException {
      return {'result': 'socket'};
    } on TimeoutException {
      return {'result': 'timeout'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } catch (e) {
      return {'result': 'error'};
    }
  }

  /// Adds a domain to the whitelist or blacklist on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to add the specified domain
  /// to either the whitelist or the blacklist, depending on the provided `list` parameter.
  /// It validates the server's response to confirm the operation's success.
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `domain` (`String`): The domain to add to the whitelist or blacklist.
  /// - `list` (`String`): The list to add the domain to (`white` or `black`).
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `socket`, `timeout`, `ssl_error`, `error`).
  ///   - `data`: The server's response data if the operation is successful.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  @override
  Future setWhiteBlacklist(String domain, String list) async {
    try {
      final response = await httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&list=$list&add=$domain',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.runtimeType == List<dynamic>) {
          return {'result': 'error', 'message': 'not_exists'};
        } else {
          if (json['success'] == true) {
            return {'result': 'success', 'data': json};
          } else {
            return {'result': 'error'};
          }
        }
      } else {
        return {'result': 'error'};
      }
    } on SocketException {
      return {'result': 'socket'};
    } on TimeoutException {
      return {'result': 'timeout'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } catch (e) {
      return {'result': 'error'};
    }
  }

  /// Fetches domain lists (whitelist, blacklist, and regex-based lists) from a Pi-hole server.
  ///
  /// This method retrieves the whitelist, regex whitelist, blacklist, and regex blacklist
  /// from the specified Pi-hole server. Each list is processed and returned in a structured format.
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `no_connection`, `ssl_error`, `auth_error`, `error`).
  ///   - `data`: A map containing the following
  ///     - `whitelist`: A list of `Domain` objects representing the whitelist.
  ///     - `whitelistRegex`: A list of `Domain` objects representing the regex whitelist.
  ///     - `blacklist`: A list of `Domain` objects representing the blacklist.
  ///     - `blacklistRegex`: A list of `Domain` objects representing the regex blacklist.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - `FormatException`: Malformed response body or unexpected data format.
  /// - General exceptions: Any other errors encountered during execution.
  @override
  Future getDomainLists() async {
    Map<String, String>? headers;
    if (checkBasicAuth(server.basicAuthUser, server.basicAuthPassword) ==
        true) {
      headers = {
        'Authorization':
            'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
      };
    }

    try {
      final results = await Future.wait([
        httpClient(
            method: 'get',
            url:
                '${server.address}/admin/api.php?auth=${server.token}&list=white',
            headers: headers),
        httpClient(
            method: 'get',
            url:
                '${server.address}/admin/api.php?auth=${server.token}&list=regex_white',
            headers: headers),
        httpClient(
            method: 'get',
            url:
                '${server.address}/admin/api.php?auth=${server.token}&list=black',
            headers: headers),
        httpClient(
            method: 'get',
            url:
                '${server.address}/admin/api.php?auth=${server.token}&list=regex_black',
            headers: headers),
      ]);

      if (results[0].statusCode == 200 &&
          results[1].statusCode == 200 &&
          results[2].statusCode == 200 &&
          results[3].statusCode == 200) {
        return {
          'result': 'success',
          'data': {
            'whitelist': jsonDecode(results[0].body)['data']
                .map((item) => Domain.fromJson(item)),
            'whitelistRegex': jsonDecode(results[1].body)['data']
                .map((item) => Domain.fromJson(item)),
            'blacklist': jsonDecode(results[2].body)['data']
                .map((item) => Domain.fromJson(item)),
            'blacklistRegex': jsonDecode(results[3].body)['data']
                .map((item) => Domain.fromJson(item)),
          }
        };
      } else {
        return {'result': 'error'};
      }
    } on SocketException {
      return {'result': 'no_connection'};
    } on TimeoutException {
      return {'result': 'no_connection'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } on FormatException {
      return {'result': 'auth_error'};
    } catch (e) {
      return {'result': 'error'};
    }
  }

  /// Removes a domain from a specific list on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to remove the specified domain
  /// from the given list, which can be one of the following: whitelist, blacklist,
  /// regex whitelist, or regex blacklist. The operation's success or failure is determined
  /// by the server's response.
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `domain` (`Domain`): The domain object to remove from the list.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `not_exists`, `socket`, `timeout`, `ssl_error`, `error`).
  ///   - `message`: A string indicating the reason for the operation's outcome.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  @override
  Future removeDomainFromList(Domain domain) async {
    String getType(int type) {
      switch (type) {
        case 0:
          return "white";

        case 1:
          return "black";

        case 2:
          return "regex_white";

        case 3:
          return "regex_black";

        default:
          return "";
      }
    }

    try {
      final response = await httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&list=${getType(domain.type)}&sub=${domain.domain}',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.runtimeType == List<dynamic>) {
          return {'result': 'error', 'message': 'not_exists'};
        } else {
          if (json['success'] == true) {
            return {'result': 'success'};
          } else {
            return {'result': 'error'};
          }
        }
      } else {
        return {'result': 'error'};
      }
    } on SocketException {
      return {'result': 'socket'};
    } on TimeoutException {
      return {'result': 'timeout'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } catch (e) {
      return {'result': 'error'};
    }
  }

  /// Adds a domain to a specified list on a Pi-hole server.
  ///
  /// This method interacts with the Pi-hole server's API to add a domain to a specified list,
  /// such as the whitelist, blacklist, regex whitelist, or regex blacklist. It checks the server's
  /// response to determine whether the operation was successful or if the domain already exists
  /// in the list.
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `domainData` (`Map<String, dynamic>`): A map containing the following keys
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `already_added`, `no_connection`, `ssl_error`, `auth_error`, `error`).
  @override
  Future addDomainToList(Map<String, dynamic> domainData) async {
    try {
      final response = await httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&list=${domainData['list']}&add=${domainData['domain']}',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.runtimeType == List<dynamic>) {
          return {'result': 'error'};
        } else {
          if (json['success'] == true &&
              json['message'] == 'Added ${domainData['domain']}') {
            return {'result': 'success'};
          } else if (json['success'] == true &&
              json['message'] ==
                  'Not adding ${domainData['domain']} as it is already on the list') {
            return {'result': 'already_added'};
          } else {
            return {'result': 'error'};
          }
        }
      } else {
        return {'result': 'error'};
      }
    } on SocketException {
      return {'result': 'no_connection'};
    } on TimeoutException {
      return {'result': 'no_connection'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } on FormatException {
      return {'result': 'auth_error'};
    } catch (e) {
      return {'result': 'error'};
    }
  }
}
