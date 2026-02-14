import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/fakes/repositories/api/fake_actions_repository.dart';
import '../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../testing/fakes/repositories/local/fake_gravity_repository.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('GravityUpdateProvider', () {
    late GravityUpdateProvider gravityUpdateProvider;
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
      repository = FakeGravityRepository();
      fakeActionsRepository = FakeActionsRepository();
      fakeFtlRepository = FakeFtlRepository();

      gravityUpdateProvider = GravityUpdateProvider(
        repository: repository,
      );
      gravityUpdateProvider.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );
      listenerCalled = false;
      gravityUpdateProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('Initial values are set correctly', () {
      expect(gravityUpdateProvider.status, GravityStatus.idle);
      expect(gravityUpdateProvider.logs, []);
      expect(gravityUpdateProvider.messages, []);
      expect(gravityUpdateProvider.startedAtTime, null);
      expect(gravityUpdateProvider.completedAtTime, null);
      expect(gravityUpdateProvider.isLoaded, false);
      expect(listenerCalled, false);
    });

    test('update() resets state and notifies listeners', () {
      gravityUpdateProvider.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );

      expect(gravityUpdateProvider.status, GravityStatus.idle);
      expect(gravityUpdateProvider.logs, []);
      expect(gravityUpdateProvider.messages, []);
      expect(gravityUpdateProvider.startedAtTime, null);
      expect(gravityUpdateProvider.completedAtTime, null);
      expect(gravityUpdateProvider.isLoaded, false);
      expect(listenerCalled, true);
    });

    test('clearMessages() clears messages and notifies listeners', () async {
      await gravityUpdateProvider.load();
      listenerCalled = false;

      gravityUpdateProvider.clearMessages();

      expect(gravityUpdateProvider.messages, []);
      expect(listenerCalled, true);
    });

    test('clearLogs() clears logs and notifies listeners', () {
      gravityUpdateProvider.appendLogs(['Log 1', 'Log 2']);

      gravityUpdateProvider.clearLogs();

      expect(gravityUpdateProvider.logs, []);
      expect(listenerCalled, true);
    });

    test('setStatus() updates status and notifies listeners', () {
      gravityUpdateProvider.setStatus(GravityStatus.running);

      expect(gravityUpdateProvider.status, GravityStatus.running);
      expect(listenerCalled, true);
    });

    test('setStartedAt() updates startedAt and notifies listeners', () {
      final now = DateTime.now();
      gravityUpdateProvider.setStartedAt(now);

      expect(gravityUpdateProvider.startedAtTime, now);
      expect(listenerCalled, true);
    });

    test('setCompletedAt() updates completedAt and notifies listeners', () {
      final now = DateTime.now();
      gravityUpdateProvider.setCompletedAt(now);

      expect(gravityUpdateProvider.completedAtTime, now);
      expect(listenerCalled, true);
    });

    test('appendLogs() adds logs and notifies listeners', () {
      gravityUpdateProvider.appendLogs(['Log 1', 'Log 2']);

      expect(gravityUpdateProvider.logs, ['Log 1', 'Log 2']);
      expect(listenerCalled, true);
    });

    test('reset() clears all data and resets state', () async {
      await gravityUpdateProvider.load();
      listenerCalled = false;

      gravityUpdateProvider.reset();

      expect(gravityUpdateProvider.logs, []);
      expect(gravityUpdateProvider.messages, []);
      expect(gravityUpdateProvider.status, GravityStatus.idle);
      expect(gravityUpdateProvider.startedAtTime, null);
      expect(gravityUpdateProvider.completedAtTime, null);
      expect(gravityUpdateProvider.isLoaded, false);
      expect(listenerCalled, true);
    });

    test('load() loads gravity data and notifies listeners', () async {
      await gravityUpdateProvider.load();

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(gravityUpdateProvider.messages[0].message, message);
      expect(gravityUpdateProvider.startedAtTime, startTime);
      expect(gravityUpdateProvider.completedAtTime, endTime);
      expect(gravityUpdateProvider.isLoaded, true);
      expect(listenerCalled, true);
    });

    test(
      'load() resumes with running status from previous session and handles as error',
      () async {
        repository.status = GravityStatus.running;
        await gravityUpdateProvider.load();

        expect(gravityUpdateProvider.status, GravityStatus.error);
        expect(gravityUpdateProvider.logs.length, 1);
        expect(gravityUpdateProvider.logs[0], log);
        expect(gravityUpdateProvider.messages.length, 1);
        expect(gravityUpdateProvider.messages[0].message, message);
        expect(gravityUpdateProvider.startedAtTime, startTime);
        expect(gravityUpdateProvider.completedAtTime, endTime);
        expect(gravityUpdateProvider.isLoaded, true);
        expect(listenerCalled, true);
      },
    );

    test('load() does not reload if already loaded', () async {
      await gravityUpdateProvider.load();
      expect(listenerCalled, true);
      listenerCalled = false;
      await gravityUpdateProvider.load();

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(gravityUpdateProvider.messages[0].message, message);
      expect(gravityUpdateProvider.startedAtTime, startTime);
      expect(gravityUpdateProvider.completedAtTime, endTime);
      expect(gravityUpdateProvider.isLoaded, true);
      expect(listenerCalled, false);
    });

    test('start() starts gravity update and notifies listeners', () async {
      final controller = StreamController<Result<List<String>>>();

      fakeActionsRepository.customGravityStream = () => controller.stream;
      gravityUpdateProvider.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );

      await gravityUpdateProvider.start();
      controller.add(const Success([log]));
      await controller.close();
      await Future.delayed(const Duration(seconds: 1));

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(listenerCalled, true);
    });

    test('start() handles stream error and updates status to error', () async {
      final controller = StreamController<Result<List<String>>>();

      fakeActionsRepository.customGravityStream = () => controller.stream;
      gravityUpdateProvider.update(
        actionsRepository: fakeActionsRepository,
        ftlRepository: fakeFtlRepository,
        serverAddress: testAddress,
      );

      await gravityUpdateProvider.start();

      controller.addError(Exception('Test error'));

      await controller.close();

      await Future.delayed(const Duration(seconds: 1));

      expect(gravityUpdateProvider.status, GravityStatus.error);
      expect(gravityUpdateProvider.completedAtTime, isNotNull);
      expect(listenerCalled, true);
    });

    test(
      'start() handles Result.Failure and updates status to error',
      () async {
        final controller = StreamController<Result<List<String>>>();

        fakeActionsRepository.customGravityStream = () => controller.stream;
        gravityUpdateProvider.update(
          actionsRepository: fakeActionsRepository,
          ftlRepository: fakeFtlRepository,
          serverAddress: testAddress,
        );

        await gravityUpdateProvider.start();
        controller.add(Failure(Exception('Gravity update error')));
        await controller.close();

        await Future.delayed(const Duration(seconds: 1));

        expect(gravityUpdateProvider.status, GravityStatus.error);
        expect(gravityUpdateProvider.logs.length, 0);
        expect(listenerCalled, true);
      },
    );

    test('removeMessage() removes a message and notifies listeners', () async {
      await gravityUpdateProvider.load();
      listenerCalled = false;

      final result = await gravityUpdateProvider.removeMessage(id);

      expect(result, true);
      expect(gravityUpdateProvider.messages, []);
      expect(listenerCalled, true);
    });

    test('removeMessage() returns false when API fails', () async {
      await gravityUpdateProvider.load();

      fakeFtlRepository.shouldFail = true;

      final result = await gravityUpdateProvider.removeMessage(id);

      expect(result, false);
      expect(gravityUpdateProvider.messages.length, 1);
    });
  });
}
