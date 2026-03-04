import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/modals/start_warning_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/base.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Base Widget Tests', () {
    late FakeServersViewModel serversViewModel;

    setUp(() {
      serversViewModel = FakeServersViewModel();
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
        ),
      );

      expect(find.byType(Base), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(StartInfoModal), findsOneWidget);
      expect(find.text('Getting Started'), findsOneWidget);
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
        ),
      );

      expect(find.byType(Base), findsOneWidget);
      await tester.pump();
      expect(find.text('Test Child'), findsOneWidget);
    });
  });
}
