import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../testing/fakes/services/fake_database_service.dart';
import '../../../../testing/fakes/services/fake_secure_storage_service.dart';

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

    test(
      'loads and caches config when passcode is set in secure storage',
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
      },
    );

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

  group('AppConfigRepository.updateMethods', () {
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
      final result = await repository.updateAutoRefreshTime(10);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.autoRefreshTime, 10);
    });

    test('updates theme in database', () async {
      final result = await repository.updateTheme(1);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.theme, 1);
    });

    test('updates language in database', () async {
      final result = await repository.updateLanguage('ja');
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.language, 'ja');
    });

    test('updates reducedDataCharts in database', () async {
      final result = await repository.updateReducedDataCharts(true);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.reducedDataCharts, 1);
    });

    test('updates logsPerQuery in database', () async {
      final result = await repository.updateLogsPerQuery(0.5);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.logsPerQuery, 0.5);
    });

    test('updates useBiometricAuth in database', () async {
      final result = await repository.updateUseBiometricAuth(true);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.useBiometricAuth, 1);
    });

    test('updates importantInfoReaden in database', () async {
      final result = await repository.updateImportantInfoReaden(true);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.importantInfoReaden, 1);
    });

    test('updates hideZeroValues in database', () async {
      final result = await repository.updateHideZeroValues(true);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.hideZeroValues, 1);
    });

    test('updates loadingAnimation in database', () async {
      final result = await repository.updateLoadingAnimation(true);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.loadingAnimation, 1);
    });

    test('updates statisticsVisualizationMode in database', () async {
      final result = await repository.updateStatisticsVisualizationMode(1);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.statisticsVisualizationMode, 1);
    });

    test('updates sendCrashReports in database', () async {
      final result = await repository.updateSendCrashReports(true);
      expect(result.isSuccess(), true);
      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.sendCrashReports, 1);
    });

    test('updates passCode in secure storage', () async {
      final result = await repository.updatePassCode('1234');
      expect(result.isSuccess(), true);
      expect(await ssSerivce.getValue('passCode').getOrNull(), '1234');
    });

    test('deletes passCode from secure storage when value is null', () async {
      await ssSerivce.saveValue('passCode', '1234');

      final result = await repository.updatePassCode(null);
      expect(result.isSuccess(), true);
      expect(await ssSerivce.getValue('passCode').isError(), true);
    });

    test('returns Failure when unexpected error', () async {
      dbService.shouldThrowOnUpdate = true;

      final result = await repository.updateAutoRefreshTime(10);
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Exception: Failed to update autoRefreshTime'),
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
      await repository.updateAutoRefreshTime(10);
      await ssSerivce.saveValue('passCode', '1234');

      final result = await repository.resetAppConfig();
      expect(result.isSuccess(), true);

      final data = await repository.fetchAppConfig();
      expect(data.isSuccess(), true);
      expect(data.getOrNull()?.toDict(), appConfigMap);
      expect(await ssSerivce.getValue('passCode').isError(), true);
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
