import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_visibility_ticker.dart';

import '../../../../../testing/test_app.dart';

// ---------------------------------------------------------------------------
// Test scaffold
// ---------------------------------------------------------------------------

class _TabTestWidget extends StatefulWidget {
  const _TabTestWidget({this.tickerEnabled = true});

  final bool tickerEnabled;

  @override
  State<_TabTestWidget> createState() => _TabTestWidgetState();
}

class _TabTestWidgetState extends State<_TabTestWidget>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final body = Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'A'),
            Tab(text: 'B'),
            Tab(text: 'C'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          TabVisibilityTicker(
            controller: controller,
            index: 0,
            child: const Text('Content A'),
          ),
          TabVisibilityTicker(
            controller: controller,
            index: 1,
            child: const Text('Content B'),
          ),
          TabVisibilityTicker(
            controller: controller,
            index: 2,
            child: const Text('Content C'),
          ),
        ],
      ),
    );

    return TickerMode(enabled: widget.tickerEnabled, child: body);
  }
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() async {
  await initTestApp();

  group('TabVisibilityTicker', () {
    testWidgets('shows only the active tab at rest', (tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(const _TabTestWidget(), useScaffold: false),
      );
      await tester.pump();

      expect(find.text('Content A'), findsOneWidget);
      expect(find.text('Content B'), findsNothing);
      expect(find.text('Content C'), findsNothing);
    });

    testWidgets('shows new tab and hides old tab after tap switch', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(const _TabTestWidget(), useScaffold: false),
      );
      await tester.pump();

      await tester.tap(find.text('B'));
      await tester.pumpAndSettle();

      expect(find.text('Content A'), findsNothing);
      expect(find.text('Content B'), findsOneWidget);
      expect(find.text('Content C'), findsNothing);
    });

    testWidgets(
      'mounts both departing and arriving tabs during gesture swipe',
      (tester) async {
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildTestApp(const _TabTestWidget(), useScaffold: false),
        );
        await tester.pump();

        // Begin a swipe from tab A toward tab B (drag left by half the width).
        final gesture = await tester.startGesture(
          tester.getCenter(find.byType(TabBarView)),
        );
        await gesture.moveBy(const Offset(-300, 0));
        await tester.pump();

        // Both tabs must be mounted during the in-progress swipe.
        expect(find.text('Content A'), findsOneWidget);
        expect(find.text('Content B'), findsOneWidget);

        await gesture.up();
        await tester.pumpAndSettle();
      },
    );

    testWidgets('unmounts departing tab after swipe completes', (tester) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(const _TabTestWidget(), useScaffold: false),
      );
      await tester.pump();

      // Fling left to complete a swipe to tab B.
      await tester.fling(find.byType(TabBarView), const Offset(-600, 0), 1000);
      await tester.pumpAndSettle();

      expect(find.text('Content A'), findsNothing);
      expect(find.text('Content B'), findsOneWidget);
    });

    testWidgets(
      'mounts only departure and destination tabs during non-adjacent tap jump',
      (tester) async {
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildTestApp(const _TabTestWidget(), useScaffold: false),
        );
        await tester.pump();

        // Tap tab C while on tab A — non-adjacent jump (index 0 → 2).
        await tester.tap(find.text('C'));
        await tester.pump(); // process tap → indexIsChanging=true, index=2
        await tester.pump(const Duration(milliseconds: 50)); // mid-animation

        // Only the departure (A) and destination (C) must be mounted.
        // The intermediate tab B must stay unmounted.
        expect(find.text('Content A'), findsOneWidget);
        expect(find.text('Content B'), findsNothing);
        expect(find.text('Content C'), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.text('Content A'), findsNothing);
        expect(find.text('Content B'), findsNothing);
        expect(find.text('Content C'), findsOneWidget);
      },
    );

    testWidgets('hides all tab children when TickerMode is disabled', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const _TabTestWidget(tickerEnabled: false),
          useScaffold: false,
        ),
      );
      await tester.pump();

      expect(find.text('Content A'), findsNothing);
      expect(find.text('Content B'), findsNothing);
      expect(find.text('Content C'), findsNothing);
    });
  });
}
