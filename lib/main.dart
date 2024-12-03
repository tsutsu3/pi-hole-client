// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:vibration/vibration.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_size/window_size.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/base.dart';
import 'package:pi_hole_client/screens/unlock.dart';

import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/classes/http_override.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/functions/status_updater.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';

void main() async {
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

  DatabaseRepository dbRepository = DatabaseRepository();
  await dbRepository.initialize();

  ServersProvider serversProvider = ServersProvider(dbRepository);
  AppConfigProvider configProvider = AppConfigProvider(dbRepository);
  StatusProvider statusProvider = StatusProvider();
  FiltersProvider filtersProvider = FiltersProvider();
  DomainsListProvider domainsListProvider =
      DomainsListProvider(serversProvider: serversProvider);

  if (dbRepository.appConfig.overrideSslCheck == 1) {
    HttpOverrides.global = MyHttpOverrides();
  }

  configProvider.saveFromDb(dbRepository.appConfig);
  await serversProvider.saveFromDb(dbRepository.servers,
      dbRepository.appConfig.passCode != null ? false : true);

  try {
    if (Platform.isAndroid || Platform.isIOS) {
      final auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      configProvider.setBiometricsSupport(canAuthenticateWithBiometrics);

      if (canAuthenticateWithBiometrics &&
          availableBiometrics.contains(BiometricType.fingerprint) == false &&
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

  void startApp() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => serversProvider)),
          ChangeNotifierProvider(create: ((context) => statusProvider)),
          ChangeNotifierProvider(create: ((context) => filtersProvider)),
          ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
            create: (context) => domainsListProvider,
            update: (context, serverConfig, servers) =>
                servers!..update(serverConfig),
          ),
          ChangeNotifierProvider(create: ((context) => configProvider)),
          ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
            create: (context) => serversProvider,
            update: (context, appConfig, servers) =>
                servers!..update(appConfig),
          ),
        ],
        child: Phoenix(child: const PiHoleClient()),
      ));

  if ((kReleaseMode &&
          (dotenv.env['SENTRY_DSN'] != null &&
              dotenv.env['SENTRY_DSN'] != "")) ||
      (dotenv.env['ENABLE_SENTRY'] == "true" &&
          (dotenv.env['SENTRY_DSN'] != null &&
              dotenv.env['SENTRY_DSN'] != ""))) {
    SentryFlutter.init((options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
      options.sendDefaultPii = false;
      options.beforeSend = (event, hint) {
        if (event.throwable is HttpException) {
          return null;
        }

        if (event.message?.formatted.contains("Unexpected character") ??
            false ||
                (event.throwable != null &&
                    event.throwable!
                        .toString()
                        .contains("Unexpected character"))) {
          return null; // Exclude this event
        }

        return event;
      };
    }, appRunner: () => startApp());
  } else {
    startApp();
  }
}

Future<PackageInfo> loadAppInfo() async {
  return await PackageInfo.fromPlatform();
}

class PiHoleClient extends StatefulWidget {
  const PiHoleClient({super.key});

  @override
  State<PiHoleClient> createState() => _PiHoleClientState();
}

class _PiHoleClientState extends State<PiHoleClient> {
  final StatusUpdater statusUpdater = StatusUpdater();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    if (statusProvider.startAutoRefresh == true ||
        statusProvider.getRefreshServerStatus == true) {
      statusUpdater.context = context;
      if (statusProvider.getRefreshServerStatus == true) {
        statusProvider.setRefreshServerStatus(false);
      }
      statusUpdater.statusData();
      statusUpdater.overTimeData();

      statusProvider.setStartAutoRefresh(false);
    }

    return DynamicColorBuilder(
      builder: ((lightDynamic, darkDynamic) {
        return MaterialApp(
            title: 'Droid Hole',
            theme: appConfigProvider.androidDeviceInfo != null &&
                    appConfigProvider.androidDeviceInfo!.version.sdkInt >= 31
                ? lightTheme(lightDynamic)
                : lightThemeOldVersions(),
            darkTheme: appConfigProvider.androidDeviceInfo != null &&
                    appConfigProvider.androidDeviceInfo!.version.sdkInt >= 31
                ? darkTheme(darkDynamic)
                : darkThemeOldVersions(),
            themeMode: appConfigProvider.selectedTheme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            locale: Locale(appConfigProvider.selectedLanguage),
            supportedLocales: const [
              Locale('en', ''),
              Locale('es', ''),
              Locale('de', ''),
              Locale('pl', ''),
              Locale('ja', ''),
            ],
            scaffoldMessengerKey: scaffoldMessengerKey,
            builder: (context, child) {
              return AppLock(
                builder: (_, __) => child!,
                lockScreenBuilder: (context) => const Unlock(),
                enabled: appConfigProvider.passCode != null ? true : false,
                backgroundLockLatency: const Duration(seconds: 0),
              );
            },
            home: const Base());
      }),
    );
  }
}
