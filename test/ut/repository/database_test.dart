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
}
