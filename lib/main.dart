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
import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/domains_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/subscriptions_list_provider.dart';
import 'package:pi_hole_client/utils/logger.dart';
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

Future<void> initializeDesktop() async {
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
  AppConfigRepository repository,
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

    final noSupported =
        !available.contains(BiometricType.fingerprint) &&
        !available.contains(BiometricType.strong) &&
        !available.contains(BiometricType.weak);

    if (noSupported &&
        repository.appConfig.getOrThrow().useBiometricAuth == 1) {
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
  await initializeDesktop();
  await dotenv.load();

  // Initialize repositories and providers
  final dbService = DatabaseService();
  await dbService.open();

  final secureStorageSercie = SecureStorageService();
  final appConfigRepository = AppConfigRepository(
    dbService,
    secureStorageSercie,
  );
  final gravityRepository = GravityRepository(dbService);
  final serverRepository = ServerRepository(dbService, secureStorageSercie);

  final serversProvider = ServersProvider(serverRepository);
  final configProvider = AppConfigProvider(appConfigRepository);
  final statusProvider = StatusProvider();
  final filtersProvider = FiltersProvider(serversProvider: serversProvider);
  final domainsListProvider = DomainsListProvider(
    serversProvider: serversProvider,
  );
  final subscriptionsListProvider = SubscriptionsListProvider(
    serversProvider: serversProvider,
  );
  final clientsListProvider = ClientsListProvider(
    serversProvider: serversProvider,
  );
  final groupsProvider = GroupsProvider(serversProvider: serversProvider);
  final gravityUpdateProvider = GravityUpdateProvider(
    repository: gravityRepository,
    serversProvider: serversProvider,
  );
  final localDnsProvider = LocalDnsProvider(serversProvider: serversProvider);

  final statusUpdateService = StatusUpdateService(
    serversProvider: serversProvider,
    statusProvider: statusProvider,
    appConfigProvider: configProvider,
    filtersProvider: filtersProvider,
  );

  final appdata = await appConfigRepository.fetchAppConfig();
  final servers = await serverRepository.fetchServers();
  configProvider.saveFromDb(appdata.getOrThrow());
  await serversProvider.saveFromDb(servers.getOrThrow());

  // Initialize devices
  await initializeBiometrics(configProvider, appConfigRepository);
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
      await SentryFlutter.init((options) {
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
                      event.throwable!.toString().contains(
                        'Unexpected character',
                      ))) {
            return null; // Exclude this event
          }

          return event;
        };
      });
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
          update: (context, appConfig, servers) => servers!..update(appConfig),
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
        ChangeNotifierProxyProvider<ServersProvider, SubscriptionsListProvider>(
          create: (context) => subscriptionsListProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        ChangeNotifierProxyProvider<ServersProvider, ClientsListProvider>(
          create: (context) => clientsListProvider,
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
        ChangeNotifierProxyProvider<ServersProvider, LocalDnsProvider>(
          create: (context) => localDnsProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        Provider<StatusUpdateService>(
          create: (_) => statusUpdateService,
          dispose: (_, service) => service.stopAutoRefresh(),
        ),
      ],
      child: SentryWidget(child: Phoenix(child: const PiHoleClient())),
    ),
  );

  await initializeSentry();
  startApp();
}
