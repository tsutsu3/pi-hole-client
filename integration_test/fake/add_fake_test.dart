import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_harness.dart';
import '../support/fake_pihole_server.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('add a password-less server with a password typed', () {
    testWidgets(
      'a password-less v6 server connects even when a password is typed',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final fakeServer = FakePiholeServer()..noPassword = true;
        addTearDown(fakeServer.close);
        final uri = Uri.parse(await fakeServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: '${uri.port}',
          password: 'left-over-password',
          alias: 'no-pw-with-pw',
        );

        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final address = app.servers.getServersList.single.address;
        expect(await app.passwordOf(address), 'left-over-password');
        expect(await app.sidOf(address) ?? '', isEmpty);
      },
    );
  });
}
