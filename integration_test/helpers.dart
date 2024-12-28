import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pi_hole_client/classes/http_override.dart';
import 'package:pi_hole_client/main.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:vibration/vibration.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/widgets.dart';

/// Initialize the app with the given environment file.
///
/// This function should be called before any other setup.
/// Call this function in the `main` function of the test file.
///
/// Parameters:
/// - `envFileName`: The name of the environment file.
///
/// Example:
/// ```dart
/// void main() async {
///   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
///   await initializeApp('.env');
///   // ...
/// ```
Future<void> initializeApp(
  String envFileName,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(500, 500));
  }

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await dotenv.load(fileName: envFileName);
}

/// Helper class to setup the providers for the test.
///
/// This class should be used in the `setUp` method of the test.
/// It initializes the providers and sets up the biometric and vibration support.
/// The providers are then used to build the test widget.
///
///  Parameters:
/// - `dbRepository`: The database repository.
/// - `ssRepository`: The secure storage repository.
///
/// Example:
/// ```dart
/// setUp(() async {
///   ssRepository = SecureStorageRepository();
///   dbRepository = DatabaseRepository(ssRepository);
///   await dbRepository.initialize(path: 'integration_test.db');
///
///   setupHelper = TestSetupHelper(dbRepository, ssRepository);
///   await setupHelper.initializeProviders();
/// });
///
/// tearDown(() async {
///    await setupHelper.tearDown('integration_test.db');
/// });
class TestSetupHelper {
  final DatabaseRepository dbRepository;
  final SecureStorageRepository ssRepository;

  late ServersProvider serversProvider;
  late AppConfigProvider configProvider;
  late StatusProvider statusProvider;
  late FiltersProvider filtersProvider;
  late DomainsListProvider domainsListProvider;

  TestSetupHelper(this.dbRepository, this.ssRepository);

  Future<void> initializeProviders() async {
    serversProvider = ServersProvider(dbRepository);
    configProvider = AppConfigProvider(dbRepository);
    statusProvider = StatusProvider();
    filtersProvider = FiltersProvider(serversProvider: serversProvider);
    domainsListProvider = DomainsListProvider(serversProvider: serversProvider);

    if (dbRepository.appConfig.overrideSslCheck == 1) {
      HttpOverrides.global = MyHttpOverrides();
    }

    configProvider.saveFromDb(dbRepository.appConfig);
    await serversProvider.saveFromDb(dbRepository.servers);

    await _setupBiometricAndVibration();
    await _setupDeviceAndAppInfo();
  }

  Future<void> tearDown(String dbPath) async {
    await databaseFactory.deleteDatabase(dbPath);
    ssRepository.clearAll();
  }

  Future<void> _setupBiometricAndVibration() async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final auth = LocalAuthentication();
        final canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
        final availableBiometrics = await auth.getAvailableBiometrics();
        configProvider.setBiometricsSupport(canAuthenticateWithBiometrics);

        if (canAuthenticateWithBiometrics &&
            !availableBiometrics.contains(BiometricType.fingerprint) &&
            !availableBiometrics.contains(BiometricType.strong) &&
            !availableBiometrics.contains(BiometricType.weak) &&
            dbRepository.appConfig.useBiometricAuth == 1) {
          await configProvider.setUseBiometrics(false);
        }
      }
    } catch (_) {
      configProvider.setBiometricsSupport(false);
    }

    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final hasVibration = await Vibration.hasCustomVibrationsSupport();
        configProvider.setValidVibrator(hasVibration ?? false);
      }
    } catch (_) {
      configProvider.setValidVibrator(false);
    }
  }

  Future<void> _setupDeviceAndAppInfo() async {
    final appInfo = await loadAppInfo();
    configProvider.setAppInfo(appInfo);

    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      configProvider.setAndroidInfo(androidInfo);
    }
    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      configProvider.setIosInfo(iosInfo);
    }
  }
}

/// Build the test widget with the given setup helper.
///
/// This function should be called in the test method.
/// It builds the widget with the providers initialized in the setup helper.
///
/// Parameters:
/// - `setupHelper`: The test setup helper.
///
/// Returns:
/// - The test widget.
///
/// Example:
/// ```dart
/// testWidgets(
///   'sample',
///   (tester) async {
///   await tester.pumpWidget(buildTestWidget(setupHelper));
///   // ...
/// );
/// ```
Widget buildTestWidget(TestSetupHelper setupHelper) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: setupHelper.serversProvider),
      ChangeNotifierProvider.value(value: setupHelper.statusProvider),
      ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
        create: (_) => setupHelper.filtersProvider,
        update: (_, serverConfig, servers) => servers!..update(serverConfig),
      ),
      ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
        create: (_) => setupHelper.domainsListProvider,
        update: (_, serverConfig, servers) => servers!..update(serverConfig),
      ),
      ChangeNotifierProvider.value(value: setupHelper.configProvider),
      ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
        create: (_) => setupHelper.serversProvider,
        update: (_, appConfig, servers) => servers!..update(appConfig),
      ),
    ],
    child: Phoenix(
      child: const SentryWidget(
        child: PiHoleClient(),
      ),
    ),
  );
}
