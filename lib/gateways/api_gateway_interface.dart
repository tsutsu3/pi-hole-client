import 'dart:async';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/groups.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/subscriptions.dart';

abstract interface class ApiGateway {
  Server get server;

  /// Handles the login process to a Pi-hole server using its API.
  ///
  /// ### Parameters
  /// - [refresh]: A boolean value indicating whether to refresh the login status.
  /// Default is `false`.
  ///   - **v6**: This parameter is used to control session refresh.
  ///   - **v5**: This parameter is ignored.
  /// ### Returns
  /// - A [LoginQueryResponse] object containing the result of the login query.
  Future<LoginQueryResponse> loginQuery({bool refresh = false});

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
  ///
  /// ### Returns
  /// - An [EnableServerResponse] object containing the result of the enable server query.
  Future<EnableServerResponse> enableServerRequest();

  /// Fetches over-time data from a Pi-hole server.
  ///
  /// ### Returns
  /// - A [FetchOverTimeDataResponse] object containing the result of the over-time data query.
  Future<FetchOverTimeDataResponse> fetchOverTimeData();

  /// Fetches log data from a Pi-hole server within a specified time range.
  ///
  /// ### Parameters
  /// - [from]: The start date and time of the log data to fetch.
  /// - [until]: The end date and time of the log data to fetch.
  ///
  /// ### Returns
  /// - A [FetchLogsResponse] object containing the result of the fetch logs query.
  Future<FetchLogsResponse> fetchLogs(DateTime from, DateTime until);

  /// Adds a domain to the whitelist or blacklist on a Pi-hole server.
  ///
  /// ### Parameters
  /// - [domain]: The domain to add to the list.
  /// - [list]: The list to add the domain to (`black`, `regex_black`, `white`, `regex_white`).
  ///
  /// ### Returns
  /// - A [SetWhiteBlacklistResponse] object containing the result of the set white/blacklist query.
  Future<SetWhiteBlacklistResponse> setWhiteBlacklist(
    String domain,
    String list,
  );

  /// Fetches domain lists (whitelist, blacklist, and regex-based lists) from a Pi-hole server.
  ///
  /// ### Returns
  /// - A [GetDomainLists] object containing the result of the get domain lists query.
  Future<GetDomainLists> getDomainLists();

  /// Removes a domain from a specific list on a Pi-hole server.
  ///
  /// ### Parameters
  /// - [domain]: The domain to remove from the list.
  ///
  /// ### Returns
  /// - A [RemoveDomainFromListResponse] object containing the result of the remove domain from list query.
  Future<RemoveDomainFromListResponse> removeDomainFromList(Domain domain);

  /// Adds a domain to a specified list on a Pi-hole server.
  ///
  /// ### Parameters
  /// - [domainData]: The domain data to add to the list.
  ///
  /// ### Returns
  /// - An [AddDomainToListResponse] object containing the result of the add domain to list query.
  Future<AddDomainToListResponse> addDomainToList(
    Map<String, dynamic> domainData,
  );

  /// Updates an existing domain.
  Future<DomainResponse> updateDomain({
    required DomainRequest body,
  });

  /// Fetch Pi-hole host information.
  Future<HostResponse> fetchHostInfo();

  /// Fetch Pi-hole sensors information. (temperature)
  Future<SensorsResponse> fetchSensorsInfo();

  /// Fetch Pi-hole system information. (CPU, RAM, Swap)
  Future<SystemResponse> fetchSystemInfo();

  /// Fetch Pi-hole version information. (Core, Web, FTL, Docker)
  Future<VersionResponse> fetchVersionInfo();

  /// Fetches information about the Pi-hole server.
  ///
  /// ### Behavior by Pi-hole version:
  /// - **v6**: Retrieves all available server information, including:
  ///   - Host information
  ///   - Sensor data
  ///   - System status
  ///   - Version details
  /// - **v5**: Only retrieves version information
  Future<PiHoleServerInfoResponse> fetchAllServerInfo();

  /// Retrieves subscription list(s) based on the given parameters.
  ///
  /// - If neither [url] nor [stype] is specified, all subscriptions are returned.
  /// - If only [url] is specified, the subscription matching that URL is returned, if it exists.
  /// - If only [stype] is specified, all subscriptions of that type (block or allow) are returned.
  /// - If both [url] and [stype] are specified, the subscription matching the URL is returned
  ///   only if it also matches the specified [stype].
  Future<SubscriptionsResponse> getSubscriptions({
    String? url,
    String? stype,
  });

  /// Removes the subscription matching the given [url] and [stype].
  ///
  /// If no matching subscription is found, the operation has no effect.
  Future<RemoveSubscriptionResponse> removeSubscription({
    required String url,
    String? stype,
  });

  /// Creates a subscription.
  Future<SubscriptionsResponse> createSubscription({
    required SubscriptionRequest body,
  });

  /// Updates an existing subscription.
  Future<SubscriptionsResponse> updateSubscription({
    required SubscriptionRequest body,
  });

  /// Search domains in Pi-hole's subscription lists
  ///
  /// The specified domain is automatically converted to lowercase.
  /// The optional parameters `limit` and `partial` limit the maximum number of
  /// returned records and whether partial matches should be returned, respectively.
  /// There is a hard upper limit of `N` defined in FTL (currently set to 10,000) to
  /// ensure that the response is not too large.
  /// ABP matches are not returned when partial matching is requested.
  /// International domains names (IDNs) are internally converted to punycode before matching.
  Future<SearchResponse> searchSubscriptions({
    required String domain,
    bool? partial,
    int? limit,
    bool? debug,
  });

  /// Fetches group information from the Pi-hole server.
  Future<GroupsResponse> getGroups({String? name});

  /// Removes a group from the Pi-hole server.
  Future<RemoveGroupResponse> removeGroup({required String name});

  /// Creates a new group on the Pi-hole server.
  Future<GroupsResponse> createGroup({required GroupRequest body});

  /// Updates an existing group on the Pi-hole server.
  Future<GroupsResponse> updateGroup({
    required GroupRequest body,
  });

  /// Run gravity
  Stream<GravityResponse> updateGravity();

  /// Get Pi-hole diagnosis messages
  Future<MessagesResponse> getMessages();

  /// Delete Pi-hole diagnosis message
  Future<RemoveMessageResponse> removeMessage(int id);

  /// Get metrics info
  ///
  /// This API hook returns live information about the DNS and DHCP metrics.
  Future<MetricsResponse> getMetrics();

  /// Get info about the gateway of your Pi-hole
  ///
  /// If the optional parameter `isDetailed` is set to `true`, the response will
  /// include detailedinformation about the individual interfaces and routes.
  /// Note that the available information is dependent on the interface type and state.
  Future<GatewayResponse> getGateway({bool? isDetailed});
}
