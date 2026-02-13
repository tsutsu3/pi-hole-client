import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/address_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/more_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/statistics_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/viewmodel/interface_viewmodel.dart';

import '../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../helpers/test_app.dart';

void main() async {
  await initTestApp();

  group('Interface Screen tests', () {
    late FakeNetworkRepository fakeNetworkRepository;
    late InterfaceViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeNetworkRepository = FakeNetworkRepository();
      viewModel = InterfaceViewModel(
        networkRepository: fakeNetworkRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildInterfaceWidget() {
      return buildTestApp(
        InterfaceScreen(viewModel: viewModel..loadInterfaces.run()),
      );
    }

    testWidgets('should show error screen when fetching interfaces fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeNetworkRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.runAsync(() async {
        viewModel.loadInterfaces.run();
        await Future<void>.delayed(const Duration(milliseconds: 500));
      });

      await tester.pumpWidget(
        buildTestApp(InterfaceScreen(viewModel: viewModel)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(InterfaceScreen), findsOneWidget);
      expect(find.byType(ErrorMessage), findsOneWidget);
    });

    testWidgets('should show interface section', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildInterfaceWidget());
      await tester.pumpAndSettle();

      expect(find.byType(InterfaceScreen), findsOneWidget);
      expect(find.text('eth0 - UP'), findsOneWidget);
    });

    testWidgets('should show address detail screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildInterfaceWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Addresses').first);
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          'Address: inet 192.168.0.22 / 24 (IPv4 private)',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AddressDetailScreen), findsOneWidget);
    });

    testWidgets('should show statistics detail screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildInterfaceWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Statistics').first);
      await tester.pumpAndSettle();

      expect(find.byType(StatisticsDetailScreen), findsOneWidget);
    });

    testWidgets('should show more details screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildInterfaceWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('More Details').first);
      await tester.pumpAndSettle();

      expect(find.byType(MoreDetailsScreen), findsOneWidget);
    });

    testWidgets('should refresh interfaces on tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildInterfaceWidget());
      await tester.pumpAndSettle();

      expect(find.byType(InterfaceScreen), findsOneWidget);
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
    });
  });
}
