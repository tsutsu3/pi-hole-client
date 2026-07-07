import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/main.dart' as app;
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_screen.dart';
import 'package:pi_hole_client/ui/home/widgets/home_screen.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_screen.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/servers_screen.dart';
import 'package:pi_hole_client/ui/servers/widgets/servers_tile_item.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_client_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_details_screen.dart';
import 'package:pi_hole_client/ui/settings/widgets/settings_screen.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_screen.dart';
import 'package:provider/provider.dart';

/// Drives the **real** app (real DI, real DB, real secure storage) in an
/// integration test, pointed at a real Pi-hole (or Caddy proxy) via the server
/// URL entered in the UI.
class AppHarness {
  AppHarness(this.tester);

  final WidgetTester tester;

  late final DatabaseService db;
  late final SecureStorageService storage;

  BuildContext get _ctx => tester.element(find.byType(PiHoleClient));

  BuildContext get _localizedCtx {
    final candidates = [
      find.byType(ServersScreen),
      find.byType(AddServerFullscreen),
      find.byType(HomeScreen),
      find.byType(StatisticsScreen),
      find.byType(LogsScreen),
      find.byType(DomainsScreen),
      find.byType(DomainDetailsScreen),
      find.byType(SettingsScreen),
      find.byType(AdlistScreen),
      find.byType(AdlistDetailsScreen),
      find.byType(GroupClientScreen),
      find.byType(GroupDetailsScreen),
      find.byType(PiHoleClient),
    ];

    for (final finder in candidates) {
      final elements = finder.evaluate();
      if (elements.isNotEmpty) {
        return elements.first;
      }
    }

    throw TestFailure('No localized screen is currently visible.');
  }

  /// Live view models from the running provider tree.
  ServersViewModel get servers =>
      Provider.of<ServersViewModel>(_ctx, listen: false);
  StatusViewModel get status =>
      Provider.of<StatusViewModel>(_ctx, listen: false);

  AppLocalizations get l10n {
    final l10n = AppLocalizations.of(_localizedCtx);
    if (l10n == null) {
      throw TestFailure(
        'AppLocalizations was not found in the current widget tree.',
      );
    }
    return l10n;
  }

  /// Boots the real app with an isolated, empty DB + secure storage.
  ///
  /// [autoRefreshTimeSeconds], when given, seeds a short auto-refresh
  /// interval (instead of the persisted default of 5s) so a test can wait
  /// for a real background `Timer.periodic` tick in a few seconds rather
  /// than waiting on the default interval.
  Future<void> boot({
    String dbPath = 'integration_test.db',
    int? autoRefreshTimeSeconds,
  }) async {
    db = DatabaseService(path: dbPath);
    storage = SecureStorageService();

    await db.open();
    // skip the welcome screen
    await db.update('appConfig', {'importantInfoReaden': 1});
    if (autoRefreshTimeSeconds != null) {
      await db.update('appConfig', {'autoRefreshTime': autoRefreshTimeSeconds});
    }

    // Clean slate: clears servers + secure storage.
    final repo = LocalServerRepository(db, storage);
    await repo.deleteAllServers();
    await storage.clearAll();

    final root = await app.bootstrapApp(
      enableSentry: false,
      enableBiometrics: false,
      databaseService: db,
      secureStorageService: storage,
    );
    await tester.pumpWidget(root);
    await settle();

    addTearDown(logoutRealSessions);
  }

  /// Deletes every v6 session created during this test from the real Pi-hole
  Future<void> logoutRealSessions() async {
    // Stop the app's auto-refresh first so it can't re-create a session
    try {
      status.stopAutoRefresh();
    } catch (_) {}

    final servers = (await LocalServerRepository(
      db,
      storage,
    ).fetchServers()).getOrNull();
    if (servers == null) return;

    for (final server in servers) {
      if (server.apiVersion != SupportedApiVersions.v6) continue;
      final sid = await sidOf(server.address);
      if (sid == null || sid.isEmpty) continue;
      try {
        final bundle = RepositoryBundleFactory.create(
          server: server,
          storage: storage,
        );
        await bundle.auth.deleteCurrentSession();
      } catch (_) {}
    }
  }

