import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/advanced_options.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/config/globals.dart';
import './advanced_options_test.mocks.dart';

@GenerateMocks(
  [AppConfigProvider, ServersProvider],
)
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  group('Advanced Options Screen tests', () {
    late MockAppConfigProvider mockConfigProvider;
    late MockServersProvider mockServersProvider;

    setUp(() async {
      mockConfigProvider = MockAppConfigProvider();
      mockServersProvider = MockServersProvider();

      bool showingSnackbar = false;
      when(mockConfigProvider.showingSnackbar).thenReturn(showingSnackbar);
      when(mockConfigProvider.setOverrideSslCheck(any))
          .thenAnswer((_) async => true);
      when(mockConfigProvider.setOneColumnLegend(any))
          .thenAnswer((_) async => true);
      when(mockConfigProvider.setReducedDataCharts(any))
          .thenAnswer((_) async => true);
      when(mockConfigProvider.setHideZeroValues(any))
          .thenAnswer((_) async => true);
      when(mockConfigProvider.restoreAppConfig()).thenAnswer((_) async => true);
      when(mockConfigProvider.passCode).thenReturn(null);
      when(mockConfigProvider.useBiometrics).thenReturn(false);
      when(mockConfigProvider.overrideSslCheck).thenReturn(false);
      when(mockConfigProvider.oneColumnLegend).thenReturn(false);
      when(mockConfigProvider.reducedDataCharts).thenReturn(false);
      when(mockConfigProvider.hideZeroValues).thenReturn(false);

      when(mockServersProvider.deleteDbData()).thenAnswer((_) async => true);
    });

    testWidgets(
      'should close reset modal and show start info modal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1000, 800);
        tester.view.devicePixelRatio = 1.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<ServersProvider>(
                create: (context) => mockServersProvider,
              ),
              ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => mockConfigProvider,
              ),
              ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
                create: (context) => mockServersProvider,
                update: (context, appConfig, servers) =>
                    servers!..update(appConfig),
              ),
            ],
            child: Phoenix(
              child: MaterialApp(
                home: const Scaffold(
                  body: AdvancedOptions(),
                ),
                locale: const Locale('en'),
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ja', ''),
                ],
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                scaffoldMessengerKey: scaffoldMessengerKey,
              ),
            ),
          ),
        );

        expect(find.byType(AdvancedOptions), findsOneWidget);

        // Tap Reset application
        await tester.tap(find.text('Reset application'));
        await tester.pumpAndSettle();

        // Tap Elase all button
        expect(find.text('Erase app data'), findsOneWidget);
        await tester.pumpAndSettle(const Duration(seconds: 6));
        await tester.tap(find.text('ERASE ALL'));
        await tester.pumpAndSettle();

        // AUto close dialog
        expect(find.text('Erase app data'), findsNothing);

        // Show StartInfoModal
        expect(find.text('Getting Started'), findsOneWidget);
      },
    );
  });
}
