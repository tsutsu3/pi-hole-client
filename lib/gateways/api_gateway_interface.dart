import 'dart:async';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';

abstract interface class ApiGateway {
  /// Fetches real-time status information from a Pi-hole server.
  Future realtimeStatus();

  /// Disables a Pi-hole server
  dynamic disableServerRequest(int time);

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

  /// Handles the login process to a Pi-hole server using its API.
  ///
  /// ### Parameters
  /// - `server`: The Pi-hole server to log in to.
  ///
  /// ### Returns
  /// - A [LoginQueryResponse] object containing the result of the login query.
  Future<LoginQueryResponse> loginQuery(Server server);
}
