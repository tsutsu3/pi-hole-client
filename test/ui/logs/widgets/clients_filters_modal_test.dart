import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/clients_filters_modal.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Client filter modal tests', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;
    late LogsViewModel logsViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      serversViewModel = ServersViewModel(serverRepo);
      final servers = await serverRepo.fetchServers();
      await serversViewModel.saveFromDb(servers.getOrThrow());
      logsViewModel = LogsViewModel();
      // Populate totalClients so the modal can render the client list
      logsViewModel.setClients(['localhost', '192.168.100.2']);
    });

    testWidgets('should uncheck all filter', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ClientsFiltersModal(
            statusBarHeight: 24,
            bottomNavBarHeight: 48,
            selectedClients: ['192.168.100.2', 'localhost'],
            window: false,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(ClientsFiltersModal), findsOneWidget);
      expect(find.text('Clients'), findsOneWidget);
      expect(find.text('Uncheck all'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
      await tester.tap(find.text('Uncheck all'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();
    });

    testWidgets('should check all clients', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ClientsFiltersModal(
            statusBarHeight: 24,
            bottomNavBarHeight: 48,
            selectedClients: [],
            window: false,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(ClientsFiltersModal), findsOneWidget);
      expect(find.text('Clients'), findsOneWidget);
      expect(find.text('Check all'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);
      await tester.tap(find.text('Check all'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();
    });
  });
}
