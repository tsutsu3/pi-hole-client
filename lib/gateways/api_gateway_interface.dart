import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/server.dart';

abstract interface class ApiGateway {
  /// Fetches real-time status information from a Pi-hole server.
  Future realtimeStatus(Server server);

  /// Handles the login process to a Pi-hole server using its API.
  Future loginQuery(Server server);

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
}
