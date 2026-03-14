import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/model/local/gravity_db_data.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/gravity_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/client.dart';
import 'package:pi_hole_client/domain/model/ftl/ftl.dart';
import 'package:pi_hole_client/domain/model/ftl/host.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart';
import 'package:pi_hole_client/domain/model/ftl/sensor.dart';
import 'package:pi_hole_client/domain/model/ftl/system.dart';
import 'package:pi_hole_client/domain/model/ftl/version.dart';
import 'package:pi_hole_client/domain/model/gravity/gravity_snapshot.dart';
import 'package:pi_hole_client/domain/services/gravity_update_service.dart';
import 'package:result_dart/result_dart.dart';

// ---------------------------------------------------------------------------
// Fakes
// ---------------------------------------------------------------------------

class _FakeGravityRepository implements GravityRepository {
  int deleteGravityDataCalls = 0;
  int upsertGravityUpdateCalls = 0;
  int insertGravityLogsCalls = 0;
  int insertGravityMessagesCalls = 0;
  int deleteGravityMessageCalls = 0;

  GravitySnapshot? snapshotToReturn;
  bool fetchGravityDataShouldFail = false;
  bool deleteGravityMessageShouldFail = false;

  @override
  Future<Result<int>> deleteGravityData(String address) async {
    deleteGravityDataCalls++;
    return const Success(1);
  }

  @override
  Future<Result<int>> upsertGravityUpdate(
    String address,
    DateTime startTime,
    DateTime endTime,
    GravityStatus status,
  ) async {
    upsertGravityUpdateCalls++;
    return const Success(1);
  }

  @override
  Future<Result<int>> insertGravityLogs(
    String address,
    List<({int line, String message, DateTime timestamp})> entries,
  ) async {
    insertGravityLogsCalls++;
    return Success(entries.length);
  }

  @override
  Future<Result<int>> insertGravityMessages(
    String address,
    List<FtlMessage> messages,
  ) async {
    insertGravityMessagesCalls++;
    return Success(messages.length);
  }

  @override
  Future<Result<GravitySnapshot>> fetchGravityData(String address) async {
    if (fetchGravityDataShouldFail) {
      return Failure(Exception('db error'));
    }
    return Success(
      snapshotToReturn ??
          const GravitySnapshot(
            status: GravityStatus.success,
            logs: ['line1'],
            messages: [],
          ),
    );
  }

  @override
  Future<Result<int>> deleteGravityMessage(String address, int id) async {
    deleteGravityMessageCalls++;
    if (deleteGravityMessageShouldFail) return Failure(Exception('db error'));
    return const Success(1);
  }

  // Unused interface methods
  @override
  Future<Result<GravityUpdateData>> fetchGravityUpdate(String address) =>
      throw UnimplementedError();
  @override
  Future<Result<int>> deleteGravityUpdate(String address) =>
      throw UnimplementedError();
  @override
  Future<Result<List<GravityLogData>>> fetchGravityLogs(String address) =>
      throw UnimplementedError();
  @override
  Future<Result<int>> deleteGravityLogs(String address) =>
      throw UnimplementedError();
  @override
  Future<Result<List<GravityMessageData>>> fetchGravityMessages(
    String address,
  ) => throw UnimplementedError();
  @override
  Future<Result<int>> deleteGravityMessages(String address) =>
      throw UnimplementedError();
  @override
  Future<Result<int>> deleteAllGravityData() => throw UnimplementedError();
}

class _FakeActionsRepository implements ActionsRepository {
  _FakeActionsRepository(this._stream);

  final Stream<Result<List<String>>> _stream;

  @override
  Stream<Result<List<String>>> updateGravity() => _stream;

  @override
  Future<Result<Unit>> flushArp() => throw UnimplementedError();
  @override
  Future<Result<Unit>> flushLogs() => throw UnimplementedError();
  @override
  Future<Result<Unit>> restartDns() => throw UnimplementedError();
}

