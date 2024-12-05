import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/realtime_status.dart';

enum APiResponseType {
  success,
  authError,
  noConnection,
  socket,
  timeout,
  sslError,
  error
}

/// A response object for the login query.
///
/// When Successful [result], [status] and [phpSessId] are returned.
/// When error, [result] and [log] are returned.
class LoginQueryResponse {
  final APiResponseType result;
  final AppLog? log;
  final String? status;
  final String? phpSessId;

  LoginQueryResponse({
    required this.result,
    this.log,
    this.status,
    this.phpSessId,
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
