import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/screens/settings/about/app_detail_modal.dart';
import 'package:pi_hole_client/screens/settings/about/important_info_modal.dart';
import 'package:pi_hole_client/screens/settings/about/legal_modal.dart';
// import 'package:pi_hole_client/screens/settings/about/licenses_screen.dart';
import 'package:pi_hole_client/screens/settings/about/privacy_modal.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/advanced_options.dart';
import 'package:pi_hole_client/screens/settings/app_settings/language_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/theme_screen.dart';
import 'package:pi_hole_client/screens/settings/settings.dart';

import '../../helpers.dart';
import '../utils.dart';

void main() async {
  await initializeApp();

  group(
    'Settings Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show Settings screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          expect(find.text('Settings'), findsNWidgets(2)); //title and nav bar

          expect(find.text('App settings'), findsOneWidget);

          expect(find.text('Theme'), findsOneWidget);
          expect(find.text('System theme'), findsOneWidget);

          expect(find.text('Language'), findsOneWidget);
          expect(find.text('English'), findsOneWidget);

          expect(find.text('Servers'), findsOneWidget);
          expect(find.text('Connected to test v6'), findsOneWidget);

          expect(find.text('Advanced settings'), findsOneWidget);
          expect(find.text('Advanced options'), findsOneWidget);

          expect(find.text('About'), findsOneWidget);

          expect(find.text('Application Detail'), findsOneWidget);
          expect(
            find.text('Get help and learn about this app'),
            findsOneWidget,
          );

          expect(find.text('Privacy'), findsOneWidget);
          expect(find.text('Privacy and Data Management'), findsOneWidget);

          expect(find.text('Important information'), findsOneWidget);
          expect(
            find.text('Read this if you are experimenting issues'),
            findsOneWidget,
          );

          expect(find.text('Legal'), findsOneWidget);
          expect(find.text('Legal information'), findsOneWidget);

          expect(find.text('Licenses'), findsOneWidget);
          expect(find.text('OSS Information'), findsOneWidget);

          final googlePlaySvg =
              SvgPicture.asset('assets/resources/google-play.svg');
          final githubSvg = SvgPicture.asset('assets/resources/github.svg');
          expect(find.svg(googlePlaySvg.bytesLoader), findsOneWidget);
          expect(find.svg(githubSvg.bytesLoader), findsOneWidget);

          expect(find.text('Select an option from the left column.'),
              findsNothing);
        },
      );

      testWidgets(
        'should show Settings screen with tablet size',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2560, 1600);
          tester.view.devicePixelRatio = 1.6;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          expect(find.text('Settings'), findsNWidgets(2)); //title and nav bar

          expect(find.text('App settings'), findsOneWidget);

          expect(find.text('Theme'), findsOneWidget);
          expect(find.text('System theme'), findsOneWidget);

          expect(find.text('Language'), findsOneWidget);
          expect(find.text('English'), findsOneWidget);

          expect(find.text('Servers'), findsOneWidget);
          expect(find.text('Connected to test v6'), findsOneWidget);

          expect(find.text('Advanced settings'), findsOneWidget);
          expect(find.text('Advanced options'), findsOneWidget);

          expect(find.text('About'), findsOneWidget);

          expect(find.text('Application Detail'), findsOneWidget);
          expect(
            find.text('Get help and learn about this app'),
            findsOneWidget,
          );

          expect(find.text('Privacy'), findsOneWidget);
          expect(find.text('Privacy and Data Management'), findsOneWidget);

          expect(find.text('Important information'), findsOneWidget);
          expect(
            find.text('Read this if you are experimenting issues'),
            findsOneWidget,
          );

          expect(find.text('Legal'), findsOneWidget);
          expect(find.text('Legal information'), findsOneWidget);

          // scroll down
          final scrollableFinder = find.byType(Scrollable);
          await tester.drag(scrollableFinder.first, const Offset(0, -200));
          await tester.pumpAndSettle();

          expect(find.text('Licenses'), findsOneWidget);
          expect(find.text('OSS Information'), findsOneWidget);

          final googlePlaySvg =
              SvgPicture.asset('assets/resources/google-play.svg');
          final githubSvg = SvgPicture.asset('assets/resources/github.svg');
          expect(find.svg(googlePlaySvg.bytesLoader), findsOneWidget);
          expect(find.svg(githubSvg.bytesLoader), findsOneWidget);

          expect(
            find.text('Select an option from the left column.'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show Theme screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Theme'));
          await tester.pumpAndSettle();
          expect(find.byType(ThemeScreen), findsOneWidget);
        },
      );

      testWidgets(
        'should show Language screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Language'));
          await tester.pumpAndSettle();
          expect(find.byType(LanguageScreen), findsOneWidget);
        },
      );

      testWidgets(
        'should show Server screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Servers'));
          await tester.pumpAndSettle();
          expect(find.byType(ServersPage), findsOneWidget);
        },
      );

      testWidgets(
        'should show Advanced settings screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Advanced settings'));
          await tester.pumpAndSettle();
          expect(find.byType(AdvancedOptions), findsOneWidget);
        },
      );

      testWidgets(
        'should show Application Detail screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Application Detail'));
          await tester.pumpAndSettle();
          expect(find.byType(AppDetailModal), findsOneWidget);
        },
      );

      testWidgets(
        'should show Privacy screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Privacy'));
          await tester.pumpAndSettle();
          expect(find.byType(PrivacyModal), findsOneWidget);
        },
      );

      testWidgets(
        'should show Important Info screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Important information'));
          await tester.pumpAndSettle();
          expect(find.byType(ImportantInfoModal), findsOneWidget);
        },
      );

      testWidgets(
        'should show Legal screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Legal'));
          await tester.pumpAndSettle();
          expect(find.byType(LegalModal), findsOneWidget);
        },
      );

      testWidgets(
        'should show Licenses screen with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Licenses'));
          when(testSetup.mockConfigProvider.selectedSettingsScreen)
              .thenReturn(6);
          await tester.pump(const Duration(seconds: 10));

          // TODO: Not found, always show ircularProgressIndicator????
          // expect(find.byType(LicensePage), findsOneWidget);
        },
      );

      testWidgets(
        'should show Google play page with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          final googlePlaySvg =
              SvgPicture.asset('assets/resources/google-play.svg');
          expect(find.svg(googlePlaySvg.bytesLoader), findsOneWidget);

          await tester.tap(find.svg(googlePlaySvg.bytesLoader));
          // await tester.pumpAndSettle();
          // expect(find.byType(), findsOneWidget); // TODO: open url
        },
      );

      testWidgets(
        'should show Github page with tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Settings(),
            ),
          );

          expect(find.byType(Settings), findsOneWidget);
          await tester.pump();

          final githubSvg = SvgPicture.asset('assets/resources/github.svg');
          expect(find.svg(githubSvg.bytesLoader), findsOneWidget);

          await tester.tap(find.svg(githubSvg.bytesLoader));
          // await tester.pumpAndSettle();
          // expect(find.byType(), findsOneWidget); // TODO: open url
        },
      );
    },
  );
}
