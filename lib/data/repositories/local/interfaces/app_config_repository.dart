import 'package:pi_hole_client/domain/model/app/app_config.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AppConfigRepository {
  Result<AppConfig> get appConfig;
  Future<Result<AppConfig>> fetchAppConfig();
  Future<Result<void>> updateAutoRefreshTime(int time);
  Future<Result<void>> updateTheme(int theme);
  Future<Result<void>> updateLanguage(String language);
  Future<Result<void>> updateReducedDataCharts(bool enabled);
  Future<Result<void>> updateLogsPerQuery(double logsPerQuery);
  Future<Result<void>> updateUseBiometricAuth(bool useBiometricAuth);
  Future<Result<void>> updateImportantInfoReaden(bool readen);
  Future<Result<void>> updateHideZeroValues(bool hideZeroValues);
  Future<Result<void>> updateLoadingAnimation(bool loadingAnimation);
  Future<Result<void>> updateStatisticsVisualizationMode(int mode);
  Future<Result<void>> updateHomeVisualizationMode(int mode);
  Future<Result<void>> updateSendCrashReports(bool sendCrashReports);
  Future<Result<void>> updatePassCode(String? passCode);
  Future<Result<void>> updateLogAutoRefreshTime(int seconds);
  Future<Result<void>> updateLiveLog(bool liveLog);
  Future<Result<void>> updateIsLivelogPaused(bool isLivelogPaused);
  Future<Result<int>> resetAppConfig();
}
