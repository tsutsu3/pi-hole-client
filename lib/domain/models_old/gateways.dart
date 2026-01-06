import 'package:pi_hole_client/data/model/v6/domains/domains.dart' as v6;
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/app_log.dart';
import 'package:pi_hole_client/domain/models_old/client.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/config.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/domain/models_old/dhcp.dart';
import 'package:pi_hole_client/domain/models_old/domain.dart';
import 'package:pi_hole_client/domain/models_old/gateway.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/domain/models_old/host.dart';
import 'package:pi_hole_client/domain/models_old/log.dart';
import 'package:pi_hole_client/domain/models_old/messages.dart';
import 'package:pi_hole_client/domain/models_old/metrics.dart';
import 'package:pi_hole_client/domain/models_old/overtime_data.dart';
import 'package:pi_hole_client/domain/models_old/realtime_status.dart';
import 'package:pi_hole_client/domain/models_old/search.dart';
import 'package:pi_hole_client/domain/models_old/sensors.dart';
import 'package:pi_hole_client/domain/models_old/sessions.dart';
import 'package:pi_hole_client/domain/models_old/subscriptions.dart';
import 'package:pi_hole_client/domain/models_old/system.dart';
import 'package:pi_hole_client/domain/models_old/version.dart';

enum APiResponseType {
  success,
  authError,
  noConnection,
  socket,
  timeout,
  sslError,
  error,
  alreadyAdded,
  notSupported,
  notFound,
  progress,
}

/// A response object for the login query.
///
/// When Successful [result], [status] and [sid] are returned.
/// When error, [result] and [log] are returned.
class LoginQueryResponse {
  LoginQueryResponse({required this.result, this.log, this.status, this.sid});

  final APiResponseType result;
  final AppLog? log;
  final String? status;
  final String? sid;
}

class RealtimeStatusResponse {
  RealtimeStatusResponse({required this.result, this.data});

  final APiResponseType result;
  final RealtimeStatus? data;
}

class DisableServerResponse {
  DisableServerResponse({required this.result, this.status});

  final APiResponseType result;
  final String? status;
}

class EnableServerResponse {
  EnableServerResponse({required this.result, this.status});

  final APiResponseType result;
  final String? status;
}

class FetchOverTimeDataResponse {
  FetchOverTimeDataResponse({required this.result, this.data});

  final APiResponseType result;
  final OverTimeData? data;
}

class FetchLogsResponse {
  FetchLogsResponse({required this.result, this.data});

  final APiResponseType result;
  final LogsInfo? data;
}

class DomainResult {
  DomainResult({required this.success, required this.message});
  factory DomainResult.fromJson(Map<String, dynamic> json) {
    return DomainResult(success: json['success'], message: json['message']);
  }

  /// Converts a [v6.Domains] object to a [DomainResult] object.
  ///
  /// Warning: This method assumes that the [v6.Domains] object has exactly 1 domain.
  factory DomainResult.fromV6(v6.Domains domains) {
    if (domains.domains.length != 1 || domains.processed == null) {
      throw ArgumentError('domains must have exactly 1 item');
    }

    if (domains.processed!.success.isNotEmpty) {
      return DomainResult(
        success: true,
        message: 'Added ${domains.processed!.success[0].item}',
      );
    }

    if (domains.processed!.errors.isNotEmpty) {
      return DomainResult(
        success: false,
        message: domains.processed!.errors[0].error,
      );
    }

    throw ArgumentError('domains must have either success or error');
  }

  final bool success;
  final String message;

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message};
  }
}

class SetWhiteBlacklistResponse {
  SetWhiteBlacklistResponse({required this.result, this.message, this.data});

  final APiResponseType result;
  final String? message;
  final DomainResult? data;
}

class DomainListResult {
  DomainListResult({
    required this.whitelist,
    required this.whitelistRegex,
    required this.blacklist,
    required this.blacklistRegex,
  });

  factory DomainListResult.fromV6(v6.Domains domains) {
    final types = {
      'allow_exact': 0,
      'deny_exact': 1,
      'allow_regex': 2,
      'deny_regex': 3,
    };

    List<Domain> v6DomainsToDomainList(
      v6.Domains domains,
      String type,
      String kind,
    ) {
      return domains.domains
          .where((domain) => domain.type == type && domain.kind == kind)
          .toList()
          .map((domain) {
            return Domain(
              id: domain.id,
              type: types['${domain.type}_${domain.kind}']!,
              domain: domain.domain,
              enabled: domain.enabled ? 1 : 0,
              dateAdded: DateTime.fromMillisecondsSinceEpoch(
                domain.dateAdded * 1000,
              ),
              dateModified: DateTime.fromMillisecondsSinceEpoch(
                domain.dateModified * 1000,
              ),
              comment: domain.comment,
              groups: domain.groups,
            );
          })
          .toList();
    }

    return DomainListResult(
      whitelist: v6DomainsToDomainList(domains, 'allow', 'exact'),
      whitelistRegex: v6DomainsToDomainList(domains, 'allow', 'regex'),
      blacklist: v6DomainsToDomainList(domains, 'deny', 'exact'),
      blacklistRegex: v6DomainsToDomainList(domains, 'deny', 'regex'),
    );
  }

