import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';

import '../support/app_harness.dart';
import '../support/real_pihole_env.dart';

/// Real-Pi-hole tests for editing a server: alias-only edits, version
/// switches, address replacement, duplicate-address rejection, default
/// promotion, and session cleanup on a failed delete.
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

  group('edit alias', () {
    testWidgets('(E1) an alias-only edit does not touch the session', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'em1-original',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final address = app.servers.getServersList.single.address;
      final sidBefore = await app.sidOf(address);

      await app.editServer(alias: 'em1-renamed');
      expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

      expect(app.servers.getServersList.single.alias, 'em1-renamed');
      expect(
        await app.sidOf(address),
        equals(sidBefore),
        reason: 'an alias-only edit must not force a re-login',
      );
    });
  });

  group('v6 to v5 version change', () {
    testWidgets('(X3) switching version replaces the server with a v5 one', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final oldUri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: oldUri.host,
        port: oldUri.hasPort ? '${oldUri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'em2-v6',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final oldAddress = app.servers.getServersList.single.address;

      final newUri = Uri.parse(RealPiholeEnv.v5Base);
      await app.editServer(
        version: 'v5',
        host: newUri.host,
        port: newUri.hasPort ? '${newUri.port}' : '',
        token: RealPiholeEnv.v5Token,
      );
      expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

      expect(app.servers.getServersList, hasLength(1));
      final saved = app.servers.getServersList.single;
      expect(await app.tokenOf(saved.address), RealPiholeEnv.v5Token);

      final oldSecrets = await app.serverSecretKeys();
      expect(
        oldSecrets.where((k) => k.startsWith(oldAddress)),
        isEmpty,
        reason: 'a version-change replace must not leave old-address secrets',
      );
    });
  });

  group('address change (replace)', () {
    testWidgets('(X1) changing the address replaces the old v6 entry', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final oldUri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: oldUri.host,
        port: oldUri.hasPort ? '${oldUri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'em4-original',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final oldAddress = app.servers.getServersList.single.address;

      final newUri = Uri.parse(RealPiholeEnv.v6BaseWP);
      await app.editServer(
        host: newUri.host,
        port: newUri.hasPort ? '${newUri.port}' : '',
        password: '',
      );
      expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

      expect(app.servers.getServersList, hasLength(1));
      expect(
        app.servers.getServersList.single.address.contains(newUri.host),
        isTrue,
      );

      final secrets = await app.serverSecretKeys();
      expect(
        secrets.where((k) => k.startsWith(oldAddress)),
        isEmpty,
        reason: 'an address-change replace must not leave old-address secrets',
      );
    });
  });

  group('duplicate URL on edit', () {
    testWidgets(
      "(X5) editing one server's address to match another's is rejected",
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();
        final uriA = Uri.parse(RealPiholeEnv.v6Base);
        final uriB = Uri.parse(RealPiholeEnv.v6BaseWP);

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uriA.host,
          port: uriA.hasPort ? '${uriA.port}' : '',
          password: RealPiholeEnv.v6Password,
          alias: 'em7-dup-a',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uriB.host,
          port: uriB.hasPort ? '${uriB.port}' : '',
          password: '',
          alias: 'em7-dup-b',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        expect(app.servers.getServersList, hasLength(2));

        await app.editServer(
          at: 'em7-dup-b',
          host: uriA.host,
          port: uriA.hasPort ? '${uriA.port}' : '',
        );
        expect(find.text(app.l10n.connectionAlreadyExists), findsOneWidget);

        expect(
          app.servers.getServersList,
          hasLength(2),
          reason: 'a rejected duplicate-address edit must not merge servers',
        );
        final dupB = app.servers.getServersList.firstWhere(
          (s) => s.alias == 'em7-dup-b',
        );
        expect(
          dupB.address.contains(uriB.host),
          isTrue,
          reason: "the rejected edit must leave em7-dup-b's address unchanged",
        );
      },
    );
  });

  group('default promotion', () {
    testWidgets('(E10) setting a new default clears the old one', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final uriA = Uri.parse(RealPiholeEnv.v6Base);
      final uriB = Uri.parse(RealPiholeEnv.v6BaseWP);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uriA.host,
        port: uriA.hasPort ? '${uriA.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'em8-a',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uriB.host,
        port: uriB.hasPort ? '${uriB.port}' : '',
        password: '',
        alias: 'em8-b',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);

      await app.setDefaultServerFor('em8-a');
      await app.settle(frames: 5);
      expect(
        app.servers.getServersList
            .firstWhere((s) => s.alias == 'em8-a')
            .defaultServer,
        isTrue,
      );

      await app.setDefaultServerFor('em8-b');
      await app.settle(frames: 5);
      expect(
        app.servers.getServersList
            .firstWhere((s) => s.alias == 'em8-b')
            .defaultServer,
        isTrue,
      );
      expect(
        app.servers.getServersList
            .firstWhere((s) => s.alias == 'em8-a')
            .defaultServer,
        isFalse,
        reason: 'promoting a new default must clear the previous one',
      );
    });
  });

  group('v5 replace', () {
    testWidgets('(X4) changing a v5 address replaces the old entry', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();
      final oldUri = Uri.parse(RealPiholeEnv.v5Base);

      await app.openAddServer();
      await app.addV5ServerViaUi(
        host: oldUri.host,
        port: oldUri.hasPort ? '${oldUri.port}' : '',
        token: RealPiholeEnv.v5Token,
        alias: 'em17-original',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final oldAddress = app.servers.getServersList.single.address;

      final newUri = Uri.parse(RealPiholeEnv.v5BaseWP);
      await app.editServer(
        host: newUri.host,
        port: newUri.hasPort ? '${newUri.port}' : '',
        token: '',
      );
      expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

      expect(app.servers.getServersList, hasLength(1));
      final secrets = await app.serverSecretKeys();
      expect(
        secrets.where((k) => k.startsWith(oldAddress)),
        isEmpty,
        reason:
            'a v5 address-change replace must not leave old-address secrets',
      );
    });
  });

  group('edit v6 to v5 through fault-delete proxy', () {
    testWidgets(
      '(X3) a faulted old-session logout leaves it to time out (accepted)',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        // Add/connect (auth + blocking status) succeed here; only a later
        // DELETE /api/auth is faulted with 401.
        final oldUri = Uri.parse(RealPiholeEnv.faultDeleteBase);
        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: oldUri.host,
          port: oldUri.hasPort ? '${oldUri.port}' : '',
          password: RealPiholeEnv.v6Password,
          alias: 'edit-old-v6',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        await app.connectServer();

        final oldAddress = app.servers.getServersList.single.address;
        final oldSid = await app.sidOf(oldAddress);
        expect(oldSid, isNotNull);

        // Settings > Servers (the bottom nav has no direct "connect" tab).
        await tester.tap(
          find.widgetWithText(NavigationDestination, app.l10n.settings),
        );
        await app.settle(frames: 10);
        await tester.tap(find.widgetWithText(ListTile, app.l10n.servers));
        await app.settle(frames: 10);

        final newUri = Uri.parse(RealPiholeEnv.v5Base);
        await app.editServer(
          version: 'v5',
          host: newUri.host,
          port: newUri.hasPort ? '${newUri.port}' : '',
          token: RealPiholeEnv.v5Token,
        );
        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

        // Accepted behavior (not ideal): the old server's DELETE /api/auth is
        // faulted (faultDeleteBase), so the logout can't complete. The version
        // switch still succeeds, and the old v6 session is simply left to time
        // out server-side -- the app does not force it. See the "Known
        // limitation" note on deleteCurrentSession in
        // lib/data/repositories/api/v6/auth_repository.dart (a failed delete
        // renews instead of retrying; low impact, left as-is).
        final directClient = PiholeV6ApiClient(url: RealPiholeEnv.v6Base);
        try {
          final result = await directClient.getAuth(oldSid);
          expect(
            result.getOrThrow().session.valid,
            isTrue,
            reason:
                'a faulted logout leaves the old session valid until timeout',
          );
        } finally {
          directClient.close();
        }
      },
    );
  });
}
