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
