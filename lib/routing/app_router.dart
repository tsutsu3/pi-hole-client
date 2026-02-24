import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/servers.dart';
import 'package:pi_hole_client/ui/settings/about/app_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/about/legal_screen.dart';
import 'package:pi_hole_client/ui/settings/about/licenses_screen.dart';
import 'package:pi_hole_client/ui/settings/about/privacy_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options.dart';
import 'package:pi_hole_client/ui/settings/app_settings/language_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/theme_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/adlist_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_server_options.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/dhcp_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/find_domains_in_lists_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/interface_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/network_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/sessions_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/server_info_screen_factory.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:provider/provider.dart';

/// Creates the application router configuration.
///
/// ## ViewModel DI Pattern
///
/// Route-specific ViewModels are created in route builders
/// via `context.read<Repository>()`.
/// App-level ViewModels (AppConfig, Servers, Status, Logs, GravityUpdate)
/// remain in `main.dart`'s MultiProvider.
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
          return createServerInfoScreen(
            bundle: bundle!,
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
          return createSessionsScreen(bundle!);
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/dhcp',
        name: Routes.settingsServerAdvancedDhcp,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return createDhcpScreen(bundle!);
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/local-dns',
        name: Routes.settingsServerAdvancedLocalDns,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return createLocalDnsScreen(bundle!);
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/interface',
        name: Routes.settingsServerAdvancedInterface,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return createInterfaceScreen(bundle!);
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/network',
        name: Routes.settingsServerAdvancedNetwork,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return createNetworkScreen(bundle!);
        },
      ),
      GoRoute(
        path: '/settings/server/adlists',
        name: Routes.settingsServerAdlists,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return createAdlistScreen(bundle!);
        },
      ),
      GoRoute(
        path: '/settings/server/advanced/find-domains-in-lists',
        name: Routes.settingsServerAdvancedFindDomainsInLists,
        builder: (context, state) {
          final bundle = context.read<RepositoryBundle?>();
          return createFindDomainsInListsScreen(bundle!);
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
        path: '/settings/app/servers',
        name: Routes.settingsAppServers,
        builder: (context, state) => const ServersPage(),
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
        path: '/settings/about/app-detail',
        name: Routes.settingsAboutAppDetail,
        builder: (context, state) {
          final appConfigViewModel = context.read<AppConfigViewModel>();
          return AppDetailScreen(
            appVersion: appConfigViewModel.getAppInfo?.version,
          );
        },
      ),
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
          return createGroupClientScreen(bundle!);
        },
      ),
    ],
  );
}
