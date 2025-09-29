import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/data/services/utils/database_utils.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/utils/logger.dart';
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
  ) : _database = database,
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
        onRetry: (attempt, error, _) =>
            logger.w('Attempt $attempt: Failed to read appConfig - $error'),
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

  /// Updates the auto-refresh interval in seconds.
  Future<Result<void>> updateAutoRefreshTime(int time) async {
    return _updateConfigValue(column: 'autoRefreshTime', value: time);
  }

  // TODO: Consider using an enum for themes
  /// Updates the application theme mode.
  ///
  /// The [theme] parameter is an integer representing the desired theme:
  /// - `0`: Follow system theme
  /// - `1`: Light mode
  /// - `2`: Dark mode
  Future<Result<void>> updateTheme(int theme) async {
    return _updateConfigValue(column: 'theme', value: theme);
  }

  // TODO: Consider using an enum for languages
  Future<Result<void>> updateLanguage(String language) async {
    return _updateConfigValue(column: 'language', value: language);
  }

  Future<Result<void>> updateReducedDataCharts(bool enabled) async {
    return _updateConfigValue(
      column: 'reducedDataCharts',
      value: enabled ? 1 : 0,
    );
  }

  /// Updates the duration allocated for logs per query, in hours.
  ///
  /// The [logsPerQuery] value represents the number of hours used when
  /// querying logs. For example:
  /// - `0.5` means 30 minutes
  /// - `1.0` means 1 hour
  Future<Result<void>> updateLogsPerQuery(double logsPerQuery) async {
    return _updateConfigValue(column: 'logsPerQuery', value: logsPerQuery);
  }

  Future<Result<void>> updateUseBiometricAuth(bool useBiometricAuth) async {
    return _updateConfigValue(
      column: 'useBiometricAuth',
      value: useBiometricAuth ? 1 : 0,
    );
  }

  Future<Result<void>> updateImportantInfoReaden(bool readen) async {
    return _updateConfigValue(
      column: 'importantInfoReaden',
      value: readen ? 1 : 0,
    );
  }

  Future<Result<void>> updateHideZeroValues(bool hideZeroValues) async {
    return _updateConfigValue(
      column: 'hideZeroValues',
      value: hideZeroValues ? 1 : 0,
    );
  }

  Future<Result<void>> updateLoadingAnimation(bool loadingAnimation) async {
    return _updateConfigValue(
      column: 'loadingAnimation',
      value: loadingAnimation ? 1 : 0,
    );
  }

  // TODO: Consider using an enum for visualization modes
  /// Updates the visualization mode for statistics.
  ///
  /// The [mode] parameter controls how statistics are displayed:
  /// - `0`: List view
  /// - `1`:  Pie chart view
  Future<Result<void>> updateStatisticsVisualizationMode(int mode) async {
    return _updateConfigValue(
      column: 'statisticsVisualizationMode',
      value: mode,
    );
  }

  // TODO: Consider using an enum for home visualization modes
  /// Updates the visualization mode for the home screen chart.
  ///
  /// The [mode] parameter defines the chart type:
  /// - `0`: Line + Area chart
  /// - `1`: Bar chart
  Future<Result<void>> updateHomeVisualizationMode(int mode) async {
    return _updateConfigValue(column: 'homeVisualizationMode', value: mode);
  }

  Future<Result<void>> updateSendCrashReports(bool sendCrashReports) async {
    return _updateConfigValue(
      column: 'sendCrashReports',
      value: sendCrashReports ? 1 : 0,
    );
  }

  Future<Result<void>> updatePassCode(String? passCode) async {
    return _updateSecretConfigValue(key: 'passCode', value: passCode);
  }

  Future<Result<void>> updateLogAutoRefreshTime(int seconds) async {
    return _updateConfigValue(column: 'logAutoRefreshTime', value: seconds);
  }

  Future<Result<void>> updateLiveLog(bool liveLog) async {
    return _updateConfigValue(column: 'liveLog', value: liveLog ? 1 : 0);
  }

  Future<Result<void>> updateIsLivelogPaused(bool isLivelogPaused) async {
    return _updateConfigValue(
      column: 'isLivelogPaused',
      value: isLivelogPaused ? 1 : 0,
    );
  }

  /// Restores the default values in the app configuration.
  ///
  /// This updates all fields in the `appConfig` table to their defaults,
  /// and deletes the `passCode` from secure storage if present.
  ///
  /// Returns a [Result] that completes with [Success.unit] on success,
  /// or [Failure] if the update fails.
  Future<Result<int>> resetAppConfig() async {
    try {
      await openDbIfNeeded(_database);

      await _secureStorage.deleteValue('passCode');
      return await _database.update('appConfig', {
        'autoRefreshTime': 5,
        'theme': 0,
        'language': 'en',
        'reducedDataCharts': 0,
        'logsPerQuery': 2,
        'logAutoRefreshTime': 15,
        'liveLog': 1,
        'isLivelogPaused': 0,
        'useBiometricAuth': 0,
        'importantInfoReaden': 0,
        'hideZeroValues': 0,
        'loadingAnimation': 0,
        'statisticsVisualizationMode': 0,
        'homeVisualizationMode': 0,
        'sendCrashReports': 0,
      });
    } catch (e, st) {
      logger.e('Failed to restore app config: $e\n$st');
      return Failure(Exception('Failed to restore app config: $e\n$st'));
    }
  }

  /// Updates a configuration value in the `appConfig` table.
  ///
  /// Writes the given [column] with the provided [value] using an SQL
  /// `UPDATE` operation. This method is intended for non-sensitive
  /// configuration data.
  ///
  /// Returns a [Result] containing the number of affected rows on success,
  /// or a [Failure] with an exception on error.
  Future<Result<int>> _updateConfigValue({
    required String column,
    required Object value,
  }) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.update('appConfig', {column: value});
    } catch (e, st) {
      logger.e('Failed to update $column: $e\n$st');
      return Failure(Exception('Failed to update $column: $e\n$st'));
    }
  }

  /// Updates or deletes a sensitive configuration value in secure storage.
  ///
  /// Saves the given [value] as a string under the specified [key] if it is
  /// non-null. If [value] is `null`, deletes the entry associated with [key].
  ///
  /// Returns a [Success] if the operation succeeds, or a [Failure] with an
  /// exception on error.
  Future<Result<void>> _updateSecretConfigValue({
    required String key,
    required Object? value,
  }) async {
    try {
      if (value == null) {
        return await _secureStorage.deleteValue('passCode');
      } else {
        return await _secureStorage.saveValue('passCode', value.toString());
      }
    } catch (e, st) {
      logger.e('Failed to update secret $key: $e\n$st');
      return Failure(Exception('Failed to update secret $key: $e\n$st'));
    }
  }
}
