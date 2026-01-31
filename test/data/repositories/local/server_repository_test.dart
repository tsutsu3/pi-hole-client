import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/local/secure_data_repository.dart';
import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
// import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../testing/fakes/services/fake_database_service.dart';
import '../../../../testing/fakes/services/fake_secure_storage_service.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  const dbName = inMemoryDatabasePath;
  final serverV5 = Server(
    address: 'http://localhost:8080',
    alias: 'test5',
    defaultServer: false,
    apiVersion: 'v5',
    allowSelfSignedCert: true,
    ignoreCertificateErrors: false,
    enabled: true,
    sm: SecureDataRepository(
      FakeSecureStorageService(),
      'http://localhost:8080',
    ),
  );
  final serverV6 = Server(
    address: 'http://localhost',
    alias: 'test6',
    defaultServer: true,
    apiVersion: 'v6',
    allowSelfSignedCert: true,
    ignoreCertificateErrors: false,
    enabled: true,
    sm: SecureDataRepository(FakeSecureStorageService(), 'http://localhost'),
  );
  final gravityUpdateDataJson = {
    'address': 'http://localhost',
    'start_time': '2025-03-04 17:22:10',
    'end_time': '2025-03-04 17:22:40',
    'status': GravityStatus.idle.index,
  };
  final gravityLogsDataJson = {
    'address': 'http://localhost',
    'line': 1,
    'message': 'Test log 1',
    'timestamp': '2025-03-04 17:22:10',
  };
  final gravityMessagesDataJson = {
    'address': 'http://localhost',
    'message_id': 1,
    'message': 'Test message 1',
    'url': 'http://example.com',
    'timestamp': '2025-03-04 17:22:10',
  };

  sqfliteTestInit();

  group('ServerRepository.fetchServers', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('returns Success with empty list', () async {
      final result = await repository.fetchServers();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), isEmpty);
    });

    test('retrun Success when server exist', () async {
      await repository.insertServer(serverV6);

      final result = await repository.fetchServers();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), isNotEmpty);
      expect(result.getOrNull()?.length, 1);
      expect(result.getOrNull()?.first.address, 'http://localhost');
    });

    test('returns Failure when database raw query fails', () async {
      dbService.shouldThrowOnRawQuery = true;

      final result = await repository.fetchServers();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Failed to load servers'),
      );
    });
  });

  group('ServerRepository.insertServer', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('inserts server when user logged in v6', () async {
      secureDataRepository = SecureDataRepository(ssSerivce, serverV6.address);
      await secureDataRepository.savePassword('pass123');
      await secureDataRepository.saveSid('sid123');
      final serverV62 = serverV6.copyWith(sm: secureDataRepository);
      await secureDataRepository.loadSid();

      final result = await repository.insertServer(serverV62);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 1);
      expect(servers.getOrNull()?.first.address, 'http://localhost');

      expect((await secureDataRepository.token).isError(), true);
      expect((await secureDataRepository.password).isSuccess(), true);
      expect((await secureDataRepository.loadSid()).isSuccess(), true);
      expect(secureDataRepository.sid.isSuccess(), true);
      expect(secureDataRepository.sid.getOrNull(), 'sid123');
      expect((await secureDataRepository.password).getOrNull(), 'pass123');
    });

    test('inserts server when user logged in v5', () async {
      final serverV52 = serverV5.copyWith(
        sm: SecureDataRepository(ssSerivce, serverV5.address),
      );
      secureDataRepository = SecureDataRepository(ssSerivce, serverV52.address);
      await secureDataRepository.saveToken('token123');

      final result = await repository.insertServer(serverV52);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 1);
      expect(servers.getOrNull()?.first.address, 'http://localhost:8080');

      expect((await secureDataRepository.token).isSuccess(), true);
      expect((await secureDataRepository.password).isError(), true);
      expect((await secureDataRepository.loadSid()).isError(), true);
      expect((await secureDataRepository.token).getOrNull(), 'token123');
    });

    test('returns Failure when unexpexted error', () async {
      dbService.shouldThrowOnInsert = true;
      await repository.insertServer(serverV6);

      final result = await repository.insertServer(serverV6);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to save server'),
      );
    });
  });

  group('ServerRepository.updateServer', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
      secureDataRepository = SecureDataRepository(ssSerivce, serverV6.address);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('updates server when user logged in v6', () async {
      secureDataRepository = SecureDataRepository(ssSerivce, serverV6.address);
      await secureDataRepository.savePassword('pass123');
      await secureDataRepository.saveSid('sid123');
      await secureDataRepository.loadSid();
      final serverV62 = serverV6.copyWith(sm: secureDataRepository);
      await repository.insertServer(serverV62);

      final updatedServer = serverV62.copyWith(alias: 'updated6');
      final result = await repository.updateServer(updatedServer);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 1);
      expect(servers.getOrNull()?.first.alias, 'updated6');
    });

    test('updates server when user logged in v5', () async {
      final serverV52 = serverV5.copyWith(
        sm: SecureDataRepository(ssSerivce, serverV5.address),
      );
      secureDataRepository = SecureDataRepository(ssSerivce, serverV52.address);
      await secureDataRepository.saveToken('token123');
      await repository.insertServer(serverV52);

      final updatedServer = serverV52.copyWith(alias: 'updated5');
      final result = await repository.updateServer(updatedServer);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 1);
      expect(servers.getOrNull()?.first.alias, 'updated5');
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnUpdate = true;
      await repository.insertServer(serverV6);

      final updatedServer = serverV6.copyWith(alias: 'updated6');
      final result = await repository.updateServer(updatedServer);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to edit server'),
      );
    });
  });

  group('ServerRepository.updateDefaultServer', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('updates default server from v6 to v5', () async {
      await repository.insertServer(serverV6);
      await repository.insertServer(serverV5);

      final result = await repository.updateDefaultServer(serverV5.address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 2);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 2);
      expect(
        servers
            .getOrNull()
            ?.firstWhere((s) => s.address == serverV6.address)
            .isDefaultServer,
        0,
      );
      expect(
        servers
            .getOrNull()
            ?.firstWhere((s) => s.address == serverV5.address)
            .isDefaultServer,
        1,
      );
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnTransaction = true;
      await repository.insertServer(serverV6);

      final result = await repository.updateDefaultServer(serverV6.address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to set default server'),
      );
    });
  });

  group('ServerRepository.deleteServer', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
      secureDataRepository = SecureDataRepository(ssSerivce, serverV6.address);
      await dbService.open();
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('deletes server and its secrets', () async {
      await repository.insertServer(serverV6);

      final result = await repository.deleteServer(serverV6.address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 0);

      final sid = await secureDataRepository.loadSid();
      expect(sid.isError(), true);
      final password = await secureDataRepository.password;
      expect(password.isError(), true);
    });

    test('deletes cascade data', () async {
      await repository.insertServer(serverV6);
      await dbService.insert('gravity_updates', gravityUpdateDataJson);
      await dbService.insert('gravity_messages', gravityMessagesDataJson);
      await dbService.insert('gravity_logs', gravityLogsDataJson);

      final result = await repository.deleteServer(serverV6.address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final gu = await dbService.query('gravity_updates');
      expect(gu.isSuccess(), true);
      expect(gu.getOrNull()?.length, 0);
      final gm = await dbService.query('gravity_messages');
      expect(gm.isSuccess(), true);
      expect(gm.getOrNull()?.length, 0);
      final gl = await dbService.query('gravity_logs');
      expect(gl.isSuccess(), true);
      expect(gl.getOrNull()?.length, 0);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnDelete = true;
      await repository.insertServer(serverV6);

      final result = await repository.deleteServer(serverV6.address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to remove server'),
      );
    });
  });

  group('ServerRepository.deleteAllServer', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
      secureDataRepository = SecureDataRepository(ssSerivce, serverV6.address);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('deletes all servers and their secrets', () async {
      await repository.insertServer(serverV6);
      await repository.insertServer(serverV5);

      final result = await repository.deleteAllServers();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 2);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 0);

      final sid = await secureDataRepository.loadSid();
      expect(sid.isError(), true);
      final password = await secureDataRepository.password;
      expect(password.isError(), true);
      final token = await secureDataRepository.token;
      expect(token.isError(), true);
    });

    test('deletes all servers cascade data', () async {
      await repository.insertServer(serverV6);
      await dbService.insert('gravity_updates', gravityUpdateDataJson);
      await dbService.insert('gravity_messages', gravityMessagesDataJson);
      await dbService.insert('gravity_logs', gravityLogsDataJson);

      final result = await repository.deleteAllServers();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final gu = await dbService.query('gravity_updates');
      expect(gu.isSuccess(), true);
      expect(gu.getOrNull()?.length, 0);
      final gm = await dbService.query('gravity_messages');
      expect(gm.isSuccess(), true);
      expect(gm.getOrNull()?.length, 0);
      final gl = await dbService.query('gravity_logs');
      expect(gl.isSuccess(), true);
      expect(gl.getOrNull()?.length, 0);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnDelete = true;
      await repository.insertServer(serverV6);

      final result = await repository.deleteAllServers();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to delete all servers data'),
      );
    });
  });

  group('ServerRepository.doesServerExist', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('returns true if server exists', () async {
      await repository.insertServer(serverV6);

      final result = await repository.doesServerExist(serverV6.address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), true);
    });

    test('returns false if server does not exist', () async {
      final result = await repository.doesServerExist(serverV6.address);
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), false);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnQuery = true;

      final result = await repository.doesServerExist(serverV6.address);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to check if URL exists'),
      );
    });
  });

  group('ServerRepository.deleteUnusedServerSecrets', () {
    late ServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = ServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('deletes secrets for servers that no longer exist', () async {
      await ssSerivce.saveValue('http://127.0.0.1_token', 'token123');
      await ssSerivce.saveValue('http://127.0.0.1_sid', 'sid123');
      await ssSerivce.saveValue('http://127.0.0.1_password', 'pass123');
      await ssSerivce.saveValue('http://127.0.0.1_basicAuthUser', 'user123');
      await ssSerivce.saveValue(
        'http://127.0.0.1_basicAuthPassword',
        'basic123',
      );

      final result = await repository.deleteUnusedServerSecrets();
      expect(result.isSuccess(), true);

      expect(
        (await ssSerivce.getValue('http://127.0.0.1_token')).isError(),
        true,
      );
      expect(
        (await ssSerivce.getValue('http://127.0.0.1_sid')).isError(),
        true,
      );
      expect(
        (await ssSerivce.getValue('http://127.0.0.1_password')).isError(),
        true,
      );
      expect(
        (await ssSerivce.getValue('http://127.0.0.1_basicAuthUser')).isError(),
        true,
      );
      expect(
        (await ssSerivce.getValue(
          'http://127.0.0.1_basicAuthPassword',
        )).isError(),
        true,
      );
    });

    test('returns Failure when unexpected error', () async {
      ssSerivce.shouldThrowOnReadAll = true;

      final result = await repository.deleteUnusedServerSecrets();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to delete unused server secrets'),
      );
    });
  });
}
