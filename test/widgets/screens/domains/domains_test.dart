import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/ui/components/labeled_multi_select_tile.dart';
import 'package:pi_hole_client/ui/domains/domains.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/edit_domain_modal.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('DomainLists Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should delete a domain from whitelist and show confirmation modal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(2560, 1600);
        tester.view.devicePixelRatio = 1.6;

        when(
          testSetup.mockDomainsListProvider.filteredWhitelistDomains,
        ).thenReturn(whiteDomains);
        when(
          testSetup.mockDomainsListProvider.filteredBlacklistDomains,
        ).thenReturn([]);
        when(
          testSetup.mockDomainsListProvider.whitelistDomains,
        ).thenReturn(whiteDomains);
        when(testSetup.mockDomainsListProvider.blacklistDomains).thenReturn([]);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsOneWidget);
        expect(
          find.text('Choose a domain to see its details.'),
          findsOneWidget,
        );

        // Tap whitelist domain to open domain detail screen
        await tester.tap(find.text('white01.example.com'));
        await tester.pumpAndSettle();
        expect(find.byType(DomainDetailsScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        // Tap delete button
        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();
        expect(
          find.text('Are you sure you want to delete this domain?'),
          findsOneWidget,
        );
        expect(find.text('Delete'), findsOneWidget);

        // Tap confirm button
        await tester.tap(find.text('Delete'));
        // await tester.pump(const Duration(milliseconds: 1000));
        await tester.pumpAndSettle();
        // expect(find.text('Domain removed successfully'), findsWidgets);

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
      },
    );

    testWidgets('should delete a domain with mobile screen size', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockDomainsListProvider.filteredWhitelistDomains,
      ).thenReturn(whiteDomains);
      when(
        testSetup.mockDomainsListProvider.filteredBlacklistDomains,
      ).thenReturn([]);
      when(
        testSetup.mockDomainsListProvider.whitelistDomains,
      ).thenReturn(whiteDomains);
      when(testSetup.mockDomainsListProvider.blacklistDomains).thenReturn([]);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      // Show whiltelist domains screen
      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('white01.example.com'), findsOneWidget);
      expect(find.text('white02.example.com'), findsOneWidget);
      expect(find.text('Choose a domain to see its details.'), findsNothing);

      // Tap whitelist domain to open domain detail screen
      await tester.tap(find.text('white01.example.com'));
      await tester.pumpAndSettle();
      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

      // Tap delete button
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();
      expect(
        find.text('Are you sure you want to delete this domain?'),
        findsOneWidget,
      );
      expect(find.text('Delete'), findsOneWidget);

      // Tap confirm button
      await tester.tap(find.text('Delete'));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.text('Domain removed successfully'), findsWidgets);

      // Show whiltelist domains screen
      expect(find.byType(DomainLists), findsOneWidget);
    });

    testWidgets('should filter domains list by search term', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(testSetup.mockApiGatewayV6.getDomainLists()).thenAnswer(
        (_) async => GetDomainLists(
          result: APiResponseType.success,
          data: DomainListResult(
            whitelist: whiteDomains,
            whitelistRegex: [],
            blacklist: blackDomains,
            blacklistRegex: [],
          ),
        ),
      );
      when(
        testSetup.mockDomainsListProvider.whitelistDomains,
      ).thenReturn(whiteDomains);
      when(
        testSetup.mockDomainsListProvider.filteredWhitelistDomains,
      ).thenReturn(whiteDomains);
      when(
        testSetup.mockDomainsListProvider.blacklistDomains,
      ).thenReturn(blackDomains);
      when(
        testSetup.mockDomainsListProvider.filteredBlacklistDomains,
      ).thenReturn(blackDomains);
      when(testSetup.mockDomainsListProvider.searchMode).thenReturn(true);
      when(testSetup.mockDomainsListProvider.searchTerm).thenReturn('white01');

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pump();

      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    });

    testWidgets('should add a domain to whitelist', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      // Show whiltelist domains screen
      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Domains'), findsOneWidget);

      // Tap add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('Add Domain'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'white03.example.com');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Show whiltelist domains screen
      expect(find.text('Domain added successfully'), findsWidgets);
      expect(find.byType(DomainLists), findsOneWidget);
    });

    testWidgets('should show error loading domains list', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockDomainsListProvider.loadingStatus,
      ).thenReturn(LoadStatus.error);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      expect(find.text("Domains list couldn't be loaded"), findsOneWidget);
    });

    testWidgets('should show loading messge', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockDomainsListProvider.loadingStatus,
      ).thenReturn(LoadStatus.loading);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      expect(find.text('Loading domains...'), findsOneWidget);
    });

    testWidgets('should edit a domain status', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should edit a domain groups', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Groups'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.byType(LabeledMultiSelectTile), findsOneWidget);
      expect(find.text('Edit groups'), findsOneWidget);

      await tester.tap(find.byType(CheckboxListTile).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should edit a domain comment', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.text('Edit comment'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'test123');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should show error snack bar', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockApiGatewayV6.updateDomain(body: anyNamed('body')),
      ).thenAnswer(
        (_) async =>
            DomainResponse(result: APiResponseType.error, message: 'Error'),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to update the Domain'), findsOneWidget);
    });

    testWidgets('should show edit domain groups modal (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Groups'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.byType(LabeledMultiSelectTile), findsOneWidget);
      expect(find.text('Edit groups'), findsOneWidget);

      await tester.tap(find.byType(CheckboxListTile).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should show edit domain comment modal (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.text('Edit comment'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'test123');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });
  });

  group('DomainLists Widget Tests (v5)', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock();
    });

    testWidgets('should not be editable with v5', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const DomainLists()));

      expect(find.byType(DomainLists), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.text('Groups'), findsNothing);
      expect(find.byType(Switch), findsNothing);
      expect(find.byIcon(Icons.edit_rounded), findsNothing);
    });
  });
}
