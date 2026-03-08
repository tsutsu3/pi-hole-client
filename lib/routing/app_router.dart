import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_logs_screen.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_screen_factory.dart';
import 'package:pi_hole_client/ui/home/widgets/home_screen.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_screen.dart';
import 'package:pi_hole_client/ui/servers/widgets/servers_screen.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/app_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/legal_screen.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/licenses_screen.dart';
import 'package:pi_hole_client/ui/settings/about/widgets/privacy_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/auto_refresh_time_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/chart_visualization_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/log_refresh_interval_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/logs_quantity_load_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/widgets/advanced_options_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/widgets/language_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/widgets/theme_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp/widgets/dhcp_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp/widgets/dhcp_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists/widgets/find_domains_in_lists_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface/widgets/interface_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns/widgets/local_dns_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network/widgets/network_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network/widgets/network_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions/widgets/session_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions/widgets/sessions_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_client_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/widgets/server_info_screen_factory.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/advanced_server_options_screen.dart';
import 'package:pi_hole_client/ui/shell/app_shell.dart';
import 'package:pi_hole_client/ui/shell/base.dart';
import 'package:pi_hole_client/ui/shell/settings_shell.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_screen.dart';
import 'package:provider/provider.dart';

/// Creates the application router configuration.
///
/// ## Route structure
///
/// ```txt
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
    // Glance widget taps send `glance-action://` URIs.
    // If GoRouter receives one with no matching route, redirect to /home.
    onException: (_, state, router) => router.go('/home'),
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
                    builder: (context, state) => const StatisticsScreen(),
                  ),
                ],
              ),

              // ── Branch 2: Logs ──
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/logs',
                    name: Routes.logs,
                    builder: (context, state) => LogsScreen(
                      logsViewModel: context.read<LogsViewModel>(),
                      appConfigViewModel: context.read<AppConfigViewModel>(),
                    ),
                  ),
                ],
              ),

              // ── Branch 3: Domains ──
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/domains',
                    name: Routes.domains,
                    builder: (context, state) {
                      final bundle = context.watch<RepositoryBundle?>();
                      if (bundle == null) return const SizedBox.shrink();
                      return KeyedSubtree(
                        key: ObjectKey(bundle),
                        child: createDomainsScreen(bundle),
                      );
                    },
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
                        builder: (context, state) => const ServersScreen(),
                      ),
                      GoRoute(
                        path: '/settings/app/advanced',
                        name: Routes.settingsAppAdvanced,
                        builder: (context, state) =>
                            const AdvancedOptionsScreen(),
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
                        builder: (context, state) => LogsQuantityLoadScreen(
                          apiVersion:
                              context
                                  .read<ServersViewModel>()
                                  .selectedServer
                                  ?.apiVersion ??
                              '',
                        ),
                      ),
                      GoRoute(
                        path: '/settings/app/advanced/app-logs',
                        name: Routes.settingsAppAdvancedAppLogs,
                        builder: (context, state) => const AppLogsScreen(),
                      ),

                      // ── Settings > Server ──
                      GoRoute(
                        path: '/settings/server/info',
                        name: Routes.settingsServerInfo,
                        builder: (context, state) {
                          final server = context
                              .read<ServersViewModel>()
                              .selectedServer!;
                          return createServerInfoScreen(
                            bundle: context.read<RepositoryBundle?>()!,
                            serverAlias: server.alias,
                            serverAddress: server.address,
                          );
                        },
                      ),
                      GoRoute(
                        path: '/settings/server/adlists',
                        name: Routes.settingsServerAdlists,
                        builder: (context, state) => createAdlistScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                      ),
                      GoRoute(
                        path: '/settings/server/group-client',
                        name: Routes.settingsServerGroupClient,
                        builder: (context, state) => createGroupClientScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                      ),
                      GoRoute(
                        path: '/settings/server/advanced',
                        name: Routes.settingsServerAdvanced,
                        builder: (context, state) =>
                            const AdvancedServerOptionsScreen(),
                      ),

                      // ── Settings > Server > Advanced ──
                      GoRoute(
                        path: '/settings/server/advanced/sessions',
                        name: Routes.settingsServerAdvancedSessions,
                        builder: (context, state) => createSessionsScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'details',
                            name: Routes.settingsServerAdvancedSessionsDetails,
                            builder: (context, state) {
                              final extra = state.extra!
                                  as (AuthSession, void Function(AuthSession));
                              return SessionDetailScreen(
                                session: extra.$1,
                                onDelete: extra.$2,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: '/settings/server/advanced/dhcp',
                        name: Routes.settingsServerAdvancedDhcp,
                        builder: (context, state) => createDhcpScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'details',
                            name: Routes.settingsServerAdvancedDhcpDetails,
                            builder: (context, state) {
                              final extra = state.extra!
                                  as (DhcpLease, void Function(DhcpLease));
                              return DhcpDetailScreen(
                                lease: extra.$1,
                                onDelete: extra.$2,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: '/settings/server/advanced/local-dns',
                        name: Routes.settingsServerAdvancedLocalDns,
                        builder: (context, state) => createLocalDnsScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                      ),
                      GoRoute(
                        path: '/settings/server/advanced/find-domains-in-lists',
                        name: Routes.settingsServerAdvancedFindDomainsInLists,
                        builder: (context, state) =>
                            createFindDomainsInListsScreen(
                              context.read<RepositoryBundle?>()!,
                            ),
                      ),
                      GoRoute(
                        path: '/settings/server/advanced/interface',
                        name: Routes.settingsServerAdvancedInterface,
                        builder: (context, state) => createInterfaceScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                      ),
                      GoRoute(
                        path: '/settings/server/advanced/network',
                        name: Routes.settingsServerAdvancedNetwork,
                        builder: (context, state) => createNetworkScreen(
                          context.read<RepositoryBundle?>()!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'details',
                            name: Routes.settingsServerAdvancedNetworkDetails,
                            builder: (context, state) {
                              final extra = state.extra!
                                  as (Device, void Function(Device));
                              return NetworkDetailScreen(
                                device: extra.$1,
                                onDelete: extra.$2,
                              );
                            },
                          ),
                        ],
                      ),

                      // ── Settings > About ──
                      GoRoute(
                        path: '/settings/about/app-detail',
                        name: Routes.settingsAboutAppDetail,
                        builder: (context, state) => AppDetailScreen(
                          appVersion: context
                              .read<AppConfigViewModel>()
                              .getAppInfo
                              ?.version,
                        ),
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

/// Reactively switches between [HomeScreen] and [ServersScreen] based on whether
/// a server is selected. Used as the `/home` route builder.
class _HomeOrConnect extends StatelessWidget {
  const _HomeOrConnect();

  @override
  Widget build(BuildContext context) {
    final serversViewModel = context.watch<ServersViewModel>();
    if (serversViewModel.selectedServer != null) {
      return HomeScreen(
        serversViewModel: serversViewModel,
        appConfigViewModel: context.read<AppConfigViewModel>(),
        statusViewModel: context.read<StatusViewModel>(),
      );
    }
    return const ServersScreen();
  }
}
