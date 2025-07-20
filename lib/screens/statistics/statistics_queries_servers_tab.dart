import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/models/realtime_status.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/statistics/custom_pie_chart.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/screens/statistics/pie_chart_legend.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:pi_hole_client/widgets/tab_content.dart';
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
    final statusLoading = context.select<StatusProvider, LoadStatus>(
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
    // final statusProvider = Provider.of<StatusProvider>(context);
    final realtimeStatus = context.select<StatusProvider, RealtimeStatus?>(
      (provider) => provider.getRealtimeStatus,
    );

    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        if (realtimeStatus?.queryTypes.isEmpty == false)
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
                            child: CustomPieChart(
                              data: realtimeStatus!.queryTypes,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: realtimeStatus.queryTypes,
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(
                      data: realtimeStatus!.queryTypes,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(
                    data: realtimeStatus.queryTypes,
                    dataUnit: '%',
                  ),
                ],
              ],
            ),
          )
        else
          NoDataChart(
            topLabel: AppLocalizations.of(context)!.queryTypes,
          ),
        if (realtimeStatus!.forwardDestinations.isEmpty == false)
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
                            child: CustomPieChart(
                              data: realtimeStatus.forwardDestinations,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: realtimeStatus.forwardDestinations,
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(
                      data: realtimeStatus.forwardDestinations,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(
                    data: realtimeStatus.forwardDestinations,
                    dataUnit: '%',
                  ),
                ],
              ],
            ),
          )
        else
          NoDataChart(
            topLabel: AppLocalizations.of(context)!.upstreamServers,
          ),
      ],
    );
  }
}
