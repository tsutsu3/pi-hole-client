import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/functions/encode_basic_auth.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/models/app_log.dart';

abstract interface class ApiGateway {
  /// Fetches real-time status information from a Pi-hole server.
  Future realtimeStatus(Server server);

  /// Disables a Pi-hole server
  dynamic disableServerRequest(Server server, int time);

  /// Enables a Pi-hole server
  dynamic enableServerRequest(Server server);

  /// Fetches over-time data from a Pi-hole server.
  Future fetchOverTimeData(Server server);

  /// Fetches log data from a Pi-hole server within a specified time range.
  Future fetchLogs({
    required Server server,
    required DateTime from,
    required DateTime until,
  });

  /// Adds a domain to the whitelist or blacklist on a Pi-hole server.
  Future setWhiteBlacklist({
    required Server server,
    required String domain,
    required String list,
  });

  /// Fetches domain lists (whitelist, blacklist, and regex-based lists) from a Pi-hole server.
  Future getDomainLists({required Server server});

  /// Removes a domain from a specific list on a Pi-hole server.
  Future removeDomainFromList({required Server server, required Domain domain});

  /// Adds a domain to a specified list on a Pi-hole server.
  Future addDomainToList({
    required Server server,
    required Map<String, dynamic> domainData,
  });

  /// Checks if both the username and password are non-null and non-empty.
  ///
  /// Parameters:
  ///   - username: The username to check.
  ///   - password: The password to check.
  ///
  /// Returns:
  /// - `true` if both the username and password are provided and not empty,
  /// `false` otherwise.
  static bool checkBasicAuth(String? username, String? password) {
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
  static Future<Response> httpClient({
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
        return await http
            .post(Uri.parse(url), headers: authHeaders, body: body)
            .timeout(Duration(seconds: timeout));

      case 'GET':
      default:
        return await http
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
  ///
  /// It returns a `Map` containing the result of the operation and, in case of failure, a detailed log.
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys:
  ///   - `result`: A string indicating the outcome of the operation (`success`, `auth_error`, `no_connection`, etc.).
  ///   - `status`: The current Pi-hole status (`enabled` or `disabled`) if the login is successful.
  ///   - `phpSessId`: The PHP session ID if the login is successful.
  ///   - `log` (`AppLog`): Detailed log information in case of errors or unexpected responses.
  ///
  /// #### Possible results:
  /// - `success`: The login was successful, and the server's status was toggled.
  /// - `auth_error`: There was an authentication error.
  /// - `no_connection`: The server could not be reached.
  /// - `socket`: A `SocketException` occurred.
  /// - `timeout`: A `TimeoutException` occurred.
  /// - `ssl_error`: A `HandshakeException` occurred.
  /// - `error`: A general error occurred.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - `FormatException`: Malformed response body or unexpected data format.
  /// - General exceptions: Any other errors encountered during execution.
  static Future loginQuery(Server server) async {
    try {
      final status = await http.get(
          Uri.parse(
              '${server.address}/admin/api.php?auth=${server.token}&summaryRaw'),
          headers:
              checkBasicAuth(server.basicAuthUser, server.basicAuthPassword) ==
                      true
                  ? {
                      'Authorization':
                          'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
                    }
                  : null);
      if (status.statusCode == 200) {
        final statusParsed = jsonDecode(status.body);
        if (statusParsed.runtimeType != List &&
            statusParsed['status'] != null) {
          final enableOrDisable = await http.get(
              Uri.parse(statusParsed['status'] == 'enabled'
                  ? '${server.address}/admin/api.php?auth=${server.token}&enable=0'
                  : '${server.address}/admin/api.php?auth=${server.token}&disable=0'),
              headers: checkBasicAuth(
                          server.basicAuthUser, server.basicAuthPassword) ==
                      true
                  ? {
                      'Authorization':
                          'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
                    }
                  : null);
          if (enableOrDisable.statusCode == 200) {
            if (enableOrDisable.body == 'Not authorized!' ||
                enableOrDisable.body ==
                    'Session expired! Please re-login on the Pi-hole dashboard.' ||
                //  enableOrDisable.body == []) {
                enableOrDisable.body.isEmpty) {
              logger.i(enableOrDisable.body);
              return {
                'result': 'auth_error',
                'log': AppLog(
                    type: 'login',
                    dateTime: DateTime.now(),
                    statusCode: status.statusCode.toString(),
                    message: 'auth_error_1',
                    resBody: status.body)
              };
            } else {
              final enableOrDisableParsed = jsonDecode(enableOrDisable.body);
              if (enableOrDisableParsed.runtimeType != List) {
                final phpSessId = enableOrDisable.headers['set-cookie']!
                    .split(';')[0]
                    .split('=')[1];
                return {
                  'result': 'success',
                  'status': statusParsed['status'],
                  'phpSessId': phpSessId,
                };
              } else {
                return {
                  'result': 'auth_error',
                  'log': AppLog(
                      type: 'login',
                      dateTime: DateTime.now(),
                      statusCode: status.statusCode.toString(),
                      message: 'auth_error_2',
                      resBody: status.body)
                };
              }
            }
          } else {
            return {
              'result': 'auth_error',
              'log': AppLog(
                  type: 'login',
                  dateTime: DateTime.now(),
                  statusCode: status.statusCode.toString(),
                  message: 'auth_error_3',
                  resBody: status.body)
            };
          }
        } else {
          return {
            'result': 'auth_error',
            'log': AppLog(
                type: 'login',
                dateTime: DateTime.now(),
                statusCode: status.statusCode.toString(),
                message: 'auth_error',
                resBody: status.body)
          };
        }
      } else {
        return {
          'result': 'no_connection',
          'log': AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              statusCode: status.statusCode.toString(),
              message: 'no_connection_2',
              resBody: status.body)
        };
      }
    } on SocketException {
      return {
        'result': 'socket',
        'log': AppLog(
            type: 'login', dateTime: DateTime.now(), message: 'SocketException')
      };
    } on TimeoutException {
      return {
        'result': 'timeout',
        'log': AppLog(
            type: 'login',
            dateTime: DateTime.now(),
            message: 'TimeoutException')
      };
    } on HandshakeException {
      return {
        'result': 'ssl_error',
        'log': AppLog(
            type: 'login',
            dateTime: DateTime.now(),
            message: 'HandshakeException')
      };
    } on FormatException {
      return {
        'result': 'auth_error',
        'log': AppLog(
            type: 'login', dateTime: DateTime.now(), message: 'FormatException')
      };
    } catch (e) {
      return {
        'result': 'error',
        'log': AppLog(
            type: 'login', dateTime: DateTime.now(), message: e.toString())
      };
    }
  }
}
