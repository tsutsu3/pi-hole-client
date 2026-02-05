import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/routing/app_router.dart';
import 'package:pi_hole_client/ui/common/unlock.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PiHoleClient extends StatefulWidget {
  const PiHoleClient({super.key});

  @override
  State<PiHoleClient> createState() => _PiHoleClientState();
}

class _PiHoleClientState extends State<PiHoleClient> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createAppRouter(
      navigatorKey: globalNavigatorKey,
      observers: [SentryNavigatorObserver()],
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Subscribe only to the necessary parts.
    final selectedTheme = context.select<AppConfigProvider, ThemeMode>(
      (provider) => provider.selectedTheme,
    );
    final selectedLanguage = context.select<AppConfigProvider, String>(
      (provider) => provider.selectedLanguage,
    );
    final passCode = context.select<AppConfigProvider, String?>(
      (provider) => provider.passCode,
    );

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'Pi-hole client',
          theme: lightTheme(lightDynamic),
          darkTheme: darkTheme(darkDynamic),
          themeMode: selectedTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          locale: Locale(selectedLanguage),
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
              builder: (_, _) => child!,
              lockScreenBuilder: (context) => const Unlock(),
              initiallyEnabled: passCode != null,
              initialBackgroundLockLatency: Duration.zero,
            );
          },
        );
      },
    );
  }
}
