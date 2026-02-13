import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/viewmodel/server_info_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/host_information_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/performance_usage_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/pihole_version_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/server_connection_section.dart';

import '../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../helpers/test_app.dart';

void main() async {
  await initTestApp();

  group('ServerInfoScreen tests', () {
    late FakeFtlRepository fakeFtlRepository;
    late ServerInfoViewModel viewModel;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};
      fakeFtlRepository = FakeFtlRepository();
      viewModel = ServerInfoViewModel(ftlRepository: fakeFtlRepository);
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildServerInfoWidget() {
      return buildTestApp(
        ServerInfoScreen(
          viewModel: viewModel..loadServerInfo.run(),
          serverAlias: 'Test Server',
          serverAddress: 'http://192.168.1.100',
        ),
      );
    }

    testWidgets('should show server info sections on success', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildServerInfoWidget());
      await tester.pumpAndSettle();

      expect(find.byType(ServerInfoScreen), findsOneWidget);
      expect(find.byType(ServerConnectionSection), findsOneWidget);
      expect(find.byType(HostInformationSection), findsOneWidget);
      expect(find.byType(PerformanceUsageSection), findsOneWidget);
      expect(find.byType(PiholeVersionSection), findsOneWidget);

      // Verify server connection info
      expect(find.text('Test Server'), findsOneWidget);
      expect(find.text('http://192.168.1.100'), findsOneWidget);
    });

    testWidgets('should show error screen when fetching fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeFtlRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.runAsync(() async {
        viewModel.loadServerInfo.run();
        await Future<void>.delayed(const Duration(milliseconds: 500));
      });

      await tester.pumpWidget(
        buildTestApp(
          ServerInfoScreen(
            viewModel: viewModel,
            serverAlias: 'Test Server',
            serverAddress: 'http://192.168.1.100',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ServerInfoScreen), findsOneWidget);
      expect(find.byType(ErrorMessage), findsOneWidget);
    });

    testWidgets('should show refresh button', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildServerInfoWidget());
      await tester.pumpAndSettle();

      expect(find.byType(ServerInfoScreen), findsOneWidget);
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
    });
  });
}
