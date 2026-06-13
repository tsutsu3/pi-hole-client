import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/local/secure_data_repository.dart';
import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../testing/fakes/services/fake_database_service.dart';
import '../../../../testing/fakes/services/fake_secure_storage_service.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  const dbName = inMemoryDatabasePath;
  const serverV5 = Server(
    address: 'http://localhost:8080',
    alias: 'test5',
    defaultServer: false,
    apiVersion: 'v5',
    allowUntrustedCert: true,
    ignoreCertificateErrors: false,
  );
  const serverV6 = Server(
    address: 'http://localhost',
    alias: 'test6',
    defaultServer: true,
    apiVersion: 'v6',
    allowUntrustedCert: true,
    ignoreCertificateErrors: false,
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
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
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
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('inserts server when user logged in v6', () async {
      secureDataRepository = SecureDataRepository(ssSerivce, serverV6.address);

      final result = await repository.insertServer(
        serverV6,
        password: 'pass123',
        sid: 'sid123',
      );
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
      secureDataRepository = SecureDataRepository(ssSerivce, serverV5.address);

      final result = await repository.insertServer(serverV5, token: 'token123');
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
      // insertServer now wraps the write in a transaction (atomic default
      // clearing), so the transaction is what throws.
      dbService.shouldThrowOnTransaction = true;

      final result = await repository.insertServer(serverV6);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to save server'),
      );
    });

    test(
      'clears the previous default when inserting a new default server',
      () async {
        await repository.insertServer(serverV5.copyWith(defaultServer: true));
        await repository.insertServer(serverV6); // defaultServer: true

        final servers = (await repository.fetchServers()).getOrNull()!;
        final defaults = servers
            .where((s) => s.defaultServer)
            .map((s) => s.address)
            .toList();
        expect(defaults, [serverV6.address]);
      },
    );
  });

  group('ServerRepository.updateServer', () {
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('updates server when user logged in v6', () async {
      await repository.insertServer(
        serverV6,
        password: 'pass123',
        sid: 'sid123',
      );

      final updatedServer = serverV6.copyWith(alias: 'updated6');
      final result = await repository.updateServer(
        updatedServer,
        password: 'pass123',
        sid: 'sid123',
      );
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 1);
      expect(servers.getOrNull()?.first.alias, 'updated6');
    });

    test('updates server when user logged in v5', () async {
      await repository.insertServer(serverV5, token: 'token123');

      final updatedServer = serverV5.copyWith(alias: 'updated5');
      final result = await repository.updateServer(
        updatedServer,
        token: 'token123',
      );
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 1);

      final servers = await repository.fetchServers();
      expect(servers.isSuccess(), true);
      expect(servers.getOrNull()?.length, 1);
      expect(servers.getOrNull()?.first.alias, 'updated5');
    });

    test('returns Failure when unexpected error', () async {
      await repository.insertServer(serverV6);
      // updateServer now wraps the write in a transaction (atomic default
      // clearing), so the transaction is what throws.
      dbService.shouldThrowOnTransaction = true;

      final updatedServer = serverV6.copyWith(alias: 'updated6');
      final result = await repository.updateServer(updatedServer);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to edit server'),
      );
    });

    test(
      'clears the default flag on other servers when updating into a default server',
      () async {
        await repository.insertServer(serverV5.copyWith(defaultServer: true));
        await repository.insertServer(serverV6.copyWith(defaultServer: false));

        final result = await repository.updateServer(
          serverV6.copyWith(defaultServer: true),
        );
        expect(result.isSuccess(), true);

        final servers = (await repository.fetchServers()).getOrNull()!;
        final defaults = servers
            .where((s) => s.defaultServer)
            .map((s) => s.address)
            .toList();
        expect(defaults, [serverV6.address]);
      },
    );
  });

  group('ServerRepository.updateDefaultServer', () {
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
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
            .defaultServer,
        false,
      );
      expect(
        servers
            .getOrNull()
            ?.firstWhere((s) => s.address == serverV5.address)
            .defaultServer,
        true,
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
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
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

  group('ServerRepository.replaceServer', () {
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    const newServerV6 = Server(
      address: 'http://192.168.1.50',
      alias: 'test6-moved',
      defaultServer: true,
      apiVersion: 'v6',
      allowUntrustedCert: true,
      ignoreCertificateErrors: false,
    );

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
      await dbService.open();
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('moves the row and leaves secrets untouched (DB only)', () async {
      await repository.insertServer(
        serverV6,
        password: 'pass-old',
        sid: 'sid-old',
      );

      final result = await repository.replaceServer(
        serverV6.address,
        newServerV6,
      );
      expect(result.isSuccess(), true);

      final servers = await repository.fetchServers();
      final addresses = servers.getOrNull()!.map((s) => s.address).toList();
      expect(addresses.contains(serverV6.address), false);
      expect(addresses.contains(newServerV6.address), true);

      // replaceServer is DB-only: secret migration is owned by the caller so a
      // failed transaction can leave the old session/credentials recoverable.
      // The old secrets remain and no new-address secrets are created here.
      expect(
        (await ssSerivce.getValue('${serverV6.address}_password')).getOrNull(),
        'pass-old',
      );
      expect(
        (await ssSerivce.getValue('${serverV6.address}_sid')).getOrNull(),
        'sid-old',
      );
      expect(
        (await ssSerivce.getValue('${newServerV6.address}_password')).isError(),
        true,
      );
      expect(
        (await ssSerivce.getValue('${newServerV6.address}_sid')).isError(),
        true,
      );
    });

    test('removes cascade data for the old address', () async {
      await repository.insertServer(serverV6);
      await dbService.insert('gravity_updates', gravityUpdateDataJson);
      await dbService.insert('gravity_messages', gravityMessagesDataJson);
      await dbService.insert('gravity_logs', gravityLogsDataJson);

      final result = await repository.replaceServer(
        serverV6.address,
        newServerV6,
      );
      expect(result.isSuccess(), true);

      final gu = await dbService.query('gravity_updates');
      expect(gu.getOrNull()?.length, 0);
      final gm = await dbService.query('gravity_messages');
      expect(gm.getOrNull()?.length, 0);
      final gl = await dbService.query('gravity_logs');
      expect(gl.getOrNull()?.length, 0);
    });

    test(
      'returns Failure and keeps the old row on transaction error',
      () async {
        await repository.insertServer(serverV6);
        dbService.shouldThrowOnTransaction = true;

        final result = await repository.replaceServer(
          serverV6.address,
          newServerV6,
        );
        expect(result.isError(), true);
        expect(
          result.exceptionOrNull()?.toString(),
          contains('Failed to replace server'),
        );

        final servers = await repository.fetchServers();
        final addresses = servers.getOrNull()!.map((s) => s.address).toList();
        expect(addresses.contains(serverV6.address), true);
      },
    );

    test('keeps the old secrets when the replace transaction fails', () async {
      await repository.insertServer(
        serverV6,
        token: 'token-old',
        password: 'pass-old',
        sid: 'sid-old',
      );
      dbService.shouldThrowOnTransaction = true;

      final result = await repository.replaceServer(
        serverV6.address,
        newServerV6,
      );
      expect(result.isError(), true);

      expect(
        (await ssSerivce.getValue('${serverV6.address}_password')).getOrNull(),
        'pass-old',
      );
      expect(
        (await ssSerivce.getValue('${serverV6.address}_token')).getOrNull(),
        'token-old',
      );
      expect(
        (await ssSerivce.getValue('${serverV6.address}_sid')).getOrNull(),
        'sid-old',
      );
    });

    test('clears the default flag on other servers when replacing into a '
        'default server', () async {
      await repository.insertServer(serverV6); // defaultServer: true
      await repository.insertServer(serverV5); // defaultServer: false

      final result = await repository.replaceServer(
        serverV5.address,
        newServerV6, // defaultServer: true
      );
      expect(result.isSuccess(), true);

      final servers = (await repository.fetchServers()).getOrNull()!;
      final defaults = servers
          .where((s) => s.defaultServer)
          .map((s) => s.address)
          .toList();
      expect(defaults, [newServerV6.address]);
    });
  });

  group('ServerRepository.deleteAllServer', () {
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;
    late SecureDataRepository secureDataRepository;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
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
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
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
    late LocalServerRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = LocalServerRepository(dbService, ssSerivce);
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

    test('handles addresses with underscores correctly', () async {
      final server = serverV6.copyWith(address: 'http://local_host');
      await repository.insertServer(server);
      await ssSerivce.saveValue('${server.address}_token', 'token123');
      await ssSerivce.saveValue('${server.address}_sid', 'sid123');
      await ssSerivce.saveValue('${server.address}_password', 'pass123');

      final result = await repository.deleteUnusedServerSecrets();
      expect(result.isSuccess(), true);

      expect(
        (await ssSerivce.getValue('${server.address}_token')).getOrNull(),
        'token123',
      );
      expect(
        (await ssSerivce.getValue('${server.address}_sid')).getOrNull(),
        'sid123',
      );
      expect(
        (await ssSerivce.getValue('${server.address}_password')).getOrNull(),
        'pass123',
      );
    });
  });
}
