import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v5/dns.dart';
import 'package:pi_hole_client/data/model/v5/domains.dart';
import 'package:pi_hole_client/data/model/v5/over_time_data.dart';
import 'package:pi_hole_client/data/model/v5/queries.dart';
import 'package:pi_hole_client/data/model/v5/realtime_status.dart';
import 'package:pi_hole_client/data/model/v5/summary_raw.dart';
import 'package:pi_hole_client/data/model/v5/versions.dart';
import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/utils/safe_api_call.dart';
import 'package:pi_hole_client/utils/misc.dart';
import 'package:result_dart/result_dart.dart';

class PiholeV5ApiClient {
  PiholeV5ApiClient({
    required String url,
    http.Client? client,
    bool? allowSelfSignedCert,
  }) : _url = url,
       _client =
           client ??
           IOClient(
             createHttpClient(allowSelfSignedCert: allowSelfSignedCert ?? true),
           );

  final String _url;
  final http.Client _client;
  final _endpoint = '/admin/api.php';

  void close() {
    _client.close();
  }

  // ==========================================================================
  // Pi-hole API
  // ==========================================================================
  Future<Result<SummaryRaw>> getSummaryRaw(String token) async {
    return safeApiCall<SummaryRaw>(() async {
      final params = {'auth': token, 'summaryRaw': ''};
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return SummaryRaw.fromJson(json);
    });
  }

  Future<Result<Blocking>> postDnsBlocking(
    String token, {
    required bool enabled,
    int? timer,
  }) async {
    return safeApiCall<Blocking>(() async {
      final params = {
        'auth': token,
        if (enabled) 'enable': '' else 'disable': (timer ?? 0).toString(),
      };
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return Blocking.fromJson(json);
    });
  }

  Future<Result<RealTimeStatus>> getRealTimeStatus(String token) async {
    return safeApiCall<RealTimeStatus>(() async {
      final params = {
        'auth': token,
        'summaryRaw': '',
        'topItems': '',
        'getForwardDestinations': '',
        'getQuerySources': '',
        'topClientsBlocked': '',
        'getQueryTypes': '',
      };
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return RealTimeStatus.fromJson(json);
    });
  }

  Future<Result<OverTimeData>> getOverTimeData(String token) async {
    return safeApiCall(() async {
      final params = {
        'auth': token,
        'overTimeData10mins': '',
        'overTimeDataClients': '',
        'getClientNames': '',
      };
      final resp = await _sendRequest(params: params);

      _validateAndParseResponse(resp);

      return OverTimeData.fromJson(jsonDecode(resp.body));
    });
  }

  Future<Result<Queries>> getQueries(
    String token, {
    DateTime? from,
    DateTime? until,
  }) async {
    return safeApiCall<Queries>(() async {
      final params = {
        'auth': token,
        'getAllQueries': '',
        'from': from == null
            ? ''
            : (from.millisecondsSinceEpoch ~/ 1000).toString(),
        'until': until == null
            ? ''
            : (until.millisecondsSinceEpoch ~/ 1000).toString(),
      };
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return Queries.fromJson(json);
    });
  }

  Future<Result<DomainResponse>> postDomain(
    String token, {
    required String domain,
    required V5DomainType domainType,
  }) async {
    return safeApiCall<DomainResponse>(() async {
      final params = {'auth': token, 'list': domainType.name, 'add': domain};
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return DomainResponse.fromJson(json);
    });
  }

  Future<Result<Domains>> getDomains(
    String token, {
    required V5DomainType domainType,
  }) async {
    return safeApiCall<Domains>(() async {
      final params = {'auth': token, 'list': domainType.name};
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return Domains.fromJson(json);
    });
  }

  Future<Result<DomainResponse>> deleteDomain(
    String token, {
    required String domain,
    required V5DomainType domainType,
  }) async {
    return safeApiCall<DomainResponse>(() async {
      final params = {'auth': token, 'list': domainType.name, 'sub': domain};
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return DomainResponse.fromJson(json);
    });
  }

  Future<Result<Versions>> getVersions(String token) async {
    return safeApiCall<Versions>(() async {
      final params = {'auth': token, 'versions': ''};
      final resp = await _sendRequest(params: params);

      final json = _validateAndParseResponse(resp);

      return Versions.fromJson(json);
    });
  }

  // ==========================================================================
  // Helper methods
  // ==========================================================================

  /// Sends an HTTP request to the Pi-hole API.
  Future<http.Response> _sendRequest({
    required Map<String, String> params,
    int timeout = 10,
  }) async {
    final uri = Uri.parse(
      _url,
    ).resolve(_endpoint).replace(queryParameters: params);

    final headers = <String, String>{'Content-Type': 'application/json'};

    final duration = Duration(seconds: timeout);

    return _client.get(uri, headers: headers).timeout(duration);
  }

  /// Parses the HTTP response and returns a Map.
  ///
  /// Throws an HttpStatusCodeException if the status code is not 200.
  /// If the response body is empty, it throws an Unauthorized exception.
  Map<String, dynamic> _validateAndParseResponse(http.Response resp) {
    if (resp.statusCode != 200) {
      throw HttpStatusCodeException(resp.statusCode, resp.body);
    }

    final json = jsonDecode(resp.body);

    if (json.isEmpty) {
      throw HttpStatusCodeException(
        401,
        'Unauthorized: Please provide a valid token.',
      );
    }

    return json;
  }
}
