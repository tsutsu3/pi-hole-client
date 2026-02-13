import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/network_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/viewmodel/network_viewmodel.dart';

import '../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../helpers/test_app.dart';

void main() async {
  await initTestApp();

  group('Network Screen tests', () {
    late FakeNetworkRepository fakeNetworkRepository;
    late FakeFtlRepository fakeFtlRepository;
    late NetworkViewModel viewModel;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};
      fakeNetworkRepository = FakeNetworkRepository();
      fakeFtlRepository = FakeFtlRepository();
      viewModel = NetworkViewModel(
        networkRepository: fakeNetworkRepository,
        ftlRepository: fakeFtlRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildNetworkWidget() {
      return buildTestApp(
        NetworkScreen(viewModel: viewModel..loadDevices.run()),
      );
    }

    testWidgets('should show error screen when fetching devices fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeNetworkRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Complete the failing command before building the widget to avoid
      // Skeletonizer's ShimmerEffect infinite animation during loading.
      await tester.runAsync(() async {
        viewModel.loadDevices.run();
        await Future<void>.delayed(const Duration(milliseconds: 500));
      });

      await tester.pumpWidget(
        buildTestApp(NetworkScreen(viewModel: viewModel)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(NetworkScreen), findsOneWidget);
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

      await tester.pumpWidget(buildNetworkWidget());
      await tester.pumpAndSettle();

      expect(find.byType(NetworkScreen), findsOneWidget);

      await tester.tap(find.text('192.168.1.51 (ubuntu-server)'));
      await tester.pumpAndSettle();

      expect(find.byType(NetworkDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
    });

    testWidgets('should refresh devices on tap', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildNetworkWidget());
      await tester.pumpAndSettle();

      expect(find.byType(NetworkScreen), findsOneWidget);
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
    });

    testWidgets('should show delete device button and delete successfully', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildNetworkWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('192.168.1.51 (ubuntu-server)'));
      await tester.pumpAndSettle();

      expect(find.byType(NetworkDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      // Show remove modal
      expect(find.byType(DeleteModal), findsOneWidget);
      expect(find.text('Delete Device'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Device removed successfully'), findsWidgets);
    });

    testWidgets('should show error snackbar when delete device fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildNetworkWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('192.168.1.51 (ubuntu-server)'));
      await tester.pumpAndSettle();

      expect(find.byType(NetworkDetailScreen), findsOneWidget);

      // Set failure before triggering delete
      fakeNetworkRepository.shouldFail = true;

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
