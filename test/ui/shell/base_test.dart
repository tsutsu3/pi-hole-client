import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/ui/modals/start_warning_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';
import 'package:window_manager/window_manager.dart';

import '../../../testing/fakes/repositories/api/fake_dns_repository.dart';
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

const _serverV6Other = Server(
  address: 'http://localhost:8082',
  alias: 'test v6 other',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

/// A [FakeDnsRepository] whose [fetchBlockingStatus] hangs until the test
/// calls [allowCompletion] -- lets a test interleave a state change (e.g.
/// changing the selected server) while a fetch is still in flight.
class _DelayedDns extends FakeDnsRepository {
  final _completer = Completer<void>();

  void allowCompletion() => _completer.complete();

  @override
  Future<Result<Blocking>> fetchBlockingStatus({
    bool skipRenewal = false,
  }) async {
    await _completer.future;
    return super.fetchBlockingStatus(skipRenewal: skipRenewal);
  }
}

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

    testWidgets('(AP3) resuming from background re-fetches status and restarts '
        'auto-refresh', (WidgetTester tester) async {
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

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await tester.pump();

      final fetchBefore = serversViewModel.updateselectedServerStatusCallCount;
      final refreshBefore = statusViewModel.startAutoRefreshCallCount;
      // `didChangeAppLifecycleState(resumed)` is a no-op on desktop
      (tester.state(find.byType(Base)) as WindowListener).onWindowRestore();
      await tester.pumpAndSettle();

      expect(
        serversViewModel.updateselectedServerStatusCallCount,
        greaterThan(fetchBefore),
        reason:
            "resuming must re-fetch the selected server's status, "
            'exactly like a cold start does',
      );
      expect(
        statusViewModel.startAutoRefreshCallCount,
        greaterThan(refreshBefore),
        reason: 'resuming must restart auto-refresh after pause stopped it',
      );
    });

    testWidgets(
      '(AP5) discards a stale resume fetch when the selected server changes '
      'mid-flight',
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

        final delayedDns = _DelayedDns();

        await tester.pumpWidget(
          buildTestApp(
            const Base(child: SizedBox()),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            repositoryBundle: createFakeRepositoryBundle(dns: delayedDns),
            createRepositoryBundle: ({required server}) =>
                createFakeRepositoryBundle(dns: delayedDns),
          ),
        );
        await tester.pump();

        // The cold-start fetch for _serverV6 is now in flight (blocked on
        // _DelayedDns). Before it completes, the selected server changes --
        // e.g. the user deleted it, or switched to another one.
        serversViewModel.selectedServer = _serverV6Other;
        delayedDns.allowCompletion();
        await tester.pumpAndSettle();

        expect(
          serversViewModel.updateselectedServerStatusCallCount,
          0,
          reason:
              'a fetch that started for a server which is no longer '
              'selected by the time it completes must be discarded, not '
              'applied to whatever is selected now',
        );
      },
    );
  });
}
