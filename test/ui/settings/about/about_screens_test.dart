import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/app_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/privacy_screen.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('AppDetailScreen', () {
    testWidgets('renders screen with app info sections', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp(const AppDetailScreen()));

      expect(find.text('Application Detail'), findsOneWidget);
      expect(find.text('App Information'), findsOneWidget);
      expect(find.text('Support and Feedback'), findsOneWidget);
      expect(find.text('Version Requirements'), findsOneWidget);
      expect(find.text('App version'), findsOneWidget);
      expect(find.text('Created by'), findsOneWidget);
      expect(find.text('tsutsu3'), findsOneWidget);
    });

    testWidgets('renders with custom app version', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(const AppDetailScreen(appVersion: '1.2.3')),
      );

      expect(find.text('1.2.3'), findsOneWidget);
    });

    testWidgets('shows build version info', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestApp(const AppDetailScreen()));

      expect(find.text('Build version'), findsOneWidget);
      expect(find.text('GitHub'), findsOneWidget);
    });
  });

  group('PrivacyScreen', () {
    late FakeAppConfigRepository fakeRepo;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      fakeRepo = FakeAppConfigRepository();
      appConfigViewModel = AppConfigViewModel(fakeRepo);
    });

    testWidgets('renders privacy screen with sections', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const PrivacyScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.text('Privacy and Data Management'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsAtLeastNWidgets(1));
      expect(find.text('Send Crash Report'), findsOneWidget);
      expect(find.text('Enable Crash Reporting'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('can toggle crash report switch', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const PrivacyScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      final switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget);

      await tester.tap(switchFinder);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('shows error snackbar when crash report toggle fails', (
      WidgetTester tester,
    ) async {
      fakeRepo.shouldFailUpdate = true;
      await tester.pumpWidget(
        buildTestApp(
          const PrivacyScreen(),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Settings cannot be updated.'), findsOneWidget);
    });
  });
}
