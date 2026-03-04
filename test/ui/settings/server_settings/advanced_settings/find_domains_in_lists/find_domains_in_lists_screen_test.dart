import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists/view_models/find_domains_in_lists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists/widgets/find_domains_in_lists_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../../../testing/fakes/repositories/api/fake_actions_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_adlist_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_client_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_config_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_dhcp_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_dns_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_domain_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_group_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_local_dns_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_metrics_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_realtime_status_repository.dart';
import '../../../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Find Domains In Lists Screen tests', () {
    late FakeAdlistRepository fakeAdlistRepository;
    late FakeDomainRepository fakeDomainRepository;
    late FakeGroupRepository fakeGroupRepository;
    late FindDomainsInListsViewModel findDomainsInListsViewModel;
    late GroupsViewModel groupsViewModel;
    late FakeServersViewModel fakeServersViewModel;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};
      fakeAdlistRepository = FakeAdlistRepository();
      fakeDomainRepository = FakeDomainRepository();
      fakeGroupRepository = FakeGroupRepository();
      findDomainsInListsViewModel = FindDomainsInListsViewModel(
        adListRepository: fakeAdlistRepository,
        domainRepository: fakeDomainRepository,
      );
      groupsViewModel = GroupsViewModel(groupRepository: fakeGroupRepository);
      fakeServersViewModel = FakeServersViewModel()
        ..selectedServer = const Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );
    });

    tearDown(() {
      findDomainsInListsViewModel.dispose();
      groupsViewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildWidget() {
      return buildTestApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ServersViewModel>.value(
              value: fakeServersViewModel,
            ),
            ChangeNotifierProvider<FindDomainsInListsViewModel>.value(
              value: findDomainsInListsViewModel,
            ),
            ChangeNotifierProvider<GroupsViewModel>.value(
              value: groupsViewModel,
            ),
            Provider<RepositoryBundle?>(
              create: (_) => RepositoryBundle(
                actions: FakeActionsRepository(),
                adlist: fakeAdlistRepository,
                auth: FakeAuthRepository(),
                config: FakeConfigRepository(),
                dhcp: FakeDhcpRepository(),
                dns: FakeDnsRepository(),
                domain: fakeDomainRepository,
                ftl: FakeFtlRepository(),
                localDns: FakeLocalDnsRepository(),
                metrics: FakeMetricsRepository(),
                network: FakeNetworkRepository(),
                realtimeStatus: FakeRealTimeStatusRepository(),
                client: FakeClientRepository(),
                group: fakeGroupRepository,
                serverAddress: 'http://localhost:8081',
                apiVersion: 'v6',
              ),
            ),
          ],
          child: const FindDomainsInListsScreen(),
        ),
      );
    }

    testWidgets('shows search form and hides results before search', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildWidget());
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
      await tester.pumpWidget(buildWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Search').last);
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Please enter a domain to search.'), findsOneWidget);
    });

    testWidgets('shows snackbar when max results is invalid', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildWidget());
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
      final v5ServersViewModel = FakeServersViewModel()
        ..selectedServer = const Server(
          address: 'http://localhost:8080',
          alias: 'test v5',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );

      await tester.pumpWidget(
        buildTestApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<ServersViewModel>.value(
                value: v5ServersViewModel,
              ),
              ChangeNotifierProvider<FindDomainsInListsViewModel>.value(
                value: findDomainsInListsViewModel,
              ),
              ChangeNotifierProvider<GroupsViewModel>.value(
                value: groupsViewModel,
              ),
            ],
            child: const FindDomainsInListsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
    });

    testWidgets('renders summary and results after successful search', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildWidget());
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

      await tester.pumpWidget(buildWidget());
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
      findDomainsInListsViewModel = FindDomainsInListsViewModel(
        adListRepository: failingRepo,
        domainRepository: fakeDomainRepository,
      );

      await tester.pumpWidget(
        buildTestApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<ServersViewModel>.value(
                value: fakeServersViewModel,
              ),
              ChangeNotifierProvider<FindDomainsInListsViewModel>.value(
                value: findDomainsInListsViewModel,
              ),
              ChangeNotifierProvider<GroupsViewModel>.value(
                value: groupsViewModel,
              ),
              Provider<RepositoryBundle?>(
                create: (_) => RepositoryBundle(
                  actions: FakeActionsRepository(),
                  adlist: failingRepo,
                  auth: FakeAuthRepository(),
                  config: FakeConfigRepository(),
                  dhcp: FakeDhcpRepository(),
                  dns: FakeDnsRepository(),
                  domain: fakeDomainRepository,
                  ftl: FakeFtlRepository(),
                  localDns: FakeLocalDnsRepository(),
                  metrics: FakeMetricsRepository(),
                  network: FakeNetworkRepository(),
                  realtimeStatus: FakeRealTimeStatusRepository(),
                  client: FakeClientRepository(),
                  group: fakeGroupRepository,
                  serverAddress: 'http://localhost:8081',
                  apiVersion: 'v6',
                ),
              ),
            ],
            child: const FindDomainsInListsScreen(),
          ),
        ),
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
