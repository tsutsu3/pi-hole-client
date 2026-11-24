import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_details_screen.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_logs_screen.dart';

import '../support/app_harness.dart';
import '../support/fake_pihole_server.dart';

/// Checks that failures reach the App Logs page through the real DI.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('app logs', () {
    /// Checks that the App Logs page shows one log with [message], and that
    /// its details screen shows [type].
    Future<void> expectAppLog(
      AppHarness app,
      String message,
      AppLogType type,
    ) async {
      expect(find.byType(AppLogsScreen), findsOneWidget);
      expect(find.text(message), findsOneWidget);

      await app.tester.tap(find.text(message));
      await app.settle();
      expect(find.byType(AppLogDetailsScreen), findsOneWidget);
      expect(find.text(type.name), findsOneWidget);
    }

    testWidgets('a wrong password when adding a server is recorded', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer();
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: '${uri.port}',
        password: 'wrong-password',
        alias: 'it-wrong-password',
      );
      expect(app.servers.getServersList, isEmpty);

      await app.closeServerForm();
      await app.openAppLogs();

      await expectAppLog(app, 'Failed to connect', AppLogType.auth);
    });

    testWidgets('a failed auto-refresh is recorded', (tester) async {
      final app = AppHarness(tester);
      await app.boot(autoRefreshTimeSeconds: 1);

      final fakeServer = FakePiholeServer();
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: '${uri.port}',
        password: fakeServer.password,
        alias: 'it-refresh',
      );
      await app.connectServer();
      await app.settle(frames: 20);
      expect(app.status.getServerStatus, LoadStatus.loaded);

      // Change the Pi-hole password. On Pi-hole this also clears the session,
      // so the next auto-refresh cannot log in again with the saved password.
      fakeServer
        ..invalidateSession()
        ..password = 'changed-password';
      await app.settle(frames: 20);

      await app.openAppLogs();

      await expectAppLog(app, 'Status refresh failed', AppLogType.auth);
    });
  });
}
