import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../../testing/fakes/repositories/api/fake_actions_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../testing/fakes/repositories/local/fake_gravity_repository.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('GravityUpdateViewModel', () {
    late GravityUpdateViewModel gravityUpdateViewModel;
    late FakeGravityRepository repository;
    late FakeActionsRepository fakeActionsRepository;
    late FakeFtlRepository fakeFtlRepository;
    late bool listenerCalled;

    const testAddress = 'http://localhost:8081';

    const id = 1;
    final startTime = DateTime.fromMillisecondsSinceEpoch(1641031200000);
    final endTime = DateTime.fromMillisecondsSinceEpoch(1641032200000);
    const message = 'Test message';
    const log = 'Test log';

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      repository = FakeGravityRepository();
      fakeActionsRepository = FakeActionsRepository();
      fakeFtlRepository = FakeFtlRepository();

      gravityUpdateViewModel = GravityUpdateViewModel(repository: repository);
      gravityUpdateViewModel.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );
      listenerCalled = false;
      gravityUpdateViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    tearDown(() {
      gravityUpdateViewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('Initial values are set correctly', () {
      expect(gravityUpdateViewModel.status, GravityStatus.idle);
      expect(gravityUpdateViewModel.logs, []);
      expect(gravityUpdateViewModel.messages, []);
      expect(gravityUpdateViewModel.startedAtTime, null);
      expect(gravityUpdateViewModel.completedAtTime, null);
      expect(gravityUpdateViewModel.isLoaded, false);
      expect(listenerCalled, false);
    });

    test('update() resets state and notifies listeners', () {
      gravityUpdateViewModel.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );

      expect(gravityUpdateViewModel.status, GravityStatus.idle);
      expect(gravityUpdateViewModel.logs, []);
      expect(gravityUpdateViewModel.messages, []);
      expect(gravityUpdateViewModel.startedAtTime, null);
      expect(gravityUpdateViewModel.completedAtTime, null);
      expect(gravityUpdateViewModel.isLoaded, false);
      expect(listenerCalled, true);
    });

    test('clearMessages() clears messages and notifies listeners', () async {
      await gravityUpdateViewModel.load();
      listenerCalled = false;

      gravityUpdateViewModel.clearMessages();

      expect(gravityUpdateViewModel.messages, []);
      expect(listenerCalled, true);
    });

    test('clearLogs() clears logs and notifies listeners', () {
      gravityUpdateViewModel.appendLogs(['Log 1', 'Log 2']);

      gravityUpdateViewModel.clearLogs();

      expect(gravityUpdateViewModel.logs, []);
      expect(listenerCalled, true);
    });

    test('setStatus() updates status and notifies listeners', () {
      gravityUpdateViewModel.setStatus(GravityStatus.running);

      expect(gravityUpdateViewModel.status, GravityStatus.running);
      expect(listenerCalled, true);
    });

    test('setStartedAt() updates startedAt and notifies listeners', () {
      final now = DateTime.now();
      gravityUpdateViewModel.setStartedAt(now);

      expect(gravityUpdateViewModel.startedAtTime, now);
      expect(listenerCalled, true);
    });

    test('setCompletedAt() updates completedAt and notifies listeners', () {
      final now = DateTime.now();
      gravityUpdateViewModel.setCompletedAt(now);

      expect(gravityUpdateViewModel.completedAtTime, now);
      expect(listenerCalled, true);
    });

    test('appendLogs() adds logs and notifies listeners', () {
      gravityUpdateViewModel.appendLogs(['Log 1', 'Log 2']);

      expect(gravityUpdateViewModel.logs, ['Log 1', 'Log 2']);
      expect(listenerCalled, true);
    });

    test('reset() clears all data and resets state', () async {
      await gravityUpdateViewModel.load();
      listenerCalled = false;

      gravityUpdateViewModel.reset();

      expect(gravityUpdateViewModel.logs, []);
      expect(gravityUpdateViewModel.messages, []);
      expect(gravityUpdateViewModel.status, GravityStatus.idle);
      expect(gravityUpdateViewModel.startedAtTime, null);
      expect(gravityUpdateViewModel.completedAtTime, null);
      expect(gravityUpdateViewModel.isLoaded, false);
      expect(listenerCalled, true);
    });

    test('load() loads gravity data and notifies listeners', () async {
      await gravityUpdateViewModel.load();

      expect(gravityUpdateViewModel.status, GravityStatus.success);
      expect(gravityUpdateViewModel.logs.length, 1);
      expect(gravityUpdateViewModel.logs[0], log);
      expect(gravityUpdateViewModel.messages.length, 1);
      expect(gravityUpdateViewModel.messages[0].message, message);
      expect(gravityUpdateViewModel.startedAtTime, startTime);
      expect(gravityUpdateViewModel.completedAtTime, endTime);
      expect(gravityUpdateViewModel.isLoaded, true);
      expect(listenerCalled, true);
    });

    test(
      'load() resumes with running status from previous session and handles as error',
      () async {
        repository.status = GravityStatus.running;
        await gravityUpdateViewModel.load();

        expect(gravityUpdateViewModel.status, GravityStatus.error);
        expect(gravityUpdateViewModel.logs.length, 1);
        expect(gravityUpdateViewModel.logs[0], log);
        expect(gravityUpdateViewModel.messages.length, 1);
        expect(gravityUpdateViewModel.messages[0].message, message);
        expect(gravityUpdateViewModel.startedAtTime, startTime);
        expect(gravityUpdateViewModel.completedAtTime, endTime);
        expect(gravityUpdateViewModel.isLoaded, true);
        expect(listenerCalled, true);
      },
    );

    test('load() does not reload if already loaded', () async {
      await gravityUpdateViewModel.load();
      expect(listenerCalled, true);
      listenerCalled = false;
      await gravityUpdateViewModel.load();

      expect(gravityUpdateViewModel.status, GravityStatus.success);
      expect(gravityUpdateViewModel.logs.length, 1);
      expect(gravityUpdateViewModel.logs[0], log);
      expect(gravityUpdateViewModel.messages.length, 1);
      expect(gravityUpdateViewModel.messages[0].message, message);
      expect(gravityUpdateViewModel.startedAtTime, startTime);
      expect(gravityUpdateViewModel.completedAtTime, endTime);
      expect(gravityUpdateViewModel.isLoaded, true);
      expect(listenerCalled, false);
    });

    test('start() starts gravity update and notifies listeners', () async {
      final controller = StreamController<Result<List<String>>>();

      fakeActionsRepository.customGravityStream = () => controller.stream;
      gravityUpdateViewModel.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );

      await gravityUpdateViewModel.start();
      controller.add(const Success([log]));
      await controller.close();
      await Future.delayed(const Duration(seconds: 1));

      expect(gravityUpdateViewModel.status, GravityStatus.success);
      expect(gravityUpdateViewModel.logs.length, 1);
      expect(gravityUpdateViewModel.logs[0], log);
      expect(gravityUpdateViewModel.messages.length, 1);
      expect(listenerCalled, true);
    });

    test('start() handles stream error and updates status to error', () async {
      final controller = StreamController<Result<List<String>>>();

      fakeActionsRepository.customGravityStream = () => controller.stream;
      gravityUpdateViewModel.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );

      await gravityUpdateViewModel.start();

      controller.addError(Exception('Test error'));

      await controller.close();

      await Future.delayed(const Duration(seconds: 1));

      expect(gravityUpdateViewModel.status, GravityStatus.error);
      expect(gravityUpdateViewModel.completedAtTime, isNotNull);
      expect(listenerCalled, true);
    });

    test(
      'start() handles Result.Failure and updates status to error',
      () async {
        final controller = StreamController<Result<List<String>>>();

        fakeActionsRepository.customGravityStream = () => controller.stream;
        gravityUpdateViewModel.update(
          actionsRepository: fakeActionsRepository,
          ftlRepository: fakeFtlRepository,
          serverAddress: testAddress,
        );

        await gravityUpdateViewModel.start();
        controller.add(Failure(Exception('Gravity update error')));
        await controller.close();

        await Future.delayed(const Duration(seconds: 1));

        expect(gravityUpdateViewModel.status, GravityStatus.error);
        expect(gravityUpdateViewModel.logs.length, 0);
        expect(listenerCalled, true);
      },
    );

    test(
      'removeMessage Command removes a message and notifies listeners',
      () async {
        await gravityUpdateViewModel.load();
        listenerCalled = false;

        await gravityUpdateViewModel.removeMessage.runAsync(id);

        expect(gravityUpdateViewModel.removeMessage.errors.value, isNull);
        expect(gravityUpdateViewModel.messages, []);
        expect(listenerCalled, true);
      },
    );

    test('removeMessage Command sets error on failure', () async {
      await gravityUpdateViewModel.load();

      fakeFtlRepository.shouldFail = true;

      try {
        await gravityUpdateViewModel.removeMessage.runAsync(id);
      } catch (_) {}

      expect(gravityUpdateViewModel.removeMessage.errors.value, isNotNull);
      expect(gravityUpdateViewModel.messages.length, 1);
    });
  });
}
