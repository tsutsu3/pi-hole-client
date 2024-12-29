import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/repository/database.dart';
import './app_config_provider_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DomainsListProvider', () {
    late AppConfigProvider appConfigProvider;
    late MockDatabaseRepository mockDatabaseRepository;

    setUp(() {
      mockDatabaseRepository = MockDatabaseRepository();
      when(mockDatabaseRepository.updateConfigQuery(
        column: anyNamed('column'),
        value: anyNamed('value'),
      )).thenAnswer((_) async => true);
      when(mockDatabaseRepository.restoreAppConfigQuery())
          .thenAnswer((_) async => true);
      appConfigProvider = AppConfigProvider(mockDatabaseRepository);
    });

    test('Initial values are correct', () {
      expect(appConfigProvider.showingSnackbar, false);
      expect(appConfigProvider.selectedTab, 0);
      expect(appConfigProvider.getAutoRefreshTime, 2);
      expect(appConfigProvider.selectedThemeNumber, 0);
      expect(appConfigProvider.overrideSslCheck, false);
      expect(appConfigProvider.oneColumnLegend, false);
      expect(appConfigProvider.reducedDataCharts, false);
      expect(appConfigProvider.logsPerQuery, 2);
      expect(appConfigProvider.passCode, null);
      expect(appConfigProvider.biometricsSupport, false);
      expect(appConfigProvider.useBiometrics, false);
      expect(appConfigProvider.appUnlocked, true);
      expect(appConfigProvider.validVibrator, false);
      expect(appConfigProvider.importantInfoReaden, false);
      expect(appConfigProvider.hideZeroValues, false);
      expect(appConfigProvider.statisticsVisualizationMode, 0);
      expect(appConfigProvider.sendCrashReports, false);
      expect(appConfigProvider.logs, []);
      expect(appConfigProvider.selectedSettingsScreen, null);
    });

    test('setShowingSnackbar updates value and notifies listeners', () {
      appConfigProvider.setShowingSnackbar(true);
      expect(appConfigProvider.showingSnackbar, true);
    });

    test('setSelectedTab updates value and notifies listeners', () {
      appConfigProvider.setSelectedTab(1);
      expect(appConfigProvider.selectedTab, 1);
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
    });

    // test('setAndroidInfo updates value and notifies listeners', () {
    //   final androidDeviceInfo = AndroidDeviceInfo(version: '1.0', model: 'Test');
    //   appConfigProvider.setAndroidInfo(androidDeviceInfo);
    //   expect(appConfigProvider.androidDeviceInfo, androidDeviceInfo);
    // });

    // test('setIosInfo updates value and notifies listeners', () {
    //   final iosDeviceInfo = IosDeviceInfo(
    //     utsname: IosUtsname(
    //       sysname: 'iOS',
    //       nodename: 'Test',
    //       release: '1.0',
    //       version: '1.0',
    //       machine: 'iPhone',
    //     ),
    //   );
    //   appConfigProvider.setIosInfo(iosDeviceInfo);
    //   expect(appConfigProvider.iosDeviceInfo, iosDeviceInfo);
    // });

    test('setBiometricsSupport updates value and notifies listeners', () {
      appConfigProvider.setBiometricsSupport(true);
      expect(appConfigProvider.biometricsSupport, true);
    });

    test('setAppUnlocked updates value and notifies listeners', () {
      appConfigProvider.setAppUnlocked(false);
      expect(appConfigProvider.appUnlocked, false);
    });

    test('setValidVibrator updates value and notifies listeners', () {
      appConfigProvider.setValidVibrator(true);
      expect(appConfigProvider.validVibrator, true);
    });

    // test('addLog adds log and notifies listeners', () {
    //   final log = AppLog(message: 'Test log');
    //   appConfigProvider.addLog(log);
    //   expect(appConfigProvider.logs, [log]);
    // });

    test('setSelectedSettingsScreen updates value and notifies listeners', () {
      appConfigProvider.setSelectedSettingsScreen(screen: 1, notify: true);
      expect(appConfigProvider.selectedSettingsScreen, 1);
    });

    test('setUseBiometrics updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'useBiometricAuth',
        value: 1,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setUseBiometrics(true);
      expect(result, true);
      expect(appConfigProvider.useBiometrics, true);
    });

    test(
      'setImportantInfoReaden updates value and notifies listeners',
      () async {
        when(mockDatabaseRepository.updateConfigQuery(
          column: 'importantInfoReaden',
          value: 1,
        )).thenAnswer((_) async => true);
        final result = await appConfigProvider.setImportantInfoReaden(true);
        expect(result, true);
        expect(appConfigProvider.importantInfoReaden, true);
      },
    );

    test('setPassCode updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'passCode',
        value: '1234',
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setPassCode('1234');
      expect(result, true);
      expect(appConfigProvider.passCode, '1234');
    });

    test('setAutoRefreshTime updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'autoRefreshTime',
        value: 10,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setAutoRefreshTime(10);
      expect(result, true);
      expect(appConfigProvider.getAutoRefreshTime, 10);
    });

    test('setLogsPerQuery updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'logsPerQuery',
        value: 5.0,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setLogsPerQuery(5.0);
      expect(result, true);
      expect(appConfigProvider.logsPerQuery, 5.0);
    });

    test('setSendCrashReports updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'sendCrashReports',
        value: 1,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setSendCrashReports(true);
      expect(result, true);
      expect(appConfigProvider.sendCrashReports, true);
    });

    test('setOverrideSslCheck updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'overrideSslCheck',
        value: 1,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setOverrideSslCheck(true);
      expect(result, true);
      expect(appConfigProvider.overrideSslCheck, true);
    });

    test('setOneColumnLegend updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'oneColumnLegend',
        value: 1,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setOneColumnLegend(true);
      expect(result, true);
      expect(appConfigProvider.oneColumnLegend, true);
    });

    test('setReducedDataCharts updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'reducedDataCharts',
        value: 1,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setReducedDataCharts(true);
      expect(result, true);
      expect(appConfigProvider.reducedDataCharts, true);
    });

    test('setHideZeroValues updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'hideZeroValues',
        value: 1,
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setHideZeroValues(true);
      expect(result, true);
      expect(appConfigProvider.hideZeroValues, true);
    });

    test('setSelectedTheme updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(column: 'theme', value: 1))
          .thenAnswer((_) async => true);
      final result = await appConfigProvider.setSelectedTheme(1);
      expect(result, true);
      expect(appConfigProvider.selectedThemeNumber, 1);
    });

    test('setSelectedLanguage updates value and notifies listeners', () async {
      when(mockDatabaseRepository.updateConfigQuery(
        column: 'language',
        value: 'en',
      )).thenAnswer((_) async => true);
      final result = await appConfigProvider.setSelectedLanguage('en');
      expect(result, true);
      expect(appConfigProvider.selectedLanguage, 'en');
    });

    test(
      'setStatisticsVisualizationMode updates value and notifies listeners',
      () async {
        when(
          mockDatabaseRepository.updateConfigQuery(
            column: 'statisticsVisualizationMode',
            value: 1,
          ),
        ).thenAnswer((_) async => true);
        final result =
            await appConfigProvider.setStatisticsVisualizationMode(1);
        expect(result, true);
        expect(appConfigProvider.statisticsVisualizationMode, 1);
      },
    );

    test(
      'restoreAppConfig restores default values and notifies listeners',
      () async {
        when(mockDatabaseRepository.restoreAppConfigQuery())
            .thenAnswer((_) async => true);
        final result = await appConfigProvider.restoreAppConfig();
        expect(result, true);
        expect(appConfigProvider.getAutoRefreshTime, 5);
        expect(appConfigProvider.selectedThemeNumber, 0);
        expect(
          appConfigProvider.selectedLanguage,
          SchedulerBinding.instance.platformDispatcher.locale.languageCode,
        );
        expect(appConfigProvider.overrideSslCheck, false);
        expect(appConfigProvider.oneColumnLegend, false);
        expect(appConfigProvider.reducedDataCharts, false);
        expect(appConfigProvider.logsPerQuery, 2);
        expect(appConfigProvider.passCode, null);
        expect(appConfigProvider.useBiometrics, false);
        expect(appConfigProvider.importantInfoReaden, false);
        expect(appConfigProvider.hideZeroValues, false);
        expect(appConfigProvider.statisticsVisualizationMode, 0);
        expect(appConfigProvider.sendCrashReports, false);
      },
    );
  });
}
