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
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/repositories/local/app_config_repository.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/viewmodel/find_domains_in_lists_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
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

  final secureStorageService = SecureStorageService();
  final appConfigRepository = AppConfigRepository(
    dbService,
    secureStorageService,
  );
  final gravityRepository = GravityRepository(dbService);
  final serverRepository = ServerRepository(dbService, secureStorageService);

  final serversProvider = ServersProvider(serverRepository);
  final configProvider = AppConfigProvider(appConfigRepository);
  final statusProvider = StatusProvider();
  final filtersProvider = FiltersProvider(serversProvider: serversProvider);
  final domainsViewModel = DomainsViewModel();
  final adlistsViewModel = AdlistsViewModel();
  final findDomainsInListsViewModel = FindDomainsInListsViewModel();
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

  const widgetChannel = MethodChannel('pihole/widget');

  final appdata = await appConfigRepository.fetchAppConfig();
  final servers = await serverRepository.fetchServers();
  configProvider.saveFromDb(appdata.getOrThrow());
  await serversProvider.saveFromDb(servers.getOrThrow());
  await WidgetChannel.sendServersUpdated(serversProvider.getServersList);

  widgetChannel.setMethodCallHandler((call) async {
    if (call.method != 'openServer') return;
    final args = call.arguments;
    if (args is! Map) return;
    final serverId = args['serverId'];
    if (serverId is! String || serverId.isEmpty) return;

    Server? target;
    for (final server in serversProvider.getServersList) {
      if (server.address == serverId) {
        target = server;
        break;
      }
    }
    if (target == null) return;

    serversProvider.setselectedServer(server: target, toHomeTab: true);
    final result = await serversProvider.selectedApiGateway?.loginQuery();
    serversProvider.updateselectedServerStatus(result?.status == 'enabled');
    statusUpdateService.startAutoRefresh(showLoadingIndicator: false);
  });

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
        // ===================================================
        // Layer 1: Services (stateless, no dependencies)
        // ===================================================
        Provider<DatabaseService>(create: (_) => dbService),
        Provider<SecureStorageService>(create: (_) => secureStorageService),

        // ===================================================
        // Layer 2: Repositories (depend on Services)
        // ===================================================
        Provider<AppConfigRepository>(create: (_) => appConfigRepository),
        Provider<ServerRepository>(create: (_) => serverRepository),
        Provider<GravityRepository>(create: (_) => gravityRepository),

        // ===================================================
        // Layer 3: ViewModels / Providers (depend on Repositories)
        //
        // NOTE: In Phase 3, new ViewModels will NOT be registered
        // here. They will be created in go_router's route builders
        // via context.read<Repository>().
        // Existing providers below are kept until migration.
        // ===================================================
        ChangeNotifierProvider(create: (context) => configProvider),
        ChangeNotifierProvider(create: (context) => serversProvider),
        ChangeNotifierProvider(create: (context) => statusProvider),
        ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
          create: (context) => serversProvider,
          update: (context, appConfig, servers) => servers!..update(appConfig),
        ),
        // ===================================================
        // Layer 3.5: Repository Bundle (depends on selected server)
        //
        // Provides version-specific API repositories (v5/v6)
        // for route-level ViewModel creation via context.read().
        // Recreated only when the selected server changes.
        // ===================================================
        ProxyProvider2<
          ServersProvider,
          SecureStorageService,
          RepositoryBundle?
        >(
          update: (_, servers, storage, previous) {
            final server = servers.selectedServer;
            if (server == null) return null;
            if (previous?.serverAddress == server.address) return previous;
            return RepositoryBundleFactory.create(
              server: server,
              storage: storage,
            );
          },
        ),

        ChangeNotifierProxyProvider<ServersProvider, FiltersProvider>(
          create: (context) => filtersProvider,
          update: (context, serverConfig, servers) =>
              servers!..update(serverConfig),
        ),
        ChangeNotifierProxyProvider<RepositoryBundle?, DomainsViewModel>(
          create: (context) => domainsViewModel,
          update: (context, bundle, previous) =>
              previous!..update(bundle?.domain),
        ),
        ChangeNotifierProxyProvider<RepositoryBundle?, AdlistsViewModel>(
          create: (context) => adlistsViewModel,
          update: (context, bundle, previous) =>
              previous!..update(bundle?.adlist),
        ),
        ChangeNotifierProxyProvider<RepositoryBundle?,
            FindDomainsInListsViewModel>(
          create: (context) => findDomainsInListsViewModel,
          update: (context, bundle, previous) => previous!
            ..update(
              adListRepository: bundle?.adlist,
              domainRepository: bundle?.domain,
            ),
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

        // ===================================================
        // Layer 4: Use Cases / Services (cross-cutting)
        // ===================================================
        Provider<StatusUpdateService>(
          create: (_) => statusUpdateService,
          dispose: (_, service) => service.stopAutoRefresh(),
        ),
      ],
      child: SentryWidget(child: Phoenix(child: const PiHoleClient())),
    ),
  );

  Command.globalExceptionHandler = (error, stackTrace) {
    Sentry.captureException(error.error, stackTrace: stackTrace);
    logger.e('Command error: ${error.error}', stackTrace: stackTrace);
  };

  await initializeSentry();
  startApp();
}
