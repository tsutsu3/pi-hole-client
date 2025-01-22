import 'package:pi_hole_client/screens/statistics/statistics_list.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/screens/statistics/statistics.dart';
import '../helpers.dart';

void main() async {
  initializeApp();

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
          tester.view.devicePixelRatio = 1.0;

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

      // TODO
      testWidgets(
        'should show statistics screen (no data, no queries)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 1.0;

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

          //   // Tab
          //   expect(find.text('Queries & servers'), findsWidgets);
          //   expect(find.text('Domains'), findsWidgets);
          //   expect(find.text('Clients'), findsWidgets);

          //   // default: Show Queries & servers
          //   expect(find.text('Query types'), findsOneWidget);
          //   expect(find.text('Upstream servers'), findsOneWidget);
          //   expect(find.text('Top permitted domains'), findsNothing);
          //   expect(find.text('Top blocked domains'), findsNothing);
          //   expect(find.text('Top clients (total)'), findsNothing);
          //   expect(find.text('Top clients (bloked only)'), findsNothing);
          //   expect(find.byType(PieChart), findsNWidgets(2));

          //   // Switch to Domains tab
          //   await tester.tap(find.text('Domains'));
          //   await tester.pumpAndSettle();
          //   expect(find.text('Query types'), findsNothing);
          //   expect(find.text('Upstream servers'), findsNothing);
          //   expect(find.text('Top permitted domains'), findsOneWidget);
          //   expect(find.text('Top blocked domains'), findsOneWidget);
          //   expect(find.text('Top clients (total)'), findsNothing);
          //   expect(find.text('Top clients (blocked only)'), findsNothing);
          //   expect(find.byType(StatisticsListContent), findsOneWidget);

          //   // Switch to Clients tab
          //   await tester.tap(find.text('Clients'));
          //   await tester.pumpAndSettle();
          //   expect(find.text('Query types'), findsNothing);
          //   expect(find.text('Upstream servers'), findsNothing);
          //   expect(find.text('Top permitted domains'), findsNothing);
          //   expect(find.text('Top blocked domains'), findsNothing);
          //   expect(find.text('Top clients (total)'), findsOneWidget);
          //   expect(find.text('Top clients (blocked only)'), findsOneWidget);
          //   expect(find.byType(StatisticsListContent), findsOneWidget);
        },
      );
    },
  );
}