  final List<Domain> whitelist;
  final List<Domain> whitelistRegex;
  final List<Domain> blacklist;
  final List<Domain> blacklistRegex;
}

class GetDomainLists {
  GetDomainLists({required this.result, this.data});

  final APiResponseType result;
  final DomainListResult? data;
}

class RemoveDomainFromListResponse {
  RemoveDomainFromListResponse({required this.result, this.message});

  final APiResponseType result;
  final String? message;
}

class AddDomainToListResponse {
  AddDomainToListResponse({required this.result});

  final APiResponseType result;
}

class DomainResponse extends BaseInfoResponse<Domain> {
  DomainResponse({required super.result, super.message, super.data});
}

abstract class BaseInfoResponse<T> {
  BaseInfoResponse({required this.result, this.message, this.data});

  final APiResponseType result;
  final String? message;
  final T? data;
}

class HostResponse extends BaseInfoResponse<HostInfo> {
  HostResponse({required super.result, super.message, super.data});
}

class SensorsResponse extends BaseInfoResponse<SensorsInfo> {
  SensorsResponse({required super.result, super.message, super.data});
}

class SystemResponse extends BaseInfoResponse<SystemInfo> {
  SystemResponse({required super.result, super.message, super.data});
}

class VersionResponse extends BaseInfoResponse<VersionInfo> {
  VersionResponse({required super.result, super.message, super.data});
}

class PiHoleServerInfoResponse {
  PiHoleServerInfoResponse({
    required this.result,
    this.message,
    this.host,
    this.sensors,
    this.system,
    this.version,
  });

  final APiResponseType result;
  final String? message;
  final HostInfo? host;
  final SensorsInfo? sensors;
  final SystemInfo? system;
  final VersionInfo? version;
}

class SubscriptionsResponse extends BaseInfoResponse<SubscriptionsInfo> {
  SubscriptionsResponse({required super.result, super.message, super.data});
}

class RemoveSubscriptionResponse extends BaseInfoResponse<void> {
  RemoveSubscriptionResponse({required super.result, super.message});
}

class SearchResponse extends BaseInfoResponse<SearchInfo> {
  SearchResponse({required super.result, super.message, super.data});
}

class GroupsResponse extends BaseInfoResponse<GroupsInfo> {
  GroupsResponse({required super.result, super.message, super.data});
}

class RemoveGroupResponse extends BaseInfoResponse<void> {
  RemoveGroupResponse({required super.result, super.message});
}

class ClientsResponse extends BaseInfoResponse<ClientsInfo> {
  ClientsResponse({required super.result, super.message, super.data});
}

class RemoveClientResponse extends BaseInfoResponse<void> {
  RemoveClientResponse({required super.result, super.message});
}

class MessagesResponse extends BaseInfoResponse<MessagesInfo> {
  MessagesResponse({required super.result, super.message, super.data});
}

class RemoveMessageResponse extends BaseInfoResponse<void> {
  RemoveMessageResponse({required super.result, super.message});
}

class GravityResponse extends BaseInfoResponse<List<String>> {
  GravityResponse({required super.result, super.message, super.data});
}

class MetricsResponse extends BaseInfoResponse<MetricsInfo> {
  MetricsResponse({required super.result, super.message, super.data});
}

class GatewayResponse extends BaseInfoResponse<GatewayInfo> {
  GatewayResponse({required super.result, super.message, super.data});
}

class DevicesResponse extends BaseInfoResponse<DevicesInfo> {
  DevicesResponse({required super.result, super.message, super.data});
}

class DeleteDeviceResponse extends BaseInfoResponse<void> {
  DeleteDeviceResponse({required super.result, super.message});
}

class ConfigurationResponse extends BaseInfoResponse<ConfigInfo> {
  ConfigurationResponse({required super.result, super.message, super.data});
}

class DeleteConfigResponse extends BaseInfoResponse<void> {
  DeleteConfigResponse({required super.result, super.message});
}

class PutConfigResponse extends BaseInfoResponse<void> {
  PutConfigResponse({required super.result, super.message});
}

class ActionResponse extends BaseInfoResponse<String> {
  ActionResponse({required super.result, super.message, super.data});
}

class SessionsResponse extends BaseInfoResponse<SessionsInfo> {
  SessionsResponse({required super.result, super.message, super.data});
}

class DeleteSessionResponse extends BaseInfoResponse<void> {
  DeleteSessionResponse({required super.result, super.message});
}

class ClientResponse extends BaseInfoResponse<ClientInfo> {
  ClientResponse({required super.result, super.message, super.data});
}

class DhcpResponse extends BaseInfoResponse<DhcpsInfo> {
  DhcpResponse({required super.result, super.message, super.data});
}

class DeleteDhcpResponse extends BaseInfoResponse<void> {
  DeleteDhcpResponse({required super.result, super.message});
}

class LocalDnsResponse extends BaseInfoResponse<List<LocalDns>> {
  LocalDnsResponse({required super.result, super.message, super.data});
}

class AddLocalDnsResponse extends BaseInfoResponse<void> {
  AddLocalDnsResponse({required super.result, super.message});
}

class DeleteLocalDnsResponse extends BaseInfoResponse<void> {
  DeleteLocalDnsResponse({required super.result, super.message});
}
