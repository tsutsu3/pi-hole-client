import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/disable_timers_screen.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('DisableTimersScreen', () {
    late FakeAppConfigRepository fakeRepo;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      fakeRepo = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(fakeRepo);
    });

    Future<void> pumpScreen(WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const DisableTimersScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );
      await tester.pumpAndSettle();
    }

    String fieldText(WidgetTester tester, int i) => tester
        .widget<TextField>(find.byKey(Key('disableDuration$i')))
        .controller!
        .text;

    Future<void> tapSave(WidgetTester tester) async {
      await tester.ensureVisible(find.text('Save'));
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
    }

    testWidgets('shows the current durations in their best unit', (
      tester,
    ) async {
      await pumpScreen(tester);

      expect(find.text('Disable timers'), findsOneWidget);
      expect(find.text('Disable menu'), findsOneWidget);
      // Defaults: 30 s, 1 min, 2 min, 5 min.
      expect(fieldText(tester, 0), '30');
      expect(fieldText(tester, 1), '1');
      expect(fieldText(tester, 2), '2');
      expect(fieldText(tester, 3), '5');
      expect(
        find.byKey(const ValueKey('disableDurationUnit0-seconds')),
        findsOneWidget,
      );
      for (var i = 1; i < 4; i++) {
        expect(
          find.byKey(ValueKey('disableDurationUnit$i-minutes')),
          findsOneWidget,
        );
      }
    });

    testWidgets('saves the edited durations sorted', (tester) async {
      await pumpScreen(tester);

      await tester.enterText(find.byKey(const Key('disableDuration0')), '90');
      await tester.pump();
      await tapSave(tester);

      // 90 s, 1 min, 2 min, 5 min -> sorted.
      expect(appConfigViewModel.disableDurations, [60, 90, 120, 300]);
      expect(find.text('Disable timers saved'), findsOneWidget);
      expect(fieldText(tester, 0), '1');
      expect(fieldText(tester, 1), '90');
    });

    testWidgets('changing the unit changes the saved value', (tester) async {
      await pumpScreen(tester);

      await tester.tap(
        find.byKey(const ValueKey('disableDurationUnit3-minutes')),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('hours').last);
      await tester.pumpAndSettle();
      await tapSave(tester);

      // Option 4: 5 minutes -> 5 hours.
      expect(appConfigViewModel.disableDurations, [30, 60, 120, 18000]);
    });

    testWidgets('a time out of range shows an error and blocks saving', (
      tester,
    ) async {
      await pumpScreen(tester);

      await tester.enterText(find.byKey(const Key('disableDuration2')), '0');
      await tester.pump();

      expect(
        find.text('Enter a time between 1 second and 24 hours'),
        findsOneWidget,
      );
      await tester.ensureVisible(find.text('Save'));
      final button = tester.widget<FilledButton>(find.byType(FilledButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('the same time twice shows an error and blocks saving', (
      tester,
    ) async {
      await pumpScreen(tester);

      // Option 2 becomes 1 minute, like option 1.
      await tester.enterText(find.byKey(const Key('disableDuration2')), '1');
      await tester.pump();

      expect(find.text('This time is already in the list'), findsOneWidget);
      await tester.ensureVisible(find.text('Save'));
      final button = tester.widget<FilledButton>(find.byType(FilledButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('shows an error when saving fails', (tester) async {
      fakeRepo.shouldFailUpdate = true;
      await pumpScreen(tester);

      await tester.enterText(find.byKey(const Key('disableDuration0')), '45');
      await tester.pump();
      await tapSave(tester);

      expect(find.text('Disable timers could not be saved'), findsOneWidget);
      expect(appConfigViewModel.disableDurations, [30, 60, 120, 300]);
      expect(fieldText(tester, 0), '45');
    });
  });
}
