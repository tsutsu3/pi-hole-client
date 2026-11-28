import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/actions/server_management.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/test_app.dart';

const _server = Server(
  address: 'http://localhost:8081',
  alias: 'v6',
  apiVersion: SupportedApiVersions.v6,
  defaultServer: false,
  allowUntrustedCert: false,
  ignoreCertificateErrors: false,
);

const _channel = MethodChannel('pihole/widget');

void main() async {
  await initTestApp();

  group('showDisableCooldownIfActive', () {
    late FakeServersViewModel serversViewModel;
    late AppConfigViewModel appConfigViewModel;
    var remainingMs = 0;

    setUp(() {
      remainingMs = 0;
      WidgetChannel.debugIsSupportedOverride = true;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_channel, (call) async {
            if (call.method == 'getDisableCooldownRemaining') {
              return remainingMs;
            }
            return null;
          });
      serversViewModel = FakeServersViewModel()..selectedServer = _server;
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
    });

    tearDown(() {
      WidgetChannel.debugIsSupportedOverride = null;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_channel, null);
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
        ),
      );
      await tester.pump();
      return ctx;
    }

    testWidgets('does nothing when the limit is off', (tester) async {
      remainingMs = 600000;
      final ctx = await pumpContext(tester);

      expect(await showDisableCooldownIfActive(ctx), isFalse);
    });

    testWidgets('allows a disable when the time is up', (tester) async {
      await appConfigViewModel.setDisableCooldown(3600);
      final ctx = await pumpContext(tester);

      expect(await showDisableCooldownIfActive(ctx), isFalse);
    });

    testWidgets('does nothing without a selected server', (tester) async {
      await appConfigViewModel.setDisableCooldown(3600);
      remainingMs = 600000;
      serversViewModel.selectedServer = null;
      final ctx = await pumpContext(tester);

      expect(await showDisableCooldownIfActive(ctx), isFalse);
    });

    testWidgets('shows how long to wait during the limit', (tester) async {
      await appConfigViewModel.setDisableCooldown(3600);
      remainingMs = (3 * 60 + 20) * 60 * 1000;
      final ctx = await pumpContext(tester);

      expect(await showDisableCooldownIfActive(ctx), isTrue);
      await tester.pump();

      expect(
        find.text('Pi-hole can be disabled again in 3h 20m'),
        findsOneWidget,
      );
    });
  });
}
