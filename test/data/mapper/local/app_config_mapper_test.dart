import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/local/app_config_mapper.dart';
import 'package:pi_hole_client/data/model/local/app_db_data.dart';
import 'package:pi_hole_client/domain/model/enums.dart';

AppDbData _makeData({
  int autoRefreshTime = 5,
  int theme = 0,
  String language = 'en',
  int reducedDataCharts = 0,
  double logsPerQuery = 100.0,
  int logAutoRefreshTime = 10,
  int liveLog = 0,
  int isLivelogPaused = 0,
  String? passCode,
  int useBiometricAuth = 0,
  int importantInfoReaden = 0,
  int hideZeroValues = 0,
  int loadingAnimation = 1,
  int statisticsVisualizationMode = 0,
  int homeVisualizationMode = 0,
  int sendCrashReports = 0,
}) {
  return AppDbData(
    autoRefreshTime: autoRefreshTime,
    theme: theme,
    language: language,
    reducedDataCharts: reducedDataCharts,
    logsPerQuery: logsPerQuery,
    logAutoRefreshTime: logAutoRefreshTime,
    liveLog: liveLog,
    isLivelogPaused: isLivelogPaused,
    passCode: passCode,
    useBiometricAuth: useBiometricAuth,
    importantInfoReaden: importantInfoReaden,
    hideZeroValues: hideZeroValues,
    loadingAnimation: loadingAnimation,
    statisticsVisualizationMode: statisticsVisualizationMode,
    homeVisualizationMode: homeVisualizationMode,
    sendCrashReports: sendCrashReports,
  );
}

void main() {
  group('AppDbDataMapper', () {
    test('maps all fields correctly', () {
      final data = _makeData(
        autoRefreshTime: 15,
        theme: 1,
        language: 'ja',
        reducedDataCharts: 1,
        logsPerQuery: 200.0,
        logAutoRefreshTime: 30,
        liveLog: 1,
        isLivelogPaused: 1,
        passCode: '1234',
        useBiometricAuth: 1,
        importantInfoReaden: 1,
        hideZeroValues: 1,
        loadingAnimation: 0,
        statisticsVisualizationMode: 1,
        homeVisualizationMode: 1,
        sendCrashReports: 1,
      );

      final config = data.toDomain();

      expect(config.autoRefreshTime, 15);
      expect(config.theme, AppThemeMode.values[1]);
      expect(config.language, 'ja');
      expect(config.reducedDataCharts, isTrue);
      expect(config.logsPerQuery, 200.0);
      expect(config.logAutoRefreshTime, 30);
      expect(config.liveLog, isTrue);
      expect(config.isLivelogPaused, isTrue);
      expect(config.passCode, '1234');
      expect(config.useBiometricAuth, isTrue);
      expect(config.importantInfoReaden, isTrue);
      expect(config.hideZeroValues, isTrue);
      expect(config.loadingAnimation, isFalse);
      expect(config.statisticsVisualizationMode, StatisticsVisualizationMode.values[1]);
      expect(config.homeVisualizationMode, HomeVisualizationMode.values[1]);
      expect(config.sendCrashReports, isTrue);
    });

    test('int=0 fields map to false', () {
      final config = _makeData(
        reducedDataCharts: 0,
        liveLog: 0,
        isLivelogPaused: 0,
        useBiometricAuth: 0,
        hideZeroValues: 0,
        loadingAnimation: 0,
        sendCrashReports: 0,
      ).toDomain();

      expect(config.reducedDataCharts, isFalse);
      expect(config.liveLog, isFalse);
      expect(config.isLivelogPaused, isFalse);
      expect(config.useBiometricAuth, isFalse);
      expect(config.hideZeroValues, isFalse);
      expect(config.loadingAnimation, isFalse);
      expect(config.sendCrashReports, isFalse);
    });

    test('passCode is null when not set', () {
      final config = _makeData(passCode: null).toDomain();
      expect(config.passCode, isNull);
    });

    test('out-of-range theme index falls back to AppThemeMode.system', () {
      final config = _makeData(theme: 9999).toDomain();
      expect(config.theme, AppThemeMode.system);
    });

    test('out-of-range statisticsVisualizationMode falls back to list', () {
      final config = _makeData(statisticsVisualizationMode: 9999).toDomain();
      expect(config.statisticsVisualizationMode, StatisticsVisualizationMode.list);
    });

    test('out-of-range homeVisualizationMode falls back to lineArea', () {
      final config = _makeData(homeVisualizationMode: 9999).toDomain();
      expect(config.homeVisualizationMode, HomeVisualizationMode.lineArea);
    });

    test('theme index 0 maps to first AppThemeMode value', () {
      final config = _makeData(theme: 0).toDomain();
      expect(config.theme, AppThemeMode.values[0]);
    });
  });
}
