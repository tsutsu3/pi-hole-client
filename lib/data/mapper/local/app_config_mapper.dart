import 'package:pi_hole_client/data/model/local/app_db_data.dart';
import 'package:pi_hole_client/domain/model/app/app_config.dart';
import 'package:pi_hole_client/domain/model/enums.dart';

extension AppDbDataMapper on AppDbData {
  AppConfig toDomain() => AppConfig(
    autoRefreshTime: autoRefreshTime,
    theme: theme < AppThemeMode.values.length
        ? AppThemeMode.values[theme]
        : AppThemeMode.system,
    language: language,
    reducedDataCharts: reducedDataCharts == 1,
    logsPerQuery: logsPerQuery,
    logAutoRefreshTime: logAutoRefreshTime,
    liveLog: liveLog == 1,
    isLivelogPaused: isLivelogPaused == 1,
    useBiometricAuth: useBiometricAuth == 1,
    importantInfoReaden: importantInfoReaden == 1,
    hideZeroValues: hideZeroValues == 1,
    loadingAnimation: loadingAnimation == 1,
    statisticsVisualizationMode:
        statisticsVisualizationMode < StatisticsVisualizationMode.values.length
        ? StatisticsVisualizationMode.values[statisticsVisualizationMode]
        : StatisticsVisualizationMode.list,
    homeVisualizationMode:
        homeVisualizationMode < HomeVisualizationMode.values.length
        ? HomeVisualizationMode.values[homeVisualizationMode]
        : HomeVisualizationMode.lineArea,
    sendCrashReports: sendCrashReports == 1,
    passCode: passCode,
  );
}
