import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_details_screen.dart';

import '../../../../../../testing/fakes/repositories/api/fake_adlist_repository.dart';
import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Find Domains In Lists Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    tearDown(() {
      testSetup.findDomainsInListsViewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    testWidgets('shows search form and hides results before search', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pumpAndSettle();

      expect(find.text('Search domain'), findsOneWidget);
      expect(
        find.text('Maximum number of results to be returned'),
        findsOneWidget,
      );
      expect(find.text('Use partial matching'), findsOneWidget);
      expect(find.text('No results found'), findsNothing);
    });

    testWidgets('shows snackbar when search term is empty', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Search').last);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Please enter a domain to search.'), findsOneWidget);
    });

    testWidgets('shows snackbar when max results is invalid', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      expect(textFields, findsNWidgets(2));

      await tester.enterText(textFields.at(0), 'example.com');
      await tester.enterText(textFields.at(1), '0');
      await tester.tap(find.text('Search').last);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Please enter a maximum number greater than 0.'),
        findsOneWidget,
      );
    });

    testWidgets('shows v5 not supported screen when api is v5', (
      WidgetTester tester,
    ) async {
      final v5Setup = TestSetupHelper();
      v5Setup.initializeMock();

      await tester.pumpWidget(
        v5Setup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
    });

    testWidgets('renders summary and results after successful search', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'example.com');
      await tester.tap(find.byType(SwitchListTile));
      await tester.pump();
      await tester.tap(find.text('Search').last);
      await tester.pump();
      await tester.pumpAndSettle();

      // FakeAdlistRepository.searchLists returns 1 gravityMatch
      expect(find.text('Summary'), findsOneWidget);
      expect(find.text('List-level lists'), findsOneWidget);
    });

    testWidgets('navigates to AdlistDetailsScreen when tapping adlist result', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1440, 2560);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'example.com');
      await tester.tap(find.text('Search').last);
      await tester.pump();
      await tester.pumpAndSettle();

      // Tap the adlist card
      await tester.tap(find.text('https://blocklist.example.com/hosts'));
      await tester.pumpAndSettle();

      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);
    });

    testWidgets('shows error message when search fails', (
      WidgetTester tester,
    ) async {
      final failingRepo = FakeAdlistRepository()..shouldFail = true;
      testSetup.findDomainsInListsViewModel.update(
        adListRepository: failingRepo,
        domainRepository: testSetup.fakeDomainRepository,
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'error.example');
      await tester.tap(find.text('Search').last);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Failed to fetch data.'), findsOneWidget);
    });
  });
}