  /// Bounded replacement for `pumpAndSettle`, which would hang on the
  /// periodic auto-refresh timers.
  Future<void> settle({
    int frames = 40,
    Duration step = const Duration(milliseconds: 150),
  }) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(step);
    }
  }

  /// Pumps up to [maxFrames], returning true as soon as [finder] matches, or
  /// false if it never appears -- catches a transient snackbar before it
  /// auto-dismisses.
  Future<bool> waitFor(
    Finder finder, {
    int maxFrames = 60,
    Duration step = const Duration(milliseconds: 150),
  }) async {
    for (var i = 0; i < maxFrames; i++) {
      await tester.pump(step);
      if (finder.evaluate().isNotEmpty) return true;
    }
    return false;
  }

  Future<bool> waitForText(String text, {int maxFrames = 60}) =>
      waitFor(find.text(text), maxFrames: maxFrames);

  Future<String?> secret(String key) async =>
      (await storage.getValue(key)).getOrNull();

  Future<String?> sidOf(String address) => secret('${address}_sid');
  Future<String?> passwordOf(String address) => secret('${address}_password');
  Future<String?> tokenOf(String address) => secret('${address}_token');

  Future<List<String>> serverSecretKeys() async {
    final all = (await storage.readAll()).getOrNull() ?? const {};
    return all.keys
        .where(
          (k) =>
              k.endsWith('_sid') ||
              k.endsWith('_password') ||
              k.endsWith('_token'),
        )
        .toList();
  }

  /// Opens the add-server screen from the servers list FAB.
  Future<void> openAddServer() async {
    await tester.tap(find.byIcon(Icons.add));
    await settle();
  }

  bool hasServer(String address) =>
      servers.getServersList.any((s) => s.address == address);

  /// Taps Connect on the unselected server tile and waits for it to finish.
  Future<void> connectServer() async {
    await tester.tap(find.widgetWithText(FilledButton, l10n.connect));
    await waitFor(find.byType(HomeScreen));
    await settle(frames: 4);
  }

  // ==========================================================================
  // UI helpers for the add-server form
  // ==========================================================================

  /// Fills and submits the add-server form for a v6 server over HTTP.
  /// Assumes the default form state (HTTP + v6).
  Future<void> addV6ServerViaUi({
    required String host,
    required String password,
    String alias = 'it-v6',
    String port = '',
  }) async {
    final fields = find.byType(EditableText);
    await tester.enterText(fields.at(0), alias);
    await tester.enterText(fields.at(1), host);
    if (port.isNotEmpty) await tester.enterText(fields.at(2), port);
    await tester.enterText(fields.at(3), password);
    await settle(frames: 3);

    await tester.tap(find.byIcon(Icons.login_rounded));
    // catch the outcome snackbar before it auto-dismisses
    await waitFor(find.byType(SnackBar));
    await settle(frames: 4);
  }

  /// Fills and submits the add-server form for a v5 server over HTTP.
  /// Assumes the default form state (HTTP + v5).
  Future<void> addV5ServerViaUi({
    required String host,
    required String token,
    String alias = 'it-v5',
    String port = '',
  }) async {
    final fields = find.byType(EditableText);
    await tester.enterText(fields.at(0), alias);
    await tester.enterText(fields.at(1), host);
    if (port.isNotEmpty) await tester.enterText(fields.at(2), port);
    await tester.tap(find.text('v5').last); // switch to v5
    await tester.enterText(fields.at(3), token);
    await settle(frames: 3);

    await tester.tap(find.byIcon(Icons.login_rounded));
    // catch the outcome snackbar before it auto-dismisses
    await waitFor(find.byType(SnackBar));
    await settle(frames: 4);
  }

  /// Fills and submits the add-server form for a v6 server over HTTPS.
  Future<void> addV6ServerHttpsViaUi({
    required String host,
    required String password,
    String alias = 'it-v6-https',
    String port = '',
    bool allowUntrustedCert = true,
  }) async {
    await tester.tap(find.text('HTTPS'));
    await settle(frames: 3);

    final fields = find.byType(EditableText);
    await tester.enterText(fields.at(0), alias);
    await tester.enterText(fields.at(1), host);
    if (port.isNotEmpty) await tester.enterText(fields.at(2), port);
    if (!allowUntrustedCert) {
      // The "allow untrusted certificate" checkbox is checked by default.
      await tester.tap(find.byType(CheckboxListTile).first);
      await settle(frames: 2);
    }
    await tester.enterText(fields.at(4), password);
    await settle(frames: 3);

    await tester.tap(find.byIcon(Icons.login_rounded));
    // catch the outcome snackbar before it auto-dismisses
    await waitFor(find.byType(SnackBar));
    await settle(frames: 4);
  }

  /// Opens the edit screen via the tile's `more_vert` > Edit, and waits for
  /// stored secrets to load (Save is disabled until then).
  Future<void> openEditServer() async {
    await tester.tap(find.byIcon(Icons.more_vert));
    await settle(frames: 5);
    await tester.tap(find.text(l10n.edit));
    await settle();
  }

  /// Scopes to the tile showing [alias] -- needed once more than one server
  /// is in the list (tiles are otherwise structurally identical).
  Finder _tileFor(String alias) => find.ancestor(
    of: find.text(alias),
    matching: find.byType(ServersTileItem),
  );

  /// Opens [alias]'s `more_vert` menu and taps [menuText] (only one popup
  /// menu is ever open, so the item itself doesn't need tile-scoping).
  Future<void> _tapTileMenu(String alias, String menuText) async {
    final tile = _tileFor(alias);
    await tester.ensureVisible(tile);
    await settle(frames: 3);
    await tester.tap(
      find.descendant(of: tile, matching: find.byIcon(Icons.more_vert)),
    );
    await settle(frames: 5);
    await tester.tap(find.text(menuText));
  }

  /// Like [openEditServer], but for a specific tile when more than one server
  /// is in the list.
  Future<void> openEditServerFor(String alias) async {
    await _tapTileMenu(alias, l10n.edit);
    await settle();
  }

  /// Deletes the (only) server via its tile's `more_vert` > Delete, confirming
  /// the modal.
  Future<void> deleteServer() async {
    await tester.tap(find.byIcon(Icons.more_vert));
    await settle(frames: 5);
    await tester.tap(find.text(l10n.delete));
    await settle(frames: 5);
    await tester.tap(find.text(l10n.delete).last);
    await waitFor(find.byType(SnackBar));
    await settle(frames: 4);
  }

  /// Sets [alias]'s server as the default via its tile's `more_vert` menu.
  Future<void> setDefaultServerFor(String alias) async {
    await _tapTileMenu(alias, l10n.setDefault);
    await settle(frames: 5);
  }

  /// Edits a server tile
  Future<void> editServer({
    String? at,
    String? version,
    String? alias,
    String? host,
    String? port,
    String? password,
    String? token,
  }) async {
    if (at != null) {
      await openEditServerFor(at);
    } else {
      await openEditServer();
    }

    if (version != null) {
      await tester.tap(find.text(version).last);
      await settle(frames: 3);
    }

    final fields = find.byType(EditableText);
    if (alias != null) await tester.enterText(fields.at(0), alias);
    if (host != null) await tester.enterText(fields.at(1), host);
    if (port != null) await tester.enterText(fields.at(2), port);
    final authValue = token ?? password;
    if (authValue != null) await tester.enterText(fields.at(3), authValue);
    await settle(frames: 3);

    await tester.tap(find.byIcon(Icons.save_rounded));
    await waitFor(find.byType(SnackBar));
    await settle(frames: 4);
  }

  /// Waits for the TOTP prompt to appear.
  Future<bool> waitForTotpPrompt() => waitFor(find.text(l10n.confirm));

  /// Fills the TOTP prompt's 6 single-digit boxes. No Confirm tap needed --
  /// the modal auto-submits once all 6 are filled.
  Future<void> submitTotpCode(String code) async {
    final allFields = find.byType(EditableText);
    final firstDigitIndex = allFields.evaluate().length - code.length;
    for (var i = 0; i < code.length; i++) {
      await tester.enterText(allFields.at(firstDigitIndex + i), code[i]);
    }
    await settle(frames: 3);
  }

  /// Submits the correct [code] and waits for the connect/edit to finish.
  Future<void> completeTotpPrompt(String code) async {
    await submitTotpCode(code);
    await waitFor(find.byType(SnackBar));
    await settle(frames: 4);
  }

  /// Cancels the TOTP prompt (modal bottom sheet).
  Future<void> cancelTotpPrompt() async {
    await tester.tap(find.text(l10n.cancel));
    await settle(frames: 5);
  }
}
