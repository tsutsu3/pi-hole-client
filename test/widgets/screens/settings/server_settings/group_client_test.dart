import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client_screen.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Groups & Clients Screen Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show screen with V6 server (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const GroupClientScreen()),
      );

      expect(find.byType(GroupClientScreen), findsOneWidget);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Groups'), findsOneWidget);
      expect(find.text('Clients'), findsOneWidget);
      expect(find.text('Default'), findsOneWidget);

      await tester.tap(find.text('Clients'));
      await tester.pumpAndSettle();
      expect(find.text('There are no clients to show here.'), findsOneWidget);
    });

    testWidgets('should show not supported screen with V5 server', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      testSetup.initializeMock();

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const GroupClientScreen()),
      );

      expect(find.byType(GroupClientScreen), findsOneWidget);
      await tester.pump();

      expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
      expect(find.text('Groups & Clients'), findsOneWidget);
    });

    testWidgets('should show empty data screen when no server selected', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(testSetup.mockServersProvider.selectedServer).thenReturn(null);
      when(testSetup.mockServersProvider.selectedApiGateway).thenReturn(null);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const GroupClientScreen()),
      );

      expect(find.byType(GroupClientScreen), findsOneWidget);
      await tester.pump();

      expect(find.byType(EmptyDataScreen), findsOneWidget);
      expect(find.text('Groups & Clients'), findsOneWidget);
    });

    testWidgets('should call search on clients list provider', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const GroupClientScreen()),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search_rounded));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'local');
      await tester.pumpAndSettle();

      verify(testSetup.mockClientsListProvider.onSearch('local')).called(1);
    });

    testWidgets('should open group edit modal from details', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const GroupClientScreen()),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Default'));
      await tester.pumpAndSettle();

      expect(find.text('Group details'), findsOneWidget);

      await tester.tap(find.text('Group name'));
      await tester.pumpAndSettle();

      expect(find.text('Edit group'), findsOneWidget);
    });

    testWidgets('should open client delete modal from details', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      final clientItem = ClientItem(
        client: '192.168.0.10',
        name: 'laptop',
        comment: 'Office',
        groups: const [0],
        id: 1,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(testSetup.mockClientsListProvider.clients).thenReturn([clientItem]);
      when(
        testSetup.mockClientsListProvider.filteredClients,
      ).thenReturn([clientItem]);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const GroupClientScreen()),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Clients'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('192.168.0.10 (laptop)'));
      await tester.pumpAndSettle();

      expect(find.text('Client details'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      expect(find.byType(DeleteModal), findsOneWidget);
    });
  });
}
