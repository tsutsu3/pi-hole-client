import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp/view_models/dhcp_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp/widgets/dhcp_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp/widgets/dhcp_screen.dart';

import '../../../../../../testing/fakes/repositories/api/fake_dhcp_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('DHCP Screen tests', () {
    late FakeDhcpRepository fakeDhcpRepository;
    late FakeFtlRepository fakeFtlRepository;
    late DhcpViewModel viewModel;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};
      fakeDhcpRepository = FakeDhcpRepository();
      fakeFtlRepository = FakeFtlRepository();
      viewModel = DhcpViewModel(
        dhcpRepository: fakeDhcpRepository,
        ftlRepository: fakeFtlRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildDhcpWidget() {
      return buildTestApp(DhcpScreen(viewModel: viewModel..loadLeases.run()));
    }

    Widget buildDhcpWidgetWithRouter() {
      final router = GoRouter(
        initialLocation: '/dhcp',
        routes: [
          GoRoute(
            path: '/dhcp',
            builder: (context, state) =>
                DhcpScreen(viewModel: viewModel..loadLeases.run()),
            routes: [
              GoRoute(
                path: 'details',
                name: Routes.settingsServerAdvancedDhcpDetails,
                builder: (context, state) {
                  final extra =
                      state.extra! as (DhcpLease, void Function(DhcpLease));
                  return DhcpDetailScreen(lease: extra.$1, onDelete: extra.$2);
                },
              ),
            ],
          ),
        ],
      );
      return buildTestApp(const SizedBox.shrink(), router: router);
    }

    testWidgets('should show error screen when fetching leases fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeDhcpRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Complete the failing command before building the widget to avoid
      // Skeletonizer's ShimmerEffect infinite animation during loading.
      await tester.runAsync(() async {
        viewModel.loadLeases.run();
        await Future<void>.delayed(const Duration(milliseconds: 500));
      });

      await tester.pumpWidget(buildTestApp(DhcpScreen(viewModel: viewModel)));
      await tester.pumpAndSettle();

      expect(find.byType(DhcpScreen), findsOneWidget);
      expect(find.byType(ErrorMessage), findsOneWidget);
    });

    testWidgets('should show detail screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildDhcpWidgetWithRouter());
      await tester.pumpAndSettle();

      expect(find.byType(DhcpScreen), findsOneWidget);

      await tester.tap(find.text('raspberrypi'));
      await tester.pumpAndSettle();

      expect(find.byType(DhcpDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
    });

    testWidgets('should refresh leases on tap', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildDhcpWidget());
      await tester.pumpAndSettle();

      expect(find.byType(DhcpScreen), findsOneWidget);
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
    });

    testWidgets('should show delete lease button and delete successfully', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildDhcpWidgetWithRouter());
      await tester.pumpAndSettle();

      await tester.tap(find.text('raspberrypi'));
      await tester.pumpAndSettle();

      expect(find.byType(DhcpDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      // Show remove modal
      expect(find.byType(DeleteModal), findsOneWidget);
      expect(find.text('Delete DHCP lease'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('DHCP lease removed successfully'), findsWidgets);
    });

    testWidgets('should show error snackbar when delete lease fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildDhcpWidgetWithRouter());
      await tester.pumpAndSettle();

      await tester.tap(find.text('raspberrypi'));
      await tester.pumpAndSettle();

      expect(find.byType(DhcpDetailScreen), findsOneWidget);

      // Set failure before triggering delete
      fakeDhcpRepository.shouldFail = true;

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      expect(find.byType(DeleteModal), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Error when removing device'), findsWidgets);
    });
  });
}
