import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:result_dart/result_dart.dart';

class FakeAppConfigRepository implements AppConfigRepository {
  bool shouldFailAppConfig = false;
  bool shouldFailFetchAppConfig = false;
  bool shouldFailUpdate = false;
  bool shouldFailResetAppConfig = false;

  @override
  Result<AppDbData> get appConfig {
    if (shouldFailAppConfig) {
      return Failure(Exception('Simulated appConfig error'));
    }
    return Success(
      AppDbData(
        autoRefreshTime: 5,
        theme: 0,
        language: 'en',
        reducedDataCharts: 0,
        logsPerQuery: 2,
        logAutoRefreshTime: 15,
        liveLog: 1,
        isLivelogPaused: 0,
        passCode: null,
        useBiometricAuth: 0,
        importantInfoReaden: 0,
        hideZeroValues: 0,
        loadingAnimation: 0,
        statisticsVisualizationMode: 0,
        homeVisualizationMode: 0,
        sendCrashReports: 0,
      ),
    );
  }

  @override
  Future<Result<AppDbData>> fetchAppConfig() async {
    if (shouldFailAppConfig) {
      return Failure(Exception('Simulated fetchAppConfig error'));
    }

    return Success(
      AppDbData(
        autoRefreshTime: 5,
        theme: 0,
        language: 'en',
        reducedDataCharts: 0,
        logsPerQuery: 2,
        logAutoRefreshTime: 15,
        liveLog: 1,
        isLivelogPaused: 0,
        passCode: null,
        useBiometricAuth: 0,
        importantInfoReaden: 0,
        hideZeroValues: 0,
        loadingAnimation: 0,
        statisticsVisualizationMode: 0,
        homeVisualizationMode: 0,
        sendCrashReports: 0,
      ),
    );
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
