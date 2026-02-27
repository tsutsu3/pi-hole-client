import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_config.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:result_dart/result_dart.dart';

class FakeAppConfigRepository implements AppConfigRepository {
  bool shouldFailAppConfig = false;
  bool shouldFailFetchAppConfig = false;
  bool shouldFailUpdate = false;
  bool shouldFailResetAppConfig = false;

  /// Controls the `importantInfoReaden` value returned by [appConfig]/[fetchAppConfig].
  bool importantInfoReadenValue = false;

  AppConfig _defaultConfig() => AppConfig(
    autoRefreshTime: 5,
    theme: AppThemeMode.system,
    language: 'en',
    reducedDataCharts: false,
    logsPerQuery: 2,
    logAutoRefreshTime: 5,
    liveLog: true,
    isLivelogPaused: true,
    useBiometricAuth: false,
    importantInfoReaden: importantInfoReadenValue,
    hideZeroValues: false,
    loadingAnimation: false,
    statisticsVisualizationMode: StatisticsVisualizationMode.list,
    homeVisualizationMode: HomeVisualizationMode.lineArea,
    sendCrashReports: false,
  );

  @override
  Result<AppConfig> get appConfig {
    if (shouldFailAppConfig) {
      return Failure(Exception('Simulated appConfig error'));
    }
    return Success(_defaultConfig());
  }

  @override
  Future<Result<AppConfig>> fetchAppConfig() async {
    if (shouldFailAppConfig) {
      return Failure(Exception('Simulated fetchAppConfig error'));
    }

    return Success(_defaultConfig());
  }

  @override
  Future<Result<void>> updateAutoRefreshTime(int time) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateAutoRefreshTime error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateTheme(int theme) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateTheme error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateLanguage(String language) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateLanguage error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateReducedDataCharts(bool enabled) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateReducedDataCharts error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateLogsPerQuery(double logsPerQuery) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateLogsPerQuery error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateLogAutoRefreshTime(int seconds) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateLogAutoRefreshTime error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateLiveLog(bool liveLog) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateLiveLog error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateIsLivelogPaused(bool isLivelogPaused) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateIsLivelogPaused error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateUseBiometricAuth(bool useBiometricAuth) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateUseBiometricAuth error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateImportantInfoReaden(bool readen) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateImportantInfoReaden error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateHideZeroValues(bool hideZeroValues) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateHideZeroValues error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateLoadingAnimation(bool loadingAnimation) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateLoadingAnimation error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateStatisticsVisualizationMode(int mode) async {
    if (shouldFailUpdate) {
      return Failure(
        Exception('Simulated updateStatisticsVisualizationMode error'),
      );
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateHomeVisualizationMode(int mode) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateHomeVisualizationMode error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updateSendCrashReports(bool sendCrashReports) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updateSendCrashReports error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> updatePassCode(String? passCode) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated updatePassCode error'));
    }
    return Success.unit();
  }

  @override
  Future<Result<int>> resetAppConfig() async {
    if (shouldFailResetAppConfig) {
      return Failure(Exception('Simulated resetAppConfig error'));
    }
    return const Success(1);
  }
}
