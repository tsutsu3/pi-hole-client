import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';

Future<void> initTestApp() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
}

Widget buildTestApp(Widget child, {AppConfigProvider? appConfigProvider}) {
  return ChangeNotifierProvider<AppConfigProvider>.value(
    value: appConfigProvider ?? AppConfigProvider(FakeAppConfigRepository()),
    child: MaterialApp(
      theme: lightTheme(null),
      home: child,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      scaffoldMessengerKey: scaffoldMessengerKey,
    ),
  );
}