class _FakeFtlRepository implements FtlRepository {
  _FakeFtlRepository({this.messages = const [], this.deleteMessageFails = false});

  final List<FtlMessage> messages;
  final bool deleteMessageFails;

  int fetchInfoMessagesCalls = 0;
  int deleteInfoMessageCalls = 0;

  @override
  Future<Result<List<FtlMessage>>> fetchInfoMessages() async {
    fetchInfoMessagesCalls++;
    return Success(messages);
  }

  @override
  Future<Result<Unit>> deleteInfoMessage(int messageId) async {
    deleteInfoMessageCalls++;
    if (deleteMessageFails) return Failure(Exception('api error'));
    return const Success(unit);
  }

  // Unused interface methods
  @override
  Future<Result<FtlClient>> fetchInfoClient() => throw UnimplementedError();
  @override
  Future<Result<FtlInfo>> fetchInfoFtl() => throw UnimplementedError();
  @override
  Future<Result<FtlHost>> fetchInfoHost() => throw UnimplementedError();
  @override
  Future<Result<FtlDnsMetrics>> fetchInfoMetrics() =>
      throw UnimplementedError();
  @override
  Future<Result<FtlSensor>> fetchInfoSensors() => throw UnimplementedError();
  @override
  Future<Result<FtlSystem>> fetchInfoSystem() => throw UnimplementedError();
  @override
  Future<Result<FtlVersion>> fetchInfoVersion() => throw UnimplementedError();
  @override
  Future<Result<PiholeServer>> fetchAllServerInfo() =>
      throw UnimplementedError();
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

GravityUpdateService _buildService({
  required Stream<Result<List<String>>> stream,
  List<FtlMessage> messages = const [],
  bool deleteMessageFails = false,
  _FakeGravityRepository? gravityRepo,
}) {
  return GravityUpdateService(
    repository: gravityRepo ?? _FakeGravityRepository(),
    actionsRepository: _FakeActionsRepository(stream),
    ftlRepository: _FakeFtlRepository(
      messages: messages,
      deleteMessageFails: deleteMessageFails,
    ),
  );
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  // -------------------------------------------------------------------------
  // startUpdate — success path
  // -------------------------------------------------------------------------

  group('GravityUpdateService – startUpdate success', () {
    test('calls onStarted and onStatusChanged(running) immediately', () async {
      final controller = StreamController<Result<List<String>>>();
      final gravityRepo = _FakeGravityRepository();
      final service = _buildService(
        stream: controller.stream,
        gravityRepo: gravityRepo,
      );

      GravityStatus? firstStatus;
      var startedCalled = false;

      unawaited(service.startUpdate(
        address: 'pi.hole',
        onLogsUpdated: (_) {},
        onStatusChanged: (s) => firstStatus ??= s,
        onStarted: (_) => startedCalled = true,
        onCompleted: (_) {},
        onMessagesUpdated: (_) {},
      ));

      // Pump the event queue so async awaits inside startUpdate complete.
      await pumpEventQueue();

      expect(startedCalled, isTrue);
      expect(firstStatus, equals(GravityStatus.running));
      expect(gravityRepo.deleteGravityDataCalls, equals(1));
      expect(gravityRepo.upsertGravityUpdateCalls, greaterThanOrEqualTo(1));

      service.cancelUpdate();
      await controller.close();
    });

    test('accumulates log lines via onLogsUpdated', () async {
      final controller = StreamController<Result<List<String>>>();
      final service = _buildService(stream: controller.stream);

      final receivedLogs = <List<String>>[];
      unawaited(service.startUpdate(
        address: 'pi.hole',
        onLogsUpdated: (logs) => receivedLogs.add(List.of(logs)),
        onStatusChanged: (_) {},
        onStarted: (_) {},
        onCompleted: (_) {},
        onMessagesUpdated: (_) {},
      ));

      controller.add(const Success(['line1', 'line2']));
      controller.add(const Success(['line3']));
      await Future.delayed(const Duration(milliseconds: 50));

      expect(receivedLogs, isNotEmpty);
      // The last snapshot must contain all 3 lines accumulated.
      expect(receivedLogs.last, containsAll(['line1', 'line2', 'line3']));

      service.cancelUpdate();
      await controller.close();
    });

    test(
      'onStatusChanged(success) and onCompleted called when stream closes',
      () async {
        final controller = StreamController<Result<List<String>>>();
        final service = _buildService(stream: controller.stream);

        GravityStatus? finalStatus;
        final completer = Completer<void>();
        unawaited(service.startUpdate(
          address: 'pi.hole',
          onLogsUpdated: (_) {},
          onStatusChanged: (s) => finalStatus = s,
          onStarted: (_) {},
          onCompleted: (_) => completer.complete(),
          onMessagesUpdated: (_) {},
        ));

        // Closing the stream triggers onDone → success path.
        await controller.close();
        await completer.future.timeout(const Duration(seconds: 3));

        expect(finalStatus, equals(GravityStatus.success));
      },
    );

    test('insertGravityMessages called when fetchInfoMessages returns data',
        () async {
      final controller = StreamController<Result<List<String>>>();
      final gravityRepo = _FakeGravityRepository();
      final msg = FtlMessage(
        id: 1,
        timestamp: DateTime(2024),
        message: 'test',
        url: 'example.com',
      );
      final service = GravityUpdateService(
        repository: gravityRepo,
        actionsRepository: _FakeActionsRepository(controller.stream),
        ftlRepository: _FakeFtlRepository(messages: [msg]),
      );

      final completer = Completer<void>();
      unawaited(service.startUpdate(
        address: 'pi.hole',
        onLogsUpdated: (_) {},
        onStatusChanged: (_) {},
        onStarted: (_) {},
        onCompleted: (_) => completer.complete(),
        onMessagesUpdated: (_) {},
      ));

      await controller.close();
      await completer.future.timeout(const Duration(seconds: 3));

      expect(gravityRepo.insertGravityMessagesCalls, equals(1));
    });
  });

  // -------------------------------------------------------------------------
  // startUpdate — error path (Result.failure in stream)
  // -------------------------------------------------------------------------

  group('GravityUpdateService – startUpdate stream error', () {
    test('Result.failure sets status to error and calls onCompleted', () async {
      final controller = StreamController<Result<List<String>>>();
      final service = _buildService(stream: controller.stream);

      GravityStatus? finalStatus;
      final completer = Completer<void>();
      unawaited(service.startUpdate(
        address: 'pi.hole',
        onLogsUpdated: (_) {},
        onStatusChanged: (s) => finalStatus = s,
        onStarted: (_) {},
        onCompleted: (_) => completer.complete(),
        onMessagesUpdated: (_) {},
      ));

      controller.add(Failure(Exception('gravity failed')));
      await completer.future.timeout(const Duration(seconds: 2));
      await controller.close();

      expect(finalStatus, equals(GravityStatus.error));
    });

    test('stream exception (onError) sets status to error', () async {
      final controller = StreamController<Result<List<String>>>();
      final service = _buildService(stream: controller.stream);

      GravityStatus? finalStatus;
      final completer = Completer<void>();
      unawaited(service.startUpdate(
        address: 'pi.hole',
        onLogsUpdated: (_) {},
        onStatusChanged: (s) => finalStatus = s,
        onStarted: (_) {},
        onCompleted: (_) => completer.complete(),
        onMessagesUpdated: (_) {},
      ));

      controller.addError(Exception('unexpected error'));
      await completer.future.timeout(const Duration(seconds: 2));

      expect(finalStatus, equals(GravityStatus.error));
    });
  });

  // -------------------------------------------------------------------------
  // removeMessage
  // -------------------------------------------------------------------------

  group('GravityUpdateService – removeMessage', () {
    test('returns true when both API and DB deletions succeed', () async {
      final gravityRepo = _FakeGravityRepository();
      final service = GravityUpdateService(
        repository: gravityRepo,
        actionsRepository: _FakeActionsRepository(const Stream.empty()),
        ftlRepository: _FakeFtlRepository(),
      );

      final result = await service.removeMessage('pi.hole', 1);

      expect(result, isTrue);
      expect(gravityRepo.deleteGravityMessageCalls, equals(1));
    });

    test('returns false when API deletion fails', () async {
      final gravityRepo = _FakeGravityRepository();
      final service = GravityUpdateService(
        repository: gravityRepo,
        actionsRepository: _FakeActionsRepository(const Stream.empty()),
        ftlRepository: _FakeFtlRepository(deleteMessageFails: true),
      );

      final result = await service.removeMessage('pi.hole', 1);

      expect(result, isFalse);
      // DB delete must NOT have been called.
      expect(gravityRepo.deleteGravityMessageCalls, equals(0));
    });

    test('returns false when DB deletion fails', () async {
      final gravityRepo = _FakeGravityRepository()
        ..deleteGravityMessageShouldFail = true;
      final service = GravityUpdateService(
        repository: gravityRepo,
        actionsRepository: _FakeActionsRepository(const Stream.empty()),
        ftlRepository: _FakeFtlRepository(),
      );

      final result = await service.removeMessage('pi.hole', 1);

      expect(result, isFalse);
    });
  });

  // -------------------------------------------------------------------------
  // loadGravityData
  // -------------------------------------------------------------------------

  group('GravityUpdateService – loadGravityData', () {
    test('returns snapshot from repository on success', () async {
      const expected = GravitySnapshot(
        status: GravityStatus.success,
        logs: ['line1'],
        messages: [],
      );
      final gravityRepo = _FakeGravityRepository()
        ..snapshotToReturn = expected;
      final service = GravityUpdateService(
        repository: gravityRepo,
        actionsRepository: _FakeActionsRepository(const Stream.empty()),
        ftlRepository: _FakeFtlRepository(),
      );

      final result = await service.loadGravityData('pi.hole');

      expect(result, equals(expected));
    });

    test('returns idle snapshot when repository fails', () async {
      final gravityRepo = _FakeGravityRepository()
        ..fetchGravityDataShouldFail = true;
      final service = GravityUpdateService(
        repository: gravityRepo,
        actionsRepository: _FakeActionsRepository(const Stream.empty()),
        ftlRepository: _FakeFtlRepository(),
      );

      final result = await service.loadGravityData('pi.hole');

      expect(result.status, equals(GravityStatus.idle));
      expect(result.logs, isEmpty);
      expect(result.messages, isEmpty);
    });
  });

  // -------------------------------------------------------------------------
  // cancelUpdate
  // -------------------------------------------------------------------------

  group('GravityUpdateService – cancelUpdate', () {
    test('cancelling stops delivery of subsequent stream events', () async {
      final controller = StreamController<Result<List<String>>>();
      final service = _buildService(stream: controller.stream);

      var logUpdateCount = 0;
      unawaited(service.startUpdate(
        address: 'pi.hole',
        onLogsUpdated: (_) => logUpdateCount++,
        onStatusChanged: (_) {},
        onStarted: (_) {},
        onCompleted: (_) {},
        onMessagesUpdated: (_) {},
      ));

      controller.add(const Success(['line1']));
      await Future.delayed(const Duration(milliseconds: 50));
      final countAtCancel = logUpdateCount;

      service.cancelUpdate();

      // Events after cancel must not be delivered.
      controller.add(const Success(['line2']));
      await Future.delayed(const Duration(milliseconds: 50));

      expect(logUpdateCount, equals(countAtCancel));
      await controller.close();
    });
  });
}
