import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/statistics/animated_percent_indicator.dart';
import 'package:pi_hole_client/screens/statistics/custom_pie_chart.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/screens/statistics/pie_chart_legend.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:pi_hole_client/widgets/tab_content.dart';
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
    final loadStatus = context.select<StatusProvider, LoadStatus>(
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
      contentGenerator: () =>
          [StatisticsListContent(type: type, countLabel: countLabel)],
      errorGenerator: () => SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
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

    final realtimeStatus = context.select<StatusProvider, RealtimeStatus?>(
      (p) => p.getRealtimeStatus,
    );

    final totalClients = context.select<FiltersProvider, List<String>>(
      (p) => p.totalClients,
    );

    final visualizationMode = context.select<AppConfigProvider, int>(
      (p) => p.statisticsVisualizationMode,
    );

    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;

    void navigateFilter(String value) {
      final filtersProvider = context.read<FiltersProvider>();
      final appConfigProvider = context.read<AppConfigProvider>();

      if (type == 'clients') {
        final isContained =
            totalClients.where((client) => value.contains(client)).toList();
        if (isContained.isNotEmpty) {
          filtersProvider.setSelectedClients([isContained[0]]);
          appConfigProvider.setSelectedTab(2);
        }
      }
      if (type == 'domains') {
        filtersProvider.setSelectedDomain(value);
        appConfigProvider.setSelectedTab(2);
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
                          // key: ValueKey('${item['label']}-${item['value']}'),
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

    Widget pieChertViewMode(List<Map<String, dynamic>> values) {
      var items = <String, double>{};
      var legend = <String, int>{};
      for (final item in values) {
        items = {...items, item['label']: item['value'].toDouble()};
        legend = {...legend, item['label']: item['value'].toInt()};
      }
      return Column(
        children: [
          const SizedBox(height: 10),
          CustomPieChart(
            data: items,
            radiusScale: pieChartRadiusScale,
          ),
          const SizedBox(height: 20),
          PieChartLegend(
            data: legend,
            onValueTap: navigateFilter,
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    Widget generateList(Map<String, int> values, String label) {
      final topQueriesList = convertFromMapToList(values);

      return Column(
        children: [
          SectionLabel(
            label: label,
            padding: const EdgeInsets.only(top: 24, left: 16, bottom: 16),
          ),
          if (visualizationMode == 0)
            listViewMode(topQueriesList)
          else
            pieChertViewMode(topQueriesList),
        ],
      );
    }

    if (type == 'domains') {
      return Column(
        children: [
          if (realtimeStatus!.topQueries.isNotEmpty)
            generateList(
              realtimeStatus.topQueries,
              loc.topPermittedDomains,
            )
          else
            NoDataChart(
              topLabel: loc.topPermittedDomains,
            ),
          if (realtimeStatus.topAds.isNotEmpty)
            generateList(
              realtimeStatus.topAds,
              loc.topBlockedDomains,
            )
          else
            NoDataChart(
              topLabel: loc.topBlockedDomains,
            ),
        ],
      );
    } else if (type == 'clients') {
      return Column(
        children: [
          if (realtimeStatus!.topSources.isNotEmpty)
            generateList(
              Map.fromEntries(
                realtimeStatus.topSources.entries.take(topk),
              ),
              loc.topClients,
            )
          else
            NoDataChart(topLabel: loc.topClients),
          if (realtimeStatus.topSourcesBlocked.isNotEmpty)
            generateList(
              Map.fromEntries(
                realtimeStatus.topSourcesBlocked.entries.take(topk),
              ),
              loc.topClientsBlocked,
            )
          else
            NoDataChart(
              topLabel: loc.topClientsBlocked,
            ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
