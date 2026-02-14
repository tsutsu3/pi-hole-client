/// Route name constants for go_router navigation.
///
/// This class provides a centralized location for all route names,
/// making it easier to maintain and refactor routes.
///
/// Route names use a hierarchical naming convention (e.g., `settings/app/theme`)
/// to clearly indicate parent-child relationships.
///
/// The order of constants within each section matches the UI display order.
abstract class Routes {
  // ===== Main navigation routes =====
  static const home = 'home';
  static const statistics = 'statistics';
  static const logs = 'logs';
  static const domains = 'domains';
  static const settings = 'settings';

  // ===== Logs sub-routes =====
  static const logsDetails = 'logs/details';

  // ===== Domains sub-routes =====
  static const domainsDetails = 'domains/details';

  // ===== Settings sub-routes =====
  static const settingsApp = 'settings/app';
  static const settingsServer = 'settings/server';
  static const settingsAbout = 'settings/about';

  // ===== Settings > App sub-routes =====
  static const settingsAppTheme = 'settings/app/theme';
  static const settingsAppLanguage = 'settings/app/language';
  static const settingsAppServers = 'settings/app/servers';
  static const settingsAppAdvanced = 'settings/app/advanced';

  // ===== Settings > App > Advanced sub-routes =====
  static const settingsAppAdvancedChartVisualization =
      'settings/app/advanced/chart-visualization';
  static const settingsAppAdvancedStatsRefreshTime =
      'settings/app/advanced/stats-refresh-time';
  static const settingsAppAdvancedLogRefreshInterval =
      'settings/app/advanced/log-refresh-interval';
  static const settingsAppAdvancedLogsQuantityLoad =
      'settings/app/advanced/logs-quantity-load';
  static const settingsAppAdvancedAppLogs = 'settings/app/advanced/app-logs';
  static const settingsAppAdvancedReset = 'settings/app/advanced/reset';

  // ===== Settings > Server sub-routes =====
  static const settingsServerInfo = 'settings/server/info';
  static const settingsServerAdlists = 'settings/server/adlists';
  static const settingsServerAdlistsDetails =
      'settings/server/adlists/details';
  static const settingsServerGroupClient = 'settings/server/group-client';
  static const settingsServerGroupDetails =
      'settings/server/group-client/group-details';
  static const settingsServerClientDetails =
      'settings/server/group-client/client-details';
  static const settingsServerAdvanced = 'settings/server/advanced';

  // ===== Settings > Server > Advanced sub-routes =====
  static const settingsServerAdvancedSessions =
      'settings/server/advanced/sessions';
  static const settingsServerAdvancedSessionsDetails =
      'settings/server/advanced/sessions/details';
  static const settingsServerAdvancedDhcp = 'settings/server/advanced/dhcp';
  static const settingsServerAdvancedDhcpDetails =
      'settings/server/advanced/dhcp/details';
  static const settingsServerAdvancedLocalDns =
      'settings/server/advanced/local-dns';
  static const settingsServerAdvancedLocalDnsDetails =
      'settings/server/advanced/local-dns/details';
  static const settingsServerAdvancedFindDomainsInLists =
      'settings/server/advanced/find-domains-in-lists';
  static const settingsServerAdvancedInterface =
      'settings/server/advanced/interface';
  static const settingsServerAdvancedInterfaceAddress =
      'settings/server/advanced/interface/address';
  static const settingsServerAdvancedInterfaceStatistics =
      'settings/server/advanced/interface/statistics';
  static const settingsServerAdvancedInterfaceMore =
      'settings/server/advanced/interface/more';
  static const settingsServerAdvancedNetwork =
      'settings/server/advanced/network';
  static const settingsServerAdvancedNetworkDetails =
      'settings/server/advanced/network/details';

  // ===== Settings > About sub-routes =====
  static const settingsAboutAppDetail = 'settings/about/app-detail';
  static const settingsAboutPrivacy = 'settings/about/privacy';
  static const settingsAboutLegal = 'settings/about/legal';
  static const settingsAboutLicenses = 'settings/about/licenses';
}
