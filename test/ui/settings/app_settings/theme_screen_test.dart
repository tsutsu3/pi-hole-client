import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/widgets/theme_screen.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('ThemeScreen', () {
    late FakeAppConfigRepository fakeRepo;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      fakeRepo = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(fakeRepo);
    });

    testWidgets('renders theme options', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ThemeScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('System theme'), findsOneWidget);
      expect(find.text('Light'), findsOneWidget);
      expect(find.text('Dark'), findsOneWidget);
      expect(find.byType(RadioListTile<AppThemeMode>), findsWidgets);
    });

    testWidgets('can select a theme option', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const ThemeScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.text('Dark'));
      await tester.pump();

      expect(appConfigViewModel.appThemeMode, AppThemeMode.dark);
    });
  });
}
