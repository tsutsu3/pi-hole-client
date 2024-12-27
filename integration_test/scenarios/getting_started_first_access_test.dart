import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/classes/http_override.dart';
import 'package:pi_hole_client/main.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:pi_hole_client/widgets/start_warning_modal.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:vibration/vibration.dart';
import 'package:window_size/window_size.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(500, 500));
  }

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await dotenv.load(fileName: '.env');

  final ssRepository = SecureStorageRepository();
  final dbRepository = DatabaseRepository(ssRepository);
  await dbRepository.initialize(path: 'integration_test.db');

  group('E2E test', () {
    late ServersProvider serversProvider;
    late AppConfigProvider configProvider;
    late StatusProvider statusProvider;
    late FiltersProvider filtersProvider;
    late DomainsListProvider domainsListProvider;

    setUp(() async {
      serversProvider = ServersProvider(dbRepository);
      configProvider = AppConfigProvider(dbRepository);
      statusProvider = StatusProvider();
      filtersProvider = FiltersProvider(serversProvider: serversProvider);
      domainsListProvider =
          DomainsListProvider(serversProvider: serversProvider);

      if (dbRepository.appConfig.overrideSslCheck == 1) {
        HttpOverrides.global = MyHttpOverrides();
      }

      configProvider.saveFromDb(dbRepository.appConfig);
      await serversProvider.saveFromDb(dbRepository.servers);

      try {
        if (Platform.isAndroid || Platform.isIOS) {
          final auth = LocalAuthentication();
          final bool canAuthenticateWithBiometrics =
              await auth.canCheckBiometrics;
          List<BiometricType> availableBiometrics =
              await auth.getAvailableBiometrics();
          configProvider.setBiometricsSupport(canAuthenticateWithBiometrics);

          if (canAuthenticateWithBiometrics &&
              !availableBiometrics.contains(BiometricType.fingerprint) &&
              !availableBiometrics.contains(BiometricType.strong) &&
              !availableBiometrics.contains(BiometricType.weak) &&
              dbRepository.appConfig.useBiometricAuth == 1) {
            await configProvider.setUseBiometrics(false);
          }
        }
      } catch (e) {
        configProvider.setBiometricsSupport(false);
      }

      try {
        if (Platform.isAndroid || Platform.isIOS) {
          if (await Vibration.hasCustomVibrationsSupport() != null) {
            configProvider.setValidVibrator(true);
          } else {
            configProvider.setValidVibrator(false);
          }
        }
      } catch (e) {
        configProvider.setValidVibrator(false);
      }

      PackageInfo appInfo = await loadAppInfo();
      configProvider.setAppInfo(appInfo);

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        configProvider.setAndroidInfo(androidInfo);
      }
      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        configProvider.setIosInfo(iosInfo);
      }
    });

    testWidgets(
      'should show getting started screen when first accessing the app',
      (tester) async {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: serversProvider),
              ChangeNotifierProvider.value(value: statusProvider),
              ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
                create: (context) => filtersProvider,
                update: (context, serverConfig, servers) =>
                    servers!..update(serverConfig),
              ),
              ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
                create: (context) => domainsListProvider,
                update: (context, serverConfig, servers) =>
                    servers!..update(serverConfig),
              ),
              ChangeNotifierProvider.value(value: configProvider),
              ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
                create: (context) => serversProvider,
                update: (context, appConfig, servers) =>
                    servers!..update(appConfig),
              ),
            ],
            child: Phoenix(
              child: const SentryWidget(
                child: PiHoleClient(),
              ),
            ),
          ),
        );

        expect(find.text('Servers'), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.byType(StartInfoModal), findsOneWidget);
        expect(find.text('Getting Started'), findsOneWidget);
      },
    );
  });
}
