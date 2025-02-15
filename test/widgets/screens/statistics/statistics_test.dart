import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/screens/statistics/statistics.dart';
import 'package:pi_hole_client/screens/statistics/statistics_list.dart';
import 'package:pi_hole_client/screens/statistics/statistics_triple_column.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../helpers.dart';
import '../utils.dart';

void main() async {
  await initializeApp();

  group(
    'Statistics Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();

        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show statistics screen (all graphs are rendered)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

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
        },
      );

      testWidgets(
        'should show loading screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockStatusProvider.getStatusLoading)
              .thenReturn(LoadStatus.loading);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

          expect(find.byType(Statistics), findsOneWidget);
          await tester.pump();

          expect(find.text('Domains'), findsWidgets);

          // Switch to Domains tab
          await tester.tap(find.text('Domains'));
          await tester.pump();
          showText();
          expect(find.text('Loading stats...'), findsOneWidget);
          expect(find.byType(StatisticsListContent), findsNothing);
        },
      );

      testWidgets(
        'should show error screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockStatusProvider.getStatusLoading)
              .thenReturn(LoadStatus.error);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

          expect(find.byType(Statistics), findsOneWidget);
          await tester.pump();

          expect(find.text('Domains'), findsWidgets);

          // Switch to Domains tab
          await tester.tap(find.text('Domains'));
          await tester.pump();
          showText();
          expect(find.text('Stats could not be loaded'), findsOneWidget);
          expect(find.byType(StatisticsListContent), findsNothing);
        },
      );

      testWidgets(
        'should show statistics screen (no data, no queries)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          final realtimeStatus = RealtimeStatus.fromJson(
            {
              'domains_being_blocked': 121860,
              'dns_queries_today': 16,
              'ads_blocked_today': 1,
              'ads_percentage_today': 6.25,
              'unique_domains': 11,
              'queries_forwarded': 9,
              'queries_cached': 6,
              'clients_ever_seen': 2,
              'unique_clients': 2,
              'dns_queries_all_types': 16,
              'reply_UNKNOWN': 0,
              'reply_NODATA': 0,
              'reply_NXDOMAIN': 3,
              'reply_CNAME': 0,
              'reply_IP': 10,
              'reply_DOMAIN': 3,
              'reply_RRNAME': 0,
              'reply_SERVFAIL': 0,
              'reply_REFUSED': 0,
              'reply_NOTIMP': 0,
              'reply_OTHER': 0,
              'reply_DNSSEC': 0,
              'reply_NONE': 0,
              'reply_BLOB': 0,
              'dns_queries_all_replies': 16,
              'privacy_level': 0,
              'status': 'enabled',
              'gravity_last_updated': {
                'file_exists': true,
                'absolute': 1732972589,
                'relative': {'days': 5, 'hours': 18, 'minutes': 14},
              },
              'top_queries': {},
              'top_ads': {},
              'top_sources': {},
              'top_sources_blocked': {},
              'forward_destinations': {},
              'querytypes': {},
            },
          );

          when(testSetup.mockStatusProvider.getRealtimeStatus)
              .thenReturn(realtimeStatus);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

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
          expect(find.text('No data'), findsNWidgets(4));
          expect(find.byType(StatisticsListContent), findsOneWidget);

          // Switch to Clients tab
          await tester.tap(find.text('Clients'));
          await tester.pumpAndSettle();
          expect(find.text('No data'), findsNWidgets(4));
          expect(find.byType(StatisticsListContent), findsOneWidget);
        },
      );

      testWidgets(
        'should show triple column statistics screen (loaded)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2400, 1080);
          tester.view.devicePixelRatio = 1.5;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

          expect(find.byType(Statistics), findsOneWidget);
          expect(find.byType(StatisticsTripleColumn), findsOneWidget);
          expect(find.text('Queries & servers'), findsWidgets);
          expect(find.text('Domains'), findsWidgets);
          expect(find.text('Clients'), findsWidgets);
        },
      );

      testWidgets(
        'should show triple column statistics screen (error)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2400, 1080);
          tester.view.devicePixelRatio = 1.5;

          when(testSetup.mockStatusProvider.getStatusLoading)
              .thenReturn(LoadStatus.error);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

          expect(find.byType(Statistics), findsOneWidget);
          expect(find.byType(StatisticsTripleColumn), findsOneWidget);
          expect(find.text('Stats could not be loaded'), findsOneWidget);
          expect(find.text('Queries & servers'), findsNothing);
          expect(find.text('Domains'), findsNothing);
          expect(find.text('Clients'), findsNothing);
        },
      );

      testWidgets(
        'should show triple column statistics screen (loading)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2400, 1080);
          tester.view.devicePixelRatio = 1.5;

          when(testSetup.mockStatusProvider.getStatusLoading)
              .thenReturn(LoadStatus.loading);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const Statistics(),
            ),
          );

          expect(find.byType(Statistics), findsOneWidget);
          expect(find.byType(StatisticsTripleColumn), findsOneWidget);
          expect(find.text('Loading stats...'), findsOneWidget);
          expect(find.text('Queries & servers'), findsNothing);
          expect(find.text('Domains'), findsNothing);
          expect(find.text('Clients'), findsNothing);
        },
      );
    },
  );
}
