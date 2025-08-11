import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/statistics/dns_tab.dart';
import 'package:pi_hole_client/ui/statistics/statistics_list.dart';
import 'package:pi_hole_client/ui/statistics/statistics_queries_servers_tab.dart';
import 'package:provider/provider.dart';

class StatisticsTripleColumn extends StatelessWidget {
  const StatisticsTripleColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final apiVersion =
        context.select((ServersProvider p) => p.selectedServer?.apiVersion) ??
            'v5';

    final columns = <Widget>[
      _buildColumn(
        context: context,
        title: AppLocalizations.of(context)!.queriesServers,
        content: const QueriesServersTabContent(),
      ),
      _buildColumn(
        context: context,
        title: AppLocalizations.of(context)!.domains,
        content: StatisticsListContent(
          type: 'domains',
          countLabel: AppLocalizations.of(context)!.hits,
          pieChartRadiusScale: 6.0,
        ),
      ),
      _buildColumn(
        context: context,
        title: AppLocalizations.of(context)!.clients,
        content: StatisticsListContent(
          type: 'clients',
          countLabel: AppLocalizations.of(context)!.requests,
          pieChartRadiusScale: 6.0,
        ),
      ),
    ];

    if (apiVersion == 'v6') {
      columns.add(
        _buildColumn(
          context: context,
          title: AppLocalizations.of(context)!.dns,
          content: const DnsTabContent(),
        ),
      );
    }

    Widget body;
    switch (statusProvider.getStatusLoading) {
      case LoadStatus.loading:
        body = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.loadingStats,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );

      case LoadStatus.loaded:
        final controller = PageController(viewportFraction: 1 / 3);
        body = Stack(
          children: [
            ScrollConfiguration(
              behavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: apiVersion == 'v6' ? 32 : 0,
                ),
                child: PageView.builder(
                  controller: controller,
                  physics: const PageScrollPhysics(),
                  padEnds: false,
                  itemCount: columns.length,
                  itemBuilder: (context, index) {
                    return columns[index];
                  },
                ),
              ),
            ),
            if (apiVersion == 'v6')
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.chevron_left,
                    size: 32,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withValues(alpha: 0.5),
                  ),
                ),
              ),
            if (apiVersion == 'v6')
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.chevron_right,
                    size: 32,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withValues(alpha: 0.5),
                  ),
                ),
              ),
          ],
        );

      case LoadStatus.error:
        body = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.statsNotLoaded,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.statistics),
      ),
      body: body,
    );
  }

  Widget _buildColumn({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ListView(children: [content]),
        ),
      ],
    );
  }
}
