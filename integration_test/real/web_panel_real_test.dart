import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pi_hole_client/ui/home/widgets/home_screen.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../testing/fakes/services/fake_url_launcher.dart';
import '../support/app_harness.dart';
import '../support/real_pihole_env.dart';

/// Real-Pi-hole tests for "Open web panel": the app opens the right URL for
/// each subroute / web interface path, and that URL serves the web interface.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    if (!dotenv.isInitialized) {
      try {
        await dotenv.load();
      } catch (_) {
        // .env is optional (Sentry/biometrics disabled in tests).
      }
    }
  });

  late FakeUrlLauncher launcher;
  late UrlLauncherPlatform originalLauncher;

  setUp(() {
    originalLauncher = UrlLauncherPlatform.instance;
    launcher = FakeUrlLauncher();
    UrlLauncherPlatform.instance = launcher;
  });

  tearDown(() {
    UrlLauncherPlatform.instance = originalLauncher;
  });

  /// Checks that the app opened [expectedUrl] and that the URL serves the
  /// Pi-hole web interface (redirects to its login page are followed).
  Future<void> expectWebPanelOpens(String expectedUrl) async {
    expect(launcher.launchedUrls, [expectedUrl]);

    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(expectedUrl));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      expect(
        response.statusCode,
        HttpStatus.ok,
        reason: '$expectedUrl must serve the web interface',
      );
      expect(body, contains('Pi-hole'));
    } finally {
      client.close(force: true);
    }
  }

  final cases = [
    (
      name: 'default path',
      base: RealPiholeEnv.v6Base,
      webPath: '',
      expected: '${RealPiholeEnv.v6Base}/admin/',
    ),
    (
      name: 'subroute',
      base: RealPiholeEnv.v6SubrouteBase,
      webPath: '',
      expected: '${RealPiholeEnv.v6SubrouteBase}/admin/',
    ),
    (
      name: 'custom web interface path',
      base: RealPiholeEnv.v6WebhomeBase,
      webPath: '/admin2',
      expected: '${RealPiholeEnv.v6WebhomeBase}/admin2/',
    ),
    (
      name: 'subroute and custom web interface path',
      base: RealPiholeEnv.v6SubrouteWebhomeBase,
      webPath: '/admin2',
      expected: '${RealPiholeEnv.v6SubrouteWebhomeBase}/admin2/',
    ),
  ];

  group('open web panel (v6, HTTP)', () {
    for (final c in cases) {
      testWidgets('${c.name} opens ${c.expected}', (tester) async {
        final app = AppHarness(tester);
        await app.boot();
        final uri = Uri.parse(c.base);

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: uri.hasPort ? '${uri.port}' : '',
          subroute: uri.path,
          webPath: c.webPath,
          password: RealPiholeEnv.v6Password,
          alias: 'web-panel',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        await app.connectServer();
        expect(find.byType(HomeScreen), findsOneWidget);

        await app.openWebPanelFromHomeMenu();

        await expectWebPanelOpens(c.expected);
      });
    }
  });
}
