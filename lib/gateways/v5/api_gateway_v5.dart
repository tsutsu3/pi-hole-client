import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/api/v6/config/config.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/groups.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/models/version.dart';
import 'package:pi_hole_client/utils2/conversions.dart';
import 'package:pi_hole_client/utils2/misc.dart';

class ApiGatewayV5 implements ApiGateway {
  /// Creates a new instance of the `ApiGatewayV5` class.
  ///
  /// Parameters:
  /// - `server` (`Server`): The pihole server object
  /// - `client` (`http.Client`): An optional HTTP client to use for requests. If not provided, a new client will be created. Add for testing purposes.
  ApiGatewayV5(Server server, {http.Client? client})
      : _server = server,
        _client = client ??
            IOClient(
              createHttpClient(allowSelfSignedCert: server.allowSelfSignedCert),
            );
  final Server _server;
  final http.Client _client;

  final notSupportedMessage = 'Pi-hole v5 does not support this feature.';
  final unexpectedError = 'An unexpected error occurred.';
  final fetchError = 'Failed to fetch data from the server.';

  @override
  Server get server => _server;

  /// Sends an HTTP request using the specified method and parameters.
  ///
  /// Parameters:
  /// - [method] The HTTP method to use (e.g., 'GET', 'POST').
  /// - [url] The URL to send the request to.
  /// - [headers] The headers to send with the request.
  /// - [body] The body of the request.
  /// - [timeout] The timeout for the request in seconds. Default is 10 seconds.
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
  }) async {
    final authHeaders = headers != null ? {...headers} : {};

    final stringAuthHeaders = authHeaders.map(
      (key, value) => MapEntry(key.toString(), value.toString()),
    );

    switch (method.toUpperCase()) {
      case 'POST':
        return _client
            .post(Uri.parse(url), headers: stringAuthHeaders, body: body)
            .timeout(Duration(seconds: timeout));

      case 'GET':
      default:
        return _client
            .get(Uri.parse(url), headers: stringAuthHeaders)
            .timeout(Duration(seconds: timeout));
    }
  }

  @override
  void close() {
    _client.close();
  }

  /// Handles the login process to a Pi-hole server using its API.
  ///
  /// This function performs the following steps:
  /// 1. Sends a GET request to verify the server's current status using the provided `address` and `token`.
  /// 2. Toggles the Pi-hole's status between enabled and disabled depending on the current status.
  /// 3. Validates the response to determine the success or failure of the login attempt.
  ///
  /// Parameters:
  /// - [refresh]: A boolean value indicating whether to refresh the login status.
  @override
  Future<LoginQueryResponse> loginQuery({bool refresh = false}) async {
    try {
      final token = await _server.sm.token;
      final status = await httpClient(
        method: 'get',
        url: '${_server.address}/admin/api.php?auth=$token&summaryRaw',
      );
      if (status.statusCode == 200) {
        final statusParsed = jsonDecode(status.body);
        if (statusParsed.runtimeType != List &&
            statusParsed['status'] != null) {
          final enableOrDisable = await httpClient(
            method: 'get',
            url: statusParsed['status'] == 'enabled'
                ? '${_server.address}/admin/api.php?auth=$token&enable=0'
                : '${_server.address}/admin/api.php?auth=$token&disable=0',
          );
          if (enableOrDisable.statusCode == 200) {
            if (enableOrDisable.body == 'Not authorized!' ||
                enableOrDisable.body ==
                    'Session expired! Please re-login on the Pi-hole dashboard.' ||
                //  enableOrDisable.body == []) {
                enableOrDisable.body.isEmpty) {
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
            } else {
              final enableOrDisableParsed = jsonDecode(enableOrDisable.body);
              if (enableOrDisableParsed.runtimeType != List) {
                final sid = enableOrDisable.headers['set-cookie']!
                    .split(';')[0]
                    .split('=')[1];
                return LoginQueryResponse(
                  result: APiResponseType.success,
                  status: statusParsed['status'],
                  sid: sid,
                );
              } else {
                return LoginQueryResponse(
                  result: APiResponseType.authError,
                  log: AppLog(
                    type: 'login',
                    dateTime: DateTime.now(),
                    statusCode: status.statusCode.toString(),
                    message: 'auth_error_2',
                    resBody: status.body,
                  ),
                );
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
                resBody: status.body,
              ),
            );
          }
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
      } else {
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
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes',
      );
      final body = jsonDecode(response.body);
      if (body['status'] != null) {
        return RealtimeStatusResponse(
          result: APiResponseType.success,
          data: RealtimeStatus.fromJson(body),
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
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&disable=$time',
      );
      final body = jsonDecode(response.body);
      if (body.runtimeType != List && body['status'] != null) {
        return DisableServerResponse(
          result: APiResponseType.success,
          status: body['status'],
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
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&enable',
      );
      final body = jsonDecode(response.body);
      if (body.runtimeType != List && body['status'] != null) {
        return EnableServerResponse(
          result: APiResponseType.success,
          status: body['status'],
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
    try {
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&overTimeData10mins&overTimeDataClients&getClientNames',
      );
      final body = jsonDecode(response.body);
      final data = OverTimeData.fromJson(body);
      return FetchOverTimeDataResponse(
        result: APiResponseType.success,
        data: data,
      );
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
  Future<FetchLogsResponse> fetchLogs(
    DateTime from,
    DateTime until, {
    int? size,
    int? cursor,
  }) async {
    try {
      // If both 'from' and 'until' are specified, 'size' is ignored and all
      // data within the period is retrieved.
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&getAllQueries=&from=${from.millisecondsSinceEpoch ~/ 1000}&until=${until.millisecondsSinceEpoch ~/ 1000}',
        timeout: 20,
      );
      final body = jsonDecode(response.body);
      return FetchLogsResponse(
        result: APiResponseType.success,
        data: LogsInfo.fromJson(body),
      );
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
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&list=$list&add=$domain',
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.runtimeType is List) {
          return SetWhiteBlacklistResponse(
            result: APiResponseType.error,
            message: 'not_exists',
          );
        } else if (json is Map<String, dynamic>) {
          if (json['success'] == true) {
            return SetWhiteBlacklistResponse(
              result: APiResponseType.success,
              data: DomainResult.fromJson(json),
            );
          } else {
            return SetWhiteBlacklistResponse(result: APiResponseType.error);
          }
        } else {
          return SetWhiteBlacklistResponse(
            result: APiResponseType.error,
            message: 'Invalid response format',
          );
        }
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
    Map<String, String>? headers;

    try {
      final token = await _server.sm.token;
      final results = await Future.wait([
        httpClient(
          method: 'get',
          url: '${_server.address}/admin/api.php?auth=$token&list=white',
          headers: headers,
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/admin/api.php?auth=$token&list=regex_white',
          headers: headers,
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/admin/api.php?auth=$token&list=black',
          headers: headers,
        ),
        httpClient(
          method: 'get',
          url: '${_server.address}/admin/api.php?auth=$token&list=regex_black',
          headers: headers,
        ),
      ]);

      if (results[0].statusCode == 200 &&
          results[1].statusCode == 200 &&
          results[2].statusCode == 200 &&
          results[3].statusCode == 200) {
        return GetDomainLists(
          result: APiResponseType.success,
          data: DomainListResult(
            whitelist: parseDomainList(
              jsonDecode(results[0].body)['data'].cast<Map<String, dynamic>>(),
            ),
            whitelistRegex: parseDomainList(
              jsonDecode(results[1].body)['data'].cast<Map<String, dynamic>>(),
            ),
            blacklist: parseDomainList(
              jsonDecode(results[2].body)['data'].cast<Map<String, dynamic>>(),
            ),
            blacklistRegex: parseDomainList(
              jsonDecode(results[3].body)['data'].cast<Map<String, dynamic>>(),
            ),
          ),
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
    String getType(int type) {
      switch (type) {
        case 0:
          return 'white';

        case 1:
          return 'black';

        case 2:
          return 'regex_white';

        case 3:
          return 'regex_black';

        default:
          return '';
      }
    }

    try {
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&list=${getType(domain.type)}&sub=${domain.domain}',
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.runtimeType is List) {
          return RemoveDomainFromListResponse(
            result: APiResponseType.error,
            message: 'not_exists',
          );
        } else if (json is Map<String, dynamic>) {
          if (json['success'] == true) {
            return RemoveDomainFromListResponse(
              result: APiResponseType.success,
            );
          } else {
            return RemoveDomainFromListResponse(result: APiResponseType.error);
          }
        } else {
          return RemoveDomainFromListResponse(
            result: APiResponseType.error,
            message: 'Invalid response format',
          );
        }
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
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&list=${domainData['list']}&add=${domainData['domain']}',
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.runtimeType is List) {
          return AddDomainToListResponse(result: APiResponseType.error);
        } else if (json is Map<String, dynamic>) {
          if (json['success'] == true &&
              json['message'] == 'Added ${domainData['domain']}') {
            return AddDomainToListResponse(result: APiResponseType.success);
          } else if (json['success'] == true &&
              json['message'] ==
                  'Not adding ${domainData['domain']} as it is already on the list') {
            return AddDomainToListResponse(
              result: APiResponseType.alreadyAdded,
            );
          } else {
            return AddDomainToListResponse(result: APiResponseType.error);
          }
        } else {
          return AddDomainToListResponse(
            result: APiResponseType.error,
          );
        }
      } else {
        return AddDomainToListResponse(result: APiResponseType.error);
      }
    } on SocketException {
      return AddDomainToListResponse(result: APiResponseType.noConnection);
    } on TimeoutException {
      return AddDomainToListResponse(result: APiResponseType.noConnection);
    } on HandshakeException {
      return AddDomainToListResponse(result: APiResponseType.sslError);
    } on FormatException {
      return AddDomainToListResponse(result: APiResponseType.authError);
    } catch (e) {
      return AddDomainToListResponse(result: APiResponseType.error);
    }
  }

  /// Updates an existing domain.
  @override
  Future<DomainResponse> updateDomain({
    required DomainRequest body,
  }) async {
    return Future.value(
      DomainResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  // =========================================================================
  // Pi-hole Sever information
  // =========================================================================
  @override
  Future<HostResponse> fetchHostInfo() async {
    return Future.value(
      HostResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<SensorsResponse> fetchSensorsInfo() async {
    return Future.value(
      SensorsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<SystemResponse> fetchSystemInfo() async {
    return Future.value(
      SystemResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<VersionResponse> fetchVersionInfo() async {
    try {
      final response = await httpClient(
        method: 'get',
        url:
            '${_server.address}/admin/api.php?auth=${await _server.sm.token}&versions',
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final version = VersionInfo.fromJson(body);
        return VersionResponse(
          result: APiResponseType.success,
          data: version,
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

      if (results[0].result == APiResponseType.notSupported &&
          results[1].result == APiResponseType.notSupported &&
          results[2].result == APiResponseType.notSupported &&
          results[3].result == APiResponseType.success) {
        return PiHoleServerInfoResponse(
          result: APiResponseType.success,
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
    return Future.value(
      SubscriptionsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<RemoveSubscriptionResponse> removeSubscription({
    required String url,
    String? stype,
  }) async {
    return Future.value(
      RemoveSubscriptionResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<SubscriptionsResponse> createSubscription({
    required SubscriptionRequest body,
  }) async {
    return Future.value(
      SubscriptionsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<SubscriptionsResponse> updateSubscription({
    required SubscriptionRequest body,
  }) async {
    return Future.value(
      SubscriptionsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<SearchResponse> searchSubscriptions({
    required String domain,
    bool? partial,
    int? limit,
    bool? debug,
  }) async {
    return Future.value(
      SearchResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<GroupsResponse> getGroups({String? name}) async {
    return Future.value(
      GroupsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<RemoveGroupResponse> removeGroup({required String name}) async {
    return Future.value(
      RemoveGroupResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<GroupsResponse> createGroup({
    required GroupRequest body,
  }) async {
    return Future.value(
      GroupsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<GroupsResponse> updateGroup({
    required GroupRequest body,
  }) async {
    return Future.value(
      GroupsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Stream<GravityResponse> updateGravity() {
    return Stream.value(
      GravityResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  /// In v5, messages can be retrieved using `/api_db.php?messages`.
  /// However, simply retrieving messages is not very meaningful, so it is treated as unsupported.
  @override
  Future<MessagesResponse> getMessages() async {
    return Future.value(
      MessagesResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<RemoveMessageResponse> removeMessage(int id) async {
    return Future.value(
      RemoveMessageResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<MetricsResponse> getMetrics() async {
    return Future.value(
      MetricsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<GatewayResponse> getGateway({bool? isDetailed}) async {
    return Future.value(
      GatewayResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<DevicesResponse> getDevices({
    int? maxDevices,
    int? maxAddresses,
  }) async {
    return Future.value(
      DevicesResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<DeleteDeviceResponse> deleteDevice(int id) async {
    return Future.value(
      DeleteDeviceResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ConfigurationResponse> getConfiguration({
    String? element,
    bool? isDetailed,
  }) async {
    return Future.value(
      ConfigurationResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ConfigurationResponse> patchConfiguration(ConfigData body) async {
    return Future.value(
      ConfigurationResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ConfigurationResponse> patchDnsQueryLoggingConfig(bool status) async {
    return Future.value(
      ConfigurationResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ActionResponse> flushArp() async {
    return Future.value(
      ActionResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ActionResponse> flushLogs() async {
    return Future.value(
      ActionResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ActionResponse> restartDns() async {
    return Future.value(
      ActionResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<SessionsResponse> getSessions() async {
    return Future.value(
      SessionsResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<DeleteSessionResponse> deleteSession(int id) async {
    return Future.value(
      DeleteSessionResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<ClientResponse> getClient() async {
    return Future.value(
      ClientResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<DhcpResponse> getDhcps() async {
    return Future.value(
      DhcpResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }

  @override
  Future<DeleteDhcpResponse> deleteDhcp(String ip) async {
    return Future.value(
      DeleteDhcpResponse(
        result: APiResponseType.notSupported,
        message: notSupportedMessage,
      ),
    );
  }
}
