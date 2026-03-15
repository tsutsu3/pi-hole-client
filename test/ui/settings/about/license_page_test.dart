import 'package:flutter/material.dart' hide LicensePage;
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/about.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/licenses_screen.dart';

import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('LicensePage', () {
    testWidgets('renders on wide screen (lateral layout)', (tester) async {
      // Logical 1280x800 > 840 threshold -> lateral UI (_MasterDetailScaffold)
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LicensePage(
            applicationName: 'TestApp',
            applicationVersion: '1.0.0',
          ),
          useScaffold: false,
        ),
      );

      // Initial pump shows loading spinner while license data is fetched
      await tester.pump();

      expect(find.byType(LicensePage), findsOneWidget);
    });

    testWidgets('renders with legalese and icon on wide screen', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LicensePage(
            applicationName: 'TestApp',
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2024 TestCorp',
            applicationIcon: Icon(Icons.android),
          ),
          useScaffold: false,
        ),
      );

      await tester.pump();

      expect(find.byType(LicensePage), findsOneWidget);
    });

    testWidgets('renders license data after loading completes', (tester) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const LicensePage(applicationName: 'TestApp'),
          useScaffold: false,
        ),
      );

      // Pump until the license Future completes
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(LicensePage), findsOneWidget);
    });
  });

  group('LicensesScreen', () {
    testWidgets('renders loading state initially', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(const LicensesScreen(), useScaffold: false),
      );

      await tester.pump();

      expect(find.byType(LicensesScreen), findsOneWidget);
    });
  });
}
