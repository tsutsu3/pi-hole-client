import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/ui/modals/start_warning_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../testing/test_app.dart';

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('Base Widget Tests', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;

    setUp(() {
      serversViewModel = FakeServersViewModel();
      statusViewModel = FakeStatusViewModel();
    });

    testWidgets('should show important info modal when first time access', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // importantInfoReaden defaults to 0 (false) in FakeAppConfigRepository
      final appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());

      await tester.pumpWidget(
        buildTestApp(
          const Base(child: SizedBox()),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
        ),
      );

      expect(find.byType(Base), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(StartInfoModal), findsOneWidget);
      expect(find.text('Getting Started'), findsOneWidget);
    });

    testWidgets('StartInfoModal close button dismisses modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());

      await tester.pumpWidget(
        buildTestApp(
          const Base(child: SizedBox()),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(StartInfoModal), findsOneWidget);

      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(appConfigViewModel.importantInfoReaden, true);
    });

    testWidgets('StartInfoModal crash report switch can be toggled', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());

      await tester.pumpWidget(
        buildTestApp(
          const Base(child: SizedBox()),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(StartInfoModal), findsOneWidget);

      final switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget);

      await tester.tap(switchFinder);
      await tester.pumpAndSettle();

      expect(appConfigViewModel.sendCrashReports, true);
    });

    testWidgets('should render child widget', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Mark important info as already read so the modal is skipped
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      final appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      await tester.pumpWidget(
        buildTestApp(
          const Base(child: Text('Test Child')),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
        ),
      );

      expect(find.byType(Base), findsOneWidget);
      await tester.pump();
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets(
      'shows the certificate recovery dialog when auto-refresh hits a TLS error',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
        final appConfigViewModel = AppConfigViewModel(repo);
        appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());
        serversViewModel.selectedServer = _serverV6;

        await tester.pumpWidget(
          buildTestApp(
            const Base(child: SizedBox()),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
            createRepositoryBundle: ({required server}) =>
                createFakeRepositoryBundle(),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(AlertDialog), findsNothing);

        // Auto-refresh detects a pinned-certificate mismatch on any screen;
        // the shell (Base) handles recovery, not HomeScreen.
        statusViewModel.fatalConnectionError = HttpStatusCodeException(
          495,
          'SSL handshake failed',
        );
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);
      },
    );

    testWidgets(
      'cold start with a selected server fetches status and starts auto-refresh',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
        final appConfigViewModel = AppConfigViewModel(repo);
        appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());
        serversViewModel.selectedServer = _serverV6;

        await tester.pumpWidget(
          buildTestApp(
            const Base(child: SizedBox()),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
            createRepositoryBundle: ({required server}) =>
                createFakeRepositoryBundle(),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          serversViewModel.updateselectedServerStatusCallCount,
          greaterThanOrEqualTo(1),
        );
        expect(
          statusViewModel.startAutoRefreshCallCount,
          greaterThanOrEqualTo(1),
        );
      },
    );

    testWidgets('cold start without a selected server does not auto-connect', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      final appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());
      // selectedServer stays null (no default server).

      await tester.pumpWidget(
        buildTestApp(
          const Base(child: SizedBox()),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
          createRepositoryBundle: ({required server}) =>
              createFakeRepositoryBundle(),
        ),
      );
      await tester.pumpAndSettle();

      expect(statusViewModel.startAutoRefreshCallCount, 0);
      expect(serversViewModel.updateselectedServerStatusCallCount, 0);
    });

    testWidgets('app pause stops auto-refresh', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      final appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());
      serversViewModel.selectedServer = _serverV6;

      await tester.pumpWidget(
        buildTestApp(
          const Base(child: SizedBox()),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
          createRepositoryBundle: ({required server}) =>
              createFakeRepositoryBundle(),
        ),
      );
      await tester.pumpAndSettle();

      final before = statusViewModel.stopAutoRefreshCallCount;
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();

      expect(statusViewModel.stopAutoRefreshCallCount, greaterThan(before));
    });
  });
}
