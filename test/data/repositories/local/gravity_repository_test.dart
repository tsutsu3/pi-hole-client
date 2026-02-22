import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/local/gravity_db_data.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../testing/fakes/services/fake_database_service.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  const dbName = inMemoryDatabasePath;
  const address = 'http://localhost';
  const messageId = 1;
  final gravityUpdateDataJson = {
    'address': address,
    'start_time': '2025-03-04 17:22:10',
    'end_time': '2025-03-04 17:22:40',
    'status': GravityStatus.idle.index,
  };
  final gravityLogsDataJson = {
    'address': address,
    'line': 1,
    'message': 'Test log 1',
    'timestamp': '2025-03-04 17:22:10',
  };
  final gravityMessagesDataJson = {
    'address': address,
    'message_id': messageId,
    'message': 'Test message 1',
    'url': 'http://example.com',
    'timestamp': '2025-03-04 17:22:10',
  };
  final serverV6 = {
    'address': address,
    'alias': 'test6',
    'isDefaultServer': 1,
    'apiVersion': 'v6',
    'allowSelfSignedCert': 1,
  };

  final gravityUpdateData = GravityUpdateData.fromMap(gravityUpdateDataJson);
  final gravityLogsData = GravityLogData.fromMap(gravityLogsDataJson);
  final gravityMessagesData = GravityMessageData.fromMap(
    gravityMessagesDataJson,
  );

  sqfliteTestInit();

  group('GravityRepository.fetchGravityUpdate', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('fetch gravity update data when it exists', () async {
      await dbService.insert('gravity_updates', gravityUpdateDataJson);

      final result = await repository.fetchGravityUpdate(address);
      expect(result.isSuccess(), true);
      final fetchedUpdate = result.getOrNull()!;
      expect(fetchedUpdate.address, gravityUpdateData.address);
      expect(fetchedUpdate.startTime, gravityUpdateData.startTime);
      expect(fetchedUpdate.endTime, gravityUpdateData.endTime);
      expect(fetchedUpdate.status, gravityUpdateData.status);
    });

    test('fetch gravity update data when it does not exist', () async {
      final result = await repository.fetchGravityUpdate(address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull()!.address, '');
    });

    test('returns fFailure when unexpected error', () async {
      dbService.shouldThrowOnQuery = true;
      final result = await repository.fetchGravityUpdate(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Failed to get gravity update'),
      );
    });
  });

  group('GravityRepository.upsertGravityUpdate', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('upsert gravity update data when it does not exist', () async {
      final result = await repository.upsertGravityUpdate(gravityUpdateData);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityUpdate(address);
      final fetchedUpsert = fetchedResult.getOrNull()!;
      expect(fetchedUpsert.address, gravityUpdateData.address);
      expect(fetchedUpsert.startTime, gravityUpdateData.startTime);
      expect(fetchedUpsert.endTime, gravityUpdateData.endTime);
      expect(fetchedUpsert.status, gravityUpdateData.status);
    });

    test('upsert gravity update data when it exists', () async {
      await dbService.insert('gravity_updates', gravityUpdateDataJson);

      final updatedData = gravityUpdateData.copyWith(
        status: GravityStatus.running.index,
      );
      final result = await repository.upsertGravityUpdate(updatedData);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityUpdate(address);
      final fetchedUpdated = fetchedResult.getOrNull()!;
      expect(fetchedUpdated.address, updatedData.address);
      expect(fetchedUpdated.startTime, updatedData.startTime);
      expect(fetchedUpdated.endTime, updatedData.endTime);
      expect(fetchedUpdated.status, updatedData.status);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnInsert = true;
      final result = await repository.upsertGravityUpdate(gravityUpdateData);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to upsert gravity update'),
      );
    });
  });

  group('GravityRepository.deleteGravityUpdate', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('delete gravity update data when it exists', () async {
      await dbService.insert('gravity_updates', gravityUpdateDataJson);

      final result = await repository.deleteGravityUpdate(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityUpdate(address);
      expect(fetchedResult.getOrNull()!.isInitial(), true);
    });

    test('delete gravity update data when it does not exist', () async {
      final result = await repository.deleteGravityUpdate(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityUpdate(address);
      expect(fetchedResult.getOrNull()!.isInitial(), true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnDelete = true;
      final result = await repository.deleteGravityUpdate(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to remove gravity update'),
      );
    });
  });

  group('GravityRepository.fetchGravityLogs', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('fetch gravity logs when they exist', () async {
      await dbService.insert('gravity_logs', gravityLogsDataJson);

      final result = await repository.fetchGravityLogs(address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull()!.length, 1);
      final fetchedLog = result.getOrNull()![0];
      expect(fetchedLog.address, gravityLogsData.address);
      expect(fetchedLog.line, gravityLogsData.line);
      expect(fetchedLog.message, gravityLogsData.message);
      expect(fetchedLog.timestamp, gravityLogsData.timestamp);
    });

    test('fetch gravity logs when they do not exist', () async {
      final result = await repository.fetchGravityLogs(address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull()!.isEmpty, true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnQuery = true;
      final result = await repository.fetchGravityLogs(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to get gravity logs'),
      );
    });
  });

  group('GravityRepository.insertGravityLogs', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('insert gravity logs when they do not exist', () async {
      final result = await repository.insertGravityLogs([gravityLogsData]);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityLogs(address);
      expect(fetchedResult.getOrNull()!.length, 1);
      final fetchedLog0 = fetchedResult.getOrNull()![0];
      expect(fetchedLog0.address, gravityLogsData.address);
      expect(fetchedLog0.line, gravityLogsData.line);
      expect(fetchedLog0.message, gravityLogsData.message);
      expect(fetchedLog0.timestamp, gravityLogsData.timestamp);
    });

    test('insert gravity logs when they exist', () async {
      await repository.insertGravityLogs([gravityLogsData]);
      final result = await repository.insertGravityLogs([gravityLogsData]);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityLogs(address);
      expect(fetchedResult.getOrNull()!.length, 2);
      final fetchedLogFirst = fetchedResult.getOrNull()![0];
      expect(fetchedLogFirst.address, gravityLogsData.address);
      expect(fetchedLogFirst.line, gravityLogsData.line);
      expect(fetchedLogFirst.message, gravityLogsData.message);
      expect(fetchedLogFirst.timestamp, gravityLogsData.timestamp);
      final fetchedLogSecond = fetchedResult.getOrNull()![1];
      expect(fetchedLogSecond.address, gravityLogsData.address);
      expect(fetchedLogSecond.line, gravityLogsData.line);
      expect(fetchedLogSecond.message, gravityLogsData.message);
      expect(fetchedLogSecond.timestamp, gravityLogsData.timestamp);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnTransaction = true;
      final result = await repository.insertGravityLogs([gravityLogsData]);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to insert gravity logs'),
      );
    });
  });

  group('GravityRepository.deleteGravityLogs', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('delete gravity logs when they exist', () async {
      await dbService.insert('gravity_logs', gravityLogsDataJson);

      final result = await repository.deleteGravityLogs(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityLogs(address);
      expect(fetchedResult.getOrNull()!.isEmpty, true);
    });

    test('delete gravity logs when they do not exist', () async {
      final result = await repository.deleteGravityLogs(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityLogs(address);
      expect(fetchedResult.getOrNull()!.isEmpty, true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnDelete = true;
      final result = await repository.deleteGravityLogs(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to delete gravity logs'),
      );
    });
  });

  group('GravityRepository.fetchGravityMessages', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('fetch gravity messages when they exist', () async {
      await dbService.insert('gravity_messages', gravityMessagesDataJson);

      final result = await repository.fetchGravityMessages(address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull()!.length, 1);
      final fetchedMsg = result.getOrNull()![0];
      expect(fetchedMsg.id, gravityMessagesData.id);
      expect(fetchedMsg.address, gravityMessagesData.address);
      expect(fetchedMsg.message, gravityMessagesData.message);
      expect(fetchedMsg.url, gravityMessagesData.url);
      expect(fetchedMsg.timestamp, gravityMessagesData.timestamp);
    });

    test('fetch gravity messages when they do not exist', () async {
      final result = await repository.fetchGravityMessages(address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull()!.isEmpty, true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnQuery = true;
      final result = await repository.fetchGravityMessages(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to get gravity messages'),
      );
    });
  });

  group('GravityRepository.insertGravityMessages', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('insert gravity messages when they do not exist', () async {
      final result = await repository.insertGravityMessages([
        gravityMessagesData,
      ]);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityMessages(address);
      expect(fetchedResult.getOrNull()!.length, 1);
      final fetched0 = fetchedResult.getOrNull()![0];
      expect(fetched0.id, gravityMessagesData.id);
      expect(fetched0.address, gravityMessagesData.address);
      expect(fetched0.message, gravityMessagesData.message);
      expect(fetched0.url, gravityMessagesData.url);
      expect(fetched0.timestamp, gravityMessagesData.timestamp);
    });

    test('insert gravity messages when they exist', () async {
      await repository.insertGravityMessages([gravityMessagesData]);
      final result = await repository.insertGravityMessages([
        gravityMessagesData,
      ]);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityMessages(address);
      expect(fetchedResult.getOrNull()!.length, 2);
      final fetchedFirst = fetchedResult.getOrNull()![0];
      expect(fetchedFirst.id, gravityMessagesData.id);
      expect(fetchedFirst.address, gravityMessagesData.address);
      expect(fetchedFirst.message, gravityMessagesData.message);
      expect(fetchedFirst.url, gravityMessagesData.url);
      expect(fetchedFirst.timestamp, gravityMessagesData.timestamp);
      final fetchedSecond = fetchedResult.getOrNull()![1];
      expect(fetchedSecond.id, gravityMessagesData.id);
      expect(fetchedSecond.address, gravityMessagesData.address);
      expect(fetchedSecond.message, gravityMessagesData.message);
      expect(fetchedSecond.url, gravityMessagesData.url);
      expect(fetchedSecond.timestamp, gravityMessagesData.timestamp);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnTransaction = true;
      final result = await repository.insertGravityMessages([
        gravityMessagesData,
      ]);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to insert gravity messages'),
      );
    });
  });

  group('GravityRepository.deleteGravityMessages', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('delete gravity messages when they exist', () async {
      await dbService.insert('gravity_messages', gravityMessagesDataJson);

      final result = await repository.deleteGravityMessages(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityMessages(address);
      expect(fetchedResult.getOrNull()!.isEmpty, true);
    });

    test('delete gravity messages when they do not exist', () async {
      final result = await repository.deleteGravityMessages(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityMessages(address);
      expect(fetchedResult.getOrNull()!.isEmpty, true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnDelete = true;
      final result = await repository.deleteGravityMessages(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to delete gravity messages'),
      );
    });
  });

  group('GravityRepository.deleteGravityMessage', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('delete a specific gravity message when it exists', () async {
      await dbService.insert('gravity_messages', gravityMessagesDataJson);

      final result = await repository.deleteGravityMessage(address, messageId);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityMessages(address);
      expect(fetchedResult.getOrNull()!.isEmpty, true);
    });

    test('delete a specific gravity message when it does not exist', () async {
      final result = await repository.deleteGravityMessage(address, messageId);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityMessages(address);
      expect(fetchedResult.getOrNull()!.isEmpty, true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnDelete = true;
      final result = await repository.deleteGravityMessage(address, messageId);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to delete gravity message'),
      );
    });
  });

  group('GravityRepository.fetchGravityData', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('fetch all gravity data when it exists', () async {
      await dbService.insert('gravity_updates', gravityUpdateDataJson);
      await dbService.insert('gravity_logs', gravityLogsDataJson);
      await dbService.insert('gravity_messages', gravityMessagesDataJson);

      final result = await repository.fetchGravityData(address);
      expect(result.isSuccess(), true);
      final fetchedUpdate = result.getOrNull()!.gravityUpdate!;
      expect(fetchedUpdate.address, gravityUpdateData.address);
      expect(fetchedUpdate.startTime, gravityUpdateData.startTime);
      expect(fetchedUpdate.endTime, gravityUpdateData.endTime);
      expect(fetchedUpdate.status, gravityUpdateData.status);
      expect(result.getOrNull()!.gravityLogs?.length, 1);
      final fetchedLog = result.getOrNull()!.gravityLogs![0];
      expect(fetchedLog.address, gravityLogsData.address);
      expect(fetchedLog.line, gravityLogsData.line);
      expect(fetchedLog.message, gravityLogsData.message);
      expect(fetchedLog.timestamp, gravityLogsData.timestamp);
      expect(result.getOrNull()!.gravityMessages?.length, 1);
      final fetchedMsg = result.getOrNull()!.gravityMessages![0];
      expect(fetchedMsg.id, gravityMessagesData.id);
      expect(fetchedMsg.address, gravityMessagesData.address);
      expect(fetchedMsg.message, gravityMessagesData.message);
      expect(fetchedMsg.url, gravityMessagesData.url);
      expect(fetchedMsg.timestamp, gravityMessagesData.timestamp);
    });

    test('fetch all gravity data when it does not exist', () async {
      final result = await repository.fetchGravityData(address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull()!.gravityUpdate?.isInitial(), true);
      expect(result.getOrNull()!.gravityLogs, isEmpty);
      expect(result.getOrNull()!.gravityMessages, isEmpty);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnQuery = true;
      final result = await repository.fetchGravityData(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to get gravity data'),
      );
    });
  });

  group('GravityRepository.deleteGravityData', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('delete all gravity data when it exists', () async {
      await dbService.insert('gravity_updates', gravityUpdateDataJson);
      await dbService.insert('gravity_logs', gravityLogsDataJson);
      await dbService.insert('gravity_messages', gravityMessagesDataJson);

      final result = await repository.deleteGravityData(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityData(address);
      expect(fetchedResult.getOrNull()!.gravityUpdate?.isInitial(), true);
      expect(fetchedResult.getOrNull()!.gravityLogs, isEmpty);
      expect(fetchedResult.getOrNull()!.gravityMessages, isEmpty);
    });

    test('delete all gravity data when it does not exist', () async {
      final result = await repository.deleteGravityData(address);
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityData(address);
      expect(fetchedResult.getOrNull()!.gravityUpdate?.isInitial(), true);
      expect(fetchedResult.getOrNull()!.gravityLogs, isEmpty);
      expect(fetchedResult.getOrNull()!.gravityMessages, isEmpty);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnTransaction = true;
      final result = await repository.deleteGravityData(address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to delete gravity data'),
      );
    });
  });

  group('GravityRepository.deleteAllGravityData', () {
    late GravityRepository repository;
    late FakeDatabaseService dbService;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      repository = GravityRepository(dbService);
      await dbService.open();
      await dbService.insert('servers', serverV6);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('delete all gravity data when it exists', () async {
      await dbService.insert('gravity_updates', gravityUpdateDataJson);
      await dbService.insert('gravity_logs', gravityLogsDataJson);
      await dbService.insert('gravity_messages', gravityMessagesDataJson);

      final result = await repository.deleteAllGravityData();
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityData(address);
      expect(fetchedResult.getOrNull()!.gravityUpdate?.isInitial(), true);
      expect(fetchedResult.getOrNull()!.gravityLogs, isEmpty);
      expect(fetchedResult.getOrNull()!.gravityMessages, isEmpty);
    });

    test('delete all gravity data when it does not exist', () async {
      final result = await repository.deleteAllGravityData();
      expect(result.isSuccess(), true);

      final fetchedResult = await repository.fetchGravityData(address);
      expect(fetchedResult.getOrNull()!.gravityUpdate?.isInitial(), true);
      expect(fetchedResult.getOrNull()!.gravityLogs, isEmpty);
      expect(fetchedResult.getOrNull()!.gravityMessages, isEmpty);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnTransaction = true;
      final result = await repository.deleteAllGravityData();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull().toString(),
        contains('Exception: Failed to delete all gravity data'),
      );
    });
  });
}
