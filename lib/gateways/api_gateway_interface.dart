import 'dart:async';
import 'package:pi_hole_client/models/api/v6/config/config.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/groups.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/subscriptions.dart';

abstract interface class ApiGateway {
  Server get server;

  /// Closes the underlying HTTP client and releases any associated resources.
  ///
  /// This should be called when the API gateway instance is no longer needed
  /// to ensure that all open connections and resources are properly cleaned up.
  void close();

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
  /// **Note:** The `clientCount` parameter is only supported for Pi-hole API v6.
  ///
  /// ### Parameters
  /// - [clientCount]: The number of clients to include in the over-time data.
  ///   - Default is `10` if not specified.
  ///   - If `clientCount` is `0`, data for all clients will be returned without aggregation.
  ///
  /// ### Returns
  /// - A [RealtimeStatusResponse] object containing the result of the real-time status query.
  Future<RealtimeStatusResponse> realtimeStatus({int? clientCount});

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
  /// **Note:** The `clientCount` parameter is only supported for Pi-hole API v6.
  ///
  /// ### Parameters
  /// - [clientCount]: The number of clients to include in the over-time data.
  ///   - Default is `10` if not specified.
  ///   - If `clientCount` is `0`, data for all clients will be returned without aggregation.
  ///   - The top (clientCount - 1) clients will be included individually, and
  ///     the remaining clients will be grouped under "others".
  ///   - For example, if `clientCount` is 10, the response will contain data
  ///     for 9 individual clients and one aggregated "others" entry.
  ///
  /// ### Returns
  /// - A [FetchOverTimeDataResponse] object containing the result of the over-time data query.
  Future<FetchOverTimeDataResponse> fetchOverTimeData({int? clientCount});

  /// Fetches log data from a Pi-hole server within a specified time range.
  ///
  /// ### Parameters
  /// - [from]: The start date and time of the log data to fetch.
  /// - [until]: The end date and time of the log data to fetch.
  /// - [size]: The number of log entries to fetch. If not specified, a default size will be used.
  ///   (default: 100). Only supported for Pi-hole API v6.
  /// - [cursor]: The cursor for pagination. If not specified, the first page of logs will be
  ///   fetched. Only supported for Pi-hole API v6.
  ///
  /// ### Returns
  /// - A [FetchLogsResponse] object containing the result of the fetch logs query.
  Future<FetchLogsResponse> fetchLogs(
    DateTime from,
    DateTime until, {
    int? size,
    int? cursor,
  });

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

  /// Get info about the devices in your local network as seen by your Pi-hole
  ///
  /// The optional parameters `maxDevices` and `maxAddresses` limit the number of
  /// devices and addresses returned in the response, respectively.
  /// If not set, the default values are `maxDevices = 999` and `maxAddresses = 25` (Pi-hole web UI defaults).
  Future<DevicesResponse> getDevices({
    int? maxDevices,
    int? maxAddresses,
  });

  /// Delete a device from the network table
  Future<DeleteDeviceResponse> deleteDevice(int id);

  /// Get current configuration of your Pi-hole
  ///
  /// Only supports when detailed parameters are set to `false`.
  /// If the optional parameter `isDetailed` is set to `true`, the response raises an error.
  ///
  /// element: If the optional parameter `element` is set, the response will only include
  /// the configuration for the specified element. If not set, the response will include
  /// the configuration for all elements.
  Future<ConfigurationResponse> getConfiguration({
    String? element,
    bool? isDetailed,
  });

  /// Change configuration of your Pi-hole
  ///
  /// This API hook allows to modify the config of your Pi-hole. This endpoint
  /// supports changing multiple properties at once when you specify several in the payload.
  Future<ConfigurationResponse> patchConfiguration(ConfigData body);

  /// Change only the DNS query logging configuration
  ///
  /// Sets the `status` to `true` to enable DNS query logging, or `false` to disable it.
  Future<ConfigurationResponse> patchDnsQueryLoggingConfig(bool status);

  /// Run gravity
  Stream<GravityResponse> updateGravity();

  /// Flush the network table
  ///
  /// Flushes the network table. This includes emptying the ARP table and removing both all known devices and their associated addresses.
  Future<ActionResponse> flushArp();

  /// Flush the DNS logs
  ///
  /// Flushes the DNS logs. This includes emptying the DNS log file and purging the most recent 24 hours from both the database and FTL's internal memory.
  Future<ActionResponse> flushLogs();

  /// Restart pihole-FTL
  ///
  /// Restarts the pihole-FTL service
  Future<ActionResponse> restartDns();

  /// List of all current sessions
  Future<SessionsResponse> getSessions();

  /// Delete session by ID
  Future<DeleteSessionResponse> deleteSession(int id);

  /// Get information about requesting client
  Future<ClientResponse> getClient();

  /// Get DHCP leases from the Pi-hole server.
  Future<DhcpResponse> getDhcps();

  /// Delete a DHCP lease by ID.
  Future<DeleteDhcpResponse> deleteDhcp(String ip);
}
