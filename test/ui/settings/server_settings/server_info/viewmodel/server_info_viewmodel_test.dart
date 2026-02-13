import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/viewmodel/server_info_viewmodel.dart';

import '../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../testing/models/v6/ftl.dart';

void main() {
  group('ServerInfoViewModel', () {
    late FakeFtlRepository fakeFtlRepository;
    late ServerInfoViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeFtlRepository = FakeFtlRepository();
      viewModel = ServerInfoViewModel(ftlRepository: fakeFtlRepository);
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('loadServerInfo success populates server info', () async {
      await viewModel.loadServerInfo.runAsync();

      expect(viewModel.loadServerInfo.value, equals(kRepoFetchAllServerInfo));
      expect(viewModel.loadServerInfo.value.host, isNotNull);
      expect(viewModel.loadServerInfo.value.version, isNotNull);
    });

    test('loadServerInfo failure sets error', () async {
      fakeFtlRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.loadServerInfo.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.loadServerInfo.run();
      await completer.future;

      expect(viewModel.loadServerInfo.errors.value, isNotNull);
    });

    test('isRunning is true while loading', () async {
      final future = viewModel.loadServerInfo.runAsync();

      expect(viewModel.loadServerInfo.isRunning.value, isTrue);

      await future;

      expect(viewModel.loadServerInfo.isRunning.value, isFalse);
    });

    test('notifies listeners on state changes', () async {
      var notifyCount = 0;
      viewModel.addListener(() => notifyCount++);

      await viewModel.loadServerInfo.runAsync();

      expect(notifyCount, greaterThan(0));
    });
  });
}
