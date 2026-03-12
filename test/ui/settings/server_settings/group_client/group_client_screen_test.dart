import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/ui/components/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/local_dns_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/add_client_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/add_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/client_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/clients_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/edit_client_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/edit_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_client_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/groups_list.dart';
import 'package:provider/provider.dart';

import '../../../../../testing/fakes/repositories/api/fake_adlist_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_client_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_domain_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_group_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_local_dns_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../../testing/test_app.dart';

// ---------------------------------------------------------------------------
// Shared test fixtures
// ---------------------------------------------------------------------------
const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

const _serverV5 = Server(
  address: 'http://localhost:8080',
  alias: 'test v5',
  defaultServer: false,
  apiVersion: 'v5',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('Groups & Clients Screen Widget Tests', () {
    late FakeServersViewModel fakeServersViewModel;
    late ClientsViewModel clientsViewModel;
    late GroupsViewModel groupsViewModel;
    late LocalDnsViewModel localDnsViewModel;
    late DomainsViewModel domainsViewModel;
    late AdlistsViewModel adlistsViewModel;
    late FakeClientRepository fakeClientRepository;
    late FakeGroupRepository fakeGroupRepository;
    late FakeLocalDnsRepository fakeLocalDnsRepository;
    late FakeNetworkRepository fakeNetworkRepository;
    late FakeDomainRepository fakeDomainRepository;
    late FakeAdlistRepository fakeAdlistRepository;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};

      fakeClientRepository = FakeClientRepository();
      fakeGroupRepository = FakeGroupRepository();
      fakeLocalDnsRepository = FakeLocalDnsRepository();
      fakeNetworkRepository = FakeNetworkRepository();
      fakeDomainRepository = FakeDomainRepository();
      fakeAdlistRepository = FakeAdlistRepository();

      fakeServersViewModel = FakeServersViewModel()..selectedServer = _serverV6;

      clientsViewModel = ClientsViewModel(
        clientRepository: fakeClientRepository,
      );
      groupsViewModel = GroupsViewModel(groupRepository: fakeGroupRepository);
      localDnsViewModel = LocalDnsViewModel(
        localDnsRepository: fakeLocalDnsRepository,
        networkRepository: fakeNetworkRepository,
      );
      domainsViewModel = DomainsViewModel(
        domainRepository: fakeDomainRepository,
      );
      adlistsViewModel = AdlistsViewModel(
        adListRepository: fakeAdlistRepository,
      );
    });

    tearDown(() {
      clientsViewModel.dispose();
      groupsViewModel.dispose();
      domainsViewModel.dispose();
      adlistsViewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildWidget(Widget child) {
      return buildTestApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ServersViewModel>.value(
              value: fakeServersViewModel,
            ),
            ChangeNotifierProvider<ClientsViewModel>.value(
              value: clientsViewModel,
            ),
            ChangeNotifierProvider<GroupsViewModel>.value(
              value: groupsViewModel,
            ),
            ChangeNotifierProvider<LocalDnsViewModel>.value(
              value: localDnsViewModel,
            ),
            ChangeNotifierProvider<DomainsViewModel>.value(
              value: domainsViewModel,
            ),
            ChangeNotifierProvider<AdlistsViewModel>.value(
              value: adlistsViewModel,
            ),
          ],
          child: child,
        ),
      );
    }

    testWidgets('should show screen with V6 server (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget(const GroupClientScreen()));

      expect(find.byType(GroupClientScreen), findsOneWidget);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Groups'), findsOneWidget);
      expect(find.text('Clients'), findsOneWidget);
      expect(find.text('Default'), findsOneWidget);
    });

    testWidgets('should show not supported screen with V5 server', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeServersViewModel.selectedServer = _serverV5;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget(const GroupClientScreen()));

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

      fakeServersViewModel.selectedServer = null;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget(const GroupClientScreen()));

      expect(find.byType(GroupClientScreen), findsOneWidget);
      await tester.pump();

      expect(find.byType(EmptyDataScreen), findsOneWidget);
      expect(find.text('Groups & Clients'), findsOneWidget);
    });

    testWidgets('should call search on clients viewmodel', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget(const GroupClientScreen()));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search_rounded));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'local');
      await tester.pumpAndSettle();

      // Verify search was applied by checking the viewmodel state
      expect(clientsViewModel.searchTerm, 'local');
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

      final router = GoRouter(
        initialLocation: '/group-client',
        routes: [
          GoRoute(
            path: '/group-client',
            builder: (context, state) => MultiProvider(
              providers: [
                ChangeNotifierProvider<ServersViewModel>.value(
                  value: fakeServersViewModel,
                ),
                ChangeNotifierProvider<ClientsViewModel>.value(
                  value: clientsViewModel,
                ),
                ChangeNotifierProvider<GroupsViewModel>.value(
                  value: groupsViewModel,
                ),
                ChangeNotifierProvider<LocalDnsViewModel>.value(
                  value: localDnsViewModel,
                ),
                ChangeNotifierProvider<DomainsViewModel>.value(
                  value: domainsViewModel,
                ),
                ChangeNotifierProvider<AdlistsViewModel>.value(
                  value: adlistsViewModel,
                ),
              ],
              child: const GroupClientScreen(),
            ),
            routes: [
              GoRoute(
                path: 'group-details',
                name: Routes.settingsServerGroupDetails,
                builder: (context, state) {
                  final extra =
                      state.extra!
                          as (
                            Group,
                            void Function(Group),
                            GroupsViewModel,
                            ClientsViewModel,
                            DomainsViewModel,
                            AdlistsViewModel,
                          );
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider.value(value: extra.$3),
                      ChangeNotifierProvider.value(value: extra.$4),
                      ChangeNotifierProvider.value(value: extra.$5),
                      ChangeNotifierProvider.value(value: extra.$6),
                    ],
                    child: GroupDetailsScreen(
                      group: extra.$1,
                      remove: extra.$2,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        buildTestApp(const SizedBox.shrink(), router: router),
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

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final router = GoRouter(
        initialLocation: '/group-client',
        routes: [
          GoRoute(
            path: '/group-client',
            builder: (context, state) => MultiProvider(
              providers: [
                ChangeNotifierProvider<ServersViewModel>.value(
                  value: fakeServersViewModel,
                ),
                ChangeNotifierProvider<ClientsViewModel>.value(
                  value: clientsViewModel,
                ),
                ChangeNotifierProvider<GroupsViewModel>.value(
                  value: groupsViewModel,
                ),
                ChangeNotifierProvider<LocalDnsViewModel>.value(
                  value: localDnsViewModel,
                ),
                ChangeNotifierProvider<DomainsViewModel>.value(
                  value: domainsViewModel,
                ),
                ChangeNotifierProvider<AdlistsViewModel>.value(
                  value: adlistsViewModel,
                ),
              ],
              child: const GroupClientScreen(),
            ),
            routes: [
              GoRoute(
                path: 'client-details',
                name: Routes.settingsServerClientDetails,
                builder: (context, state) {
                  final extra =
                      state.extra!
                          as (
                            ManagedClient,
                            void Function(ManagedClient),
                            Map<int, String>,
                            dynamic,
                            Map<String, String>,
                            Map<String, String>,
                            Map<String, String>,
                            ClientsViewModel,
                          );
                  return ChangeNotifierProvider.value(
                    value: extra.$8,
                    child: ClientDetailsScreen(
                      client: extra.$1,
                      remove: extra.$2,
                      groups: extra.$3,
                      ipToMac: extra.$5,
                      ipToHostname: extra.$6,
                      macToIp: extra.$7,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        buildTestApp(const SizedBox.shrink(), router: router),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Clients'));
      await tester.pumpAndSettle();

      // FakeClientRepository returns '192.168.1.100 (desktop)'
      await tester.tap(find.text('192.168.1.100 (desktop)'));
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

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
          GroupsList(
            scrollController: ScrollController(),
            searchTerm: 'test',
            selectedGroup: null,
            onGroupSelected: (_) {},
          ),
        ),
      );

      // Kick off loads and pump to let async complete + rebuild
      unawaited(groupsViewModel.loadGroups.runAsync());
      unawaited(clientsViewModel.loadClients.runAsync());
      unawaited(domainsViewModel.loadDomains.runAsync());
      unawaited(adlistsViewModel.loadAdlists.runAsync());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // FakeGroupRepository returns 'Default' and 'test'
      // Searching 'test' should only show the 'test' group
      expect(find.text('test'), findsOneWidget);
      expect(find.text('Default'), findsNothing);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(AddGroupModal), findsOneWidget);
    });

    testWidgets('GroupsList adds group and shows success snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
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

      expect(find.text('Group added successfully'), findsOneWidget);
    });

    testWidgets('ClientsList shows client tile and opens add modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
          ClientsList(
            scrollController: ScrollController(),
            onClientSelected: (_) {},
            selectedClient: null,
            groups: const {0: 'Default'},
          ),
        ),
      );

      // Kick off load and pump to let async complete + rebuild
      unawaited(clientsViewModel.loadClients.runAsync());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // FakeClientRepository returns two clients
      expect(find.text('192.168.1.100 (desktop)'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(AddClientModal), findsOneWidget);
    });

    testWidgets('ClientsList adds client and shows success snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
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

      expect(find.text('Client added successfully'), findsOneWidget);
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
        buildWidget(GroupDetailsScreen(group: group, remove: (_) {})),
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

    testWidgets('ClientDetailsScreen shows mappings and opens edit modals', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final client = ManagedClient(
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
        buildWidget(
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

    testWidgets(
      'GroupDetailsScreen toggles status and shows success snackbar',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 900);
        tester.view.devicePixelRatio = 1.0;

        final group = Group(
          id: 0,
          name: 'Default',
          enabled: true,
          comment: 'The default group',
          dateAdded: DateTime(2024, 1, 1),
          dateModified: DateTime(2024, 1, 1),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(GroupDetailsScreen(group: group, remove: (_) {})),
        );
        await tester.pumpAndSettle();

        expect(find.text('Enabled'), findsOneWidget);
        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Group updated successfully'), findsOneWidget);
      },
    );

    testWidgets(
      'GroupDetailsScreen toggles status and shows error snackbar on failure',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 900);
        tester.view.devicePixelRatio = 1.0;

        fakeGroupRepository.shouldFail = true;

        final group = Group(
          id: 0,
          name: 'Default',
          enabled: true,
          dateAdded: DateTime(2024, 1, 1),
          dateModified: DateTime(2024, 1, 1),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(GroupDetailsScreen(group: group, remove: (_) {})),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to update the group'), findsOneWidget);
      },
    );

    testWidgets('GroupDetailsScreen deletes group and shows success snackbar', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1.0;

      final group = Group(
        id: 0,
        name: 'Default',
        enabled: true,
        dateAdded: DateTime(2024, 1, 1),
        dateModified: DateTime(2024, 1, 1),
      );

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(GroupDetailsScreen(group: group, remove: (_) {})),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();
      expect(find.byType(DeleteModal), findsOneWidget);

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Group removed successfully'), findsOneWidget);
    });

    testWidgets(
      'ClientDetailsScreen edits comment and shows success snackbar',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 900);
        tester.view.devicePixelRatio = 1.0;

        final client = ManagedClient(
          client: '192.168.1.100',
          name: 'desktop',
          groups: const [0],
          id: 1,
          comment: 'Main desktop',
          dateAdded: DateTime(2024, 1, 1),
          dateModified: DateTime(2024, 1, 1),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
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
        expect(find.byType(EditClientModal), findsOneWidget);

        await tester.enterText(find.byType(TextField), 'new comment');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Edit'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Client updated successfully'), findsOneWidget);
      },
    );

    testWidgets(
      'ClientDetailsScreen edits comment and shows error snackbar on failure',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 900);
        tester.view.devicePixelRatio = 1.0;

        fakeClientRepository.shouldFail = true;

        final client = ManagedClient(
          client: '192.168.1.100',
          name: 'desktop',
          groups: const [0],
          id: 1,
          dateAdded: DateTime(2024, 1, 1),
          dateModified: DateTime(2024, 1, 1),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
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
        expect(find.byType(EditClientModal), findsOneWidget);

        await tester.enterText(find.byType(TextField), 'new comment');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Edit'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to update the client'), findsOneWidget);
      },
    );

    testWidgets(
      'ClientDetailsScreen deletes client and shows success snackbar',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 900);
        tester.view.devicePixelRatio = 1.0;

        final client = ManagedClient(
          client: '192.168.1.100',
          name: 'desktop',
          groups: const [0],
          id: 1,
          dateAdded: DateTime(2024, 1, 1),
          dateModified: DateTime(2024, 1, 1),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
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
        expect(find.byType(DeleteModal), findsOneWidget);

        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Client removed successfully'), findsOneWidget);
      },
    );
  });
}
