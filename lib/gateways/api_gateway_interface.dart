import 'dart:async';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';

abstract interface class ApiGateway {
  /// Handles the login process to a Pi-hole server using its API.
  ///
  /// ### Returns
  /// - A [LoginQueryResponse] object containing the result of the login query.
  Future<LoginQueryResponse> loginQuery();

  /// Fetches real-time status information from a Pi-hole server.
  ///
  /// ### Returns
  /// - A [RealtimeStatusResponse] object containing the result of the real-time status query.
  Future<RealtimeStatusResponse> realtimeStatus();

  /// Disables a Pi-hole server
  ///
  /// ### Parameters
  /// - [time]: The time in seconds to disable the server for.
  ///
  /// ### Returns
  /// - A [DisableServerResponse] object containing the result of the disable server query.
  Future<DisableServerResponse> disableServerRequest(int time);

  /// Enables a Pi-hole server
  dynamic enableServerRequest();

  /// Fetches over-time data from a Pi-hole server.
  Future fetchOverTimeData();

  /// Fetches log data from a Pi-hole server within a specified time range.
  Future fetchLogs(DateTime from, DateTime until);

  /// Adds a domain to the whitelist or blacklist on a Pi-hole server.
  Future setWhiteBlacklist(String domain, String list);

  /// Fetches domain lists (whitelist, blacklist, and regex-based lists) from a Pi-hole server.
  Future getDomainLists();

  /// Removes a domain from a specific list on a Pi-hole server.
  Future removeDomainFromList(Domain domain);

  /// Adds a domain to a specified list on a Pi-hole server.
  Future addDomainToList(Map<String, dynamic> domainData);
}
