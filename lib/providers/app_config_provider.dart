import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/languages.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/repository/database.dart';

class AppConfigProvider with ChangeNotifier {
  AppConfigProvider(this._repository);

  bool _showingSnackbar = false;
  int _selectedTab = 0;
  AndroidDeviceInfo? _androidDeviceInfo;
  IosDeviceInfo? _iosDeviceInfo;
  PackageInfo? _appInfo;
  int? _autoRefreshTime = 2; // secounds
  int _selectedTheme = 0;
  int _reducedDataCharts = 0;
  double _logsPerQuery = 2; //hours
  String? _passCode;
  bool _biometricsSupport = false;
  int _useBiometrics = 0;
  bool _appUnlocked = true;
  bool _validVibrator = false;
  int _importantInfoReaden = 0;
  int _hideZeroValues = 0;
  int _statisticsVisualizationMode = 0;
  int _homeVisualizationMode = 0;
  int _sendCrashReports = 0;
  int? _selectedSettingsScreen;
  String _selectedLanguage = 'en';
  // SchedulerBinding.instance.platformDispatcher.locale.languageCode;

  final List<AppLog> _logs = [];
  final DatabaseRepository _repository;

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
      case 0:
        return SchedulerBinding
                    .instance.platformDispatcher.platformBrightness ==
                Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;

      case 1:
        return ThemeMode.light;

      case 2:
        return ThemeMode.dark;

      default:
        return ThemeMode.light;
    }
  }

  String get selectedLanguage {
    return _selectedLanguage;
  }

  int get selectedThemeNumber {
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
    return _useBiometrics == 0 ? false : true;
  }

  bool get appUnlocked {
    return _appUnlocked;
  }

  bool get validVibrator {
    return _validVibrator;
  }

  bool get importantInfoReaden {
    return _importantInfoReaden == 0 ? false : true;
  }

  bool get hideZeroValues {
    return _hideZeroValues == 0 ? false : true;
  }

  int get statisticsVisualizationMode {
    return _statisticsVisualizationMode;
  }

  int get homeVisualizationMode {
    return _homeVisualizationMode;
  }

  bool get sendCrashReports {
    return _sendCrashReports == 0 ? false : true;
  }

  List<AppLog> get logs {
    return _logs;
  }

  int? get selectedSettingsScreen {
    return _selectedSettingsScreen;
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

  void setSelectedSettingsScreen({required int? screen, bool? notify}) {
    _selectedSettingsScreen = screen;
    if (notify == true) {
      notifyListeners();
    }
  }

  Future<bool> setUseBiometrics(bool biometrics) async {
    final updated = await _repository.updateConfigQuery(
      column: 'useBiometricAuth',
      value: biometrics == true ? 1 : 0,
    );
    if (updated == true) {
      _useBiometrics = biometrics == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setImportantInfoReaden(bool status) async {
    final updated = await _repository.updateConfigQuery(
      column: 'importantInfoReaden',
      value: status == true ? 1 : 0,
    );
    if (updated == true) {
      _importantInfoReaden = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setPassCode(String? code) async {
    if (_useBiometrics == 1) {
      final updated = await _repository.updateConfigQuery(
        column: 'useBiometricAuth',
        value: 0,
      );
      if (updated == true) {
        _useBiometrics = 0;
        final updated2 = await _repository.updateConfigQuery(
          column: 'passCode',
          value: code,
        );
        if (updated2 == true) {
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
      final updated =
          await _repository.updateConfigQuery(column: 'passCode', value: code);
      if (updated == true) {
        _passCode = code;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> setAutoRefreshTime(int seconds) async {
    final updated = await _repository.updateConfigQuery(
      column: 'autoRefreshTime',
      value: seconds,
    );
    if (updated == true) {
      _autoRefreshTime = seconds;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setLogsPerQuery(double time) async {
    final updated = await _repository.updateConfigQuery(
      column: 'logsPerQuery',
      value: time,
    );
    if (updated == true) {
      _logsPerQuery = time;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSendCrashReports(bool status) async {
    final updated = await _repository.updateConfigQuery(
      column: 'sendCrashReports',
      value: status == true ? 1 : 0,
    );
    if (updated == true) {
      _sendCrashReports = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void saveFromDb(AppDbData dbData) {
    _autoRefreshTime = dbData.autoRefreshTime;
    _selectedTheme = dbData.theme;
    _selectedLanguage = dbData.language;
    _reducedDataCharts = dbData.reducedDataCharts;
    _logsPerQuery = dbData.logsPerQuery;
    _passCode = dbData.passCode;
    _useBiometrics = dbData.useBiometricAuth;
    _importantInfoReaden = dbData.importantInfoReaden;
    _hideZeroValues = dbData.hideZeroValues;
    _statisticsVisualizationMode = dbData.statisticsVisualizationMode;
    _homeVisualizationMode = dbData.homeVisualizationMode;
    _sendCrashReports = dbData.sendCrashReports;

    if (dbData.passCode != null) {
      _appUnlocked = false;
    }

    notifyListeners();
  }

  Future<bool> setReducedDataCharts(bool status) async {
    final updated = await _repository.updateConfigQuery(
      column: 'reducedDataCharts',
      value: status == true ? 1 : 0,
    );
    if (updated == true) {
      _reducedDataCharts = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setHideZeroValues(bool status) async {
    final updated = await _repository.updateConfigQuery(
      column: 'hideZeroValues',
      value: status == true ? 1 : 0,
    );
    if (updated == true) {
      _hideZeroValues = status == true ? 1 : 0;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSelectedTheme(int value) async {
    final updated =
        await _repository.updateConfigQuery(column: 'theme', value: value);
    if (updated == true) {
      _selectedTheme = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSelectedLanguage(String value) async {
    final updated =
        await _repository.updateConfigQuery(column: 'language', value: value);
    if (updated == true) {
      _selectedLanguage = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setStatisticsVisualizationMode(int value) async {
    final updated = await _repository.updateConfigQuery(
      column: 'statisticsVisualizationMode',
      value: value,
    );
    if (updated == true) {
      _statisticsVisualizationMode = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setHomeVisualizationMode(int value) async {
    final updated = await _repository.updateConfigQuery(
      column: 'homeVisualizationMode',
      value: value,
    );
    if (updated == true) {
      _homeVisualizationMode = value;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> restoreAppConfig() async {
    final result = await _repository.restoreAppConfigQuery();
    if (result == true) {
      _autoRefreshTime = 5;
      _selectedTheme = 0;
      _selectedLanguage = 'en';
      _reducedDataCharts = 0;
      _logsPerQuery = 2;
      _passCode = null;
      _useBiometrics = 0;
      _importantInfoReaden = 0;
      _hideZeroValues = 0;
      _statisticsVisualizationMode = 0;
      _homeVisualizationMode = 0;
      _sendCrashReports = 0;

      notifyListeners();

      return true;
    } else {
      return false;
    }
  }
}
