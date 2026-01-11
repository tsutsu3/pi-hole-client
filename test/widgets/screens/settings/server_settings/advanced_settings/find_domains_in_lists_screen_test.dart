import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/model/v6/lists/search.dart' as v6_search;
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/search.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_tile.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen.dart';

import '../../../../helpers.dart';

SearchInfo buildSearchInfo({
  List<v6_search.DomainEntry>? domains,
  List<v6_search.GravityEntry>? gravity,
  int domainsExact = 0,
  int domainsRegex = 0,
  int gravityAllow = 0,
  int gravityBlock = 0,
  int total = 0,
  bool partial = true,
  int maxResults = 20,
  String domain = 'example.com',
}) {
  return SearchInfo(
    domains: domains ?? [],
    gravity: gravity ?? [],
    parameters: SearchParametersInfo(
      partial: partial,
      maxResults: maxResults,
      domain: domain,
      debug: false,
    ),
    results: SearchResultsInfo(
      domainsExact: domainsExact,
      domainsRegex: domainsRegex,
      gravityAllow: gravityAllow,
      gravityBlock: gravityBlock,
      total: total,
    ),
  );
}

v6_search.DomainEntry buildDomainEntry({
  required int id,
  required String domain,
  v6_search.DomainType type = v6_search.DomainType.allow,
  v6_search.DomainKind kind = v6_search.DomainKind.exact,
  bool enabled = true,
  int timestamp = 1700000000,
}) {
  return v6_search.DomainEntry(
    id: id,
    domain: domain,
    enabled: enabled,
    type: type,
    kind: kind,
    dateAdded: timestamp,
    dateModified: timestamp,
    groups: const [0],
    comment: 'comment',
  );
}

v6_search.GravityEntry buildGravityEntry({
  required int id,
  required String address,
  required String domain,
  v6_search.GravityType type = v6_search.GravityType.block,
  bool enabled = true,
  int timestamp = 1700000000,
  int status = 1,
}) {
  return v6_search.GravityEntry(
    id: id,
    address: address,
    domain: domain,
    enabled: enabled,
    type: type,
    dateAdded: timestamp,
    dateModified: timestamp,
    dateUpdated: timestamp,
    number: 12,
    invalidDomains: 0,
    abpEntries: 0,
    status: status,
    groups: const [0],
    comment: 'Migrated from /etc/pihole/adlists.list',
  );
}

