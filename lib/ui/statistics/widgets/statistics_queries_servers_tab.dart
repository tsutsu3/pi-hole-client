import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/statistics/widgets/custom_pie_chart.dart';
import 'package:pi_hole_client/ui/statistics/widgets/no_data_chart.dart';
import 'package:pi_hole_client/ui/statistics/widgets/pie_chart_legend.dart';
import 'package:provider/provider.dart';

class QueriesServersTab extends StatelessWidget {
  const QueriesServersTab({
    required this.onRefresh,
    this.controller,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final statusLoading = context.select<StatusViewModel, LoadStatus>(
      (p) => p.getStatusLoading,
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
      contentGenerator: () => [const QueriesServersTabContent()],
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
      loadStatus: statusLoading,
      onRefresh: onRefresh,
      controller: controller,
    );
  }
}

class QueriesServersTabContent extends StatelessWidget {
  const QueriesServersTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final realtimeStatus = context.select<StatusViewModel, RealtimeStatus?>(
      (provider) => provider.getRealtimeStatus,
    );

    final width = MediaQuery.of(context).size.width;

    // Convert List<QueryTypeStat> to Map<String, double> for pie chart
    final queryTypesMap = realtimeStatus != null
        ? _sortedDescending(
            Map.fromEntries(
              realtimeStatus.summary.queryTypes
                  .where((q) => q.percentage > 0)
                  .map(
                    (q) => MapEntry(q.type.name.toUpperCase(), q.percentage),
                  ),
            ),
          )
        : <String, double>{};

    // Convert List<DestinationStat> to Map<String, double> for pie chart
    final destinationsMap = realtimeStatus != null
        ? _sortedDescending(
            Map.fromEntries(
              realtimeStatus.forwardDestinations
                  .where((d) => d.percentage > 0)
                  .map((d) => MapEntry(d.destination, d.percentage)),
            ),
          )
        : <String, double>{};

    return Column(
      children: [
        if (queryTypesMap.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SectionLabel(
                  label: AppLocalizations.of(context)!.queryTypes,
                  padding: const EdgeInsets.only(top: 8, left: 16, bottom: 24),
                ),
                if (width > ResponsiveConstants.medium)
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              maxHeight: 200,
                            ),
                            child: CustomPieChart(data: queryTypesMap),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: queryTypesMap,
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(data: queryTypesMap),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(data: queryTypesMap, dataUnit: '%'),
                ],
              ],
            ),
          )
        else
          NoDataChart(topLabel: AppLocalizations.of(context)!.queryTypes),
        if (destinationsMap.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SectionLabel(
                  label: AppLocalizations.of(context)!.upstreamServers,
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 24),
                ),
                if (width > ResponsiveConstants.medium)
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              maxHeight: 200,
                            ),
                            child: CustomPieChart(data: destinationsMap),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: destinationsMap,
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(data: destinationsMap),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(data: destinationsMap, dataUnit: '%'),
                ],
              ],
            ),
          )
        else
          NoDataChart(topLabel: AppLocalizations.of(context)!.upstreamServers),
      ],
    );
  }

  Map<String, double> _sortedDescending(Map<String, double> values) {
    final sortedKeys = values.keys.toList(growable: false)
      ..sort((a, b) => values[b]!.compareTo(values[a]!));
    return LinkedHashMap.fromIterable(
      sortedKeys,
      key: (k) => k,
      value: (k) => values[k] ?? 0.0,
    );
  }
}
