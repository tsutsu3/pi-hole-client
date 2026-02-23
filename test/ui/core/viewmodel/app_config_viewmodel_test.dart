import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/local/app_db_data.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppConfigViewModel', () {
    late AppConfigViewModel appConfigViewModel;
    late FakeAppConfigRepository repository;
    late bool listenerCalled;

    setUp(() {
      repository = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(repository);

      listenerCalled = false;
      appConfigViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    test('Initial values are correct', () {
      expect(appConfigViewModel.showingSnackbar, false);
      expect(appConfigViewModel.selectedTab, 0);
      expect(appConfigViewModel.getAutoRefreshTime, 2);
      expect(appConfigViewModel.appThemeMode, AppThemeMode.system);
      expect(appConfigViewModel.selectedLanguage, 'en');
      expect(appConfigViewModel.reducedDataCharts, false);
      expect(appConfigViewModel.logsPerQuery, 2);
      expect(appConfigViewModel.logAutoRefreshTime, 5);
      expect(appConfigViewModel.liveLog, true);
      expect(appConfigViewModel.isLivelogPaused, true);
      expect(appConfigViewModel.passCode, null);
      expect(appConfigViewModel.biometricsSupport, false);
      expect(appConfigViewModel.useBiometrics, false);
      expect(appConfigViewModel.appUnlocked, true);
      expect(appConfigViewModel.validVibrator, false);
      expect(appConfigViewModel.loadingAnimation, true);
      expect(appConfigViewModel.importantInfoReaden, false);
      expect(appConfigViewModel.hideZeroValues, false);
      expect(
        appConfigViewModel.statisticsVisualizationMode,
        StatisticsVisualizationMode.list,
      );
      expect(
        appConfigViewModel.homeVisualizationMode,
        HomeVisualizationMode.lineArea,
      );
      expect(appConfigViewModel.sendCrashReports, false);
      expect(appConfigViewModel.logs, []);
      expect(appConfigViewModel.selectedSettingsScreen, null);
      expect(listenerCalled, false);
    });

    test('setShowingSnackbar updates value and notifies listeners', () {
      appConfigViewModel.setShowingSnackbar(true);
      expect(appConfigViewModel.showingSnackbar, true);
      expect(listenerCalled, true);
    });

    test('setSelectedTab updates value and notifies listeners', () {
      appConfigViewModel.setSelectedTab(1);
      expect(appConfigViewModel.selectedTab, 1);
      expect(listenerCalled, true);
    });

    test('setAppInfo updates value and notifies listeners', () {
      final packageInfo = PackageInfo(
        appName: 'Test',
        packageName: 'test',
        version: '1.0',
        buildNumber: '1',
      );
      appConfigViewModel.setAppInfo(packageInfo);
      expect(appConfigViewModel.getAppInfo, packageInfo);
      expect(listenerCalled, true);
    });

    test('setBiometricsSupport updates value and notifies listeners', () {
      appConfigViewModel.setBiometricsSupport(true);
      expect(appConfigViewModel.biometricsSupport, true);
      expect(listenerCalled, true);
    });

    test('setAppUnlocked updates value and notifies listeners', () {
      appConfigViewModel.setAppUnlocked(false);
      expect(appConfigViewModel.appUnlocked, false);
      expect(listenerCalled, true);
    });

    test('setValidVibrator updates value and notifies listeners', () {
      appConfigViewModel.setValidVibrator(true);
      expect(appConfigViewModel.validVibrator, true);
      expect(listenerCalled, true);
    });

    // TODO:
    // test('addLog adds log and notifies listeners', () {
    //   final log = AppLog(message: 'Test log');
    //   appConfigViewModel.addLog(log);
    //   expect(appConfigViewModel.logs, [log]);
    // });

    test('setSelectedSettingsScreen updates value and notifies listeners', () {
      appConfigViewModel.setSelectedSettingsScreen(screen: 1, notify: true);
      expect(appConfigViewModel.selectedSettingsScreen, 1);
      expect(listenerCalled, true);
    });

    test('setUseBiometrics updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setUseBiometrics(true);
      expect(result, true);
      expect(appConfigViewModel.useBiometrics, true);
      expect(listenerCalled, true);
    });

    test(
      'setImportantInfoReaden updates value and notifies listeners',
      () async {
        final result = await appConfigViewModel.setImportantInfoReaden(true);
        expect(result, true);
        expect(appConfigViewModel.importantInfoReaden, true);
        expect(listenerCalled, true);
      },
    );

    test('setPassCode updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setPassCode('1234');
      expect(result, true);
      expect(appConfigViewModel.passCode, '1234');
      expect(listenerCalled, true);
    });

    test(
      'setPassCode updates value with biometrics and notifies listeners',
      () async {
        final result = await appConfigViewModel.setPassCode('1234');
        expect(result, true);
        expect(appConfigViewModel.passCode, '1234');
        expect(listenerCalled, true);
      },
    );

    test('setAutoRefreshTime updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setAutoRefreshTime(10);
      expect(result, true);
      expect(appConfigViewModel.getAutoRefreshTime, 10);
      expect(listenerCalled, true);
    });

    test('setLogsPerQuery updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setLogsPerQuery(5.0);
      expect(result, true);
      expect(appConfigViewModel.logsPerQuery, 5.0);
      expect(listenerCalled, true);
    });

    test('setSendCrashReports updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setSendCrashReports(true);
      expect(result, true);
      expect(appConfigViewModel.sendCrashReports, true);
      expect(listenerCalled, true);
    });

    test(
      'saveFromDb updates values from database and notifies listeners',
      () async {
        final appDbData = AppDbData(
          autoRefreshTime: 5,
          theme: 1,
          language: 'ja',
          reducedDataCharts: 1,
          logsPerQuery: 5,
          logAutoRefreshTime: 30,
          liveLog: 0,
          isLivelogPaused: 0,
          passCode: '9999',
          useBiometricAuth: 1,
          importantInfoReaden: 1,
          hideZeroValues: 1,
          loadingAnimation: 0,
          statisticsVisualizationMode: 1,
          homeVisualizationMode: 1,
          sendCrashReports: 1,
        );

        appConfigViewModel.saveFromDb(appDbData);
        expect(appConfigViewModel.getAutoRefreshTime, 5);
        expect(appConfigViewModel.appThemeMode, AppThemeMode.light);
        expect(appConfigViewModel.selectedLanguage, 'ja');
        expect(appConfigViewModel.reducedDataCharts, true);
        expect(appConfigViewModel.logsPerQuery, 5);
        expect(appConfigViewModel.logAutoRefreshTime, 30);
        expect(appConfigViewModel.liveLog, false);
        expect(appConfigViewModel.isLivelogPaused, false);
        expect(appConfigViewModel.passCode, '9999');
        expect(appConfigViewModel.useBiometrics, true);
        expect(appConfigViewModel.importantInfoReaden, true);
        expect(appConfigViewModel.hideZeroValues, true);
        expect(appConfigViewModel.loadingAnimation, false);
        expect(
          appConfigViewModel.statisticsVisualizationMode,
          StatisticsVisualizationMode.pieChart,
        );
        expect(
          appConfigViewModel.homeVisualizationMode,
          HomeVisualizationMode.bar,
        );
        expect(appConfigViewModel.sendCrashReports, true);
        expect(listenerCalled, true);
        expect(appDbData.toDict(), {
          'autoRefreshTime': 5,
          'theme': 1,
          'language': 'ja',
          'reducedDataCharts': 1,
          'logsPerQuery': 5,
          'logAutoRefreshTime': 30,
          'liveLog': 0,
          'isLivelogPaused': 0,
          'passCode': '9999',
          'useBiometricAuth': 1,
          'importantInfoReaden': 1,
          'hideZeroValues': 1,
          'loadingAnimation': 0,
          'statisticsVisualizationMode': 1,
          'homeVisualizationMode': 1,
          'sendCrashReports': 1,
        });
      },
    );

    test('setReducedDataCharts updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setReducedDataCharts(true);
      expect(result, true);
      expect(appConfigViewModel.reducedDataCharts, true);
      expect(listenerCalled, true);
    });

    test('setHideZeroValues updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setHideZeroValues(true);
      expect(result, true);
      expect(appConfigViewModel.hideZeroValues, true);
      expect(listenerCalled, true);
    });

    test('setLoadingAnimation updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setShowLoadingAnimation(true);
      expect(result, true);
      expect(appConfigViewModel.loadingAnimation, true);
      expect(listenerCalled, true);
    });

    test('setSelectedTheme updates value and notifies listeners', () async {
      final result =
          await appConfigViewModel.setSelectedTheme(AppThemeMode.light);
      expect(result, true);
      expect(appConfigViewModel.appThemeMode, AppThemeMode.light);
      expect(listenerCalled, true);
    });

    test('setSelectedLanguage updates value and notifies listeners', () async {
      final result = await appConfigViewModel.setSelectedLanguage('ja');
      expect(result, true);
      expect(appConfigViewModel.selectedLanguage, 'ja');
      expect(appConfigViewModel.selectedLanguageNumber, 1);
      expect(listenerCalled, true);
    });

    test(
      'setStatisticsVisualizationMode updates value and notifies listeners',
      () async {
        final result = await appConfigViewModel.setStatisticsVisualizationMode(
          StatisticsVisualizationMode.pieChart,
        );
        expect(result, true);
        expect(
          appConfigViewModel.statisticsVisualizationMode,
          StatisticsVisualizationMode.pieChart,
        );
        expect(listenerCalled, true);
      },
    );

    test(
      'setHomeVisualizationMode updates value and notifies listeners',
      () async {
        final result = await appConfigViewModel.setHomeVisualizationMode(
          HomeVisualizationMode.bar,
        );
        expect(result, true);
        expect(
          appConfigViewModel.homeVisualizationMode,
          HomeVisualizationMode.bar,
        );
        expect(listenerCalled, true);
      },
    );

    test(
      'restoreAppConfig restores default values and notifies listeners',
      () async {
        final result = await appConfigViewModel.restoreAppConfig();
        expect(result, true);
        expect(appConfigViewModel.getAutoRefreshTime, 5);
        expect(appConfigViewModel.appThemeMode, AppThemeMode.system);
        expect(
          appConfigViewModel.selectedLanguage,
          SchedulerBinding.instance.platformDispatcher.locale.languageCode,
        );
        expect(appConfigViewModel.reducedDataCharts, false);
        expect(appConfigViewModel.logsPerQuery, 2);
        expect(appConfigViewModel.logAutoRefreshTime, 5);
        expect(appConfigViewModel.liveLog, true);
        expect(appConfigViewModel.isLivelogPaused, true);
        expect(appConfigViewModel.passCode, null);
        expect(appConfigViewModel.useBiometrics, false);
        expect(appConfigViewModel.importantInfoReaden, false);
        expect(appConfigViewModel.hideZeroValues, false);
        expect(appConfigViewModel.loadingAnimation, true);
        expect(
          appConfigViewModel.statisticsVisualizationMode,
          StatisticsVisualizationMode.list,
        );
        expect(
          appConfigViewModel.homeVisualizationMode,
          HomeVisualizationMode.lineArea,
        );
        expect(appConfigViewModel.sendCrashReports, false);
        expect(listenerCalled, true);
      },
    );
  });
}
