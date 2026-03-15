import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/model/app_screen.dart';
import 'package:pi_hole_client/ui/core/ui/layout/navigation_rail.dart';

import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  const screens = [
    AppScreen(icon: Icon(Icons.home), name: 'home'),
    AppScreen(icon: Icon(Icons.bar_chart), name: 'statistics'),
    AppScreen(icon: Icon(Icons.list), name: 'logs'),
    AppScreen(icon: Icon(Icons.dns), name: 'domains'),
    AppScreen(icon: Icon(Icons.settings), name: 'settings'),
  ];

  group('CustomNavigationRail', () {
    testWidgets('renders all screen labels', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          CustomNavigationRail(
            screens: screens,
            selectedScreen: 0,
            onChange: (_) {},
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Statistics'), findsOneWidget);
      expect(find.text('Logs'), findsOneWidget);
      expect(find.text('Domains'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('calls onChange when destination tapped', (tester) async {
      int? selected;

      await tester.pumpWidget(
        buildTestApp(
          CustomNavigationRail(
            screens: screens,
            selectedScreen: 0,
            onChange: (i) => selected = i,
          ),
        ),
      );

      await tester.tap(find.text('Statistics'));
      await tester.pump();

      expect(selected, 1);
    });

    testWidgets('renders connect screen label', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          CustomNavigationRail(
            screens: const [AppScreen(icon: Icon(Icons.link), name: 'connect')],
            selectedScreen: 0,
            onChange: (_) {},
          ),
        ),
      );

      expect(find.text('Connect'), findsOneWidget);
    });

    testWidgets('returns empty string for unknown screen name', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          CustomNavigationRail(
            screens: const [AppScreen(icon: Icon(Icons.help), name: 'unknown')],
            selectedScreen: 0,
            onChange: (_) {},
          ),
        ),
      );

      // Empty string label — just verify widget renders without error
      expect(find.byType(NavigationRail), findsOneWidget);
    });
  });
}
