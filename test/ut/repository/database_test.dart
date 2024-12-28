import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pi_hole_client/services/session_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:pi_hole_client/repository/database.dart';
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
  await dotenv.load(fileName: '.env');

  final testDb = 'test.db';

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
      expect(appConfig.overrideSslCheck, 0);
      expect(appConfig.oneColumnLegend, 0);
      expect(appConfig.reducedDataCharts, 0);
      expect(appConfig.logsPerQuery, 2);
      expect(appConfig.passCode, isNull);
      expect(appConfig.useBiometricAuth, 0);
      expect(appConfig.sendCrashReports, 0);
      // TODO: check logger messages
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
      expect(appConfig.overrideSslCheck, 0);
      expect(appConfig.oneColumnLegend, 0);
      expect(appConfig.reducedDataCharts, 0);
      expect(appConfig.logsPerQuery, 2);
      expect(appConfig.passCode, isNull);
      expect(appConfig.useBiometricAuth, 0);
      expect(appConfig.sendCrashReports, 0);
      // TODO: check logger messages
    });

    test('should return one registered server without passcode', () async {
      final secureStorageRepository = SecureStorageRepository();
      final server = Server(
        address: 'http://localhost:8080',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        sm: SessionManager(
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
      expect(appConfig.overrideSslCheck, 0);
      expect(appConfig.oneColumnLegend, 0);
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
        sm: SessionManager(
          secureStorageRepository,
          'http://localhost:8080',
        ),
      );
      secureStorageRepository.saveValue('passCode', '9999');

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
      expect(appConfig.overrideSslCheck, 0);
      expect(appConfig.oneColumnLegend, 0);
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
          token: 'token123',
          defaultServer: false,
          apiVersion: 'v5',
        );

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
      'should save server with basic auth (v5)',
      () async {
        final server = Server(
          address: 'http://localhost:8080',
          alias: 'test v5',
          defaultServer: false,
          apiVersion: 'v5',
          basicAuthUser: 'user01',
          basicAuthPassword: 'password01',
        );

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
        expect(actuslS['http://localhost:8080_basicAuthUser'], 'user01');
        expect(
          actuslS['http://localhost:8080_basicAuthPassword'],
          'password01',
        );
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
        );
        server.sm.savePassword('password01');

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
      );

      defaultServerV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        sm: SessionManager(
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
        final server = defaultServerV5.copyWith(token: 'token123');

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
      'should edit basic auth (v5)',
      () async {
        final server = defaultServerV5.copyWith(
          basicAuthUser: 'user01',
          basicAuthPassword: 'password01',
        );

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
        expect(actuslS['http://localhost:8080_basicAuthUser'], 'user01');
        expect(
          actuslS['http://localhost:8080_basicAuthPassword'],
          'password01',
        );
      },
    );

    test(
      'should save server with password (v6)',
      () async {
        final server = defaultServerV6.copyWith(
          sm: SessionManager(
            secureStorage,
            'http://localhost:8081',
          ),
        );
        server.sm.savePassword('password02');
        server.sm.save('sid02');

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

  group('DatabaseRepository.setDefaultServerQuery', () {});

  group('DatabaseRepository.removeServerQuery', () {});

  group('DatabaseRepository.deleteServersDataQuery', () {});

  group('DatabaseRepository.checkUrlExistsQuery', () {});

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
  });

  group('DatabaseRepository.restoreAppConfigQuery', () {});
}
