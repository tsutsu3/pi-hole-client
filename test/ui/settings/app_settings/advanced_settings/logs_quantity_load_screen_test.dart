import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/logs_quantity_load_screen.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('LogOption', () {
    test('timeFromIndex returns correct time for valid indices', () {
      expect(LogOption.timeFromIndex(0), 0.5);
      expect(LogOption.timeFromIndex(1), 1.0);
      expect(LogOption.timeFromIndex(2), 2.0);
      expect(LogOption.timeFromIndex(3), 4.0);
      expect(LogOption.timeFromIndex(4), 6.0);
      expect(LogOption.timeFromIndex(5), 8.0);
    });

    test('timeFromIndex returns 2.0 for out-of-range index', () {
      expect(LogOption.timeFromIndex(-1), 2.0);
      expect(LogOption.timeFromIndex(99), 2.0);
    });

    test('indexFromTime returns correct index for known times', () {
      expect(LogOption.indexFromTime(0.5), 0);
      expect(LogOption.indexFromTime(1.0), 1);
      expect(LogOption.indexFromTime(2.0), 2);
      expect(LogOption.indexFromTime(4.0), 3);
      expect(LogOption.indexFromTime(6.0), 4);
      expect(LogOption.indexFromTime(8.0), 5);
    });

    test('indexFromTime clamps to 0 for unknown time', () {
      expect(LogOption.indexFromTime(99.0), 0);
      expect(LogOption.indexFromTime(-1.0), 0);
    });

    test('round-trip: timeFromIndex(indexFromTime(t)) == t for all options', () {
      for (final option in LogOption.all) {
        final index = LogOption.indexFromTime(option.time);
        expect(LogOption.timeFromIndex(index), option.time);
      }
    });
  });

  group('LogsQuantityLoadScreen widget tests', () {
    late FakeAppConfigRepository fakeRepo;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      fakeRepo = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(fakeRepo);
    });

    testWidgets('shows not-supported screen for v6', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const LogsQuantityLoadScreen(apiVersion: 'v6'),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.text('Logs quantity per request'), findsOneWidget);
      // v6 shows a not-supported message
      expect(
        find.textContaining('no longer applicable'),
        findsOneWidget,
      );
    });

    testWidgets('renders radio options for v5', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LogsQuantityLoadScreen(apiVersion: 'v5'),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.text('Logs quantity per request'), findsOneWidget);
      expect(find.text('30 minutes'), findsOneWidget);
      expect(find.text('1 hour'), findsOneWidget);
      expect(find.text('2 hours'), findsOneWidget);
      expect(find.text('4 hours'), findsOneWidget);
      expect(find.text('6 hours'), findsOneWidget);
      expect(find.text('8 hours'), findsOneWidget);
    });

    testWidgets('save succeeds when selecting an option in v5', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LogsQuantityLoadScreen(apiVersion: 'v5'),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.text('4 hours'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Logs quantity per request updated successfully'),
        findsOneWidget,
      );
    });

    testWidgets('save fails when repository returns error in v5', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LogsQuantityLoadScreen(apiVersion: 'v5'),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      fakeRepo.shouldFailUpdate = true;
      await tester.tap(find.text('4 hours'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text("Logs quantity per request couldn't be updated"),
        findsOneWidget,
      );
    });
  });
}
