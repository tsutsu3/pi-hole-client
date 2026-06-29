import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/view_models/server_info_viewmodel.dart';

import '../../../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../testing/models/v6/ftl.dart';

void main() {
  group('ServerInfoViewModel', () {
    late FakeFtlRepository fakeFtlRepository;
    late FakeAuthRepository fakeAuthRepository;
    late ServerInfoViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeFtlRepository = FakeFtlRepository();
      fakeAuthRepository = FakeAuthRepository();
      viewModel = ServerInfoViewModel(
        ftlRepository: fakeFtlRepository,
        authRepository: fakeAuthRepository,
      );
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

    test('mfaEnabled is true when server uses 2FA', () async {
      fakeAuthRepository.serverUsesTotp = true;
      await viewModel.loadServerInfo.runAsync();
      expect(viewModel.mfaEnabled, isTrue);
    });

    test('mfaEnabled is false when server does not use 2FA', () async {
      fakeAuthRepository.serverUsesTotp = false;
      await viewModel.loadServerInfo.runAsync();
      expect(viewModel.mfaEnabled, isFalse);
    });

    test('mfaEnabled is null when 2FA status is unavailable', () async {
      // getAuth failure mimics v5, which has no 2FA support.
      fakeAuthRepository.shouldFail = true;
      await viewModel.loadServerInfo.runAsync();
      expect(viewModel.mfaEnabled, isNull);
    });
  });
}
