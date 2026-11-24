import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/local/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';
import 'package:pi_hole_client/ui/app_logs/view_models/app_logs_viewmodel.dart';

void main() {
  group('AppLogsViewModel', () {
    late LocalAppLogRepository repository;

    setUp(() {
      repository = LocalAppLogRepository();
    });

    test('shows the logs that exist when it is created', () {
      repository.add(type: AppLogType.auth, message: 'before');

      final viewModel = AppLogsViewModel(repository: repository);
      addTearDown(viewModel.dispose);

      expect(viewModel.logs.map((log) => log.message), ['before']);
    });

    test('shows the newest log first', () {
      repository
        ..add(type: AppLogType.auth, message: 'first')
        ..add(type: AppLogType.auth, message: 'second');

      final viewModel = AppLogsViewModel(repository: repository);
      addTearDown(viewModel.dispose);

      expect(viewModel.logs.map((log) => log.message), ['second', 'first']);
    });

    test('groups the logs by day, newest day first', () {
      var now = DateTime(2025, 1, 21, 23, 59);
      repository = LocalAppLogRepository(now: () => now)
        ..add(type: AppLogType.auth, message: 'day1');

      now = DateTime(2025, 1, 22, 0, 1);
      repository.add(type: AppLogType.auth, message: 'day2-a');

      now = DateTime(2025, 1, 22, 10);
      repository.add(type: AppLogType.auth, message: 'day2-b');

      final viewModel = AppLogsViewModel(repository: repository);
      addTearDown(viewModel.dispose);

      final groups = viewModel.logsByDay;
      expect(groups.map((group) => group.day), [
        DateTime(2025, 1, 22),
        DateTime(2025, 1, 21),
      ]);
      expect(
        groups.map((group) => group.logs.map((log) => log.message).toList()),
        [
          ['day2-b', 'day2-a'],
          ['day1'],
        ],
      );
    });

    test(
      'updates the logs and notifies listeners when a log is added',
      () async {
        final viewModel = AppLogsViewModel(repository: repository);
        addTearDown(viewModel.dispose);
        var notified = 0;
        viewModel.addListener(() => notified++);

        repository.add(type: AppLogType.connection, message: 'after');
        await Future<void>.delayed(Duration.zero);

        expect(viewModel.logs.map((log) => log.message), ['after']);
        expect(notified, 1);
      },
    );

    test('stops listening after dispose', () async {
      final viewModel = AppLogsViewModel(repository: repository)..dispose();

      repository.add(type: AppLogType.connection, message: 'after');
      await Future<void>.delayed(Duration.zero);

      expect(viewModel.logs, isEmpty);
    });
  });
}
