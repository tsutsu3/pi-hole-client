import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/local/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';

void main() {
  group('LocalAppLogRepository', () {
    final now = DateTime(2025, 1, 22, 10, 50, 31);
    late LocalAppLogRepository repository;

    setUp(() {
      repository = LocalAppLogRepository(now: () => now);
    });

    test('starts with no logs', () {
      expect(repository.logs, isEmpty);
    });

    test('add stores the log with the type name and the current time', () {
      repository.add(
        type: AppLogType.connection,
        message: 'Network connection failed.',
        statusCode: 503,
      );

      expect(repository.logs, [
        AppLog(
          type: 'connection',
          dateTime: now,
          message: 'Network connection failed.',
          statusCode: '503',
        ),
      ]);
    });

    test('add keeps the logs in the order they were added', () {
      repository
        ..add(type: AppLogType.auth, message: 'first')
        ..add(type: AppLogType.session, message: 'second');

      expect(repository.logs.map((log) => log.message), ['first', 'second']);
    });

    test('logsStream emits the new logs on each add', () async {
      final emitted = expectLater(
        repository.logsStream.map((logs) => logs.map((log) => log.message)),
        emitsInOrder([
          ['first'],
          ['first', 'second'],
        ]),
      );

      repository
        ..add(type: AppLogType.auth, message: 'first')
        ..add(type: AppLogType.auth, message: 'second');

      await emitted;
    });

    test('logs cannot be changed from outside', () {
      repository.add(type: AppLogType.auth, message: 'first');

      expect(() => repository.logs.clear(), throwsUnsupportedError);
    });

    test('add keeps only the newest maxLogs logs', () {
      for (var i = 0; i <= LocalAppLogRepository.maxLogs; i++) {
        repository.add(type: AppLogType.connection, message: '$i');
      }

      final messages = repository.logs.map((log) => log.message);
      expect(messages.length, LocalAppLogRepository.maxLogs);
      expect(messages.first, '1');
      expect(messages.last, '${LocalAppLogRepository.maxLogs}');
    });

    test('add hides secrets in the message', () {
      repository.add(
        type: AppLogType.connection,
        message: 'uri=http://pi.hole/admin/api.php?auth=abc123',
      );

      expect(
        repository.logs.single.message,
        'uri=http://pi.hole/admin/api.php?auth=***',
      );
    });
  });

  group('redactSecrets', () {
    final cases = <String, (String, String)>{
      'v5 ClientException with the token in the uri': (
        'ClientException with SocketException: Connection refused '
            '(OS Error: Connection refused, errno = 111), '
            'address = 192.168.1.2, port = 45678, '
            'uri=http://192.168.1.2/admin/api.php?auth=abc123&summaryRaw',
        'ClientException with SocketException: Connection refused '
            '(OS Error: Connection refused, errno = 111), '
            'address = 192.168.1.2, port = 45678, '
            'uri=http://192.168.1.2/admin/api.php?auth=***&summaryRaw',
      ),
      'query parameters': (
        'https://pi.hole/api?sid=s1&password=p1&token=t1&totp=123456',
        'https://pi.hole/api?sid=***&password=***&token=***&totp=***',
      ),
      'JSON values': (
        r'{"password": "p\"1", "sid":"s1", "totp": 123456, "token":"t1"}',
        '{"password": ***, "sid":***, "totp": ***, "token":***}',
      ),
      'header values': (
        '{X-FTL-SID: s1, Cookie: a=1; b=2, Authorization: Bearer t1}',
        '{X-FTL-SID: ***, Cookie: ***, Authorization: ***}',
      ),
      'Set-Cookie header': ('Set-Cookie: sid=s1; path=/', 'Set-Cookie: ***'),
      'text without secrets': (
        'Network connection failed. Connection refused',
        'Network connection failed. Connection refused',
      ),
    };

    for (final MapEntry(key: name, value: (input, expected)) in cases.entries) {
      test(name, () {
        expect(redactSecrets(input), expected);
      });
    }
  });
}
