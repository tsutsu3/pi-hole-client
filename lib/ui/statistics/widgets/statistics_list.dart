import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/statistics/widgets/animated_percent_indicator.dart';
import 'package:pi_hole_client/ui/statistics/widgets/custom_pie_chart.dart';
import 'package:pi_hole_client/ui/statistics/widgets/no_data_chart.dart';
import 'package:pi_hole_client/ui/statistics/widgets/pie_chart_legend.dart';
import 'package:provider/provider.dart';

class StatisticsList extends StatelessWidget {
  const StatisticsList({
    required this.countLabel,
    required this.type,
    required this.onRefresh,
    this.controller,
    super.key,
  });

  final String countLabel;
  final String type;
  final Future<void> Function() onRefresh;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final loadStatus = context.select<StatusViewModel, LoadStatus>(
      (provider) => provider.getStatusLoading,
    );

    return CustomTabContent(
      loadingGenerator: () => SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 50),
            Text(
              AppLocalizations.of(context)!.loadingStats,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      contentGenerator: () => [
        StatisticsListContent(type: type, countLabel: countLabel),
      ],
      errorGenerator: () => SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 50, color: Colors.red),
            const SizedBox(height: 50),
            Text(
              AppLocalizations.of(context)!.statsNotLoaded,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      loadStatus: loadStatus,
      onRefresh: onRefresh,
      controller: controller,
    );
  }
}

class StatisticsListContent extends StatelessWidget {
  const StatisticsListContent({
    required this.type,
    required this.countLabel,
    this.pieChartRadiusScale = 3.0,
    super.key,
  });

  final String type;
  final String countLabel;
  final double pieChartRadiusScale;

  @override
  Widget build(BuildContext context) {
    const topk = 10;

    final realtimeStatus = context.select<StatusViewModel, RealtimeStatus?>(
      (p) => p.getRealtimeStatus,
    );

    final totalClients = context.select<LogsViewModel, List<String>>(
      (p) => p.totalClients,
    );

    final visualizationMode =
        context.select<AppConfigViewModel, StatisticsVisualizationMode>(
          (p) => p.statisticsVisualizationMode,
        );

    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;

    void navigateFilter(String value) {
      final logsViewModel = context.read<LogsViewModel>();
      final appConfigViewModel = context.read<AppConfigViewModel>();

      if (type == 'clients') {
        final isContained = totalClients
            .where((client) => value.contains(client))
            .toList();
        if (isContained.isNotEmpty) {
          logsViewModel.setSelectedClients([isContained[0]]);
          appConfigViewModel.setSelectedTab(2);
        }
      }
      if (type == 'domains') {
        logsViewModel.setSelectedDomain(value);
        appConfigViewModel.setSelectedTab(2);
      }
    }

    Widget listViewMode(List<Map<String, dynamic>> values) {
      var totalHits = 0;
      for (final item in values) {
        totalHits = totalHits + item['value'].toInt() as int;
      }

      return Column(
        children: [
          ...values.map(
            (item) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => navigateFilter(item['label']),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['label'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '$countLabel ${item['value'].toInt()}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: AnimatedPercentIndicator(
                          value: item['value'],
                          total: totalHits,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget pieChartViewMode(List<Map<String, dynamic>> values) {
      var items = <String, double>{};
      var legend = <String, int>{};
      for (final item in values) {
        items = {...items, item['label']: item['value'].toDouble()};
        legend = {...legend, item['label']: item['value'].toInt()};
      }
      return Column(
        children: [
          const SizedBox(height: 10),
          CustomPieChart(data: items, radiusScale: pieChartRadiusScale),
          const SizedBox(height: 20),
          PieChartLegend(data: legend, onValueTap: navigateFilter),
          const SizedBox(height: 10),
        ],
      );
    }

    Widget generateList(Map<String, int> values, String label) {
      final topList = values.entries
          .map((e) => {'label': e.key, 'value': e.value})
          .toList();

      return Column(
        children: [
          SectionLabel(
            label: label,
            padding: const EdgeInsets.only(top: 24, left: 16, bottom: 16),
          ),
          if (visualizationMode == StatisticsVisualizationMode.list)
            listViewMode(topList)
          else
            pieChartViewMode(topList),
        ],
      );
    }

    if (type == 'domains') {
      final topQueries = realtimeStatus != null
          ? Map.fromEntries(
              realtimeStatus.topDomains.topQueries
                  .map((q) => MapEntry(q.domain, q.count)),
            )
          : <String, int>{};
      final topAds = realtimeStatus != null
          ? Map.fromEntries(
              realtimeStatus.topDomains.topAds
                  .map((q) => MapEntry(q.domain, q.count)),
            )
          : <String, int>{};

      return Column(
        children: [
          if (topQueries.isNotEmpty)
            generateList(topQueries, loc.topPermittedDomains)
          else
            NoDataChart(topLabel: loc.topPermittedDomains),
          if (topAds.isNotEmpty)
            generateList(topAds, loc.topBlockedDomains)
          else
            NoDataChart(topLabel: loc.topBlockedDomains),
        ],
      );
    } else if (type == 'clients') {
      final topSources = realtimeStatus != null
          ? Map.fromEntries(
              realtimeStatus.topClients.topSources
                  .take(topk)
                  .map((s) => MapEntry(s.source, s.count)),
            )
          : <String, int>{};
      final topSourcesBlocked = realtimeStatus != null
          ? Map.fromEntries(
              realtimeStatus.topClients.topSourcesBlocked
                  .take(topk)
                  .map((s) => MapEntry(s.source, s.count)),
            )
          : <String, int>{};

      return Column(
        children: [
          if (topSources.isNotEmpty)
            generateList(topSources, loc.topClients)
          else
            NoDataChart(topLabel: loc.topClients),
          if (topSourcesBlocked.isNotEmpty)
            generateList(topSourcesBlocked, loc.topClientsBlocked)
          else
            NoDataChart(topLabel: loc.topClientsBlocked),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
