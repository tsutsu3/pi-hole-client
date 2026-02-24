import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/app_logs/app_logs.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/domains_page.dart';
import 'package:pi_hole_client/ui/home/home.dart';
import 'package:pi_hole_client/ui/logs/logs.dart';
import 'package:pi_hole_client/ui/servers/servers.dart';
import 'package:pi_hole_client/ui/settings/about/app_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/about/legal_screen.dart';
import 'package:pi_hole_client/ui/settings/about/licenses_screen.dart';
import 'package:pi_hole_client/ui/settings/about/privacy_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/auto_refresh_time_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/chart_visualization_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/log_refresh_interval_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/logs_quantity_load_screen.dart';
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
import 'package:pi_hole_client/ui/shell/app_shell.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:pi_hole_client/ui/shell/settings_shell.dart';
import 'package:pi_hole_client/ui/statistics/statistics.dart';
import 'package:provider/provider.dart';

/// Creates the application router configuration.
///
/// ## Route structure
///
/// ```
/// ShellRoute (Base – lifecycle management)
///   └─ StatefulShellRoute.indexedStack (AppShell – NavigationRail / BottomNavBar)
///         ├─ Branch 0: /home, /connect
///         ├─ Branch 1: /statistics
///         ├─ Branch 2: /logs
///         ├─ Branch 3: /domains
///         └─ Branch 4: Settings
///               └─ ShellRoute (SettingsShell – desktop master/detail)
///                     ├─ /settings (list / placeholder)
///                     ├─ /settings/app/*
///                     ├─ /settings/server/*
///                     └─ /settings/about/*
/// ```
///
/// The [navigatorKey] parameter allows external observers like
/// `SentryNavigatorObserver` to track navigation events.
GoRouter createAppRouter({
  required GlobalKey<NavigatorState> navigatorKey,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/home',
    observers: observers ?? [],
    routes: [
      // Outermost shell: lifecycle management (auto-refresh, window events)
      ShellRoute(
        builder: (context, state, child) => Base(child: child),
        routes: [
          // Main navigation shell with 5 branches
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                AppShell(navigationShell: navigationShell),
            branches: [
              // ── Branch 0: Home ──
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/home',
                    name: Routes.home,
                    builder: (context, state) => const _HomeOrConnect(),
                  ),
                ],
              ),

              // ── Branch 1: Statistics ──
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/statistics',
                    name: Routes.statistics,
                    builder: (context, state) => const Statistics(),
                  ),
                ],
              ),

              // ── Branch 2: Logs ──
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/logs',
                    name: Routes.logs,
                    builder: (context, state) => const Logs(),
                  ),
                ],
              ),

              // ── Branch 3: Domains ──
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/domains',
                    name: Routes.domains,
                    builder: (context, state) => const DomainsPage(),
                  ),
                ],
              ),

              // ── Branch 4: Settings ──
              StatefulShellBranch(
                routes: [
                  // Settings shell: desktop = master/detail, mobile = pass-through
                  ShellRoute(
                    builder: (context, state, child) =>
                        SettingsShell(child: child),
                    routes: [
                      GoRoute(
                        path: '/settings',
                        name: Routes.settings,
                        builder: (context, state) =>
                            const SettingsDefaultPage(),
                      ),

                      // ── Settings > App ──
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

                      // ── Settings > App > Advanced ──
                      GoRoute(
                        path: '/settings/app/advanced/chart-visualization',
                        name: Routes.settingsAppAdvancedChartVisualization,
                        builder: (context, state) =>
                            const ChartVisualizationScreen(),
                      ),
                      GoRoute(
                        path: '/settings/app/advanced/stats-refresh-time',
                        name: Routes.settingsAppAdvancedStatsRefreshTime,
                        builder: (context, state) =>
                            const AutoRefreshTimeScreen(),
                      ),
                      GoRoute(
                        path: '/settings/app/advanced/log-refresh-interval',
                        name: Routes.settingsAppAdvancedLogRefreshInterval,
                        builder: (context, state) =>
                            const LogRefreshIntervalScreen(),
                      ),
                      GoRoute(
                        path: '/settings/app/advanced/logs-quantity-load',
                        name: Routes.settingsAppAdvancedLogsQuantityLoad,
                        builder: (context, state) {
                          final apiVersion = context
                                  .read<ServersViewModel>()
                                  .selectedServer
                                  ?.apiVersion ??
                              '';
                          return LogsQuantityLoadScreen(
                            apiVersion: apiVersion,
                          );
                        },
                      ),
                      GoRoute(
                        path: '/settings/app/advanced/app-logs',
                        name: Routes.settingsAppAdvancedAppLogs,
                        builder: (context, state) => const AppLogs(),
                      ),

                      // ── Settings > Server ──
                      GoRoute(
                        path: '/settings/server/info',
                        name: Routes.settingsServerInfo,
                        builder: (context, state) {
                          final server =
                              context.read<ServersViewModel>().selectedServer!;
                          final bundle = context.read<RepositoryBundle?>();
                          return createServerInfoScreen(
                            bundle: bundle!,
                            serverAlias: server.alias,
                            serverAddress: server.address,
                          );
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
                        path: '/settings/server/group-client',
                        name: Routes.settingsServerGroupClient,
                        builder: (context, state) {
                          final bundle = context.read<RepositoryBundle?>();
                          return createGroupClientScreen(bundle!);
                        },
                      ),
                      GoRoute(
                        path: '/settings/server/advanced',
                        name: Routes.settingsServerAdvanced,
                        builder: (context, state) =>
                            const AdvancedServerOptions(),
                      ),

                      // ── Settings > Server > Advanced ──
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
                        path: '/settings/server/advanced/find-domains-in-lists',
                        name: Routes.settingsServerAdvancedFindDomainsInLists,
                        builder: (context, state) {
                          final bundle = context.read<RepositoryBundle?>();
                          return createFindDomainsInListsScreen(bundle!);
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

                      // ── Settings > About ──
                      GoRoute(
                        path: '/settings/about/app-detail',
                        name: Routes.settingsAboutAppDetail,
                        builder: (context, state) {
                          final appConfigViewModel =
                              context.read<AppConfigViewModel>();
                          return AppDetailScreen(
                            appVersion:
                                appConfigViewModel.getAppInfo?.version,
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
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Reactively switches between [Home] and [ServersPage] based on whether
/// a server is selected. Used as the `/home` route builder.
class _HomeOrConnect extends StatelessWidget {
  const _HomeOrConnect();

  @override
  Widget build(BuildContext context) {
    final hasServer = context.select<ServersViewModel, bool>(
      (vm) => vm.selectedServer != null,
    );
    return hasServer ? const Home() : const ServersPage();
  }
}
