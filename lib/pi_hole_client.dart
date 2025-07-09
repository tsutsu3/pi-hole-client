import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pi_hole_client/base.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/screens/unlock.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PiHoleClient extends StatelessWidget {
  const PiHoleClient({super.key});

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
        return MaterialApp(
          navigatorObservers: [
            SentryNavigatorObserver(),
          ],
          navigatorKey: globalNavigatorKey,
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
              builder: (_, __) => child!,
              lockScreenBuilder: (context) => const Unlock(),
              initiallyEnabled: passCode != null,
              initialBackgroundLockLatency: Duration.zero,
            );
          },
          home: const Base(),
        );
      },
    );
  }
}
