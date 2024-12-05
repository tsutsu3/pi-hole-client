import 'package:pi_hole_client/models/app_log.dart';

enum LoginResultType {
  success,
  authError,
  noConnection,
  socket,
  timeout,
  sslError,
  error
}

class LoginQueryResponse {
  final LoginResultType result;
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
