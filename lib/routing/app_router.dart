import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/about/legal_screen.dart';
import 'package:pi_hole_client/ui/settings/about/licenses_screen.dart';
import 'package:pi_hole_client/ui/settings/about/privacy_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options.dart';
import 'package:pi_hole_client/ui/settings/app_settings/language_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/theme_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_server_options.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/viewmodel/dhcp_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/viewmodel/find_domains_in_lists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/viewmodel/interface_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/viewmodel/local_dns_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/viewmodel/network_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/viewmodel/sessions_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/viewmodel/server_info_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:provider/provider.dart';

/// Creates the application router configuration.
///
/// The router is created as a function that takes the navigator key
/// to maintain compatibility with existing navigation observers (e.g., Sentry).
///
/// ## Migration Strategy
///
/// This is the foundation setup for go_router (Phase 1.2).
/// Currently, the router wraps the existing [Base] widget which handles
/// internal tab-based navigation. In Phase 3, individual screens will be
/// migrated to use go_router directly.
///
/// ## ViewModel DI Pattern (Phase 3)
///
/// New ViewModels will be created in route builders, NOT in MultiProvider.
/// [RepositoryBundle] is provided via [ProxyProvider] in the widget tree,
/// creating version-specific repositories based on the selected server.
/// ViewModels receive repositories via constructor.
///
/// The [navigatorKey] parameter allows external observers like
/// `SentryNavigatorObserver` to track navigation events.
GoRouter createAppRouter({
  required GlobalKey<NavigatorState> navigatorKey,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    observers: observers ?? [],
    routes: [
      // Main shell route - wraps the Base widget which handles
      // bottom navigation and internal tab switching.
      // In Phase 3, this will be refactored to use ShellRoute
      // with individual GoRoute children for each tab.
      GoRoute(
        path: '/',
        name: Routes.home,
        builder: (context, state) => const Base(),
      ),
      GoRoute(
        path: '/settings/server/info',
        name: Routes.settingsServerInfo,
        builder: (context, state) {
          final server = context.read<ServersViewModel>().selectedServer!;
          final bundle = context.read<RepositoryBundle?>();
          return ServerInfoScreen(
            viewModel: ServerInfoViewModel(ftlRepository: bundle!.ftl)
              ..loadServerInfo.run(),
            serverAlias: server.alias,
            serverAddress: server.address,
          );
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/sessions',
        name: Routes.settingsServerAdvancedSessions,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return SessionsScreen(
            viewModel: SessionsViewModel(authRepository: bundle!.auth)
              ..loadSessions.run(),
          );
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/dhcp',
        name: Routes.settingsServerAdvancedDhcp,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return DhcpScreen(
            viewModel: DhcpViewModel(
              dhcpRepository: bundle!.dhcp,
              ftlRepository: bundle.ftl,
            )..loadLeases.run(),
          );
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/local-dns',
        name: Routes.settingsServerAdvancedLocalDns,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return LocalDnsScreen(
            viewModel: LocalDnsViewModel(
              localDnsRepository: bundle!.localDns,
              networkRepository: bundle.network,
            )..loadRecords.run(),
          );
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/interface',
        name: Routes.settingsServerAdvancedInterface,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return InterfaceScreen(
            viewModel: InterfaceViewModel(networkRepository: bundle!.network)
              ..loadInterfaces.run(),
          );
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/network',
        name: Routes.settingsServerAdvancedNetwork,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return NetworkScreen(
            viewModel: NetworkViewModel(
              networkRepository: bundle!.network,
              ftlRepository: bundle.ftl,
            )..loadDevices.run(),
          );
        },
      ),
      GoRoute(
        path: '/settings/server/adlists',
        name: Routes.settingsServerAdlists,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) =>
                    AdlistsViewModel(adListRepository: bundle!.adlist)
                      ..loadAdlists.run(),
              ),
              ChangeNotifierProvider(
                create: (_) =>
                    GroupsViewModel(groupRepository: bundle!.group)
                      ..loadGroups.run(),
              ),
            ],
            child: const AdlistScreen(),
          );
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/find-domains-in-lists',
        name: Routes.settingsServerAdvancedFindDomainsInLists,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => FindDomainsInListsViewModel(
                  adListRepository: bundle!.adlist,
                  domainRepository: bundle.domain,
                ),
              ),
              ChangeNotifierProvider(
                create: (_) =>
                    GroupsViewModel(groupRepository: bundle!.group)
                      ..loadGroups.run(),
              ),
            ],
            child: const FindDomainsInListsScreen(),
          );
        },
      ),
      // ===== Settings > App =====
      GoRoute(
        path: '/settings/app/theme',
        name: Routes.settingsAppTheme,
        builder: (context, state) => const ThemeScreen(),
      ),
      GoRoute(
        path: '/settings/app/language',
        name: Routes.settingsAppLanguage,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        path: '/settings/app/advanced',
        name: Routes.settingsAppAdvanced,
        builder: (context, state) => const AdvancedOptions(),
      ),
      // ===== Settings > Server =====
      GoRoute(
        path: '/settings/server/advanced',
        name: Routes.settingsServerAdvanced,
        builder: (context, state) => const AdvancedServerOptions(),
      ),
      // ===== Settings > About =====
      GoRoute(
        path: '/settings/about/privacy',
        name: Routes.settingsAboutPrivacy,
        builder: (context, state) => const PrivacyScreen(),
      ),
      GoRoute(
        path: '/settings/about/legal',
        name: Routes.settingsAboutLegal,
        builder: (context, state) => const LegalScreen(),
      ),
      GoRoute(
        path: '/settings/about/licenses',
        name: Routes.settingsAboutLicenses,
        builder: (context, state) => const LicensesScreen(),
      ),
      GoRoute(
        path: '/settings/server/group-client',
        name: Routes.settingsServerGroupClient,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          final serversViewModel = context.read<ServersViewModel>();
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) =>
                    ClientsViewModel(clientRepository: bundle!.client)
                      ..loadClients.run(),
              ),
              ChangeNotifierProvider(
                create: (_) =>
                    GroupsViewModel(groupRepository: bundle!.group)
                      ..loadGroups.run(),
              ),
              ChangeNotifierProvider(
                create: (_) =>
                    DomainsViewModel(domainRepository: bundle!.domain)
                      ..loadDomains.run(),
              ),
              ChangeNotifierProvider(
                create: (_) =>
                    AdlistsViewModel(adListRepository: bundle!.adlist)
                      ..loadAdlists.run(),
              ),
              ChangeNotifierProvider(
                create: (_) =>
                    LocalDnsProvider(serversViewModel: serversViewModel),
              ),
            ],
            child: const GroupClientScreen(),
          );
        },
      ),
    ],
  );
}