void main() async {
  await initializeApp();

  group('Find Domains In Lists Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('shows search form and hides results before search', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

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
      await tester.pump();

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
      await tester.pump();

      expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
    });

    testWidgets('renders summary and results after successful search', (
      WidgetTester tester,
    ) async {
      final gravityEntries = [
        buildGravityEntry(
          id: 10,
          address: 'https://example.com/adlist.txt',
          domain: 'ad.example.com',
        ),
        buildGravityEntry(
          id: 10,
          address: 'https://example.com/adlist.txt',
          domain: 'tracker.example.net',
        ),
      ];
      final searchInfo = buildSearchInfo(
        domains: [
          buildDomainEntry(id: 1, domain: 'example.com'),
          buildDomainEntry(
            id: 2,
            domain: 'regex.example.com',
            kind: v6_search.DomainKind.regex,
            type: v6_search.DomainType.deny,
          ),
        ],
        gravity: gravityEntries,
        domainsExact: 1,
        domainsRegex: 1,
        gravityBlock: 2,
        total: 4,
      );

      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'example.com',
          partial: false,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer(
        (_) async =>
            SearchResponse(result: APiResponseType.success, data: searchInfo),
      );

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

      verify(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'example.com',
          partial: false,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).called(1);

      expect(find.text('Summary'), findsOneWidget);
      expect(find.text('Domain-level lists'), findsOneWidget);
      expect(find.text('List-level lists'), findsOneWidget);
      expect(find.text('example.com'), findsNWidgets(2));
      expect(find.text('https://example.com/adlist.txt'), findsOneWidget);
      expect(find.text('Matching entries:'), findsOneWidget);

      await tester.ensureVisible(find.text('Matching entries:'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Matching entries:'));
      await tester.pumpAndSettle();

      expect(find.text('ad.example.com'), findsOneWidget);
      expect(find.text('tracker.example.net'), findsOneWidget);
    });

    testWidgets('shows empty results state after search', (
      WidgetTester tester,
    ) async {
      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'empty.example',
          partial: true,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer(
        (_) async => SearchResponse(
          result: APiResponseType.success,
          data: buildSearchInfo(domain: 'empty.example'),
        ),
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'empty.example');
      await tester.tap(find.text('Search').last);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('No results found'), findsOneWidget);
    });

    testWidgets('shows error message when search fails', (
      WidgetTester tester,
    ) async {
      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'error.example',
          partial: true,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer((_) async => SearchResponse(result: APiResponseType.error));

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

    testWidgets('opens domain details screen on tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final searchInfo = buildSearchInfo(
        domains: [buildDomainEntry(id: 1, domain: 'example.com')],
        total: 1,
      );

      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'example.com',
          partial: true,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer(
        (_) async =>
            SearchResponse(result: APiResponseType.success, data: searchInfo),
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'example.com');
      await tester.tap(find.text('Search').last);
      await tester.pumpAndSettle();

      expect(find.byType(DomainTile), findsOneWidget);
      await tester.tap(find.byType(DomainTile));
      await tester.pumpAndSettle();

      expect(find.text('Domain details'), findsOneWidget);
    });

    testWidgets('removes domain from results after delete', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final searchInfo = buildSearchInfo(
        domains: [buildDomainEntry(id: 1, domain: 'example.com')],
        total: 1,
      );

      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'example.com',
          partial: true,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer(
        (_) async =>
            SearchResponse(result: APiResponseType.success, data: searchInfo),
      );
      when(testSetup.mockApiGatewayV6.removeDomainFromList(any)).thenAnswer(
        (_) async =>
            RemoveDomainFromListResponse(result: APiResponseType.success),
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'example.com');
      await tester.tap(find.text('Search').last);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DomainTile));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Delete Domain'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainTile), findsNothing);
      expect(find.text('Domain removed successfully'), findsOneWidget);
    });

    testWidgets('opens adlist details screen on tap', (
      WidgetTester tester,
    ) async {
      final searchInfo = buildSearchInfo(
        gravity: [
          buildGravityEntry(
            id: 10,
            address: 'https://example.com/adlist.txt',
            domain: 'ad.example.com',
          ),
        ],
        gravityBlock: 1,
        total: 1,
      );

      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'example.com',
          partial: true,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer(
        (_) async =>
            SearchResponse(result: APiResponseType.success, data: searchInfo),
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'example.com');
      await tester.tap(find.text('Search').last);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('https://example.com/adlist.txt'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://example.com/adlist.txt'));
      await tester.pumpAndSettle();

      expect(find.text('Adlist Details'), findsOneWidget);
    });

    testWidgets('removes adlist from results after delete', (
      WidgetTester tester,
    ) async {
      final searchInfo = buildSearchInfo(
        gravity: [
          buildGravityEntry(
            id: 10,
            address: 'https://example.com/adlist.txt',
            domain: 'ad.example.com',
          ),
        ],
        gravityBlock: 1,
        total: 1,
      );

      when(
        testSetup.mockApiGatewayV6.searchSubscriptions(
          domain: 'example.com',
          partial: true,
          limit: 20,
          debug: anyNamed('debug'),
        ),
      ).thenAnswer(
        (_) async =>
            SearchResponse(result: APiResponseType.success, data: searchInfo),
      );
      when(
        testSetup.mockApiGatewayV6.removeSubscription(
          url: 'https://example.com/adlist.txt',
          stype: 'block',
        ),
      ).thenAnswer(
        (_) async =>
            RemoveSubscriptionResponse(result: APiResponseType.success),
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(const FindDomainsInListsScreen()),
      );
      await tester.pump();

      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'example.com');
      await tester.tap(find.text('Search').last);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('https://example.com/adlist.txt'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://example.com/adlist.txt'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Delete Adlist'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.text('https://example.com/adlist.txt'), findsNothing);
      expect(find.text('Adlist removed successfully'), findsOneWidget);
    });
  });
}
