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
