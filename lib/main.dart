import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/gravity_provider.dart';
import 'package:pi_hole_client/providers/groups_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/providers/subscriptions_list_provider.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:vibration/vibration.dart';
import 'package:window_manager/window_manager.dart';
import 'package:window_size/window_size.dart';

Future<void> initializeFlutter() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

Future<void> initializeDatabase() async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    await windowManager.setMinimumSize(const Size(400, 400));
    setWindowMinSize(const Size(500, 500));
  }

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}

Future<void> initializeBiometrics(
  AppConfigProvider configProvider,
  DatabaseRepository dbRepository,
) async {
  try {
    if (!Platform.isAndroid && !Platform.isIOS) return;

    final auth = LocalAuthentication();
    final isSupported = await auth.isDeviceSupported();
    if (!isSupported) {
      logger.w('Biometrics not supported on this device.');
      configProvider.setBiometricsSupport(false);
      await configProvider.setUseBiometrics(false);
      return;
    }

    final canAuth = await auth.canCheckBiometrics;
    configProvider.setBiometricsSupport(canAuth);

    if (!canAuth) {
      logger.w('Biometrics hardware present but cannot authenticate.');
      await configProvider.setUseBiometrics(false);
      return;
    }

    var available = <BiometricType>[];
    try {
      available = await auth.getAvailableBiometrics();
    } catch (e) {
      logger.w('Error getting available biometrics: $e');
    }

    final noSupported = !available.contains(BiometricType.fingerprint) &&
        !available.contains(BiometricType.strong) &&
        !available.contains(BiometricType.weak);

    if (noSupported && dbRepository.appConfig.useBiometricAuth == 1) {
      logger.w('No usable biometrics available, disabling biometric auth.');
      await configProvider.setUseBiometrics(false);
    }
  } catch (e) {
    logger.w('Error checking biometrics support: $e');
    configProvider.setBiometricsSupport(false);
    await configProvider.setUseBiometrics(false);
  }
}

Future<void> initializeVibration(AppConfigProvider configProvider) async {
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      final supported = await Vibration.hasCustomVibrationsSupport();
      configProvider.setValidVibrator(supported);
    }
  } catch (e) {
    logger.w('Error checking vibration support: $e');
    configProvider.setValidVibrator(false);
  }
}

Future<void> initializeDeviceInfo(AppConfigProvider configProvider) async {
  try {
    final info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await info.androidInfo;
      configProvider.setAndroidInfo(androidInfo);
    } else if (Platform.isIOS) {
      final iosInfo = await info.iosInfo;
      configProvider.setIosInfo(iosInfo);
    }
  } catch (e) {
    logger.w('Error fetching device info: $e');
  }
}

Future<PackageInfo> loadAppInfo() async {
  return PackageInfo.fromPlatform();
}

void main() async {
  // Initialize System
  await initializeFlutter();
  await initializeDatabase();
  await dotenv.load();

  // Initialize repositories and providers
  final ssRepository = SecureStorageRepository();
  final dbRepository = DatabaseRepository(ssRepository);
  await dbRepository.initialize();

  final serversProvider = ServersProvider(dbRepository);
  final configProvider = AppConfigProvider(dbRepository);
  final statusProvider = StatusProvider();
  final filtersProvider = FiltersProvider(serversProvider: serversProvider);
  final domainsListProvider =
      DomainsListProvider(serversProvider: serversProvider);
  final subscriptionsListProvider =
      SubscriptionsListProvider(serversProvider: serversProvider);
  final groupsProvider = GroupsProvider(serversProvider: serversProvider);
  final gravityUpdateProvider = GravityUpdateProvider(
    repository: dbRepository,
    serversProvider: serversProvider,
  );

  final statusUpdateService = StatusUpdateService(
    serversProvider: serversProvider,
    statusProvider: statusProvider,
    appConfigProvider: configProvider,
    filtersProvider: filtersProvider,
  );

  configProvider.saveFromDb(dbRepository.appConfig);
  await serversProvider.saveFromDb(dbRepository.servers);

  // Initialize devices
  await initializeBiometrics(configProvider, dbRepository);
  await initializeVibration(configProvider);
  await initializeDeviceInfo(configProvider);
  configProvider.setAppInfo(await loadAppInfo());

  Future<void> initializeSentry() async {
    if (configProvider.sendCrashReports == false) {
      logger.d('Send Crash Reports: OFF');
      await Sentry.close();
      return;
    }

    if ((kReleaseMode &&
            (dotenv.env['SENTRY_DSN'] != null &&
                dotenv.env['SENTRY_DSN'] != '')) ||
        (dotenv.env['ENABLE_SENTRY'] == 'true' &&
            (dotenv.env['SENTRY_DSN'] != null &&
                dotenv.env['SENTRY_DSN'] != ''))) {
      logger.d('Send Crash Reports: ON');
      await SentryFlutter.init(
        (options) {
          options.dsn = dotenv.env['SENTRY_DSN'];
          options.sendDefaultPii = false;
          options.attachScreenshot =
              dotenv.env['ENABLE_SENTRY_SCREENSHOTS'] == 'true';
          options.beforeSend = (event, hint) {
            if (event.throwable is HttpException) {
              return null;
            }

            if (event.message?.formatted.contains('Unexpected character') ??
                false ||
                    (event.throwable != null &&
                        event.throwable!
                            .toString()
                            .contains('Unexpected character'))) {
              return null; // Exclude this event
            }

            return event;
          };
        },
      );
    }
  }

  void startApp() => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => configProvider),
            ChangeNotifierProvider(create: (context) => serversProvider),
            ChangeNotifierProvider(create: (context) => statusProvider),
            ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
              create: (context) => serversProvider,
              update: (context, appConfig, servers) =>
                  servers!..update(appConfig),
            ),
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
            ChangeNotifierProxyProvider<ServersProvider,
                SubscriptionsListProvider>(
              create: (context) => subscriptionsListProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, GroupsProvider>(
              create: (context) => groupsProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            ChangeNotifierProxyProvider<ServersProvider, GravityUpdateProvider>(
              create: (context) => gravityUpdateProvider,
              update: (context, serverConfig, servers) =>
                  servers!..update(serverConfig),
            ),
            Provider<StatusUpdateService>(
              create: (_) => statusUpdateService,
              dispose: (_, service) => service.stopAutoRefresh(),
            ),
          ],
          child: SentryWidget(
            child: Phoenix(
              child: const PiHoleClient(),
            ),
          ),
        ),
      );

  await initializeSentry();
  startApp();
}
