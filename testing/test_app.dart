import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/ui/core/globals.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/viewmodel/logs_viewmodel.dart';
import 'package:provider/provider.dart';

import 'fakes/repositories/local/fake_app_config_repository.dart';

Future<void> initTestApp() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
}

Widget buildTestApp(
  Widget child, {
  AppConfigViewModel? appConfigViewModel,
  ServersViewModel? serversViewModel,
  StatusViewModel? statusViewModel,
  LogsViewModel? logsViewModel,
  bool useScaffold = true,
  GoRouter? router,
}) {
  final Widget app;
  if (router != null) {
    app = MaterialApp.router(
      routerConfig: router,
      theme: lightTheme(null),
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  } else {
    app = MaterialApp(
      theme: lightTheme(null),
      home: useScaffold ? Scaffold(body: child) : child,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AppConfigViewModel>.value(
        value: appConfigViewModel ??
            AppConfigViewModel(FakeAppConfigRepository()),
      ),
      if (serversViewModel != null)
        ChangeNotifierProvider<ServersViewModel>.value(
          value: serversViewModel,
        ),
      if (statusViewModel != null)
        ChangeNotifierProvider<StatusViewModel>.value(
          value: statusViewModel,
        ),
      if (logsViewModel != null)
        ChangeNotifierProvider<LogsViewModel>.value(
          value: logsViewModel,
        ),
    ],
    child: app,
  );
}
