import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/add_client_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/add_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/client_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/clients_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/edit_client_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/edit_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/group_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/groups_list.dart';

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

    testWidgets('GroupsList filters groups and opens add modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final groups = [
        Group(
          id: 0,
          name: 'Default',
          enabled: true,
          dateAdded: DateTime(2024, 1, 2),
          dateModified: DateTime(2024, 1, 2),
        ),
        Group(
          id: 1,
          name: 'Work',
          enabled: true,
          comment: 'Office',
          dateAdded: DateTime(2024, 1, 3),
          dateModified: DateTime(2024, 1, 4),
        ),
      ];

      final clients = [
        ClientItem(
          client: '192.168.1.10',
          name: 'laptop',
          groups: const [1],
          id: 1,
          dateAdded: DateTime(2024, 1, 2),
          dateModified: DateTime(2024, 1, 2),
        ),
      ];

      when(testSetup.mockGroupsProvider.groups).thenReturn(groups);
      when(testSetup.mockClientsListProvider.clients).thenReturn(clients);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupsList(
            scrollController: ScrollController(),
            searchTerm: 'Work',
            selectedGroup: null,
            onGroupSelected: (_) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Work'), findsOneWidget);
      expect(find.text('Default'), findsNothing);
      expect(find.text('Clients: 1'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(AddGroupModal), findsOneWidget);
    });

    testWidgets('GroupsList adds group and shows success snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      when(
        testSetup.mockApiGatewayV6.createGroup(body: anyNamed('body')),
      ).thenAnswer(
        (_) async => GroupsResponse(
          result: APiResponseType.success,
          data: GroupsInfo(groups: []),
        ),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupsList(
            scrollController: ScrollController(),
            searchTerm: '',
            selectedGroup: null,
            onGroupSelected: (_) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'Work');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      verify(testSetup.mockGroupsProvider.loadGroups()).called(1);
      expect(find.text('Group added successfully'), findsOneWidget);
    });

    testWidgets('ClientsList shows client tile and opens add modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final clients = [
        ClientItem(
          client: '192.168.1.20',
          name: 'desktop',
          comment: 'Lab',
          groups: const [0],
          id: 2,
          dateAdded: DateTime(2024, 1, 2),
          dateModified: DateTime(2024, 1, 2),
        ),
      ];

      when(
        testSetup.mockClientsListProvider.filteredClients,
      ).thenReturn(clients);
      when(
        testSetup.mockLocalDnsProvider.ipToMac,
      ).thenReturn({'192.168.1.20': '00:11:22:33:44:55'});
      when(
        testSetup.mockLocalDnsProvider.ipToHostname,
      ).thenReturn({'192.168.1.20': 'desktop'});
      when(
        testSetup.mockLocalDnsProvider.macToIp,
      ).thenReturn({'00:11:22:33:44:55': '192.168.1.20'});

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          ClientsList(
            scrollController: ScrollController(),
            onClientSelected: (_) {},
            selectedClient: null,
            groups: const {0: 'Default'},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('MAC Address:'), findsOneWidget);
      expect(find.text('192.168.1.20 (desktop)'), findsOneWidget);
      expect(find.textContaining('Groups:'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(AddClientModal), findsOneWidget);
    });

    testWidgets('ClientsList adds client and shows success snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      when(
        testSetup.mockApiGatewayV6.createClient(body: anyNamed('body')),
      ).thenAnswer(
        (_) async => ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo(clients: []),
        ),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          ClientsList(
            scrollController: ScrollController(),
            onClientSelected: (_) {},
            selectedClient: null,
            groups: const {0: 'Default'},
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, '192.168.1.2');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      verify(testSetup.mockClientsListProvider.fetchClients()).called(1);
      expect(find.text('Client added successfully'), findsOneWidget);
    });

    testWidgets('ClientsList shows already added snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      when(
        testSetup.mockApiGatewayV6.createClient(body: anyNamed('body')),
      ).thenAnswer(
        (_) async => ClientsResponse(result: APiResponseType.alreadyAdded),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          ClientsList(
            scrollController: ScrollController(),
            onClientSelected: (_) {},
            selectedClient: null,
            groups: const {0: 'Default'},
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, '192.168.1.2');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.text('Client already added'), findsOneWidget);
      verifyNever(testSetup.mockClientsListProvider.fetchClients());
    });

    testWidgets('GroupDetailsScreen opens edit and delete modals', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final group = Group(
        id: 1,
        name: 'Work',
        enabled: true,
        comment: 'Office',
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupDetailsScreen(group: group, remove: (_) {}),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Group details'), findsOneWidget);
      expect(find.text('Enabled'), findsOneWidget);

      await tester.tap(find.text('Group name'));
      await tester.pumpAndSettle();
      expect(find.byType(EditGroupModal), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();
      expect(find.byType(DeleteModal), findsOneWidget);
    });

    testWidgets('GroupDetailsScreen updates group and shows snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final group = Group(
        id: 1,
        name: 'Work',
        enabled: true,
        comment: 'Office',
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(
        testSetup.mockApiGatewayV6.updateGroup(
          name: anyNamed('name'),
          body: anyNamed('body'),
        ),
      ).thenAnswer(
        (_) async => GroupsResponse(
          result: APiResponseType.success,
          data: GroupsInfo(groups: [group]),
        ),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupDetailsScreen(group: group, remove: (_) {}),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Group name'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).at(0), 'Work-Updated');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      verify(testSetup.mockGroupsProvider.loadGroups()).called(1);
      expect(find.text('Group updated successfully'), findsOneWidget);
    });

    testWidgets('GroupDetailsScreen removes group and shows snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final group = Group(
        id: 1,
        name: 'Work',
        enabled: true,
        comment: 'Office',
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(
        testSetup.mockApiGatewayV6.removeGroup(name: anyNamed('name')),
      ).thenAnswer(
        (_) async => RemoveGroupResponse(result: APiResponseType.success),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupDetailsScreen(group: group, remove: (_) {}),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      verify(testSetup.mockGroupsProvider.loadGroups()).called(1);
      expect(find.text('Group removed successfully'), findsOneWidget);
    });

    testWidgets('ClientDetailsScreen shows mappings and opens edit modals', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final client = ClientItem(
        client: '00:11:22:33:44:55',
        name: '',
        groups: const [0],
        id: 2,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          ClientDetailsScreen(
            client: client,
            remove: (_) {},
            groups: const {0: 'Default'},
            ipToMac: const {'192.168.1.20': '00:11:22:33:44:55'},
            ipToHostname: const {'192.168.1.20': 'desktop'},
            macToIp: const {'00:11:22:33:44:55': '192.168.1.20'},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Client details'), findsOneWidget);
      expect(find.text('00:11:22:33:44:55'), findsOneWidget);
      expect(find.text('192.168.1.20'), findsOneWidget);
      expect(find.text('desktop'), findsOneWidget);

      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();
      expect(find.byType(EditClientModal), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Groups'));
      await tester.pumpAndSettle();
      expect(find.byType(EditClientModal), findsWidgets);
    });

    testWidgets('ClientDetailsScreen updates comment and shows snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final client = ClientItem(
        client: '192.168.1.2',
        name: 'device',
        comment: 'old',
        groups: const [0],
        id: 2,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(
        testSetup.mockApiGatewayV6.updateClient(
          client: anyNamed('client'),
          body: anyNamed('body'),
        ),
      ).thenAnswer(
        (_) async => ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo(clients: [client.copyWith(comment: 'new')]),
        ),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          ClientDetailsScreen(
            client: client,
            remove: (_) {},
            groups: const {0: 'Default'},
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'new');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.text('Client updated successfully'), findsOneWidget);
    });

    testWidgets('ClientDetailsScreen removes client and shows snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final client = ClientItem(
        client: '192.168.1.2',
        name: 'device',
        groups: const [0],
        id: 2,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(
        testSetup.mockApiGatewayV6.removeClient(client: anyNamed('client')),
      ).thenAnswer(
        (_) async => RemoveClientResponse(result: APiResponseType.success),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          ClientDetailsScreen(
            client: client,
            remove: (_) {},
            groups: const {0: 'Default'},
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      verify(
        testSetup.mockClientsListProvider.removeClientFromList(
          argThat(isA<ClientItem>().having((c) => c.id, 'id', client.id)),
        ),
      ).called(1);
      expect(find.text('Client removed successfully'), findsOneWidget);
    });
  });
}
