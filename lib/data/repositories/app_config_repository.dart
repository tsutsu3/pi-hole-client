import 'package:pi_hole_client/data/services/database/database_service.dart';
import 'package:pi_hole_client/data/services/storage/secure_storage_service.dart';
import 'package:pi_hole_client/domain/models/database.dart';
import 'package:pi_hole_client/utils/database_utils.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/retry.dart';
import 'package:result_dart/result_dart.dart';

/// Provides access to the local application configuration.
///
/// This repository handles reading and writing app settings stored in
/// SQLite and secure storage. It supports partial field updates and
/// restoring default values.
class AppConfigRepository {
  AppConfigRepository(
    DatabaseService database,
    SecureStorageService secureStorage,
  )   : _database = database,
        _secureStorage = secureStorage;

  final DatabaseService _database;
  final SecureStorageService _secureStorage;

  AppDbData? _appConfig;

  /// Returns the current cached application configuration.
  ///
  /// This returns the in-memory cached configuration previously loaded via
  /// [fetchAppConfig]. If the configuration has not yet been fetched and cached,
  /// this returns a [Failure]. To ensure the config is available, call
  /// [fetchAppConfig] before accessing this getter.
  Result<AppDbData> get appConfig {
    if (_appConfig == null) {
      return Failure(
        Exception('App config not loaded. Call fetchAppConfig() first.'),
      );
    }
    return Success(_appConfig!);
  }

  /// Loads and caches the application configuration from persistent storage.
  ///
  /// This method queries the `appConfig` table from the database using retry logic,
  /// then securely loads the `passCode` from secure storage. The result is merged
  /// and stored in memory to be returned quickly on future accesses via [appConfig].
  ///
  /// The returned [Result] will contain [Success] if loading and merging succeeds,
  /// or [Failure] with an [Exception] if any step fails.
  ///
  /// The configuration is cached in memory after the first successful load.
  Future<Result<AppDbData>> fetchAppConfig() async {
    try {
      await openDbIfNeeded(_database);

      AppDbData appConfig;

      final rows = await runWithRetry<Result<List<Map<String, dynamic>>>>(
        action: () => _database.rawQuery('SELECT * FROM appConfig'),
        onRetry: (attempt, error, _) => logger.w(
          'Attempt $attempt: Failed to read appConfig - $error',
        ),
      );
      appConfig = AppDbData.fromMap(rows.getOrThrow()[0]);

      final passCode = await _secureStorage.getValue('passCode');
      appConfig = AppDbData.withSecrets(appConfig, passCode.getOrNull());

      _appConfig = appConfig;

      return Success(appConfig);
    } catch (e, st) {
      logger.e('Failed to load app config: $e\n$st');
      return Failure(Exception('Failed to load app config: $e\n$st'));
    }
  }

  /// Updates a configuration value in the database or secure storage.
  ///
  /// If the [column] is `passCode`, the [value] is written to secure storage instead
  /// of the database. If the [value] is `null`, the key is deleted from secure storage.
  /// For any other [column], the [value] is updated in the `appConfig` table.
  ///
  /// Returns a [Result] that completes with [Success.unit] on success,
  /// or [Failure] with an [Exception] if the operation fails.
  Future<Result<void>> updateConfigValue({
    required String column,
    required Object? value,
  }) async {
    try {
      await openDbIfNeeded(_database);

      if (column == 'passCode') {
        if (value == null) {
          return await _secureStorage.deleteValue('passCode');
        }

        return await _secureStorage.saveValue('passCode', value.toString());
      }

      return await _database.update('appConfig', {column: value}).fold(
        (_) => Success.unit(),
        Failure.new,
      );
    } catch (e, st) {
      logger.e('Failed to update config: $e\n$st');
      return Failure(Exception('Failed to update config: $e\n$st'));
    }
  }

  /// Restores the default values in the app configuration.
  ///
  /// This updates all fields in the `appConfig` table to their defaults,
  /// and deletes the `passCode` from secure storage if present.
  ///
  /// Returns a [Result] that completes with [Success.unit] on success,
  /// or [Failure] if the update fails.
  Future<Result<void>> resetAppConfig() async {
    try {
      await openDbIfNeeded(_database);

      await _secureStorage.deleteValue('passCode');
      return await _database.update(
        'appConfig',
        {
          'autoRefreshTime': 5,
          'theme': 0,
          'language': 'en',
          'reducedDataCharts': 0,
          'logsPerQuery': 2,
          'useBiometricAuth': 0,
          'importantInfoReaden': 0,
          'hideZeroValues': 0,
          'loadingAnimation': 0,
          'statisticsVisualizationMode': 0,
          'homeVisualizationMode': 0,
          'sendCrashReports': 0,
        },
      ).fold(
        (_) => Success.unit(),
        Failure.new,
      );
    } catch (e, st) {
      logger.e('Failed to restore app config: $e\n$st');
      return Failure(Exception('Failed to restore app config: $e\n$st'));
    }
  }
}
