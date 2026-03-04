import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart' as logs_model;
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_filters_modal.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_screen.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_logs_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/test_app.dart';

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

const _serverV5 = Server(
  address: 'http://localhost:8081',
  alias: 'test v5',
  defaultServer: false,
  apiVersion: 'v5',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

final _testLogsList = [
  logs_model.Log(
    id: 1,
    dateTime: DateTime.now().subtract(const Duration(minutes: 10)),
    type: DnsRecordType.a,
    url: 'white.example.com',
    device: '192.168.100.2',
    status: QueryStatusType.forwarded,
    replyType: ReplyType.ip,
    replyTime: 0.019,
    answeredBy: 'localhost#5353',
  ),
];

void main() async {
  await initTestApp();

  group('Query logs screen tests', () {
    late AppConfigViewModel appConfigViewModel;
    late FakeServersViewModel serversViewModel;
    late FakeLogsViewModel logsViewModel;
    setUp(() {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = _serverV6
        ..selectedServerEnabled = true
        ..serversList = [_serverV6];

      logsViewModel = FakeLogsViewModel()
        ..logsList = _testLogsList
        ..logsListDisplay = _testLogsList
        ..loadStatus = LoadStatus.loaded
        ..screenActive = true
        ..sortStatus = 0
        ..searchText = ''
        ..hasActiveChips = false
        ..isFiltering = false
        ..logsPerQuery = 2.0
        ..statusSelected = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        ..defaultSelected = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        ..statusAllowedAndRetried = [3, 4, 13, 14, 15]
        ..requestStatus = RequestStatus.all
        ..selectedClients = ['192.168.100.2']
        ..selectedDomain = 'white.example.com'
        ..startTime = DateTime.now()
        ..endTime = DateTime.now().add(const Duration(hours: 2))
        ..totalClients = ['localhost', '192.168.100.2'];
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

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      // Show logs screen
      expect(find.byType(LogsScreen), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Query logs'), findsOneWidget);
      expect(find.text('white.example.com'), findsWidgets);
      expect(
        find.text('Choose a query log to see its details.'),
        findsNothing,
      );
    });

    testWidgets('should show error message when logs could not be loaded', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      // Override to simulate error state
      logsViewModel.loadStatus = LoadStatus.error;
      logsViewModel.logsListDisplay = [];

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsScreen), findsOneWidget);
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
      logsViewModel.selectedLog = _testLogsList.first;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      // Show logs screen with detail pane
      expect(find.byType(LogsScreen), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Query logs'), findsOneWidget);
      expect(find.text('white.example.com'), findsWidgets);
      expect(find.text('Log details'), findsOneWidget);

      // Tap blacklist button (isAllowedOrRetried returns true -> shows
      // blacklist button)
      expect(find.byIcon(Icons.gpp_bad_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.gpp_bad_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      // Return to logs screen (not raise Exception)
      expect(find.text('Domain added to blacklist.'), findsWidgets);
      expect(find.byType(LogsScreen), findsOneWidget);
    });

    testWidgets('should search logs', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsScreen), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('white.example.com'), findsWidgets);

      // Simulate search filtering by setting logsListDisplay to empty
      logsViewModel.logsListDisplay = [];

      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.search_rounded));
      await tester.pumpAndSettle();
      expect(find.text('Search by URL...'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'not.com');
      await tester.pumpAndSettle();

      expect(logsViewModel.setSearchTextCallCount, 1);
      expect(logsViewModel.lastSearchText, 'not.com');
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

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      // show logs screen
      expect(find.byType(LogsScreen), findsOneWidget);
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

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      // show logs screen
      expect(find.byType(LogsScreen), findsOneWidget);
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

      // tap Allowed filter
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

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      // show logs screen
      expect(find.byType(LogsScreen), findsOneWidget);
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

      // tap Allowed filter
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

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsScreen), findsOneWidget);
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

      expect(find.byType(LogsScreen), findsOneWidget);
      expect(find.byType(PopupMenuItem), findsNothing);
    });

    testWidgets('should change sort when tapping radio button', (
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
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byIcon(Icons.sort_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.sort_rounded));
      await tester.pumpAndSettle();

      expect(find.byType(Radio<int>), findsNWidgets(2));
      await tester.tap(find.byType(Radio<int>).last, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(logsViewModel.updateSortStatusCallCount, 1);
      expect(logsViewModel.lastSortStatus, 1);
      expect(find.byType(PopupMenuItem), findsNothing);
    });
  });

  group('Query logs screen tests (v5)', () {
    late AppConfigViewModel appConfigViewModel;
    late FakeServersViewModel serversViewModel;
    late FakeLogsViewModel logsViewModel;

    setUp(() {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = _serverV5
        ..selectedServerEnabled = true
        ..serversList = [_serverV5];

      logsViewModel = FakeLogsViewModel()
        ..logsList = _testLogsList
        ..logsListDisplay = _testLogsList
        ..loadStatus = LoadStatus.loaded
        ..screenActive = true
        ..sortStatus = 0
        ..searchText = ''
        ..hasActiveChips = false
        ..isFiltering = false
        ..logsPerQuery = 2.0
        ..statusSelected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14]
        ..defaultSelected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14]
        ..statusAllowedAndRetried = [2, 3, 12, 13, 14]
        ..requestStatus = RequestStatus.all
        ..selectedClients = ['192.168.100.2']
        ..selectedDomain = 'white.example.com'
        ..startTime = DateTime.now()
        ..endTime = DateTime.now().add(const Duration(hours: 2))
        ..totalClients = ['localhost', '192.168.100.2'];
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

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      // Show logs screen
      expect(find.byType(LogsScreen), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Query logs'), findsOneWidget);
      expect(find.text('white.example.com'), findsWidgets);
      expect(
        find.text('Choose a query log to see its details.'),
        findsNothing,
      );
    });

    testWidgets('should show error message when logs could not be loaded', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      // Override to simulate error state
      logsViewModel.loadStatus = LoadStatus.error;
      logsViewModel.logsListDisplay = [];

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsScreen(
            logsViewModel: logsViewModel,
            appConfigViewModel: appConfigViewModel,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsScreen), findsOneWidget);
      expect(find.text('Query logs'), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text("Logs couldn't be loaded"), findsWidgets);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });
  });
}
