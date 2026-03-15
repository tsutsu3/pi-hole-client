import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/log_refresh_interval_screen.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('RefreshOption (log refresh)', () {
    test('indexFromTime returns correct index for known time', () {
      expect(RefreshOption.indexFromTime(3), 0);
      expect(RefreshOption.indexFromTime(5), 1);
      expect(RefreshOption.indexFromTime(10), 2);
      expect(RefreshOption.indexFromTime(15), RefreshOption.defaultIndex);
      expect(RefreshOption.indexFromTime(30), 4);
      expect(RefreshOption.indexFromTime(60), 5);
    });

    test('indexFromTime returns last index for unknown time', () {
      expect(RefreshOption.indexFromTime(999), RefreshOption.all.length - 1);
      expect(RefreshOption.indexFromTime(0), RefreshOption.all.length - 1);
    });

    test('timeFromIndex returns correct time for standard options', () {
      expect(RefreshOption.timeFromIndex(0), 3);
      expect(RefreshOption.timeFromIndex(1), 5);
      expect(RefreshOption.timeFromIndex(2), 10);
      expect(RefreshOption.timeFromIndex(3), 15);
      expect(RefreshOption.timeFromIndex(4), 30);
      expect(RefreshOption.timeFromIndex(5), 60);
    });

    test('timeFromIndex returns 0 for custom option (-1)', () {
      final customIndex = RefreshOption.all.length - 1;
      expect(RefreshOption.timeFromIndex(customIndex), 0);
    });

    test('defaultTime and defaultIndex are consistent', () {
      expect(
        RefreshOption.timeFromIndex(RefreshOption.defaultIndex),
        RefreshOption.defaultTime,
      );
    });
  });

  group('LogRefreshIntervalScreen widget tests', () {
    late FakeAppConfigRepository fakeRepo;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      fakeRepo = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(fakeRepo);
    });

    testWidgets('renders the screen with options', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LogRefreshIntervalScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.byType(LogRefreshIntervalScreen), findsOneWidget);
      expect(find.text('Log refresh interval'), findsOneWidget);
      expect(find.text('3 seconds'), findsOneWidget);
      expect(find.text('5 seconds'), findsOneWidget);
      expect(find.text('10 seconds'), findsOneWidget);
      expect(find.text('15 seconds'), findsOneWidget);
      expect(find.text('30 seconds'), findsOneWidget);
      expect(find.text('60 seconds'), findsOneWidget);
      expect(find.text('Custom'), findsOneWidget);
    });

    testWidgets('save succeeds when selecting a preset option', (
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
          const LogRefreshIntervalScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.text('30 seconds'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Update time changed successfully.'), findsOneWidget);
    });

    testWidgets('save fails when repository returns error', (
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
          const LogRefreshIntervalScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      fakeRepo.shouldFailUpdate = true;
      await tester.tap(find.text('30 seconds'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Cannot change update time'), findsOneWidget);
    });

    testWidgets('custom input is shown when Custom is selected', (
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
          const LogRefreshIntervalScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.text('Custom'));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('custom input saves valid value on submit', (
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
          const LogRefreshIntervalScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.text('Custom'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '20');
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Update time changed successfully.'), findsOneWidget);
    });

    testWidgets('custom input shows error for invalid value', (
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
          const LogRefreshIntervalScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.text('Custom'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '0');
      await tester.pump();
      await tester.pumpAndSettle();

      expect(
        find.text('Please enter a number between 1 and 86400 seconds'),
        findsOneWidget,
      );
    });
  });
}
