import 'package:pi_hole_client/models/api/v6/domains/domains.dart' as v6;
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';

enum APiResponseType {
  success,
  authError,
  noConnection,
  socket,
  timeout,
  sslError,
  error,
  alreadyAdded
}

/// A response object for the login query.
///
/// When Successful [result], [status] and [sid] are returned.
/// When error, [result] and [log] are returned.
class LoginQueryResponse {
  final APiResponseType result;
  final AppLog? log;
  final String? status;
  final String? sid;

  LoginQueryResponse({
    required this.result,
    this.log,
    this.status,
    this.sid,
  });
}

class RealtimeStatusResponse {
  final APiResponseType result;
  final RealtimeStatus? data;

  RealtimeStatusResponse({
    required this.result,
    this.data,
  });
}

class DisableServerResponse {
  final APiResponseType result;
  final String? status;

  DisableServerResponse({
    required this.result,
    this.status,
  });
}

class EnableServerResponse {
  final APiResponseType result;
  final String? status;

  EnableServerResponse({
    required this.result,
    this.status,
  });
}

class FetchOverTimeDataResponse {
  final APiResponseType result;
  final OverTimeData? data;

  FetchOverTimeDataResponse({
    required this.result,
    this.data,
  });
}

class FetchLogsResponse {
  final APiResponseType result;
  final List<Log>? data;

  FetchLogsResponse({
    required this.result,
    this.data,
  });
}

class DomainResult {
  final bool success;
  final String message;

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

  /// Converts a [AddDomains] object to a [DomainResult] object.
  ///
  /// Warning: This method assumes that the [AddDomains] object has exactly 1 domain.
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

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}

class SetWhiteBlacklistResponse {
  final APiResponseType result;
  final String? message;
  final DomainResult? data;

  SetWhiteBlacklistResponse({
    required this.result,
    this.message,
    this.data,
  });
}

class DomainListResult {
  final List<Domain> whitelist;
  final List<Domain> whitelistRegex;
  final List<Domain> blacklist;
  final List<Domain> blacklistRegex;

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
}

class GetDomainLists {
  final APiResponseType result;
  final DomainListResult? data;

  GetDomainLists({
    required this.result,
    this.data,
  });
}

class RemoveDomainFromListResponse {
  final APiResponseType result;
  final String? message;

  RemoveDomainFromListResponse({
    required this.result,
    this.message,
  });
}

class AddDomainToListResponse {
  final APiResponseType result;

  AddDomainToListResponse({
    required this.result,
  });
}
