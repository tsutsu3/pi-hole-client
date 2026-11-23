import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/app_log_type_of.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

void main() {
  group('appLogTypeOf', () {
    final cases = <String, (Object, AppLogType)>{
      'SecureStorageException': (
        SecureStorageException('Failed to read value for key'),
        AppLogType.storage,
      ),
      'SidNotFoundException': (SidNotFoundException(), AppLogType.session),
      'TotpRequiredException': (TotpRequiredException(), AppLogType.auth),
      'TotpInvalidException': (TotpInvalidException(), AppLogType.auth),
      'TotpReusedException': (TotpReusedException(), AppLogType.auth),
      'TotpRateLimitException': (TotpRateLimitException(), AppLogType.auth),
      'HttpStatusCodeException 401': (
        HttpStatusCodeException(401),
        AppLogType.auth,
      ),
      'ApiException 401': (
        ApiException(message: 'unauthorized', statusCode: 401),
        AppLogType.auth,
      ),
      'HttpStatusCodeException 503': (
        HttpStatusCodeException(503),
        AppLogType.connection,
      ),
      'ApiException without status code': (
        ApiException(message: 'timeout'),
        AppLogType.connection,
      ),
      'other exception': (Exception('unknown'), AppLogType.connection),
    };

    for (final MapEntry(key: name, value: (error, expected)) in cases.entries) {
      test('$name -> ${expected.name}', () {
        expect(appLogTypeOf(error), expected);
      });
    }
  });

  group('statusCodeOf', () {
    final cases = <String, (Object, int?)>{
      'HttpStatusCodeException': (HttpStatusCodeException(503), 503),
      'ApiException': (ApiException(message: 'm', statusCode: 404), 404),
      'ApiException without status code': (ApiException(message: 'm'), null),
      'other exception': (Exception('unknown'), null),
    };

    for (final MapEntry(key: name, value: (error, expected)) in cases.entries) {
      test('$name -> $expected', () {
        expect(statusCodeOf(error), expected);
      });
    }
  });
}
