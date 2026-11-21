import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

/// Returns the [AppLogType] for [error].
AppLogType appLogTypeOf(Object error) {
  if (error is SidNotFoundException) return AppLogType.session;

  if (error is TotpRequiredException ||
      error is TotpInvalidException ||
      error is TotpReusedException ||
      error is TotpRateLimitException) {
    return AppLogType.auth;
  }

  final statusCode = switch (error) {
    HttpStatusCodeException(:final statusCode) => statusCode,
    ApiException(:final statusCode) => statusCode,
    _ => null,
  };

  if (statusCode == 401) return AppLogType.auth;

  return AppLogType.connection;
}
