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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    await windowManager.setMinimumSize(const Size(400, 400));
    setWindowMinSize(const Size(500, 500));
  }

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await dotenv.load();

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
  } catch (e) {
    configProvider.setBiometricsSupport(false);
  }

  try {
    if (Platform.isAndroid || Platform.isIOS) {
      if (await Vibration.hasCustomVibrationsSupport()) {
        configProvider.setValidVibrator(true);
      } else {
        configProvider.setValidVibrator(false);
      }
    }
  } catch (e) {
    configProvider.setValidVibrator(false);
  }

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

Future<PackageInfo> loadAppInfo() async {
  return PackageInfo.fromPlatform();
}
