import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/model/enums.dart';

part 'app_config.freezed.dart';

@freezed
sealed class AppConfig with _$AppConfig {
  const factory AppConfig({
    required int autoRefreshTime,
    required AppThemeMode theme,
    required String language,
    required bool reducedDataCharts,
    required double logsPerQuery,
    required int logAutoRefreshTime,
    required bool liveLog,
    required bool isLivelogPaused,
    required bool useBiometricAuth,
    required bool importantInfoReaden,
    required bool hideZeroValues,
    required bool loadingAnimation,
    required StatisticsVisualizationMode statisticsVisualizationMode,
    required HomeVisualizationMode homeVisualizationMode,
    required bool sendCrashReports,
    String? passCode,
  }) = _AppConfig;
}
