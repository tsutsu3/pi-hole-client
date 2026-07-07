import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_screen.dart';
import 'package:pi_hole_client/ui/home/widgets/disable_modal.dart';
import 'package:pi_hole_client/ui/home/widgets/home_screen.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_client_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/widgets/server_info_screen.dart';
import 'package:pi_hole_client/ui/settings/widgets/settings_screen.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_screen.dart';

import '../support/app_harness.dart';
import '../support/real_pihole_env.dart';

/// Real-Pi-hole tests for post-login UI operations: tab navigation, settings
/// sub-screens, blocking toggle, and domain/adlist/group CRUD.
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

  group('post-login UI (v6, HTTP)', () {
    testWidgets('walks every tab and opens settings sub-screens', (
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
        alias: 'ui-nav',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      await app.connectServer();
      expect(find.byType(HomeScreen), findsOneWidget);

      Future<void> gotoTab(String label) async {
        await tester.tap(find.widgetWithText(NavigationDestination, label));
        await app.settle(frames: 10);
      }

      await gotoTab(app.l10n.statistics);
      expect(find.byType(StatisticsScreen), findsOneWidget);

      await gotoTab(app.l10n.logs);
      expect(find.byType(LogsScreen), findsOneWidget);

      await gotoTab(app.l10n.domains);
      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('Whitelist'), findsOneWidget);
      expect(find.text('Blacklist'), findsOneWidget);

      await gotoTab(app.l10n.settings);
      expect(find.byType(SettingsScreen), findsOneWidget);

      Future<void> openAndBackSetting<T extends Widget>(String label) async {
        final tile = find.widgetWithText(ListTile, label);
        await tester.ensureVisible(tile);
        await app.settle(frames: 5);
        await tester.tap(tile);
        await app.settle(); // sub-screen fetches real data over HTTP
        expect(
          find.byType(T),
          findsOneWidget,
          reason: 'opening $label navigates to it',
        );
        await tester.tap(find.byType(BackButton));
        await app.settle(frames: 10);
        expect(
          find.byType(SettingsScreen),
          findsOneWidget,
          reason: 'back from $label must return to the settings list',
        );
      }

      await openAndBackSetting<ServerInfoScreen>(app.l10n.serverInfo);
      await openAndBackSetting<AdlistScreen>(app.l10n.adlists);
      await openAndBackSetting<GroupClientScreen>(app.l10n.groupsAndClients);

      await gotoTab(app.l10n.home);
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('blocking toggle is state-aware and self-healing', (
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
        alias: 'ui-blocking',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      await app.connectServer();

      final fab = find.widgetWithIcon(
        FloatingActionButton,
        Icons.shield_rounded,
      );
      if (app.servers.selectedServerEnabled != true) {
        await tester.tap(fab);
        await app.waitFor(find.byType(SnackBar));
        await app.settle(frames: 4);
        expect(find.text(app.l10n.serverEnabled), findsOneWidget);
      }
      expect(app.servers.selectedServerEnabled, isTrue);
      await app.settle(frames: 15);

      // Enabled -> tap opens DisableModal. Pick "Indefinitely"
      await tester.tap(fab);
      await app.settle(frames: 5);
      expect(find.byType(DisableModal), findsOneWidget);
      expect(find.text(app.l10n.indefinitely), findsWidgets);
      await tester.tap(find.text(app.l10n.indefinitely).first);
      await app.settle(frames: 3);
      await tester.tap(find.text(app.l10n.accept));
      await app.waitFor(find.byType(SnackBar));
      await app.settle(frames: 4);
      expect(find.text(app.l10n.serverDisabled), findsOneWidget);
      expect(app.servers.selectedServerEnabled, isFalse);

      // Disabled -> tap re-enables directly
      await tester.tap(fab);
      await app.waitFor(find.byType(SnackBar));
      await app.settle(frames: 4);
      expect(find.text(app.l10n.serverEnabled), findsOneWidget);
      expect(app.servers.selectedServerEnabled, isTrue);
    });

    testWidgets('domain: add, edit, then delete', (tester) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'ui-domain',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      await app.connectServer();

      final testDomain =
          'e2e-${DateTime.now().millisecondsSinceEpoch}.example.com';

      await tester.tap(
        find.widgetWithText(NavigationDestination, app.l10n.domains),
      );
      await app.settle(frames: 10);
      expect(find.byType(DomainsScreen), findsOneWidget);

      // Add (Whitelist is the default selected tab).
      await tester.tap(find.byIcon(Icons.add));
      await app.settle(frames: 5);
      await tester.enterText(find.byType(TextField), testDomain);
      // (no-op) button
      await app.settle(frames: 3);
      await tester.tap(find.text(app.l10n.add));
      await app.waitFor(find.text(app.l10n.domainAdded));
      expect(find.text(app.l10n.domainAdded), findsOneWidget);
      await app.settle();
      expect(find.text(testDomain), findsOneWidget);

      // Edit: toggle the Status switch off.
      await tester.tap(find.text(testDomain));
      await app.settle();
      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      final domainSwitch = find.byType(Switch);
      await tester.tap(domainSwitch);
      await app.waitFor(find.text(app.l10n.domainUpdated));
      await app.settle(frames: 4);
      expect(find.text(app.l10n.domainUpdated), findsOneWidget);
      expect(tester.widget<Switch>(domainSwitch).value, isFalse);

      // Delete.
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await app.settle(frames: 3);
      expect(find.text(app.l10n.domainDelete), findsOneWidget);
      await tester.tap(find.text(app.l10n.delete));
      await app.waitFor(find.text(app.l10n.domainRemoved));
      expect(find.text(app.l10n.domainRemoved), findsOneWidget);
      await app.settle();
      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text(testDomain), findsNothing);
    });

    testWidgets('adlist: add, edit, then delete', (tester) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'ui-adlist',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      await app.connectServer();

      final testAddress =
          'http://example.com/e2e-${DateTime.now().millisecondsSinceEpoch}.txt';

      await tester.tap(
        find.widgetWithText(NavigationDestination, app.l10n.settings),
      );
      await app.settle(frames: 10);
      final adlistsTile = find.widgetWithText(ListTile, app.l10n.adlists);
      await tester.ensureVisible(adlistsTile);
      await app.settle(frames: 5);
      await tester.tap(adlistsTile);
      await app.settle();
      expect(find.byType(AdlistScreen), findsOneWidget);

      // Add (Allow/whitelist is the default selected tab).
      await tester.tap(find.byIcon(Icons.add));
      await app.settle(frames: 5);
      await tester.enterText(find.byType(TextField).at(0), testAddress);
      await app.settle(frames: 3);
      await tester.tap(find.text(app.l10n.add));
      await app.waitFor(find.text(app.l10n.adlistAdded));
      expect(find.text(app.l10n.adlistAdded), findsOneWidget);
      await app.settle();
      expect(find.text(testAddress), findsOneWidget);

      // Edit: toggle the Status switch off.
      await tester.tap(find.text(testAddress));
      await app.settle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      final adlistSwitch = find.byType(Switch);
      await tester.tap(adlistSwitch);
      await app.waitFor(find.text(app.l10n.adlistUpdated));
      await app.settle(frames: 4);
      expect(find.text(app.l10n.adlistUpdated), findsOneWidget);
      expect(tester.widget<Switch>(adlistSwitch).value, isFalse);

      // Delete.
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await app.settle(frames: 3);
      expect(find.text(app.l10n.adlistDelete), findsOneWidget);
      await tester.tap(find.text(app.l10n.delete));
      await app.waitFor(find.text(app.l10n.adlistRemoved));
      expect(find.text(app.l10n.adlistRemoved), findsOneWidget);
      await app.settle();
      expect(find.text(testAddress), findsNothing);
    });

    testWidgets('group: add, edit, then delete', (tester) async {
      final app = AppHarness(tester);
      await app.boot();
      final uri = Uri.parse(RealPiholeEnv.v6Base);

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: uri.hasPort ? '${uri.port}' : '',
        password: RealPiholeEnv.v6Password,
        alias: 'ui-group',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      await app.connectServer();

      final testGroup = 'e2e-group-${DateTime.now().millisecondsSinceEpoch}';

      await tester.tap(
        find.widgetWithText(NavigationDestination, app.l10n.settings),
      );
      await app.settle(frames: 10);
      final groupsTile = find.widgetWithText(
        ListTile,
        app.l10n.groupsAndClients,
      );
      await tester.ensureVisible(groupsTile);
      await app.settle(frames: 5);
      await tester.tap(groupsTile);
      await app.settle();
      expect(find.byType(GroupClientScreen), findsOneWidget);

      // Add (Groups is the default selected tab).
      await tester.tap(find.byIcon(Icons.add));
      await app.settle(frames: 5);
      await tester.enterText(find.byType(TextField).at(0), testGroup);
      await app.settle(frames: 3);
      await tester.tap(find.text(app.l10n.add));
      await app.waitFor(find.text(app.l10n.groupAdded));
      expect(find.text(app.l10n.groupAdded), findsOneWidget);
      await app.settle();
      expect(find.text(testGroup), findsOneWidget);

      // Edit: toggle the Status switch off.
      await tester.tap(find.text(testGroup));
      await app.settle();
      expect(find.byType(GroupDetailsScreen), findsOneWidget);
      final groupSwitch = find.byType(Switch);
      await tester.tap(groupSwitch);
      await app.waitFor(find.text(app.l10n.groupUpdated));
      await app.settle(frames: 4);
      expect(find.text(app.l10n.groupUpdated), findsOneWidget);
      expect(tester.widget<Switch>(groupSwitch).value, isFalse);

      // Delete.
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await app.settle(frames: 3);
      expect(find.text(app.l10n.groupDelete), findsOneWidget);
      await tester.tap(find.text(app.l10n.delete));
      await app.waitFor(find.text(app.l10n.groupRemoved));
      expect(find.text(app.l10n.groupRemoved), findsOneWidget);
      await app.settle();
      expect(find.text(testGroup), findsNothing);
    });
  });
}
