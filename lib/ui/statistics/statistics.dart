import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/logic/refresh_server_status.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/statistics/dns_tab.dart';
import 'package:pi_hole_client/ui/statistics/statistics_list.dart';
import 'package:pi_hole_client/ui/statistics/statistics_queries_servers_tab.dart';
import 'package:pi_hole_client/ui/statistics/statistics_triple_column.dart';
import 'package:provider/provider.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late final ScrollController _queriesController;
  late final ScrollController _domainsController;
  late final ScrollController _clientsController;
  late final ScrollController _dnsController;

  @override
  void initState() {
    super.initState();
    _queriesController = ScrollController();
    _domainsController = ScrollController();
    _clientsController = ScrollController();
    _dnsController = ScrollController();
  }

  @override
  void dispose() {
    _queriesController.dispose();
    _domainsController.dispose();
    _clientsController.dispose();
    _dnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiVersion =
        context.select((ServersProvider p) => p.selectedServer?.apiVersion) ??
        'v5';

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      return const StatisticsTripleColumn();
    }

    final loc = AppLocalizations.of(context)!;
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

    final pages = <Widget>[
      QueriesServersTab(
        onRefresh: () async => refreshServerStatus(context),
        controller: _queriesController,
      ),
      StatisticsList(
        type: 'domains',
        countLabel: loc.hits,
        onRefresh: () async => refreshServerStatus(context),
        controller: _domainsController,
      ),
      StatisticsList(
        type: 'clients',
        countLabel: loc.requests,
        onRefresh: () async => refreshServerStatus(context),
        controller: _clientsController,
      ),
    ];

    // Add DNS tab for v6
    if (apiVersion == 'v6') {
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
        DnsTab(
          onRefresh: () async => refreshServerStatus(context),
          controller: _dnsController,
        ),
      );
    }

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverAppBar(
                  title: Text(AppLocalizations.of(context)!.statistics),
                  pinned: true,
                  floating: true,
                  centerTitle: false,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: tabs,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: pages),
        ),
      ),
    );
  }
}
