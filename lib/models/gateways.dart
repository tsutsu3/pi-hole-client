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
