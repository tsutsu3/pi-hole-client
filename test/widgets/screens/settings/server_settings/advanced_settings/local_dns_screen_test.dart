import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/add_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/edit_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_detail_screen.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Local DNS Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show error screen when fetching local DNS fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockLocalDnsProvider.loadingStatus,
      ).thenReturn(LoadStatus.error);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();
      expect(find.byType(ErrorMessage), findsOneWidget);
    });

    testWidgets('should show empty data screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(
        testSetup.mockLocalDnsProvider.loadingStatus,
      ).thenReturn(LoadStatus.loaded);

      when(testSetup.mockLocalDnsProvider.localDns).thenReturn([]);

      when(testSetup.mockApiGatewayV6.getLocalDns()).thenAnswer(
        (_) async => LocalDnsResponse(result: APiResponseType.error),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();
      expect(find.byType(EmptyDataScreen), findsOneWidget);
    });

    testWidgets('should show detail screen with tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('192.168.1.2'));
      await tester.pumpAndSettle();
      await tester.pump();

      expect(find.byType(LocalDnsDetailScreen), findsOneWidget);
    });

    testWidgets('should show add screen with tap', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.byType(AddLocalDnsModal), findsOneWidget);
      expect(find.text('Add Local DNS'), findsOneWidget);
      await tester.enterText(find.byType(TextField).first, 'test');
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).last, '192.168.1.3');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Local DNS has been added successfully'), findsWidgets);
    });

    testWidgets('should delete local DNS entry', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('192.168.1.2'));
      await tester.pumpAndSettle();

      expect(find.byType(LocalDnsDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      // Show remove modal
      expect(find.byType(DeleteModal), findsOneWidget);
      expect(find.text('Delete Local DNS'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Local DNS has been removed successfully'),
        findsWidgets,
      );
    });

    testWidgets('should edit local DNS hostname', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('192.168.1.2'));
      await tester.pumpAndSettle();

      expect(find.byType(LocalDnsDetailScreen), findsOneWidget);

      await tester.tap(find.text('Hostname'));
      await tester.pumpAndSettle();

      expect(find.byType(EditLocalDnsModal), findsOneWidget);
      expect(find.text('Edit Hostname'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'test');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Local DNS has been updated successfully'),
        findsWidgets,
      );
    });

    testWidgets('should edit local DNS ip', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const LocalDnsScreen()),
      );

      expect(find.byType(LocalDnsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('192.168.1.2'));
      await tester.pumpAndSettle();

      expect(find.byType(LocalDnsDetailScreen), findsOneWidget);

      await tester.tap(find.text('IP Address'));
      await tester.pumpAndSettle();

      expect(find.byType(EditLocalDnsModal), findsOneWidget);
      expect(find.text('Edit IP Address'), findsOneWidget);
      await tester.enterText(find.byType(TextField), '192.168.1.3');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Local DNS has been updated successfully'),
        findsWidgets,
      );
    });
  });
}
