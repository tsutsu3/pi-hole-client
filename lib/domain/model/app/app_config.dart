import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/utils/disable_durations.dart';

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

    /// Timed options of the disable menu, in seconds.
    @Default(DisableDurations.defaults) List<int> disableDurations,

    /// How long a disable from a home screen widget lasts, in seconds.
    /// 0 = indefinitely.
    @Default(0) int widgetDisableDuration,
  }) = _AppConfig;
}
