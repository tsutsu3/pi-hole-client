class AppDbData {
  AppDbData({
    required this.autoRefreshTime,
    required this.theme,
    required this.language,
    required this.reducedDataCharts,
    required this.logsPerQuery,
    required this.logAutoRefreshTime,
    required this.liveLog,
    required this.isLivelogPaused,
    required this.passCode,
    required this.useBiometricAuth,
    required this.importantInfoReaden,
    required this.hideZeroValues,
    required this.loadingAnimation,
    required this.statisticsVisualizationMode,
    required this.homeVisualizationMode,
    required this.sendCrashReports,
  });

  factory AppDbData.fromMap(Map<String, Object?> map) {
    return AppDbData(
      autoRefreshTime: map['autoRefreshTime']! as int,
      theme: map['theme']! as int,
      language: map['language']! as String,
      reducedDataCharts: map['reducedDataCharts']! as int,
      logsPerQuery: (map['logsPerQuery']! as num).toDouble(),
      logAutoRefreshTime: map['logAutoRefreshTime']! as int,
      liveLog: map['liveLog']! as int,
      isLivelogPaused: map['isLivelogPaused']! as int,
      passCode: map['passCode'] as String?,
      useBiometricAuth: map['useBiometricAuth']! as int,
      importantInfoReaden: map['importantInfoReaden']! as int,
      hideZeroValues: map['hideZeroValues']! as int,
      loadingAnimation: map['loadingAnimation']! as int,
      statisticsVisualizationMode: map['statisticsVisualizationMode']! as int,
      homeVisualizationMode: map['homeVisualizationMode']! as int,
      sendCrashReports: map['sendCrashReports']! as int,
    );
  }

  factory AppDbData.withSecrets(AppDbData instance, String? passCode) {
    return AppDbData(
      autoRefreshTime: instance.autoRefreshTime,
      theme: instance.theme,
      language: instance.language,
      reducedDataCharts: instance.reducedDataCharts,
      logsPerQuery: instance.logsPerQuery,
      logAutoRefreshTime: instance.logAutoRefreshTime,
      liveLog: instance.liveLog,
      isLivelogPaused: instance.isLivelogPaused,
      passCode: passCode,
      useBiometricAuth: instance.useBiometricAuth,
      importantInfoReaden: instance.importantInfoReaden,
      hideZeroValues: instance.hideZeroValues,
      loadingAnimation: instance.loadingAnimation,
      statisticsVisualizationMode: instance.statisticsVisualizationMode,
      homeVisualizationMode: instance.homeVisualizationMode,
      sendCrashReports: instance.sendCrashReports,
    );
  }

  final int autoRefreshTime;
  final int theme;
  final String language;
  final int reducedDataCharts;
  final double logsPerQuery;
  final int logAutoRefreshTime;
  final int liveLog;
  final int isLivelogPaused;
  final String? passCode;
  final int useBiometricAuth;
  final int importantInfoReaden;
  final int hideZeroValues;
  final int loadingAnimation;
  final int statisticsVisualizationMode; // 0 = list, 1 = pie
  final int homeVisualizationMode; // 0 = line area, 1 = bar
  final int sendCrashReports;

  Map<String, Object?> toDict() {
    return {
      'autoRefreshTime': autoRefreshTime,
      'theme': theme,
      'language': language,
      'reducedDataCharts': reducedDataCharts,
      'logsPerQuery': logsPerQuery,
      'logAutoRefreshTime': logAutoRefreshTime,
      'liveLog': liveLog,
      'isLivelogPaused': isLivelogPaused,
      'passCode': passCode,
      'useBiometricAuth': useBiometricAuth,
      'importantInfoReaden': importantInfoReaden,
      'hideZeroValues': hideZeroValues,
      'loadingAnimation': loadingAnimation,
      'statisticsVisualizationMode': statisticsVisualizationMode,
      'homeVisualizationMode': homeVisualizationMode,
      'sendCrashReports': sendCrashReports,
    };
  }
}
