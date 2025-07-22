import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/app_config_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../testing/fakes/services/fake_database_service.dart';
import '../../../testing/fakes/services/fake_secure_storage_service.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  const dbName = inMemoryDatabasePath;
  const appConfigMap = {
    'autoRefreshTime': 5,
    'theme': 0,
    'language': 'en',
    'reducedDataCharts': 0,
    'logsPerQuery': 2.0,
    'passCode': null,
    'useBiometricAuth': 0,
    'importantInfoReaden': 0,
    'hideZeroValues': 0,
    'loadingAnimation': 0,
    'statisticsVisualizationMode': 0,
    'homeVisualizationMode': 0,
    'sendCrashReports': 0,
  };

  sqfliteTestInit();

  group('AppConfigRepository.getter', () {
    late AppConfigRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = AppConfigRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('returns Success with default values', () async {
      await repository.fetchAppConfig();

      final result = repository.appConfig;
      expect(result.isSuccess(), true);
      expect(result.getOrNull()?.toDict(), appConfigMap);
    });

    test('returns Failure if not loaded', () async {
      final result = repository.appConfig;
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains(
          'Exception: App config not loaded. Call fetchAppConfig() first.',
        ),
      );
    });
  });

  group('AppConfigRepository.fetchAppConfig', () {
    late AppConfigRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = AppConfigRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('loads and caches config when passcode is not set', () async {
      final result = await repository.fetchAppConfig();
      expect(result.isSuccess(), true);
      expect(result.getOrNull()?.toDict(), appConfigMap);
      expect(repository.appConfig.isSuccess(), true);
      expect(repository.appConfig.getOrNull()?.toDict(), appConfigMap);
    });

    test('loads and caches config when passcode is set in secure storage',
        () async {
      await ssSerivce.saveValue('passCode', '1234');

      final result = await repository.fetchAppConfig();
      expect(result.isSuccess(), true);
      expect(result.getOrNull()?.toDict(), {
        ...appConfigMap,
        'passCode': '1234',
      });
      expect(repository.appConfig.isSuccess(), true);
      expect(repository.appConfig.getOrNull()?.toDict(), {
        ...appConfigMap,
        'passCode': '1234',
      });
    });

    test('returns Failure when database read fails', () async {
      dbService.shouldFailRawQuery = true;

      final result = await repository.fetchAppConfig();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to load app config'),
      );
      expect(repository.appConfig.isError(), true);
    });
  });

  group('AppConfigRepository.updateConfigValue', () {
    late AppConfigRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = AppConfigRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('updates autoRefreshTime in database', () async {
      final result = await repository.updateConfigValue(
        column: 'autoRefreshTime',
        value: 10,
      );
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.autoRefreshTime, 10);
    });

    test('updates passCode in secure storage', () async {
      final result = await repository.updateConfigValue(
        column: 'passCode',
        value: '1234',
      );
      expect(result.isSuccess(), true);
      expect(
        await ssSerivce.getValue('passCode').getOrNull(),
        '1234',
      );
    });

    test('deletes passCode from secure storage when value is null', () async {
      await ssSerivce.saveValue('passCode', '1234');

      final result = await repository.updateConfigValue(
        column: 'passCode',
        value: null,
      );
      expect(result.isSuccess(), true);
      expect(
        await ssSerivce.getValue('passCode').isError(),
        true,
      );
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnUpdate = true;

      final result = await repository.updateConfigValue(
        column: 'autoRefreshTime',
        value: 10,
      );
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to update config'),
      );
    });
  });

  group('AppConfigRepository.resetAppConfig', () {
    late AppConfigRepository repository;
    late FakeDatabaseService dbService;
    late FakeSecureStorageService ssSerivce;

    setUp(() async {
      dbService = FakeDatabaseService(path: dbName);
      ssSerivce = FakeSecureStorageService();
      repository = AppConfigRepository(dbService, ssSerivce);
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('resets all config values to defaults', () async {
      await repository.updateConfigValue(
        column: 'autoRefreshTime',
        value: 10,
      );
      await ssSerivce.saveValue('passCode', '1234');

      final result = await repository.resetAppConfig();
      expect(result.isSuccess(), true);

      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.toDict(), appConfigMap);
      expect(
        await ssSerivce.getValue('passCode').isError(),
        true,
      );
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnUpdate = true;

      final result = await repository.resetAppConfig();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to restore app config'),
      );
    });
  });
}
