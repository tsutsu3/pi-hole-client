import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppConfigProvider', () {
    late AppConfigProvider appConfigProvider;
    late FakeAppConfigRepository repository;
    late bool listenerCalled;

    setUp(() {
      repository = FakeAppConfigRepository();
      appConfigProvider = AppConfigProvider(repository);

      listenerCalled = false;
      appConfigProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('Initial values are correct', () {
      expect(appConfigProvider.showingSnackbar, false);
      expect(appConfigProvider.selectedTab, 0);
      expect(appConfigProvider.getAutoRefreshTime, 2);
      expect(appConfigProvider.selectedThemeNumber, 0);
      expect(appConfigProvider.selectedLanguage, 'en');
      expect(appConfigProvider.reducedDataCharts, false);
      expect(appConfigProvider.logsPerQuery, 2);
      expect(appConfigProvider.passCode, null);
      expect(appConfigProvider.biometricsSupport, false);
      expect(appConfigProvider.useBiometrics, false);
      expect(appConfigProvider.appUnlocked, true);
      expect(appConfigProvider.validVibrator, false);
      expect(appConfigProvider.loadingAnimation, true);
      expect(appConfigProvider.importantInfoReaden, false);
      expect(appConfigProvider.hideZeroValues, false);
      expect(appConfigProvider.statisticsVisualizationMode, 0);
      expect(appConfigProvider.homeVisualizationMode, 0);
      expect(appConfigProvider.sendCrashReports, false);
      expect(appConfigProvider.logs, []);
      expect(appConfigProvider.selectedSettingsScreen, null);
      expect(listenerCalled, false);
    });

    test('setShowingSnackbar updates value and notifies listeners', () {
      appConfigProvider.setShowingSnackbar(true);
      expect(appConfigProvider.showingSnackbar, true);
      expect(listenerCalled, true);
    });

    test('setSelectedTab updates value and notifies listeners', () {
      appConfigProvider.setSelectedTab(1);
      expect(appConfigProvider.selectedTab, 1);
      expect(listenerCalled, true);
    });

    test('setAppInfo updates value and notifies listeners', () {
      final packageInfo = PackageInfo(
        appName: 'Test',
        packageName: 'test',
        version: '1.0',
        buildNumber: '1',
      );
      appConfigProvider.setAppInfo(packageInfo);
      expect(appConfigProvider.getAppInfo, packageInfo);
      expect(listenerCalled, true);
    });

    test('setBiometricsSupport updates value and notifies listeners', () {
      appConfigProvider.setBiometricsSupport(true);
      expect(appConfigProvider.biometricsSupport, true);
      expect(listenerCalled, true);
    });

    test('setAppUnlocked updates value and notifies listeners', () {
      appConfigProvider.setAppUnlocked(false);
      expect(appConfigProvider.appUnlocked, false);
      expect(listenerCalled, true);
    });

    test('setValidVibrator updates value and notifies listeners', () {
      appConfigProvider.setValidVibrator(true);
      expect(appConfigProvider.validVibrator, true);
      expect(listenerCalled, true);
    });

    // TODO:
    // test('addLog adds log and notifies listeners', () {
    //   final log = AppLog(message: 'Test log');
    //   appConfigProvider.addLog(log);
    //   expect(appConfigProvider.logs, [log]);
    // });

    test('setSelectedSettingsScreen updates value and notifies listeners', () {
      appConfigProvider.setSelectedSettingsScreen(screen: 1, notify: true);
      expect(appConfigProvider.selectedSettingsScreen, 1);
      expect(listenerCalled, true);
    });

    test('setUseBiometrics updates value and notifies listeners', () async {
      final result = await appConfigProvider.setUseBiometrics(true);
      expect(result, true);
      expect(appConfigProvider.useBiometrics, true);
      expect(listenerCalled, true);
    });

    test(
      'setImportantInfoReaden updates value and notifies listeners',
      () async {
        final result = await appConfigProvider.setImportantInfoReaden(true);
        expect(result, true);
        expect(appConfigProvider.importantInfoReaden, true);
        expect(listenerCalled, true);
      },
    );

    test('setPassCode updates value and notifies listeners', () async {
      final result = await appConfigProvider.setPassCode('1234');
      expect(result, true);
      expect(appConfigProvider.passCode, '1234');
      expect(listenerCalled, true);
    });

    test(
      'setPassCode updates value with biometrics and notifies listeners',
      () async {
        final result = await appConfigProvider.setPassCode('1234');
        expect(result, true);
        expect(appConfigProvider.passCode, '1234');
        expect(listenerCalled, true);
      },
    );

    test('setAutoRefreshTime updates value and notifies listeners', () async {
      final result = await appConfigProvider.setAutoRefreshTime(10);
      expect(result, true);
      expect(appConfigProvider.getAutoRefreshTime, 10);
      expect(listenerCalled, true);
    });

    test('setLogsPerQuery updates value and notifies listeners', () async {
      final result = await appConfigProvider.setLogsPerQuery(5.0);
      expect(result, true);
      expect(appConfigProvider.logsPerQuery, 5.0);
      expect(listenerCalled, true);
    });

    test('setSendCrashReports updates value and notifies listeners', () async {
      final result = await appConfigProvider.setSendCrashReports(true);
      expect(result, true);
      expect(appConfigProvider.sendCrashReports, true);
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
          passCode: '9999',
          useBiometricAuth: 1,
          importantInfoReaden: 1,
          hideZeroValues: 1,
          loadingAnimation: 0,
          statisticsVisualizationMode: 1,
          homeVisualizationMode: 1,
          sendCrashReports: 1,
        );

        appConfigProvider.saveFromDb(appDbData);
        expect(appConfigProvider.getAutoRefreshTime, 5);
        expect(appConfigProvider.selectedThemeNumber, 1);
        expect(appConfigProvider.selectedLanguage, 'ja');
        expect(appConfigProvider.reducedDataCharts, true);
        expect(appConfigProvider.logsPerQuery, 5);
        expect(appConfigProvider.passCode, '9999');
        expect(appConfigProvider.useBiometrics, true);
        expect(appConfigProvider.importantInfoReaden, true);
        expect(appConfigProvider.hideZeroValues, true);
        expect(appConfigProvider.loadingAnimation, false);
        expect(appConfigProvider.statisticsVisualizationMode, 1);
        expect(appConfigProvider.homeVisualizationMode, 1);
        expect(appConfigProvider.sendCrashReports, true);
        expect(listenerCalled, true);
        expect(appDbData.toDict(), {
          'autoRefreshTime': 5,
          'theme': 1,
          'language': 'ja',
          'reducedDataCharts': 1,
          'logsPerQuery': 5,
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
      final result = await appConfigProvider.setReducedDataCharts(true);
      expect(result, true);
      expect(appConfigProvider.reducedDataCharts, true);
      expect(listenerCalled, true);
    });

    test('setHideZeroValues updates value and notifies listeners', () async {
      final result = await appConfigProvider.setHideZeroValues(true);
      expect(result, true);
      expect(appConfigProvider.hideZeroValues, true);
      expect(listenerCalled, true);
    });

    test('setLoadingAnimation updates value and notifies listeners', () async {
      final result = await appConfigProvider.setShowLoadingAnimation(true);
      expect(result, true);
      expect(appConfigProvider.loadingAnimation, true);
      expect(listenerCalled, true);
    });

    test('setSelectedTheme updates value and notifies listeners', () async {
      final result = await appConfigProvider.setSelectedTheme(1);
      expect(result, true);
      expect(appConfigProvider.selectedThemeNumber, 1);
      expect(listenerCalled, true);
    });

    test('setSelectedLanguage updates value and notifies listeners', () async {
      final result = await appConfigProvider.setSelectedLanguage('ja');
      expect(result, true);
      expect(appConfigProvider.selectedLanguage, 'ja');
      expect(appConfigProvider.selectedLanguageNumber, 1);
      expect(listenerCalled, true);
    });

    test(
      'setStatisticsVisualizationMode updates value and notifies listeners',
      () async {
        final result = await appConfigProvider.setStatisticsVisualizationMode(
          1,
        );
        expect(result, true);
        expect(appConfigProvider.statisticsVisualizationMode, 1);
        expect(listenerCalled, true);
      },
    );

    test(
      'setHomeVisualizationMode updates value and notifies listeners',
      () async {
        final result = await appConfigProvider.setHomeVisualizationMode(1);
        expect(result, true);
        expect(appConfigProvider.homeVisualizationMode, 1);
        expect(listenerCalled, true);
      },
    );

    test(
      'restoreAppConfig restores default values and notifies listeners',
      () async {
        final result = await appConfigProvider.restoreAppConfig();
        expect(result, true);
        expect(appConfigProvider.getAutoRefreshTime, 5);
        expect(appConfigProvider.selectedThemeNumber, 0);
        expect(
          appConfigProvider.selectedLanguage,
          SchedulerBinding.instance.platformDispatcher.locale.languageCode,
        );
        expect(appConfigProvider.reducedDataCharts, false);
        expect(appConfigProvider.logsPerQuery, 2);
        expect(appConfigProvider.passCode, null);
        expect(appConfigProvider.useBiometrics, false);
        expect(appConfigProvider.importantInfoReaden, false);
        expect(appConfigProvider.hideZeroValues, false);
        expect(appConfigProvider.loadingAnimation, true);
        expect(appConfigProvider.statisticsVisualizationMode, 0);
        expect(appConfigProvider.homeVisualizationMode, 0);
        expect(appConfigProvider.sendCrashReports, false);
        expect(listenerCalled, true);
      },
    );
  });
}
