import 'dart:async';
import 'dart:io';

import 'package:command_it/command_it.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pi_hole_client/config/dependencies.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/app_config_repository.dart';
import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
import 'package:provider/provider.dart';
import 'package:result_dart/result_dart.dart';
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
  AppConfigViewModel configProvider,
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
        (repository.appConfig.getOrNull()?.useBiometricAuth ?? false)) {
      logger.w('No usable biometrics available, disabling biometric auth.');
      await configProvider.setUseBiometrics(false);
    }
  } catch (e) {
    logger.w('Error checking biometrics support: $e');
    configProvider.setBiometricsSupport(false);
    await configProvider.setUseBiometrics(false);
  }
}

Future<void> initializeVibration(AppConfigViewModel configProvider) async {
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

Future<void> initializeDeviceInfo(AppConfigViewModel configProvider) async {
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

Future<void> initializeSentry(AppConfigViewModel configProvider) async {
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

void setupWidgetChannel({
  required ServersViewModel serversViewModel,
  required SecureStorageService secureStorageService,
  required StatusViewModel statusViewModel,
}) {
  const widgetChannel = MethodChannel('pihole/widget');
  widgetChannel.setMethodCallHandler((call) async {
    if (call.method != 'openServer') return;
    final args = call.arguments;
    if (args is! Map) return;
    final serverId = args['serverId'];
    if (serverId is! String || serverId.isEmpty) return;

    Server? target;
    for (final server in serversViewModel.getServersList) {
      if (server.address == serverId) {
        target = server;
        break;
      }
    }
    if (target == null) return;

    serversViewModel.setselectedServer(server: target, toHomeTab: true);
    final bundle = RepositoryBundleFactory.create(
      server: target,
      storage: secureStorageService,
    );
    final result = await bundle.dns.fetchBlockingStatus();
    serversViewModel.updateselectedServerStatus(
      result.getOrNull()?.status == DnsBlockingStatus.enabled,
    );
    statusViewModel.startAutoRefresh(showLoadingIndicator: false);
  });
}

void main() async {
  // 1. System init
  await initializeFlutter();
  await initializeDesktop();
  await dotenv.load();

  // 2. Services & Repositories
  final dbService = DatabaseService();
  await dbService.open();
  final secureStorageService = SecureStorageService();
  final appConfigRepository = LocalAppConfigRepository(
    dbService,
    secureStorageService,
  );
  final serverRepository = LocalServerRepository(
    dbService,
    secureStorageService,
  );

  // 3. ViewModels
  final gravityRepository = LocalGravityRepository(dbService);
  final serversViewModel = ServersViewModel(serverRepository);
  final configProvider = AppConfigViewModel(appConfigRepository);
  final statusViewModel = StatusViewModel();
  final logsViewModel = LogsViewModel();
  final gravityUpdateViewModel = GravityUpdateViewModel(
    repository: gravityRepository,
  );

  // 4. Load persisted data
  final appdata = await appConfigRepository.fetchAppConfig();
  final servers = await serverRepository.fetchServers();
  switch (appdata) {
    case Success():
      configProvider.saveFromDb(appdata.getOrNull());
    case Failure():
      logger.e('Failed to load app config: ${appdata.exceptionOrNull()}');
      throw appdata.exceptionOrNull();
  }
  switch (servers) {
    case Success():
      await serversViewModel.saveFromDb(servers.getOrNull());
    case Failure():
      logger.e('Failed to load servers: ${servers.exceptionOrNull()}');
      throw servers.exceptionOrNull();
  }
  await WidgetChannel.sendServersUpdated(serversViewModel.getServersList);

  // 5. Platform-specific setup
  setupWidgetChannel(
    serversViewModel: serversViewModel,
    secureStorageService: secureStorageService,
    statusViewModel: statusViewModel,
  );
  await initializeBiometrics(configProvider, appConfigRepository);
  await initializeVibration(configProvider);
  await initializeDeviceInfo(configProvider);
  configProvider.setAppInfo(await loadAppInfo());

  // 6. Error handling & Sentry
  Command.globalExceptionHandler = (error, stackTrace) {
    Sentry.captureException(error.error, stackTrace: stackTrace);
    logger.e('Command error: ${error.error}', stackTrace: stackTrace);
  };
  await initializeSentry(configProvider);

  // 7. Launch
  runApp(
    MultiProvider(
      providers: createProviders(
        dbService: dbService,
        secureStorageService: secureStorageService,
        appConfigRepository: appConfigRepository,
        serverRepository: serverRepository,
        configProvider: configProvider,
        serversViewModel: serversViewModel,
        statusViewModel: statusViewModel,
        logsViewModel: logsViewModel,
        gravityUpdateViewModel: gravityUpdateViewModel,
      ),
      child: SentryWidget(child: Phoenix(child: const PiHoleClient())),
    ),
  );
}
