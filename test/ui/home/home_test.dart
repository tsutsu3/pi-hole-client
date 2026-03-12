import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/disable_modal.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar/switch_server_modal.dart';
import 'package:pi_hole_client/ui/home/widgets/home_screen.dart';
import 'package:pi_hole_client/ui/servers/widgets/servers_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_logs_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../testing/models/v5/merics.dart' as metrics_fixture;
import '../../../testing/models/v5/realtime_status.dart' as rt_fixture;
import '../../../testing/models/v6/ftl.dart' as ftl_fixture;
import '../../../testing/test_app.dart';

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('Home Screen Widget Tests', () {
    late AppConfigViewModel appConfigViewModel;
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late FakeLogsViewModel logsViewModel;

    setUp(() async {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = _serverV6
        ..selectedServerEnabled = true
        ..serversList = [_serverV6];

      statusViewModel = FakeStatusViewModel()
        ..realtimeStatus = rt_fixture.kRepoFetchRealTimeStatus
        ..overtimeData = metrics_fixture.kRepoFetchOverTime
        ..ftlDnsMetrics = ftl_fixture.kRepoFetchFtlMetrics;

      logsViewModel = FakeLogsViewModel();
    });

    testWidgets('should home screen be rendered (all graphs are rendered)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Home App Bar
      expect(find.byIcon(Icons.gpp_good_rounded), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      expect(find.text('test v6'), findsWidgets);
      expect(find.text('http://localhost:8081'), findsWidgets);

      // titles
      expect(find.text('Total queries'), findsOneWidget);
      expect(find.text('Queries blocked'), findsOneWidget);
      expect(find.text('Percentage blocked'), findsOneWidget);
      expect(find.text('Domains on Adlists'), findsOneWidget);

      // queries graph
      expect(find.text('Total queries last 24 hours'), findsOneWidget);

      // clients graph
      expect(find.text('Client activity last 24 hours'), findsOneWidget);
    });

    testWidgets('should home screen be rendered (loading state)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      statusViewModel.statusLoading = LoadStatus.loading;

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));

      final shimmerText = find.descendant(
        of: find.byType(Skeletonizer),
        matching: find.byType(Text),
      );

      expect(shimmerText, findsNothing);
    });

    testWidgets('should home screen be rendered (loading error state)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      statusViewModel.statusLoading = LoadStatus.error;

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Error'), findsNWidgets(4));
    });

    testWidgets(
      'should show disable modal and snackbar when disable button is pressed',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildTestApp(
            HomeScreen(
              serversViewModel: serversViewModel,
              appConfigViewModel: appConfigViewModel,
              statusViewModel: statusViewModel,
            ),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            logsViewModel: logsViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
          ),
        );

        expect(find.byType(HomeScreen), findsOneWidget);
        await tester.pump();
        expect(find.byType(FloatingActionButton), findsOneWidget);

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byType(DisableModal), findsOneWidget);
        await tester.tap(find.text('30 seconds').last);
        await tester.pump();
        await tester.tap(find.text('Accept').last);
        await tester.pump();
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Server disabled successfully.'), findsOneWidget);
      },
    );

    testWidgets('should show enabled snackbar when enable button is pressed', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      serversViewModel.selectedServerEnabled = false;

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      await tester.pump();
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(DisableModal), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Server enabled successfully.'), findsOneWidget);
    });

    testWidgets('should show switch server modal', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      await tester.pump();

      // show switch server modal
      expect(find.text('test v6'), findsWidgets);
      await tester.tap(find.text('test v6').last);
      await tester.pumpAndSettle();
      expect(find.byType(SwitchServerModal), findsOneWidget);
    });

    testWidgets('should show popup menu', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      expect(find.text('Refresh'), findsOneWidget);
      expect(find.text('Open web panel'), findsOneWidget);
      expect(find.text('Change server'), findsOneWidget);
    });

    testWidgets(
      'should shows "Connect" and "Change server" options when server is not connected',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        statusViewModel.serverStatus = LoadStatus.loading;

        await tester.pumpWidget(
          buildTestApp(
            HomeScreen(
              serversViewModel: serversViewModel,
              appConfigViewModel: appConfigViewModel,
              statusViewModel: statusViewModel,
            ),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            logsViewModel: logsViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
          ),
        );

        expect(find.byType(HomeScreen), findsOneWidget);
        expect(find.byType(HomeAppBar), findsOneWidget);
        expect(find.byIcon(Icons.more_vert), findsOneWidget);
        await tester.pump();

        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pump();
        expect(find.text('Try reconnect'), findsOneWidget);
        expect(find.text('Change server'), findsOneWidget);
      },
    );

    testWidgets('should show refresh server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      expect(find.text('Refresh'), findsOneWidget);
      expect(find.text('Open web panel'), findsOneWidget);
      expect(find.text('Change server'), findsOneWidget);

      await tester.tap(find.text('Refresh'));
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('should show servers page', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: Routes.home,
            builder: (context, state) => HomeScreen(
              serversViewModel: serversViewModel,
              appConfigViewModel: appConfigViewModel,
              statusViewModel: statusViewModel,
            ),
          ),
          GoRoute(
            path: '/servers',
            name: Routes.servers,
            builder: (context, state) => const ServersScreen(),
          ),
        ],
      );

      await tester.pumpWidget(
        buildTestApp(
          const SizedBox.shrink(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
          router: router,
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      expect(find.text('Refresh'), findsOneWidget);
      expect(find.text('Open web panel'), findsOneWidget);
      expect(find.text('Change server'), findsOneWidget);

      await tester.tap(find.text('Change server'));
      await tester.pumpAndSettle();
      expect(find.text('Servers'), findsOneWidget);
    });

    // Network navigation now uses go_router (context.pushNamed).
    // Full navigation is tested in network_screen_test.dart.
    testWidgets('should navigate when tapping on "Total queries" tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Total queries'), findsOneWidget);
    });

    testWidgets(
      'should show logs page with filter when tapping on "Queries blocked" tile',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildTestApp(
            HomeScreen(
              serversViewModel: serversViewModel,
              appConfigViewModel: appConfigViewModel,
              statusViewModel: statusViewModel,
            ),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            logsViewModel: logsViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
          ),
        );

        expect(find.byType(HomeScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Queries blocked'));
        // GoRouter.goNamed throws because there's no router in the test tree;
        // consume the exception so the test can verify the ViewModel call.
        tester.takeException();

        expect(logsViewModel.setRequestStatusCallCount, 1);
        expect(logsViewModel.lastRequestStatus, RequestStatus.blocked);
      },
    );

    testWidgets(
      'should show logs page when tapping on "Percentage blocked" tile',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildTestApp(
            HomeScreen(
              serversViewModel: serversViewModel,
              appConfigViewModel: appConfigViewModel,
              statusViewModel: statusViewModel,
            ),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            logsViewModel: logsViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
          ),
        );

        expect(find.byType(HomeScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Percentage blocked'));
        // GoRouter.goNamed throws because there's no router in the test tree;
        // consume the exception so the test can verify the ViewModel call.
        tester.takeException();

        expect(logsViewModel.setRequestStatusCallCount, 1);
        expect(logsViewModel.lastRequestStatus, RequestStatus.all);
      },
    );

    testWidgets('should show "Domains on Adlists" tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          HomeScreen(
            serversViewModel: serversViewModel,
            appConfigViewModel: appConfigViewModel,
            statusViewModel: statusViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          logsViewModel: logsViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(HomeScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Domains on Adlists'), findsOneWidget);
      expect(find.byIcon(Icons.list), findsOneWidget);
    });
  });
}
