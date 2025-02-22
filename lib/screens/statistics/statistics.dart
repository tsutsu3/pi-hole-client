import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/refresh_server_status.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/screens/statistics/statistics_list.dart';
import 'package:pi_hole_client/screens/statistics/statistics_queries_servers_tab.dart';
import 'package:pi_hole_client/screens/statistics/statistics_triple_column.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      return const StatisticsTripleColumn();
    } else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: Text(AppLocalizations.of(context)!.statistics),
                    pinned: true,
                    floating: true,
                    centerTitle: false,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: [
                        Tab(
                          child: Row(
                            children: [
                              const Icon(Icons.dns_rounded),
                              const SizedBox(width: 16),
                              Text(
                                AppLocalizations.of(context)!.queriesServers,
                              ),
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
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                QueriesServersTab(
                  onRefresh: () async => refreshServerStatus(context),
                ),
                StatisticsList(
                  countLabel: AppLocalizations.of(context)!.hits,
                  type: 'domains',
                  onRefresh: () async => refreshServerStatus(context),
                ),
                StatisticsList(
                  countLabel: AppLocalizations.of(context)!.requests,
                  type: 'clients',
                  onRefresh: () async => refreshServerStatus(context),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
