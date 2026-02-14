import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/viewmodel/local_dns_viewmodel.dart';

import '../../../../../testing/fakes/repositories/api/fake_local_dns_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../helpers/test_app.dart';

void main() async {
  await initTestApp();

  group('Local DNS Screen tests', () {
    late FakeLocalDnsRepository fakeLocalDnsRepository;
    late FakeNetworkRepository fakeNetworkRepository;
    late LocalDnsViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeLocalDnsRepository = FakeLocalDnsRepository();
      fakeNetworkRepository = FakeNetworkRepository();
      viewModel = LocalDnsViewModel(
        localDnsRepository: fakeLocalDnsRepository,
        networkRepository: fakeNetworkRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildLocalDnsWidget() {
      return buildTestApp(
        LocalDnsScreen(viewModel: viewModel..loadRecords.run()),
      );
    }

    testWidgets('should show error screen when fetching fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeLocalDnsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.runAsync(() async {
        viewModel.loadRecords.run();
        await Future<void>.delayed(const Duration(milliseconds: 500));
      });

      await tester.pumpWidget(
        buildTestApp(LocalDnsScreen(viewModel: viewModel)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      expect(find.byType(ErrorMessage), findsOneWidget);
    });

    testWidgets('should show local dns records', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildLocalDnsWidget());
      await tester.pumpAndSettle();

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      expect(find.text('server1'), findsOneWidget);
      expect(find.text('printer1'), findsOneWidget);
      expect(find.text('nas1'), findsOneWidget);
    });

    testWidgets('should show refresh button', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildLocalDnsWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
    });

    testWidgets('should show FAB', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildLocalDnsWidget());
      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
