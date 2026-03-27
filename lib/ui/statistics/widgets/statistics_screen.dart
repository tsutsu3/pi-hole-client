import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/actions/refresh_server_status.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_visibility_ticker.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/app_shell.dart';
import 'package:pi_hole_client/ui/statistics/widgets/dns_tab.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_list.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_queries_servers_tab.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_triple_column.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with TickerProviderStateMixin {
  late final ScrollController _queriesController;
  late final ScrollController _domainsController;
  late final ScrollController _clientsController;
  late final ScrollController _dnsController;

  TabController? _tabController;
  int _lastTabLength = 0;

  late final AppConfigViewModel _appConfigViewModel;
  int _lastKnownTab = AppShell.statisticsIndex;

  @override
  void initState() {
    super.initState();
    _queriesController = ScrollController();
    _domainsController = ScrollController();
    _clientsController = ScrollController();
    _dnsController = ScrollController();

    _appConfigViewModel = context.read<AppConfigViewModel>();
    _appConfigViewModel.addListener(_onAppConfigChanged);
  }

  void _onAppConfigChanged() {
    final currentTab = _appConfigViewModel.selectedTab;
    if (currentTab == _lastKnownTab) return;
    _lastKnownTab = currentTab;

    // Reset tab to first when returning to statistics.
    // Resetting on leave would call TabController.index while off-screen,
    // triggering TabBarView.setState() before TickerMode(enabled: false) is
    // applied — causing unnecessary rebuilds of all statistics widgets.
    if (currentTab == AppShell.statisticsIndex) {
      _tabController?.index = 0;
    }
  }

  void _ensureTabController(int length) {
    if (_tabController == null || _lastTabLength != length) {
      _tabController?.dispose();
      _tabController = TabController(length: length, vsync: this);
      _lastTabLength = length;
    }
  }

  @override
  void dispose() {
    _appConfigViewModel.removeListener(_onAppConfigChanged);
    _tabController?.dispose();
    _queriesController.dispose();
    _domainsController.dispose();
    _clientsController.dispose();
    _dnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiVersion =
        context.select<ServersViewModel, String?>(
          (vm) => vm.selectedServer?.apiVersion,
        ) ?? 'v5';

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      return const StatisticsTripleColumn();
    }

    final loc = AppLocalizations.of(context)!;
    final isV6 = apiVersion == 'v6';

    // Initialize TabController before building pages so TabVisibilityTicker
    // can reference _tabController! safely.
    _ensureTabController(isV6 ? 4 : 3);

    final tabs = <Tab>[
      Tab(
        child: Row(
          children: [
            const Icon(Icons.dns_rounded),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.queriesServers),
          ],
        ),
      ),
      Tab(
        child: Row(
          children: [
            const Icon(Icons.http_rounded),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.domains),
          ],
        ),
      ),
      Tab(
        child: Row(
          children: [
            const Icon(Icons.devices_rounded),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.clients),
          ],
        ),
      ),
    ];

    // Wrap each page with TabVisibilityTicker so that only the active tab has
    // TickerMode enabled. TabBarView (PageView) does not disable TickerMode
    // for non-active pages, so without this wrapper visited-but-inactive tabs
    // would keep select() subscriptions alive and rebuild on every timer tick.
    final pages = <Widget>[
      TabVisibilityTicker(
        controller: _tabController!,
        index: 0,
        child: QueriesServersTab(
          onRefresh: () async => refreshServerStatus(context),
          controller: _queriesController,
        ),
      ),
      TabVisibilityTicker(
        controller: _tabController!,
        index: 1,
        child: StatisticsList(
          type: 'domains',
          countLabel: loc.hits,
          onRefresh: () async => refreshServerStatus(context),
          controller: _domainsController,
        ),
      ),
      TabVisibilityTicker(
        controller: _tabController!,
        index: 2,
        child: StatisticsList(
          type: 'clients',
          countLabel: loc.requests,
          onRefresh: () async => refreshServerStatus(context),
          controller: _clientsController,
        ),
      ),
    ];

    // Add DNS tab for v6
    if (isV6) {
      tabs.add(
        Tab(
          child: Row(
            children: [
              const Icon(Icons.public_rounded),
              const SizedBox(width: 16),
              Text(AppLocalizations.of(context)!.dns),
            ],
          ),
        ),
      );
      pages.add(
        TabVisibilityTicker(
          controller: _tabController!,
          index: 3,
          child: DnsTab(
            onRefresh: () async => refreshServerStatus(context),
            controller: _dnsController,
          ),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text(AppLocalizations.of(context)!.statistics),
                pinned: true,
                floating: true,
                centerTitle: false,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: _tabController,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(controller: _tabController, children: pages),
      ),
    );
  }
}
