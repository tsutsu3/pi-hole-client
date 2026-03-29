import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/statistics/widgets/dns_tab.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_list.dart';
import 'package:pi_hole_client/ui/statistics/widgets/statistics_queries_servers_tab.dart';
import 'package:provider/provider.dart';

class StatisticsTripleColumn extends StatefulWidget {
  const StatisticsTripleColumn({super.key});

  @override
  State<StatisticsTripleColumn> createState() => _StatisticsTripleColumnState();
}

class _StatisticsTripleColumnState extends State<StatisticsTripleColumn> {
  final PageController _controller = PageController(viewportFraction: 1 / 3);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusLoading = context.select<StatusViewModel, LoadStatus>(
      (vm) => vm.getStatusLoading,
    );
    final apiVersion =
        context.select<ServersViewModel, String?>(
          (vm) => vm.selectedServer?.apiVersion,
        ) ??
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
    switch (statusLoading) {
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
                  controller: _controller,
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.statistics)),
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(child: ListView(children: [content])),
      ],
    );
  }
}
