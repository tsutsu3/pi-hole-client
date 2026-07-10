import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/servers_screen.dart';

import '../support/app_harness.dart';
import '../support/real_pihole_env.dart';

/// Real-Pi-hole tests for adding/connecting a server: happy paths, abnormal
/// inputs, password-less auth, and cleanup on a failed post-auth check.
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

  group('add (v6, HTTP)', () {
    testWidgets('boots to the servers screen when no server is configured', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(app.servers.getServersList, isEmpty);
    });

    testWidgets('(C1) add + connect a real v6 server saves it to the list', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final uri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      expect(find.byType(AddServerFullscreen), findsOneWidget);

      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'e2e-v6',
      );

      expect(
        find.text(app.l10n.connectedSuccessfully),
        findsOneWidget,
        reason: 'a successful login shows the success snackbar',
      );
      expect(
        app.servers.getServersList,
        isNotEmpty,
        reason: 'a successful real login should save the server',
      );
      expect(
        app.servers.getServersList.any((s) => s.address.contains(uri.host)),
        isTrue,
      );
      final saved = app.servers.getServersList.first;
      expect(await app.passwordOf(saved.address), RealPiholeEnv.v6Password);
      final sid = await app.sidOf(saved.address);
      expect(
        sid != null,
        isTrue,
        reason: 'a successful real login should persist a session ID',
      );
    });

    testWidgets('(C11) wrong password does not save the server', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: 'definitely-wrong-password',
        alias: 'bad-pw',
      );

      expect(
        find.text(app.l10n.loginPasswordIncorrect),
        findsOneWidget,
        reason: 'a 401 on a v6 login shows the wrong-password snackbar',
      );
      expect(app.servers.getServersList, isEmpty);
      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });

    testWidgets('(C12) unreachable host does not save the server', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: '10.0.2.2',
        port: '19999',
        password: RealPiholeEnv.v6Password,
        alias: 'unreachable',
      );

      expect(
        find.text(app.l10n.checkAddress),
        findsOneWidget,
        reason: 'an unreachable host shows the check-address snackbar',
      );
      expect(app.servers.getServersList, isEmpty);
      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });

    testWidgets('(C10) duplicate URL is rejected (no second server)', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6Base);
      final port = uri.hasPort ? '${uri.port}' : '';

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: port,
        password: RealPiholeEnv.v6Password,
        alias: 'first',
      );
      expect(
        find.text(app.l10n.connectedSuccessfully),
        findsOneWidget,
        reason: 'the first add succeeds',
      );
      expect(app.servers.getServersList, hasLength(1));

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: port,
        password: RealPiholeEnv.v6Password,
        alias: 'dup',
      );
      expect(
        find.text(app.l10n.connectionAlreadyExists),
        findsOneWidget,
        reason: 'a duplicate address shows the already-exists snackbar',
      );
      expect(
        app.servers.getServersList,
        hasLength(1),
        reason: 'a duplicate address must not create a second server',
      );
    });

    testWidgets(
      '(C13) a failed connection check after successful auth does not leave a sid behind',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        // /api/auth passes through to the real Pi-hole (login succeeds), but
        // the blocking-status probe that follows is faulted with 503.
        final uri = Uri.parse(RealPiholeEnv.faultBase);

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: uri.hasPort ? '${uri.port}' : '',
          password: RealPiholeEnv.v6Password,
          alias: 'fault-add',
        );

        expect(
          app.servers.getServersList,
          isEmpty,
          reason:
              'the connection check failed, so the server must not be saved',
        );
        expect(find.byType(AddServerFullscreen), findsOneWidget);

        final secretKeys = await app.serverSecretKeys();
        expect(
          secretKeys.where((k) => k.endsWith('_sid')),
          isEmpty,
          reason: 'a failed add must clean up the sid saved during login',
        );
      },
    );
  });

  group('add (v6, HTTPS strict)', () {
    testWidgets('(C19) an untrusted certificate is blocked with no dialog when '
        '"allow untrusted certificate" is off', (tester) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6HttpsBase);

      await app.openAddServer();
      await app.addV6ServerHttpsViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'https-strict-blocked',
        allowUntrustedCert: false,
      );

      expect(
        find.text(app.l10n.sslErrorLong),
        findsOneWidget,
        reason:
            'strict mode must block an untrusted/self-signed certificate '
            'with an SSL error, not a certificate dialog',
      );
      expect(app.servers.getServersList, isEmpty);
      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });
  });

  group('add (v5, HTTP)', () {
    testWidgets('(C3) add + connect a real v5 server saves it to the list', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final uri = Uri.parse(RealPiholeEnv.v5Base);

      await app.openAddServer();
      expect(find.byType(AddServerFullscreen), findsOneWidget);

      await app.addV5ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        token: RealPiholeEnv.v5Token,
        alias: 'e2e-v5',
      );

      expect(
        find.text(app.l10n.connectedSuccessfully),
        findsOneWidget,
        reason: 'a successful login shows the success snackbar',
      );
      expect(
        app.servers.getServersList,
        isNotEmpty,
        reason: 'a successful real login should save the server',
      );
      expect(
        app.servers.getServersList.any((s) => s.address.contains(uri.host)),
        isTrue,
      );

      final saved = app.servers.getServersList.first;
      expect(await app.tokenOf(saved.address), RealPiholeEnv.v5Token);
    });
  });

  group('add (v6, no password)', () {
    testWidgets('(C2) password-less v6 connects and stores no sid', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6BaseWP);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: '',
        alias: 'noauth-v6',
      );

      expect(
        find.text(app.l10n.connectedSuccessfully),
        findsOneWidget,
        reason: 'a password-less v6 login still shows the success snackbar',
      );
      expect(app.servers.getServersList, isNotEmpty);
      final saved = app.servers.getServersList.first;
      expect(await app.passwordOf(saved.address), '');
      final sid = await app.sidOf(saved.address);
      expect(
        sid == null || sid.isEmpty,
        isTrue,
        reason: 'a password-less v6 server should not persist a sid',
      );
    });
  });

  group('add (v5, no token)', () {
    testWidgets('(C4) password-less v5 connects and stores no token', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v5BaseWP);

      await app.openAddServer();
      await app.addV5ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        token: '',
        alias: 'noauth-v5',
      );

      expect(
        find.text(app.l10n.connectedSuccessfully),
        findsOneWidget,
        reason: 'a token-less v5 login still shows the success snackbar',
      );
      expect(app.servers.getServersList, isNotEmpty);
      final saved = app.servers.getServersList.first;
      expect(await app.tokenOf(saved.address), '');
    });
  });
}
