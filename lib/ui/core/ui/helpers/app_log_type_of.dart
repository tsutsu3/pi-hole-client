import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

/// Returns the [AppLogType] for [error].
AppLogType appLogTypeOf(Object error) {
  if (error is SecureStorageException) return AppLogType.storage;

  if (error is SidNotFoundException) return AppLogType.session;

  if (error is TotpRequiredException ||
      error is TotpInvalidException ||
      error is TotpReusedException ||
      error is TotpRateLimitException) {
    return AppLogType.auth;
  }

  if (statusCodeOf(error) == 401) return AppLogType.auth;

  return AppLogType.connection;
}

/// Returns the HTTP status code in [error], or null when it has none.
int? statusCodeOf(Object error) {
  return switch (error) {
    HttpStatusCodeException(:final statusCode) => statusCode,
    ApiException(:final statusCode) => statusCode,
    _ => null,
  };
}
