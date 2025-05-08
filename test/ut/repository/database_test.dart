// ignore_for_file: avoid_dynamic_calls
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:pi_hole_client/services/secret_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../helper.dart';

/// Initialize sqflite for test.
void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() async {
  // Initialize the sqflite for testing
  sqfliteTestInit();

  FlutterSecureStorage.setMockInitialValues({});

  // For loading the .env file
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  const testDb = 'test.db';

  group('DatabaseRepository.initialize', () {
    late DbHelper dbHelper;

    setUp(() async {
      await deleteDatabase(testDb);
      FlutterSecureStorage.setMockInitialValues({});
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test('should initialize database', () async {
      final secureStorageRepository = SecureStorageRepository();
      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      final servers = databaseRepository.servers;
      final appConfig = databaseRepository.appConfig;
      expect(servers, []);
      expect(appConfig, isNotNull);
      expect(appConfig.autoRefreshTime, 5);
      expect(appConfig.theme, 0);
      expect(appConfig.language, 'en');
      expect(appConfig.reducedDataCharts, 0);
      expect(appConfig.logsPerQuery, 2);
      expect(appConfig.passCode, isNull);
      expect(appConfig.useBiometricAuth, 0);
      expect(appConfig.sendCrashReports, 0);
    });

    test('should open database', () async {
      dbHelper = DbHelper(testDb);
      await dbHelper.loadDb();
      await dbHelper.closeDb();

      final secureStorageRepository = SecureStorageRepository();
      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      final servers = databaseRepository.servers;
      final appConfig = databaseRepository.appConfig;
      expect(servers, []);
      expect(appConfig, isNotNull);
      expect(appConfig.autoRefreshTime, 5);
      expect(appConfig.theme, 0);
      expect(appConfig.language, 'en');
      expect(appConfig.reducedDataCharts, 0);
      expect(appConfig.logsPerQuery, 2);
      expect(appConfig.passCode, isNull);
      expect(appConfig.useBiometricAuth, 0);
      expect(appConfig.sendCrashReports, 0);
    });

    test('should return one registered server without passcode', () async {
      final secureStorageRepository = SecureStorageRepository();
      final server = Server(
        address: 'http://localhost:8080',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorageRepository,
          'http://localhost:8080',
        ),
      );

      dbHelper = DbHelper(testDb);
      await dbHelper.loadDb();
      await dbHelper.saveDb(server);
      await dbHelper.closeDb();

      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      // Assert the returned data
      final servers = databaseRepository.servers;
      final appConfig = databaseRepository.appConfig;
      expect(servers, isNotNull);
      expect(servers.length, 1);
      expect(servers[0].address, 'http://localhost:8080');
      expect(servers[0].alias, 'test v6');
      expect(servers[0].isDefaultServer, 0);
      expect(servers[0].apiVersion, 'v6');

      expect(appConfig, isNotNull);
      expect(appConfig.autoRefreshTime, 5);
      expect(appConfig.theme, 0);
      expect(appConfig.language, 'en');
      expect(appConfig.reducedDataCharts, 0);
      expect(appConfig.logsPerQuery, 2);
      expect(appConfig.passCode, isNull);
      expect(appConfig.useBiometricAuth, 0);
      expect(appConfig.sendCrashReports, 0);
    });

    test('should return one registered server with passcode', () async {
      final secureStorageRepository = SecureStorageRepository();
      final server = Server(
        address: 'http://localhost:8080',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorageRepository,
          'http://localhost:8080',
        ),
      );
      await secureStorageRepository.saveValue('passCode', '9999');

      dbHelper = DbHelper(testDb);
      await dbHelper.loadDb();
      await dbHelper.saveDb(server);
      await dbHelper.closeDb();

      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      // Assert the returned data
      final servers = databaseRepository.servers;
      final appConfig = databaseRepository.appConfig;
      expect(servers, isNotNull);
      expect(servers.length, 1);
      expect(servers[0].address, 'http://localhost:8080');
      expect(servers[0].alias, 'test v6');
      expect(servers[0].isDefaultServer, 0);
      expect(servers[0].apiVersion, 'v6');

      expect(appConfig, isNotNull);
      expect(appConfig.autoRefreshTime, 5);
      expect(appConfig.theme, 0);
      expect(appConfig.language, 'en');
      expect(appConfig.reducedDataCharts, 0);
      expect(appConfig.logsPerQuery, 2);
      expect(appConfig.passCode, '9999');
      expect(appConfig.useBiometricAuth, 0);
      expect(appConfig.sendCrashReports, 0);
    });
  });

  group('DatabaseRepository.saveServerQuery', () {
    late DbHelper dbHelper;
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should save server with token (v5)',
      () async {
        final server = Server(
          address: 'http://localhost:8080',
          alias: 'test v5',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: true,
        );
        await server.sm.saveToken('token123');

        final result = await databaseRepository.saveServerQuery(server);

        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();
        final actuslS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 1);
        expect(actualD['servers'][0]['address'], 'http://localhost:8080');
        expect(actualD['servers'][0]['alias'], 'test v5');
        expect(actualD['servers'][0]['apiVersion'], 'v5');
        expect(actualD['servers'][0]['isDefaultServer'], 0);
        expect(actuslS['http://localhost:8080_token'], 'token123');
      },
    );

    test(
      'should save server with password (v6)',
      () async {
        final server = Server(
          address: 'http://localhost:8080',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
        );
        await server.sm.savePassword('password01');

        final result = await databaseRepository.saveServerQuery(server);

        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();
        final actuslS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 1);
        expect(actualD['servers'][0]['address'], 'http://localhost:8080');
        expect(actualD['servers'][0]['alias'], 'test v6');
        expect(actualD['servers'][0]['apiVersion'], 'v6');
        expect(actualD['servers'][0]['isDefaultServer'], 0);
        expect(actuslS['http://localhost:8080_password'], 'password01');
      },
    );
  });

  group('DatabaseRepository.editServerQuery', () {
    late DbHelper dbHelper;
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    late Server defaultServerV5;
    late Server defaultServerV6;

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);

      defaultServerV5 = Server(
        address: 'http://localhost:8080',
        alias: 'test v5',
        defaultServer: false,
        apiVersion: 'v5',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorage,
          'http://localhost:8080',
        ),
      );

      defaultServerV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorage,
          'http://localhost:8081',
        ),
      );
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should edit token (v5)',
      () async {
        final server = defaultServerV5.copyWith(
          sm: SecretManager(
            secureStorage,
            'http://localhost:8080',
          ),
        );
        await server.sm.saveToken('token123');

        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV5);

        final result = await databaseRepository.editServerQuery(server);

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        final actuslS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 1);
        expect(actualD['servers'][0]['address'], 'http://localhost:8080');
        expect(actualD['servers'][0]['alias'], 'test v5');
        expect(actualD['servers'][0]['apiVersion'], 'v5');
        expect(actualD['servers'][0]['isDefaultServer'], 0);
        expect(actuslS['http://localhost:8080_token'], 'token123');
      },
    );

    test(
      'should save server with password (v6)',
      () async {
        final server = defaultServerV6.copyWith(
          sm: SecretManager(
            secureStorage,
            'http://localhost:8081',
          ),
        );
        await server.sm.savePassword('password02');
        await server.sm.save('sid02');

        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV6);

        final result = await databaseRepository.editServerQuery(server);

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        final actuslS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 1);
        expect(actualD['servers'][0]['address'], 'http://localhost:8081');
        expect(actualD['servers'][0]['alias'], 'test v6');
        expect(actualD['servers'][0]['apiVersion'], 'v6');
        expect(actualD['servers'][0]['isDefaultServer'], 0);
        expect(actuslS['http://localhost:8081_password'], 'password02');
        expect(actuslS['http://localhost:8081_sid'], 'sid02');
      },
    );
  });

  group('DatabaseRepository.setDefaultServerQuery', () {
    late DbHelper dbHelper;
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    late Server defaultServerV5;
    late Server defaultServerV6;

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);

      defaultServerV5 = Server(
        address: 'http://localhost:8080',
        alias: 'test v5',
        defaultServer: false,
        apiVersion: 'v5',
        allowSelfSignedCert: true,
      );

      defaultServerV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorage,
          'http://localhost:8081',
        ),
      );
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should set default server',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV5);
        await dbHelper.saveDb(defaultServerV6);

        final result = await databaseRepository
            .setDefaultServerQuery('http://localhost:8081');

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actualD['servers'].length, 2);
        expect(actualD['servers'][0]['address'], 'http://localhost:8080');
        expect(actualD['servers'][0]['alias'], 'test v5');
        expect(actualD['servers'][0]['apiVersion'], 'v5');
        expect(actualD['servers'][0]['isDefaultServer'], 0);
        expect(actualD['servers'][1]['address'], 'http://localhost:8081');
        expect(actualD['servers'][1]['alias'], 'test v6');
        expect(actualD['servers'][1]['apiVersion'], 'v6');
        expect(actualD['servers'][1]['isDefaultServer'], 1);
      },
    );

    test(
      'should switch default server',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV5);
        await dbHelper.saveDb(defaultServerV6);

        await databaseRepository.setDefaultServerQuery('http://localhost:8081');
        final result = await databaseRepository
            .setDefaultServerQuery('http://localhost:8080');

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actualD['servers'].length, 2);
        expect(actualD['servers'][0]['address'], 'http://localhost:8080');
        expect(actualD['servers'][0]['alias'], 'test v5');
        expect(actualD['servers'][0]['apiVersion'], 'v5');
        expect(actualD['servers'][0]['isDefaultServer'], 1);
        expect(actualD['servers'][1]['address'], 'http://localhost:8081');
        expect(actualD['servers'][1]['alias'], 'test v6');
        expect(actualD['servers'][1]['apiVersion'], 'v6');
        expect(actualD['servers'][1]['isDefaultServer'], 0);
      },
    );
  });

  group('DatabaseRepository.removeServerQuery', () {
    late DbHelper dbHelper;
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    late Server defaultServerV6;

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);

      defaultServerV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorage,
          'http://localhost:8081',
        ),
      );
      await defaultServerV6.sm.savePassword('password02');
      await defaultServerV6.sm.save('sid02');
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should remove exist server data',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV6);

        final result =
            await databaseRepository.removeServerQuery('http://localhost:8081');

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        final actualS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 0);
        expect(actualS['http://localhost:8081_password'], null);
        expect(actualS['http://localhost:8081_sid'], null);
      },
    );

    test(
      'should remove not exist server data',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();

        final result =
            await databaseRepository.removeServerQuery('http://localhost:8081');

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        final actualS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 0);
        expect(actualS['http://localhost:8081_password'], null);
        expect(actualS['http://localhost:8081_sid'], null);
      },
    );
  });

  group('DatabaseRepository.deleteServersDataQuery', () {
    late DbHelper dbHelper;
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    late Server defaultServerV6;

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);

      defaultServerV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorage,
          'http://localhost:8081',
        ),
      );
      await defaultServerV6.sm.savePassword('password02');
      await defaultServerV6.sm.save('sid02');
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should delete all servers data',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV6);

        final result = await databaseRepository.deleteServersDataQuery();

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        final actualS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['servers'].length, 0);
        expect(actualS['http://localhost:8081_password'], null);
        expect(actualS['http://localhost:8081_sid'], null);
      },
    );
  });

  group('DatabaseRepository.checkUrlExistsQuery', () {
    late DbHelper dbHelper;
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    late Server defaultServerV6;

    setUp(() async {
      FlutterSecureStorage.setMockInitialValues({});
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);

      defaultServerV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorage,
          'http://localhost:8081',
        ),
      );
      await defaultServerV6.sm.savePassword('password02');
      await defaultServerV6.sm.save('sid02');
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should check exist url',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.saveDb(defaultServerV6);

        final result = await databaseRepository
            .checkUrlExistsQuery('http://localhost:8081');

        await dbHelper.closeDb();

        expect(result, {'result': 'success', 'exists': true});
      },
    );

    test(
      'should check not exist url',
      () async {
        dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();

        final result = await databaseRepository
            .checkUrlExistsQuery('http://localhost:8081');

        await dbHelper.closeDb();

        expect(result, {'result': 'success', 'exists': false});
      },
    );
  });

  group('DatabaseRepository.updateConfigQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;

    setUp(() async {
      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);

      // Use test sqflite database. Before each test, initialize the database
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await databaseRepository.closeDb();
    });

    test(
      'should delete key from secure storage when null is passed (Clear)',
      () async {
        const testColumn = 'passCode';

        final result = await databaseRepository.updateConfigQuery(
          column: testColumn,
          value: null,
        );

        expect(result, true);
        expect(await secureStorage.getValue(testColumn), null);
      },
    );

    test(
      'should save value to secure storage when non-null value is passed (Update)',
      () async {
        const testColumn = 'passCode';
        const testValue = '1234';

        final result = await databaseRepository.updateConfigQuery(
          column: testColumn,
          value: testValue,
        );

        expect(result, true);
        expect(await secureStorage.getValue(testColumn), testValue);
      },
    );

    test(
      'should update appConfig',
      () async {
        const testColumn = 'autoRefreshTime';
        const testValue = 4;

        final result = await databaseRepository.updateConfigQuery(
          column: testColumn,
          value: testValue,
        );

        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actualD['appConfig'][0][testColumn], testValue);
      },
    );
  });

  group('DatabaseRepository.restoreAppConfigQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;

    setUp(() async {
      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);

      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await databaseRepository.closeDb();
    });

    test(
      'should delete key from secure storage when null is passed (Clear)',
      () async {
        const testColumn = 'autoRefreshTime';

        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.updateConfigQuery(column: testColumn, value: 10);
        await secureStorage.saveValue('passCode', '1234');

        final result = await databaseRepository.restoreAppConfigQuery();

        final actualD = await dbHelper.readDb();
        await dbHelper.closeDb();

        final actualS = await secureStorage.readAll();

        expect(result, true);
        expect(actualD['appConfig'][0][testColumn], 5);
        expect(actualS['passCode'], null);
      },
    );
  });

  group('DatabaseRepository.cleanUpSecureStorage', () {
    late DbHelper dbHelper;

    setUp(() async {
      await deleteDatabase(testDb);
      FlutterSecureStorage.setMockInitialValues({
        'http://localhost_password': 'test123',
        'http://localhost_token': '',
        'http://localhost_sid': 'XXXXXxxx1234Q=',
      });
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test('should not cleanup secure storage', () async {
      final secureStorageRepository = SecureStorageRepository();
      final server = Server(
        address: 'http://localhost',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorageRepository,
          'http://localhost',
        ),
      );

      dbHelper = DbHelper(testDb);
      await dbHelper.loadDb();
      await dbHelper.saveDb(server);
      await dbHelper.closeDb();

      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      final actual = await secureStorageRepository.readAll();
      expect(actual['http://localhost_password'], 'test123');
      expect(actual['http://localhost_token'], '');
      expect(actual['http://localhost_sid'], 'XXXXXxxx1234Q=');
    });

    test('should cleanup secure storage', () async {
      final secureStorageRepository = SecureStorageRepository();
      final server = Server(
        address: 'http://localhost:8080',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorageRepository,
          'http://localhost:8080',
        ),
      );

      dbHelper = DbHelper(testDb);
      await dbHelper.loadDb();
      await dbHelper.saveDb(server);
      await dbHelper.closeDb();

      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      final actual = await secureStorageRepository.readAll();
      expect(actual['http://localhost_password'], null);
      expect(actual['http://localhost_token'], null);
      expect(actual['http://localhost_sid'], null);
    });

    test('should cleanup secure storage (basic auth)', () async {
      FlutterSecureStorage.setMockInitialValues({
        'http://localhost_password': 'test123',
        'http://localhost_token': '',
        'http://localhost_sid': 'XXXXXxxx1234Q=',
        'http://localhost_basicAuthUser': 'user',
        'http://localhost_basicAuthPassword': 'pss123',
      });

      final secureStorageRepository = SecureStorageRepository();
      final server = Server(
        address: 'http://localhost',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        sm: SecretManager(
          secureStorageRepository,
          'http://localhost',
        ),
      );

      dbHelper = DbHelper(testDb);
      await dbHelper.loadDb();
      await dbHelper.saveDb(server);
      await dbHelper.closeDb();

      final databaseRepository = DatabaseRepository(secureStorageRepository);
      await databaseRepository.initialize(path: testDb);

      final actual = await secureStorageRepository.readAll();
      expect(actual['http://localhost_password'], 'test123');
      expect(actual['http://localhost_token'], '');
      expect(actual['http://localhost_sid'], 'XXXXXxxx1234Q=');
      expect(actual['http://localhost_basicAuthUser'], null);
      expect(actual['http://localhost_basicAuthPassword'], null);
    });
  });

  // -------------------
  group('DatabaseRepository.getGravityUpdateQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    final endTime = DateTime.now().add(const Duration(seconds: 10)).toLocal();

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should get gravity update date',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityUpdateQuery(address, startTime, endTime, 2);

        final actual = await databaseRepository.getGravityUpdateQuery(address);
        await dbHelper.closeDb();

        final expected = {
          'address': address,
          'start_time': startTime.toUtc().toIso8601String(),
          'end_time': endTime.toUtc().toIso8601String(),
          'status': 2,
        };

        expect(actual?.toDict(), expected);
      },
    );
  });

  group('DatabaseRepository.upsertGravityUpdateQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    final endTime = DateTime.now().add(const Duration(seconds: 10)).toLocal();

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should insert gravity update data',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();

        final result = await databaseRepository.upsertGravityUpdateQuery(
          GravityUpdateData(
            address: address,
            startTime: startTime,
            endTime: endTime,
            status: 2,
          ),
        );
        final actual = await dbHelper.readDb();

        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_updates'].length, 1);
        expect(actual['gravity_updates'][0]['address'], address);
        expect(
          actual['gravity_updates'][0]['start_time'],
          startTime.toUtc().toIso8601String(),
        );
        expect(
          actual['gravity_updates'][0]['end_time'],
          endTime.toUtc().toIso8601String(),
        );
        expect(actual['gravity_updates'][0]['status'], 2);
      },
    );

    test(
      'should update gravity update data',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityUpdateQuery(address, startTime, endTime, 1);

        final result = await databaseRepository.upsertGravityUpdateQuery(
          GravityUpdateData(
            address: address,
            startTime: startTime,
            endTime: endTime,
            status: 2,
          ),
        );
        final actual = await dbHelper.readDb();

        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_updates'].length, 1);
        expect(actual['gravity_updates'][0]['address'], address);
        expect(
          actual['gravity_updates'][0]['start_time'],
          startTime.toUtc().toIso8601String(),
        );
        expect(
          actual['gravity_updates'][0]['end_time'],
          endTime.toUtc().toIso8601String(),
        );
        expect(actual['gravity_updates'][0]['status'], 2);
      },
    );
  });

  group('DatabaseRepository.removeGravityUpdateQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    final endTime = DateTime.now().add(const Duration(seconds: 10)).toLocal();

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should delete gravity update data',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityUpdateQuery(address, startTime, endTime, 1);

        final result =
            await databaseRepository.removeGravityUpdateQuery(address);
        final actual = await dbHelper.readDb();

        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_updates'].length, 0);
      },
    );
  });

  group('DatabaseRepository.insertGravityLogQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    const message = 'test message';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should insert gravity logs data',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();

        final result = await databaseRepository.insertGravityLogQuery(
          [
            GravityLogsData(
              address: address,
              line: 1,
              message: message,
              timestamp: startTime,
            ),
          ],
        );
        final actual = await dbHelper.readDb();

        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_logs'].length, 1);
        expect(actual['gravity_logs'][0]['address'], address);
        expect(actual['gravity_logs'][0]['line'], 1);
        expect(actual['gravity_logs'][0]['message'], message);
        expect(
          actual['gravity_logs'][0]['timestamp'],
          startTime.toUtc().toIso8601String(),
        );
      },
    );
  });

  group('DatabaseRepository.clearGravityLogsQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    const message = 'test message';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should clear gravity logs data',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityLogsQuery(
          address,
          1,
          message,
          startTime,
        );

        final result = await databaseRepository.clearGravityLogsQuery(address);
        final actual = await dbHelper.readDb();

        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_logs'].length, 0);
      },
    );
  });

  group('DatabaseRepository.getGravityMessagesQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const id = 3;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    const message = 'test message';
    const url = 'http://localhost/test.txt';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should get gravity messages data',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityMessagesQuery(
          address,
          id,
          message,
          url,
          startTime,
        );

        final actual =
            await databaseRepository.getGravityMessagesQuery(address);
        await dbHelper.closeDb();

        expect(actual?.length, 1);
        expect(actual![0].toDict(), {
          'id': id,
          'address': address,
          'message': message,
          'url': url,
          'timestamp': startTime.toUtc().toIso8601String(),
        });
      },
    );
  });

  group('DatabaseRepository.insertGravityMessageQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const id = 3;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    const message = 'test message';
    const url = 'http://localhost/test.txt';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should insert gravity messages date',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();

        final result = await databaseRepository.insertGravityMessageQuery([
          GravityMessagesData(
            id: id,
            address: address,
            message: message,
            url: url,
            timestamp: startTime,
          ),
        ]);
        final actual = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_messages'].length, 1);
        expect(actual['gravity_messages'][0]['address'], address);
        expect(actual['gravity_messages'][0]['message'], message);
        expect(actual['gravity_messages'][0]['url'], url);
        expect(
          actual['gravity_messages'][0]['timestamp'],
          startTime.toUtc().toIso8601String(),
        );
      },
    );
  });

  group('DatabaseRepository.clearGravityMessagesQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const id = 3;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    const message = 'test message';
    const url = 'http://localhost/test.txt';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should insert gravity messages date',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityMessagesQuery(
          address,
          id,
          message,
          url,
          startTime,
        );

        final result =
            await databaseRepository.clearGravityMessagesQuery(address);
        final actual = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_messages'].length, 0);
      },
    );
  });

  group('DatabaseRepository.getGravityDataQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const id = 3;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    final endTime = DateTime.now().add(const Duration(seconds: 10)).toLocal();
    const url = 'http://localhost/test.txt';
    const message = 'test message';
    const log = 'test log';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should get gravity date',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityUpdateQuery(address, startTime, endTime, 2);
        await dbHelper.insertGravityLogsQuery(address, 1, log, startTime);
        await dbHelper.insertGravityMessagesQuery(
          address,
          id,
          message,
          url,
          startTime,
        );

        final actual = await databaseRepository.getGravityDataQuery(address);
        await dbHelper.closeDb();

        expect(actual!.gravityUpdate!.toDict(), {
          'address': address,
          'start_time': startTime.toUtc().toIso8601String(),
          'end_time': endTime.toUtc().toIso8601String(),
          'status': 2,
        });

        expect(actual.gravityLogs!.toList()[0].toDict(), {
          'address': address,
          'line': 1,
          'message': log,
          'timestamp': startTime.toUtc().toIso8601String(),
        });

        expect(actual.gravityMessages!.toList()[0].toDict(), {
          'id': id,
          'address': address,
          'message': message,
          'url': url,
          'timestamp': startTime.toUtc().toIso8601String(),
        });
      },
    );
  });

  group('DatabaseRepository.clearGravityDataQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const id = 3;
    const address = 'http://localhost';
    final startTime = DateTime.now().toLocal();
    final endTime = DateTime.now().add(const Duration(seconds: 10)).toLocal();
    const url = 'http://localhost/test.txt';
    const message = 'test message';
    const log = 'test log';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should clear gravity date',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityUpdateQuery(address, startTime, endTime, 2);
        await dbHelper.insertGravityLogsQuery(address, 1, log, startTime);
        await dbHelper.insertGravityMessagesQuery(
          address,
          id,
          message,
          url,
          startTime,
        );

        final result = await databaseRepository.clearGravityDataQuery(address);
        final actual = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_updates'].length, 0);
        expect(actual['gravity_logs'].length, 0);
        expect(actual['gravity_messages'].length, 0);
      },
    );
  });

  group('DatabaseRepository.clearAllGravityDataQuery', () {
    late SecureStorageRepository secureStorage;
    late DatabaseRepository databaseRepository;
    const id = 3;
    const id2 = 4;
    const address = 'http://localhost';
    const address2 = 'http://localhost:8080';
    final startTime = DateTime.now().toLocal();
    final endTime = DateTime.now().add(const Duration(seconds: 10)).toLocal();
    const url = 'http://localhost/test.txt';
    const message = 'test message';
    const log = 'test log';

    setUp(() async {
      await deleteDatabase(testDb);

      secureStorage = SecureStorageRepository();
      databaseRepository = DatabaseRepository(secureStorage);
      await databaseRepository.initialize(path: testDb);
    });

    tearDown(() async {
      await deleteDatabase(testDb);
    });

    test(
      'should clear all gravity date',
      () async {
        final dbHelper = DbHelper(testDb);
        await dbHelper.loadDb();
        await dbHelper.insertGravityUpdateQuery(address, startTime, endTime, 2);
        await dbHelper.insertGravityLogsQuery(address, 1, log, startTime);
        await dbHelper.insertGravityMessagesQuery(
          address,
          id,
          message,
          url,
          startTime,
        );
        await dbHelper.insertGravityUpdateQuery(
          address2,
          startTime,
          endTime,
          2,
        );
        await dbHelper.insertGravityLogsQuery(address2, 1, log, startTime);
        await dbHelper.insertGravityMessagesQuery(
          address2,
          id2,
          message,
          url,
          startTime,
        );

        final result = await databaseRepository.clearAllGravityDataQuery();
        final actual = await dbHelper.readDb();
        await dbHelper.closeDb();

        expect(result, true);
        expect(actual['gravity_updates'].length, 0);
        expect(actual['gravity_logs'].length, 0);
        expect(actual['gravity_messages'].length, 0);
      },
    );
  });
}
