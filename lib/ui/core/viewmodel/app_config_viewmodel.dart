import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/local/app_db_data.dart';
import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/ui/core/l10n/languages.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/utils/logger.dart';

class AppConfigViewModel with ChangeNotifier {
  AppConfigViewModel(this._repository);

  bool _showingSnackbar = false;
  int _selectedTab = 0;
  AndroidDeviceInfo? _androidDeviceInfo;
  IosDeviceInfo? _iosDeviceInfo;
  PackageInfo? _appInfo;
  int? _autoRefreshTime = 2; // secounds
  AppThemeMode _selectedTheme = AppThemeMode.system;
  int _reducedDataCharts = 0;
  double _logsPerQuery = 2; //hours
  String? _passCode;
  bool _biometricsSupport = false;
  int _useBiometrics = 0;
  bool _appUnlocked = true;
  bool _validVibrator = false;
  int _importantInfoReaden = 0;
  int _hideZeroValues = 0;
  int _loadingAnimation = 1;
  StatisticsVisualizationMode _statisticsVisualizationMode =
      StatisticsVisualizationMode.list;
  HomeVisualizationMode _homeVisualizationMode = HomeVisualizationMode.lineArea;
  int _sendCrashReports = 0;
  String _selectedLanguage = 'en';
  int _logAutoRefreshTime = 5;
  bool _liveLog = true;
  bool _isLivelogPaused = true;

  final List<AppLog> _logs = [];
  final AppConfigRepository _repository;

  AppColors get colors =>
      selectedTheme == ThemeMode.light ? lightAppColors : darkAppColors;

  bool get showingSnackbar {
    return _showingSnackbar;
  }

  int get selectedTab {
    return _selectedTab;
  }

  PackageInfo? get getAppInfo {
    return _appInfo;
  }

  int? get getAutoRefreshTime {
    return _autoRefreshTime;
  }

