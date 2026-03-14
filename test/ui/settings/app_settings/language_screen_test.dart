import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/widgets/language_screen.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('LanguageScreen', () {
    late FakeAppConfigRepository fakeRepo;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      fakeRepo = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(fakeRepo);
    });

    testWidgets('renders language options', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LanguageScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.text('Language'), findsOneWidget);
      // Should render radio tiles for each language option
      expect(find.byType(RadioListTile<int>), findsWidgets);
    });

    testWidgets('can select a language option', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LanguageScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      // Tap the first visible radio option
      final radios = find.byType(RadioListTile<int>);
      expect(radios, findsWidgets);
      await tester.tap(radios.first);
      await tester.pump();
    });
  });
}
