import 'package:pi_hole_client/models/api/v6/domains/domains.dart' as v6;
import 'package:pi_hole_client/models/api/v6/flt/host.dart';
import 'package:pi_hole_client/models/api/v6/flt/sensors.dart';
import 'package:pi_hole_client/models/api/v6/flt/system.dart';
import 'package:pi_hole_client/models/api/v6/flt/version.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/models/version.dart';

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
}

/// A response object for the login query.
///
/// When Successful [result], [status] and [sid] are returned.
/// When error, [result] and [log] are returned.
class LoginQueryResponse {
  LoginQueryResponse({
    required this.result,
    this.log,
    this.status,
    this.sid,
  });

  final APiResponseType result;
  final AppLog? log;
  final String? status;
  final String? sid;
}

class RealtimeStatusResponse {
  RealtimeStatusResponse({
    required this.result,
    this.data,
  });

  final APiResponseType result;
  final RealtimeStatus? data;
}

class DisableServerResponse {
  DisableServerResponse({
    required this.result,
    this.status,
  });

  final APiResponseType result;
  final String? status;
}

class EnableServerResponse {
  EnableServerResponse({
    required this.result,
    this.status,
  });

  final APiResponseType result;
  final String? status;
}

class FetchOverTimeDataResponse {
  FetchOverTimeDataResponse({
    required this.result,
    this.data,
  });

  final APiResponseType result;
  final OverTimeData? data;
}

class FetchLogsResponse {
  FetchLogsResponse({
    required this.result,
    this.data,
  });

  final APiResponseType result;
  final List<Log>? data;
}

class DomainResult {
  DomainResult({
    required this.success,
    required this.message,
  });
  factory DomainResult.fromJson(Map<String, dynamic> json) {
    return DomainResult(
      success: json['success'],
      message: json['message'],
    );
  }

  /// Converts a [v6.AddDomains] object to a [DomainResult] object.
  ///
  /// Warning: This method assumes that the [v6.AddDomains] object has exactly 1 domain.
  factory DomainResult.fromV6(v6.AddDomains domains) {
    if (domains.domains.length != 1) {
      throw ArgumentError('domains must have exactly 1 item');
    }

    if (domains.processed.success.isNotEmpty) {
      return DomainResult(
        success: true,
        message: 'Added ${domains.processed.success[0].item}',
      );
    }

    if (domains.processed.errors.isNotEmpty) {
      return DomainResult(
        success: false,
        message: domains.processed.errors[0].error,
      );
    }

    throw ArgumentError('domains must have either success or error');
  }

  final bool success;
  final String message;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}

class SetWhiteBlacklistResponse {
  SetWhiteBlacklistResponse({
    required this.result,
    this.message,
    this.data,
  });

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
          dateAdded:
              DateTime.fromMillisecondsSinceEpoch(domain.dateAdded * 1000),
          dateModified:
              DateTime.fromMillisecondsSinceEpoch(domain.dateModified * 1000),
          comment: domain.comment,
          groups: domain.groups,
        );
      }).toList();
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
  GetDomainLists({
    required this.result,
    this.data,
  });

  final APiResponseType result;
  final DomainListResult? data;
}

class RemoveDomainFromListResponse {
  RemoveDomainFromListResponse({
    required this.result,
    this.message,
  });

  final APiResponseType result;
  final String? message;
}

class AddDomainToListResponse {
  AddDomainToListResponse({
    required this.result,
  });

  final APiResponseType result;
}

abstract class BaseInfoResponse<T> {
  BaseInfoResponse({
    required this.result,
    this.message,
    this.data,
  });

  final APiResponseType result;
  final String? message;
  final T? data;
}

class HostResponse extends BaseInfoResponse<Host> {
  HostResponse({
    required super.result,
    super.message,
    super.data,
  });
}

class SensorsResponse extends BaseInfoResponse<Sensors> {
  SensorsResponse({
    required super.result,
    super.message,
    super.data,
  });
}

class SystemResponse extends BaseInfoResponse<System> {
  SystemResponse({
    required super.result,
    super.message,
    super.data,
  });
}

class VersionResponse extends BaseInfoResponse<VersionInfo> {
  VersionResponse({
    required super.result,
    super.message,
    super.data,
  });
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
  final Host? host;
  final Sensors? sensors;
  final System? system;
  final Version? version;
}
