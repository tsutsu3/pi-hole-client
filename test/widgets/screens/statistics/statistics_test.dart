import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/ui/statistics/statistics.dart';
import 'package:pi_hole_client/ui/statistics/statistics_list.dart';
import 'package:pi_hole_client/ui/statistics/statistics_triple_column.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('Statistics Screen Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();

      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show statistics screen (all graphs are rendered)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      await tester.pump();

      expect(find.text('Statistics'), findsWidgets);

      // Tab
      expect(find.text('Queries & servers'), findsWidgets);
      expect(find.text('Domains'), findsWidgets);
      expect(find.text('Clients'), findsWidgets);

      // default: Show Queries & servers
      expect(find.text('Query types'), findsOneWidget);
      expect(find.text('Upstream servers'), findsOneWidget);
      expect(find.text('Top permitted domains'), findsNothing);
      expect(find.text('Top blocked domains'), findsNothing);
      expect(find.text('Top clients (total)'), findsNothing);
      expect(find.text('Top clients (bloked only)'), findsNothing);
      expect(find.byType(PieChart), findsNWidgets(2));

      // Switch to Domains tab
      await tester.tap(find.text('Domains'));
      await tester.pumpAndSettle();
      expect(find.text('Query types'), findsNothing);
      expect(find.text('Upstream servers'), findsNothing);
      expect(find.text('Top permitted domains'), findsOneWidget);
      expect(find.text('Top blocked domains'), findsOneWidget);
      expect(find.text('Top clients (total)'), findsNothing);
      expect(find.text('Top clients (blocked only)'), findsNothing);
      expect(find.byType(StatisticsListContent), findsOneWidget);

      // Switch to Clients tab
      await tester.tap(find.text('Clients'));
      await tester.pumpAndSettle();
      expect(find.text('Query types'), findsNothing);
      expect(find.text('Upstream servers'), findsNothing);
      expect(find.text('Top permitted domains'), findsNothing);
      expect(find.text('Top blocked domains'), findsNothing);
      expect(find.text('Top clients (total)'), findsOneWidget);
      expect(find.text('Top clients (blocked only)'), findsOneWidget);
      expect(find.byType(StatisticsListContent), findsOneWidget);

      // Switch to DNS tab
      await tester.tap(find.text('DNS'));
      await tester.pumpAndSettle();
      expect(find.text('DNS cache metrics'), findsOneWidget);
      expect(find.text('DNS reply metrics'), findsOneWidget);
      expect(find.byType(PieChart), findsNWidgets(2));
    });

    testWidgets('should show loading screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockStatusViewModel.getStatusLoading,
      ).thenReturn(LoadStatus.loading);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      await tester.pump();

      expect(find.text('Domains'), findsWidgets);

      // Switch to Domains tab
      await tester.tap(find.text('Domains'));
      await tester.pump();
      expect(find.text('Loading stats...'), findsOneWidget);
      expect(find.byType(StatisticsListContent), findsNothing);
    });

    testWidgets('should show error screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockStatusViewModel.getStatusLoading,
      ).thenReturn(LoadStatus.error);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      await tester.pump();

      expect(find.text('Domains'), findsWidgets);

      // Switch to Domains tab
      await tester.tap(find.text('Domains'));
      await tester.pump();
      expect(find.text('Stats could not be loaded'), findsOneWidget);
      expect(find.byType(StatisticsListContent), findsNothing);
    });

    testWidgets('should show statistics screen (no data, no queries)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      final realtimeStatus = RealtimeStatus(
        summary: Summary(
          domainsBeingBlocked: 121860,
          dnsQueriesToday: 16,
          adsBlockedToday: 1,
          adsPercentageToday: 6.25,
          uniqueDomains: 11,
          queriesForwarded: 9,
          queriesCached: 6,
          clientsEverSeen: 2,
          uniqueClients: 2,
          dnsQueriesAllTypes: 16,
          replies: const ReplyCounts(
            unknown: 0, nodata: 0, nxDomain: 3, cname: 0, ip: 10, domain: 3,
            rrname: 0, servfail: 0, refused: 0, notimp: 0, other: 0,
            dnssec: 0, none: 0, blob: 0, total: 16,
          ),
          queryTypes: const [],
        ),
        status: DnsBlockingStatus.enabled,
        topDomains: const TopDomains(topQueries: [], topAds: []),
        topClients: const TopClients(topSources: [], topSourcesBlocked: []),
        forwardDestinations: const [],
      );

      when(
        testSetup.mockStatusViewModel.getRealtimeStatus,
      ).thenReturn(realtimeStatus);

      when(testSetup.mockStatusViewModel.getFtlDnsMetrics).thenReturn(null);
      when(testSetup.mockStatusViewModel.getDnsCache).thenReturn(null);
      when(testSetup.mockStatusViewModel.getDnsReplies).thenReturn(null);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      await tester.pump();

      expect(find.text('Statistics'), findsWidgets);

      // default: Show Queries & servers
      expect(find.text('Query types'), findsOneWidget);
      expect(find.text('Upstream servers'), findsOneWidget);
      expect(find.text('No data'), findsNWidgets(2));
      expect(find.byType(PieChart), findsNothing);

      // Switch to Domains tab
      await tester.tap(find.text('Domains'));
      await tester.pumpAndSettle();
      expect(find.text('No data'), findsNWidgets(2));
      expect(find.byType(StatisticsListContent), findsOneWidget);

      // Switch to Clients tab
      await tester.tap(find.text('Clients'));
      await tester.pumpAndSettle();
      expect(find.text('No data'), findsNWidgets(2));
      expect(find.byType(StatisticsListContent), findsOneWidget);

      // Switch to DNS tab
      await tester.tap(find.text('DNS'));
      await tester.pumpAndSettle();
      expect(find.text('No data'), findsNWidgets(2));
      expect(find.byType(PieChart), findsNothing);
    });

    testWidgets('should show triple column statistics screen (loaded)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2400, 1080);
      tester.view.devicePixelRatio = 1.5;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      expect(find.byType(StatisticsTripleColumn), findsOneWidget);
      expect(find.text('Queries & servers'), findsWidgets);
      expect(find.text('Domains'), findsWidgets);
      expect(find.text('Clients'), findsWidgets);
    });

    testWidgets(
      'should show triple column statistics screen (loaded, 4th column)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(2400, 1080);
        tester.view.devicePixelRatio = 1.5;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

        expect(find.byType(Statistics), findsOneWidget);
        expect(find.byType(StatisticsTripleColumn), findsOneWidget);
        expect(find.byIcon(Icons.chevron_right), findsWidgets);

        // swipe to the right
        await tester.drag(
          find.byType(StatisticsTripleColumn),
          const Offset(-500, 0),
        );
        await tester.pumpAndSettle();

        expect(find.text('Domains'), findsWidgets);
        expect(find.text('Clients'), findsWidgets);
        expect(find.text('DNS'), findsOneWidget);
      },
    );

    testWidgets('should show triple column statistics screen (error)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2400, 1080);
      tester.view.devicePixelRatio = 1.5;

      when(
        testSetup.mockStatusViewModel.getStatusLoading,
      ).thenReturn(LoadStatus.error);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      expect(find.byType(StatisticsTripleColumn), findsOneWidget);
      expect(find.text('Stats could not be loaded'), findsOneWidget);
      expect(find.text('Queries & servers'), findsNothing);
      expect(find.text('Domains'), findsNothing);
      expect(find.text('Clients'), findsNothing);
    });

    testWidgets('should show triple column statistics screen (loading)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2400, 1080);
      tester.view.devicePixelRatio = 1.5;

      when(
        testSetup.mockStatusViewModel.getStatusLoading,
      ).thenReturn(LoadStatus.loading);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Statistics()));

      expect(find.byType(Statistics), findsOneWidget);
      expect(find.byType(StatisticsTripleColumn), findsOneWidget);
      expect(find.text('Loading stats...'), findsOneWidget);
      expect(find.text('Queries & servers'), findsNothing);
      expect(find.text('Domains'), findsNothing);
      expect(find.text('Clients'), findsNothing);
    });
  });
}
