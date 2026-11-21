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
  });
}
