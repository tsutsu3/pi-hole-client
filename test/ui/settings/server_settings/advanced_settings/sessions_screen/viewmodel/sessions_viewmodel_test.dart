import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/viewmodel/sessions_viewmodel.dart';

import '../../../../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../../../../testing/models/v6/auth.dart';

void main() {
  group('SessionsViewModel', () {
    late FakeAuthRepository fakeAuthRepository;
    late SessionsViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeAuthRepository = FakeAuthRepository();
      viewModel = SessionsViewModel(authRepository: fakeAuthRepository);
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('loadSessions success populates sessions list', () async {
      await viewModel.loadSessions.runAsync();

      expect(viewModel.loadSessions.value, equals(kRepoGetAllSessions));
      expect(viewModel.loadSessions.value.length, 3);
    });

    test('loadSessions failure sets error', () async {
      fakeAuthRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.loadSessions.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.loadSessions.run();
      await completer.future;

      expect(viewModel.loadSessions.errors.value, isNotNull);
    });

    test('deleteSession success reloads sessions', () async {
      await viewModel.loadSessions.runAsync();
      expect(fakeAuthRepository.getAllSessionsCallCount, 1);

      await viewModel.deleteSession.runAsync(0);

      // getAllSessions called again by _deleteSession's reload
      expect(fakeAuthRepository.getAllSessionsCallCount, 2);
      expect(viewModel.loadSessions.value, equals(kRepoGetAllSessions));
    });

    test('deleteSession failure sets error', () async {
      // First load sessions successfully
      await viewModel.loadSessions.runAsync();

      // Now make repository fail
      fakeAuthRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.deleteSession.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.deleteSession.run(0);
      await completer.future;

      expect(viewModel.deleteSession.errors.value, isNotNull);
    });

    test('isRunning is true while loading', () async {
      final future = viewModel.loadSessions.runAsync();

      // isRunning should be true during execution
      expect(viewModel.loadSessions.isRunning.value, isTrue);

      await future;

      expect(viewModel.loadSessions.isRunning.value, isFalse);
    });

    test('notifies listeners on state changes', () async {
      var notifyCount = 0;
      viewModel.addListener(() => notifyCount++);

      await viewModel.loadSessions.runAsync();

      expect(notifyCount, greaterThan(0));
    });
  });
}
