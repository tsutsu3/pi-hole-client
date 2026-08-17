import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/actions/refresh_server_status.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../../testing/test_app.dart';

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'v6',
  apiVersion: SupportedApiVersions.v6,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('refreshServerStatus', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      serversViewModel = FakeServersViewModel();
      statusViewModel = FakeStatusViewModel();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
    });

    Future<BuildContext> pumpContext(WidgetTester tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
        ),
      );
      await tester.pump();
      return ctx;
    }

    testWidgets('clears an earlier 2FA cancellation before refreshing', (
      tester,
    ) async {
      serversViewModel.selectedServer = _serverV6;
      serversViewModel.markTotpReauthDeclined(_serverV6.address);
      final ctx = await pumpContext(tester);

      await refreshServerStatus(ctx);
      await tester.pumpAndSettle();

      expect(serversViewModel.isTotpReauthDeclined(_serverV6.address), isFalse);
      expect(statusViewModel.refreshOnceCallCount, 1);
    });

    testWidgets('refreshes when no server is selected', (tester) async {
      final ctx = await pumpContext(tester);

      await refreshServerStatus(ctx);
      await tester.pumpAndSettle();

      expect(statusViewModel.refreshOnceCallCount, 1);
      expect(serversViewModel.clearTotpReauthDeclinedCallCount, 0);
    });

    testWidgets('shows an error snackbar when the refresh fails', (
      tester,
    ) async {
      serversViewModel.selectedServer = _serverV6;
      statusViewModel.refreshOnceResult = false;
      final ctx = await pumpContext(tester);

      await refreshServerStatus(ctx);
      await tester.pumpAndSettle();

      expect(find.text('Could not connect to the server'), findsOneWidget);
    });
  });
}
