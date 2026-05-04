import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/widgets/settings_screen.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Settings Screen Widget Tests', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      serversViewModel = ServersViewModel(serverRepo);
      final servers = await serverRepo.fetchServers();
      await serversViewModel.saveFromDb(servers.getOrThrow());
      statusViewModel = FakeStatusViewModel();
    });

    Widget buildAppWithRouter() {
      final router = GoRouter(
        initialLocation: '/settings',
        routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      );

      return buildTestApp(
        const SizedBox.shrink(),
        appConfigViewModel: appConfigViewModel,
        serversViewModel: serversViewModel,
        statusViewModel: statusViewModel,
        router: router,
      );
    }

    testWidgets('should show Settings screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      expect(find.text('Settings'), findsNWidgets(2)); //title and nav bar

      expect(find.text('App Settings'), findsOneWidget);

      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('System theme'), findsOneWidget);

      expect(find.text('Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);

      expect(find.text('Servers'), findsOneWidget);
      expect(find.text('Connected to v6'), findsOneWidget);

      expect(find.text('Advanced settings'), findsNWidgets(2));
      expect(find.text('Access advanced app settings'), findsOneWidget);

      expect(find.text('Server Settings'), findsOneWidget);
      expect(find.text('Pi-hole Server'), findsOneWidget);
      expect(find.text('v6'), findsOneWidget);

      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('Manage and update Adlists'), findsOneWidget);

      expect(find.text('Groups & Clients'), findsOneWidget);
      expect(find.text('Manage groups and client assignments'), findsOneWidget);

      expect(find.text('Advanced settings'), findsNWidgets(2));
      expect(find.text('Access advanced server settings'), findsOneWidget);

      expect(find.text('About'), findsOneWidget);

      expect(find.text('Application Detail'), findsOneWidget);
      expect(find.text('Get help and learn about this app'), findsOneWidget);

      expect(find.text('Privacy'), findsOneWidget);
      expect(find.text('Privacy and Data Management'), findsOneWidget);

      expect(find.text('Legal'), findsOneWidget);
      expect(find.text('Legal information'), findsOneWidget);

      expect(find.text('Licenses'), findsOneWidget);
      expect(find.text('OSS Information'), findsOneWidget);

      final googlePlaySvg = SvgPicture.asset(
        'assets/resources/google-play.svg',
      );
      final githubSvg = SvgPicture.asset('assets/resources/github.svg');
      expect(find.svg(googlePlaySvg.bytesLoader), findsOneWidget);
      expect(find.svg(githubSvg.bytesLoader), findsOneWidget);

      expect(find.text('Select an option from the left column.'), findsNothing);
    });

    testWidgets('should show Settings screen with tablet size', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);

      expect(find.text('App Settings'), findsOneWidget);

      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('System theme'), findsOneWidget);

      expect(find.text('Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);

      expect(find.text('Servers'), findsOneWidget);
      expect(find.text('Connected to v6'), findsOneWidget);

      expect(find.text('Advanced settings'), findsNWidgets(2));
      expect(find.text('Access advanced app settings'), findsOneWidget);

      expect(find.text('Server Settings'), findsOneWidget);
      expect(find.text('Pi-hole Server'), findsOneWidget);
      expect(find.text('v6'), findsOneWidget);

      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('Manage and update Adlists'), findsOneWidget);

      expect(find.text('Groups & Clients'), findsOneWidget);
      expect(find.text('Manage groups and client assignments'), findsOneWidget);

      expect(find.text('Advanced settings'), findsNWidgets(2));
      expect(find.text('Access advanced server settings'), findsOneWidget);

      final scrollableFinder = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        find.text('About'),
        200,
        scrollable: scrollableFinder.first,
      );
      await tester.pumpAndSettle();

      expect(find.text('About'), findsOneWidget);

      expect(find.text('Application Detail'), findsOneWidget);
      expect(find.text('Get help and learn about this app'), findsOneWidget);

      expect(find.text('Privacy'), findsOneWidget);
      expect(find.text('Privacy and Data Management'), findsOneWidget);

      expect(find.text('Legal'), findsOneWidget);
      expect(find.text('Legal information'), findsOneWidget);

      // scroll down
      await tester.drag(scrollableFinder.first, const Offset(0, -200));
      await tester.pumpAndSettle();

      expect(find.text('Licenses'), findsOneWidget);
      expect(find.text('OSS Information'), findsOneWidget);

      final googlePlaySvg = SvgPicture.asset(
        'assets/resources/google-play.svg',
      );
      final githubSvg = SvgPicture.asset('assets/resources/github.svg');
      expect(find.svg(googlePlaySvg.bytesLoader), findsOneWidget);
      expect(find.svg(githubSvg.bytesLoader), findsOneWidget);
    });

    // Theme navigation now uses go_router (context.pushNamed).
    testWidgets('should show Theme tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('System theme'), findsOneWidget);
    });

    // Language navigation now uses go_router (context.pushNamed).
    testWidgets('should show Language tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
    });

    testWidgets('should show Server tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Servers'), findsOneWidget);
      expect(find.text('Connected to v6'), findsOneWidget);
    });

    // Advanced app settings navigation now uses go_router (context.pushNamed).
    testWidgets('should show Advanced app settings tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Advanced settings'), findsNWidgets(2));
      expect(find.text('Access advanced app settings'), findsOneWidget);
    });

    testWidgets('should show Pi-hole server tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Pi-hole Server'), findsOneWidget);
      expect(find.byIcon(Icons.connected_tv_rounded), findsOneWidget);
    });

    testWidgets('should show adlists tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('Manage and update Adlists'), findsOneWidget);
      expect(find.byIcon(Icons.security_rounded), findsOneWidget);
    });

    testWidgets('should show groups and clients tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      await tester.ensureVisible(find.text('Groups & Clients'));
      await tester.pumpAndSettle();

      expect(find.text('Groups & Clients'), findsOneWidget);
      expect(find.text('Manage groups and client assignments'), findsOneWidget);
      expect(find.byIcon(Icons.group_rounded), findsOneWidget);
    });

    // Advanced server settings navigation now uses go_router (context.pushNamed).
    testWidgets('should show advanced server settings tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Advanced settings'), findsNWidgets(2));
      expect(find.text('Access advanced server settings'), findsOneWidget);
    });

    // Application Detail navigation now uses go_router (context.pushNamed).
    testWidgets('should show Application Detail tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Application Detail'), findsOneWidget);
      expect(find.text('Get help and learn about this app'), findsOneWidget);
    });

    // Privacy navigation now uses go_router (context.pushNamed).
    testWidgets('should show Privacy tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Privacy'), findsOneWidget);
      expect(find.text('Privacy and Data Management'), findsOneWidget);
    });

    // Legal navigation now uses go_router (context.pushNamed).
    testWidgets('should show Legal tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Legal'), findsOneWidget);
      expect(find.text('Legal information'), findsOneWidget);
    });

    // Licenses navigation now uses go_router (context.pushNamed).
    testWidgets('should show Licenses tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      await tester.ensureVisible(find.text('Licenses'));
      await tester.pumpAndSettle();

      expect(find.text('Licenses'), findsOneWidget);
      expect(find.text('OSS Information'), findsOneWidget);
    });

    testWidgets('should show Google play page with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      final log = <MethodCall>[];
      const urlLauncherChannel = MethodChannel(
        'plugins.flutter.io/url_launcher',
      );

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(urlLauncherChannel, (
            MethodCall methodCall,
          ) async {
            log.add(methodCall);
            return true;
          });

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(urlLauncherChannel, null);
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      final googlePlaySvg = SvgPicture.asset(
        'assets/resources/google-play.svg',
      );
      expect(find.svg(googlePlaySvg.bytesLoader), findsOneWidget);

      await tester.ensureVisible(find.svg(googlePlaySvg.bytesLoader));
      await tester.pumpAndSettle();

      await tester.tap(find.svg(googlePlaySvg.bytesLoader));
      await tester.pumpAndSettle();

      final launchCall = log.last;
      final url = (launchCall.arguments as Map)['url'];
      expect(url, contains('play.google.com'));
    });

    testWidgets('should show Github page with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      final log = <MethodCall>[];
      const urlLauncherChannel = MethodChannel(
        'plugins.flutter.io/url_launcher',
      );

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(urlLauncherChannel, (
            MethodCall methodCall,
          ) async {
            log.add(methodCall);
            return true;
          });

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(urlLauncherChannel, null);
      });

      await tester.pumpWidget(buildAppWithRouter());

      expect(find.byType(SettingsScreen), findsOneWidget);
      await tester.pump();

      final githubSvg = SvgPicture.asset('assets/resources/github.svg');
      expect(find.svg(githubSvg.bytesLoader), findsOneWidget);

      await tester.ensureVisible(find.svg(githubSvg.bytesLoader));
      await tester.pumpAndSettle();

      await tester.tap(find.svg(githubSvg.bytesLoader));
      await tester.pumpAndSettle();

      final launchCall = log.last;
      final url = (launchCall.arguments as Map)['url'];
      expect(url, contains('github.com'));
    });
  });
}