  ThemeMode get selectedTheme {
    switch (_selectedTheme) {
      case AppThemeMode.system:
        return SchedulerBinding
                    .instance
                    .platformDispatcher
                    .platformBrightness ==
                Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;

      case AppThemeMode.light:
        return ThemeMode.light;

      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  String get selectedLanguage {
    return _selectedLanguage;
  }

  AppThemeMode get appThemeMode {
    return _selectedTheme;
  }

  int get selectedLanguageNumber {
    final selectedLanguageOption = languageOptions.firstWhere(
      (option) => option.key == _selectedLanguage,
      orElse: () => languageOptions.firstWhere((option) => option.key == 'en'),
    );
    return selectedLanguageOption.index;
  }

  bool get reducedDataCharts {
    return _reducedDataCharts == 0 ? false : true;
  }

  double get logsPerQuery {
    return _logsPerQuery;
  }

  AndroidDeviceInfo? get androidDeviceInfo {
    return _androidDeviceInfo;
  }

  IosDeviceInfo? get iosDeviceInfo {
    return _iosDeviceInfo;
  }

  String? get passCode {
    return _passCode;
  }

  bool get biometricsSupport {
    return _biometricsSupport;
  }

  bool get useBiometrics {
    return _useBiometrics == 1;
  }

  bool get appUnlocked {
    return _appUnlocked;
  }

  bool get validVibrator {
    return _validVibrator;
  }

  bool get importantInfoReaden {
    return _importantInfoReaden == 1;
  }

  bool get hideZeroValues {
    return _hideZeroValues == 1;
  }

  bool get loadingAnimation {
    return _loadingAnimation == 1;
  }

  StatisticsVisualizationMode get statisticsVisualizationMode {
    return _statisticsVisualizationMode;
  }

  HomeVisualizationMode get homeVisualizationMode {
    return _homeVisualizationMode;
  }

  bool get sendCrashReports {
    return _sendCrashReports == 1;
  }

  List<AppLog> get logs {
    return _logs;
  }

  int get logAutoRefreshTime {
    return _logAutoRefreshTime;
  }

  bool get liveLog {
    return _liveLog;
  }

  bool get isLivelogPaused {
    return _isLivelogPaused;
  }

  void setShowingSnackbar(bool status) {
    _showingSnackbar = status;
    notifyListeners();
  }

  void setSelectedTab(int selectedTab) {
    _selectedTab = selectedTab;
    notifyListeners();
  }

  void setAppInfo(PackageInfo appInfo) {
    _appInfo = appInfo;
    notifyListeners();
  }

  void setAndroidInfo(AndroidDeviceInfo deviceInfo) {
    _androidDeviceInfo = deviceInfo;
    notifyListeners();
  }

  void setIosInfo(IosDeviceInfo deviceInfo) {
    _iosDeviceInfo = deviceInfo;
    notifyListeners();
  }

  void setBiometricsSupport(bool isSupported) {
    _biometricsSupport = isSupported;
    notifyListeners();
  }

  void setAppUnlocked(bool status) {
    _appUnlocked = status;
    notifyListeners();
  }

  void setValidVibrator(bool valid) {
    _validVibrator = valid;
    notifyListeners();
  }

  void addLog(AppLog log) {
    _logs.add(log);
    notifyListeners();
  }

  Future<bool> setUseBiometrics(bool biometrics) async {
    final updated = await _repository.updateUseBiometricAuth(biometrics);
    if (updated.isSuccess()) {
      _useBiometrics = biometrics == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      logger.w(
        'Failed to persist useBiometrics setting to the database. In-memory state has been updated, but DB and app state may be inconsistent.',
      );
      return false;
    }
  }

  Future<bool> setImportantInfoReaden(bool status) async {
    final updated = await _repository.updateImportantInfoReaden(status);
    if (updated.isSuccess()) {
      _importantInfoReaden = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setPassCode(String? code) async {
    if (_useBiometrics == 1) {
      final updated = await _repository.updateUseBiometricAuth(false);
      if (updated.isSuccess()) {
        _useBiometrics = 0;
        final updated2 = await _repository.updatePassCode(code);
        if (updated2.isSuccess()) {
          _passCode = code;
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      final updated = await _repository.updatePassCode(code);
      if (updated.isSuccess()) {
        _passCode = code;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> setAutoRefreshTime(int seconds) async {
    final updated = await _repository.updateAutoRefreshTime(seconds);
    if (updated.isSuccess()) {
      _autoRefreshTime = seconds;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setLogsPerQuery(double time) async {
    final updated = await _repository.updateLogsPerQuery(time);
    if (updated.isSuccess()) {
      _logsPerQuery = time;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSendCrashReports(bool status) async {
    final updated = await _repository.updateSendCrashReports(status);
    if (updated.isSuccess()) {
      _sendCrashReports = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setLogAutoRefreshTime(int seconds) async {
    final updated = await _repository.updateLogAutoRefreshTime(seconds);
    if (updated.isSuccess()) {
      _logAutoRefreshTime = seconds;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setLiveLog(bool status) async {
    final updated = await _repository.updateLiveLog(status);
    if (updated.isSuccess()) {
      _liveLog = status;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setLivelogPaused(bool status) async {
    final updated = await _repository.updateIsLivelogPaused(status);
    if (updated.isSuccess()) {
      _isLivelogPaused = status;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void saveFromDb(AppDbData dbData) {
    _autoRefreshTime = dbData.autoRefreshTime;
    _selectedTheme = dbData.theme < AppThemeMode.values.length
        ? AppThemeMode.values[dbData.theme]
        : AppThemeMode.system;
    _selectedLanguage = dbData.language;
    _reducedDataCharts = dbData.reducedDataCharts;
    _logsPerQuery = dbData.logsPerQuery;
    _logAutoRefreshTime = dbData.logAutoRefreshTime;
    _liveLog = dbData.liveLog == 1;
    _isLivelogPaused = dbData.isLivelogPaused == 1;
    _passCode = dbData.passCode;
    _useBiometrics = dbData.useBiometricAuth;
    _importantInfoReaden = dbData.importantInfoReaden;
    _hideZeroValues = dbData.hideZeroValues;
    _loadingAnimation = dbData.loadingAnimation;
    _statisticsVisualizationMode =
        dbData.statisticsVisualizationMode < StatisticsVisualizationMode.values.length
            ? StatisticsVisualizationMode.values[dbData.statisticsVisualizationMode]
            : StatisticsVisualizationMode.list;
    _homeVisualizationMode =
        dbData.homeVisualizationMode < HomeVisualizationMode.values.length
            ? HomeVisualizationMode.values[dbData.homeVisualizationMode]
            : HomeVisualizationMode.lineArea;
    _sendCrashReports = dbData.sendCrashReports;

    if (dbData.passCode != null) {
      _appUnlocked = false;
    }

    notifyListeners();
  }

  Future<bool> setReducedDataCharts(bool status) async {
    final updated = await _repository.updateReducedDataCharts(status);
    if (updated.isSuccess()) {
      _reducedDataCharts = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setHideZeroValues(bool status) async {
    final updated = await _repository.updateHideZeroValues(status);
    if (updated.isSuccess()) {
      _hideZeroValues = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setShowLoadingAnimation(bool status) async {
    final updated = await _repository.updateLoadingAnimation(status);
    if (updated.isSuccess()) {
      _loadingAnimation = status ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSelectedTheme(AppThemeMode value) async {
    final updated = await _repository.updateTheme(value.index);
    if (updated.isSuccess()) {
      _selectedTheme = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSelectedLanguage(String value) async {
    final updated = await _repository.updateLanguage(value);
    if (updated.isSuccess()) {
      _selectedLanguage = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setStatisticsVisualizationMode(
    StatisticsVisualizationMode value,
  ) async {
    final updated =
        await _repository.updateStatisticsVisualizationMode(value.index);
    if (updated.isSuccess()) {
      _statisticsVisualizationMode = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setHomeVisualizationMode(HomeVisualizationMode value) async {
    final updated =
        await _repository.updateHomeVisualizationMode(value.index);
    if (updated.isSuccess()) {
      _homeVisualizationMode = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> restoreAppConfig() async {
    final result = await _repository.resetAppConfig();
    if (result.isSuccess()) {
      _autoRefreshTime = 5;
      _selectedTheme = AppThemeMode.system;
      _selectedLanguage = 'en';
      _reducedDataCharts = 0;
      _logsPerQuery = 2;
      _logAutoRefreshTime = 5;
      _liveLog = true;
      _isLivelogPaused = true;
      _passCode = null;
      _useBiometrics = 0;
      _importantInfoReaden = 0;
      _hideZeroValues = 0;
      _loadingAnimation = 1;
      _statisticsVisualizationMode = StatisticsVisualizationMode.list;
      _homeVisualizationMode = HomeVisualizationMode.lineArea;
      _sendCrashReports = 0;

      notifyListeners();

      return true;
    } else {
      return false;
    }
  }
}
