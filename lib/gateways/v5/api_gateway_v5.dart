import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/functions/encode_basic_auth.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';

class ApiGatewayV5 implements ApiGateway {
  final Server server;

  ApiGatewayV5(this.server);

  /// Fetches real-time status information from a Pi-hole server.
  ///
  /// This method sends a GET request to the specified Pi-hole server to retrieve
  /// detailed status and metrics, including top items, forward destinations,
  /// query sources, and query types. It parses the response and returns the
  /// data in a structured format.
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `socket`, `timeout`, `ssl_error`, `error`).
  ///   - `data`: A `RealtimeStatus` object containing the server's realtime status data if the operation is successful.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  @override
  Future realtimeStatus() async {
    try {
      final response = await ApiGateway.httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      if (body['status'] != null) {
        return {'result': 'success', 'data': RealtimeStatus.fromJson(body)};
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

  /// Disables a Pi-hole server
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  /// - `time` (`int`): The time in seconds to disable the server.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `no_connection`, `ssl_error`, `error`).
  ///   - `status`: The current Pi-hole status (`enabled` or `disabled`) if the operation is successful.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  @override
  dynamic disableServerRequest(int time) async {
    try {
      final response = await ApiGateway.httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&disable=$time',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      if (body.runtimeType != List && body['status'] != null) {
        return {'result': 'success', 'status': body['status']};
      } else {
        return {'result': 'error'};
      }
    } on SocketException {
      return {'result': 'no_connection'};
    } on TimeoutException {
      return {'result': 'no_connection'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } catch (e) {
      return {'result': 'error'};
    }
  }

  /// Enables a Pi-hole server
  ///
  /// ### Parameters:
  /// - `server` (`Server`): The server object containing the Pi-hole address, token, and optional basic authentication credentials.
  ///
  /// ### Returns:
  /// - `Map<String, dynamic>`: A result object with the following keys
  ///   - `result`: A string indicating the outcome of the operation (`success`, `no_connection`, `ssl_error`, `error`).
  ///   - `status`: The current Pi-hole status (`enabled` or `disabled`) if the operation is successful.
  ///
  /// ### Exceptions:
  /// - `SocketException`: Network issues prevent connection to the server.
  /// - `TimeoutException`: The request times out.
  /// - `HandshakeException`: SSL/TLS handshake fails.
  /// - General exceptions: Any other errors encountered during execution.
  ///
  @override
  dynamic enableServerRequest() async {
    try {
      final response = await ApiGateway.httpClient(
          method: 'get',
          url: '${server.address}/admin/api.php?auth=${server.token}&enable',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      if (body.runtimeType != List && body['status'] != null) {
        return {'result': 'success', 'status': body['status']};
      } else {
        return {'result': 'error'};
      }
    } on SocketException {
      return {'result': 'no_connection'};
    } on TimeoutException {
      return {'result': 'no_connection'};
    } on HandshakeException {
      return {'result': 'ssl_error'};
    } catch (e) {
      return {'result': 'error'};
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
  Future fetchOverTimeData() async {
    try {
      final response = await ApiGateway.httpClient(
          method: 'get',
          url:
              '${server.address}/admin/api.php?auth=${server.token}&overTimeData10mins&overTimeDataClients&getClientNames',
          basicAuth: {
            'username': server.basicAuthUser,
            'password': server.basicAuthPassword
          });
      final body = jsonDecode(response.body);
      var data = OverTimeData.fromJson(body);
      return {'result': 'success', 'data': data};
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
      final response = await ApiGateway.httpClient(
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
      final response = await ApiGateway.httpClient(
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
    if (ApiGateway.checkBasicAuth(
            server.basicAuthUser, server.basicAuthPassword) ==
        true) {
      headers = {
        'Authorization':
            'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
      };
    }

    try {
      final results = await Future.wait([
        http.get(
            Uri.parse(
                '${server.address}/admin/api.php?auth=${server.token}&list=white'),
            headers: headers),
        http.get(
            Uri.parse(
                '${server.address}/admin/api.php?auth=${server.token}&list=regex_white'),
            headers: headers),
        http.get(
            Uri.parse(
                '${server.address}/admin/api.php?auth=${server.token}&list=black'),
            headers: headers),
        http.get(
            Uri.parse(
                '${server.address}/admin/api.php?auth=${server.token}&list=regex_black'),
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
      final response = await ApiGateway.httpClient(
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
      final response = await ApiGateway.httpClient(
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
