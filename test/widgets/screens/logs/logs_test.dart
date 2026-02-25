import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/logs/logs.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_filters_modal.dart';

import '../../helpers.dart' show TestSetupHelper, initializeApp, testLogsList;

void main() async {
  await initializeApp();

  group('Query logs screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show logs screen on mobile layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      // Show logs screen
      expect(find.byType(Logs), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Query logs'), findsOneWidget);
      expect(find.text('white.example.com'), findsWidgets);
      expect(find.text('Choose a query log to see its details.'), findsNothing);
    });

    testWidgets('should show error message when logs could not be loaded', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      // Override mock to simulate error state
      when(testSetup.mockLogsViewModel.loadStatus)
          .thenReturn(LoadStatus.error);
      when(testSetup.mockLogsViewModel.logsListDisplay).thenReturn([]);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text("Logs couldn't be loaded"), findsWidgets);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('should set blacklist domains on tablet layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2176, 1600);
      tester.view.devicePixelRatio = 2.0;

      // Pre-select a log so that the detail pane is visible on tablet
      final selectedLog = testLogsList.first;
      when(testSetup.mockLogsViewModel.selectedLog).thenReturn(selectedLog);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      // Show logs screen with detail pane
      expect(find.byType(Logs), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Query logs'), findsOneWidget);
      expect(find.text('white.example.com'), findsWidgets);
      expect(find.text('Log details'), findsOneWidget);

      // Tap blacklist button (isAllowedOrRetried returns true → shows blacklist button)
      expect(find.byIcon(Icons.gpp_bad_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.gpp_bad_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      // Return to logs screen (Not raise Exception)
      expect(find.text('Domain added to blacklist.'), findsWidgets);
      expect(find.byType(Logs), findsOneWidget);
    });

    testWidgets('should search logs', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('white.example.com'), findsWidgets);

      // Simulate search filtering by re-stubbing logsListDisplay
      when(testSetup.mockLogsViewModel.logsListDisplay).thenReturn([]);

      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.search_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Search by URL...'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'not.com');
      await tester.pumpAndSettle();

      verify(testSetup.mockLogsViewModel.setSearchText('not.com')).called(1);
      expect(find.text('white.example.com'), findsNothing);
    });

    testWidgets('should show filter logs and apply filter(close modal)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      // show logs screen
      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();

      // tap filter button
      expect(find.byIcon(Icons.filter_list_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.filter_list_rounded));
      await tester.pumpAndSettle();

      // show filter modal
      expect(find.byType(LogsFiltersModal), findsOneWidget);
      expect(find.text('Filters'), findsOneWidget);
      expect(find.text('Blocked'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);

      // tap blocked filter
      await tester.tap(find.text('Blocked'));
      await tester.pumpAndSettle();

      // apply filter and close modal
      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      expect(find.byType(LogsFiltersModal), findsNothing);
      expect(find.text('Filters'), findsNothing);
    });

    testWidgets('should show filter logs and tap close(close modal)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      // show logs screen
      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();

      // tap filter button
      expect(find.byIcon(Icons.filter_list_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.filter_list_rounded));
      await tester.pumpAndSettle();

      // show filter modal
      expect(find.byType(LogsFiltersModal), findsOneWidget);
      expect(find.text('Filters'), findsOneWidget);
      expect(find.text('Blocked'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);

      // tap Allowd filter
      await tester.tap(find.text('Allowed'));
      await tester.pumpAndSettle();

      // close modal
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(find.byType(LogsFiltersModal), findsNothing);
      expect(find.text('Filters'), findsNothing);
    });

    testWidgets('should show filter logs on tablet layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2176, 1600);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      // show logs screen
      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();

      // tap filter button
      expect(find.byIcon(Icons.filter_list_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.filter_list_rounded));
      await tester.pumpAndSettle();

      // show filter modal
      expect(find.byType(LogsFiltersModal), findsOneWidget);
      expect(find.text('Filters'), findsOneWidget);
      expect(find.text('Blocked'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);

      // tap Allowd filter
      await tester.tap(find.text('Allowed'));
      await tester.pumpAndSettle();

      // close modal
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(find.byType(LogsFiltersModal), findsNothing);
      expect(find.text('Filters'), findsNothing);
    });

    testWidgets('should show sort modal', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.sort_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.sort_rounded));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_upward_rounded), findsOneWidget);
      expect(find.byIcon(Icons.arrow_downward_rounded), findsOneWidget);
      expect(find.text('From latest to oldest'), findsOneWidget);
      expect(find.text('From oldest to latest'), findsOneWidget);
      await tester.tap(find.text('From oldest to latest'));
      await tester.pumpAndSettle();

      expect(find.byType(Logs), findsOneWidget);
      expect(find.byType(PopupMenuItem), findsNothing);
    });
  });

  group('Query logs screen tests (v5)', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock();
    });

    testWidgets('should show logs screen on mobile layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      // Show logs screen
      expect(find.byType(Logs), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Query logs'), findsOneWidget);
      expect(find.text('white.example.com'), findsWidgets);
      expect(find.text('Choose a query log to see its details.'), findsNothing);
    });

    testWidgets('should show error message when logs could not be loaded', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      // Override mock to simulate error state
      when(testSetup.mockLogsViewModel.loadStatus)
          .thenReturn(LoadStatus.error);
      when(testSetup.mockLogsViewModel.logsListDisplay).thenReturn([]);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(Logs(
              logsViewModel: testSetup.mockLogsViewModel,
              appConfigViewModel: testSetup.mockConfigProvider,
            )));

      expect(find.byType(Logs), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text("Logs couldn't be loaded"), findsWidgets);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });
  });
}
