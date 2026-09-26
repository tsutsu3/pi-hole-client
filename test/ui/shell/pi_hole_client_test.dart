import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/pi_hole_client.dart';
import 'package:pi_hole_client/ui/core/ui/components/unlock.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_screen.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:provider/provider.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_logs_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('PiHoleClient Widget Tests', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late FakeLogsViewModel logsViewModel;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = const Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowUntrustedCert: true,
          ignoreCertificateErrors: false,
        )
        ..selectedServerEnabled = true;

      statusViewModel = FakeStatusViewModel();
      logsViewModel = FakeLogsViewModel();
    });

    testWidgets('should show pihole client widget', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final bundle = createFakeRepositoryBundle();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppConfigViewModel>.value(
              value: appConfigViewModel,
            ),
            ChangeNotifierProvider<ServersViewModel>.value(
              value: serversViewModel,
            ),
            ChangeNotifierProvider<StatusViewModel>.value(
              value: statusViewModel,
            ),
            ChangeNotifierProvider<LogsViewModel>.value(value: logsViewModel),
            Provider<RepositoryBundle?>.value(value: bundle),
          ],
          child: const PiHoleClient(),
        ),
      );

      expect(find.byType(PiHoleClient), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(Base), findsOneWidget);
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    group('app lock', () {
      Future<void> pumpApp(WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<AppConfigViewModel>.value(
                value: appConfigViewModel,
              ),
              ChangeNotifierProvider<ServersViewModel>.value(
                value: serversViewModel,
              ),
              ChangeNotifierProvider<StatusViewModel>.value(
                value: statusViewModel,
              ),
              ChangeNotifierProvider<LogsViewModel>.value(value: logsViewModel),
              Provider<RepositoryBundle?>.value(
                value: createFakeRepositoryBundle(),
              ),
            ],
            child: const PiHoleClient(),
          ),
        );
        await tester.pump(const Duration(seconds: 3));
      }

      Future<void> sendToBackgroundAndBack(WidgetTester tester) async {
        for (final state in [
          AppLifecycleState.inactive,
          AppLifecycleState.hidden,
          AppLifecycleState.inactive,
          AppLifecycleState.resumed,
        ]) {
          tester.binding.handleAppLifecycleStateChanged(state);
          await tester.pump(const Duration(seconds: 1));
        }
        await tester.pump(const Duration(seconds: 1));
      }

      testWidgets('does not lock after the passcode is removed', (
        tester,
      ) async {
        await appConfigViewModel.setPassCode('1234');
        await pumpApp(tester);
        expect(find.byType(Unlock), findsOneWidget);

        for (final digit in ['1', '2', '3', '4']) {
          await tester.tap(find.text(digit));
          await tester.pump();
        }
        await tester.pump(const Duration(seconds: 3));
        expect(find.byType(Unlock), findsNothing);

        await appConfigViewModel.setPassCode(null);
        await tester.pump();

        await sendToBackgroundAndBack(tester);
        expect(find.byType(Unlock), findsNothing);
      });

      testWidgets('locks after a passcode is set while running', (
        tester,
      ) async {
        await pumpApp(tester);
        expect(find.byType(Unlock), findsNothing);

        await appConfigViewModel.setPassCode('1234');
        await tester.pump();

        await sendToBackgroundAndBack(tester);
        expect(find.byType(Unlock), findsOneWidget);
      });
    });
  });
}
