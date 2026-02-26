import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/statistics/widgets/custom_pie_chart.dart';
import 'package:pi_hole_client/ui/statistics/widgets/no_data_chart.dart';
import 'package:pi_hole_client/ui/statistics/widgets/pie_chart_legend.dart';
import 'package:provider/provider.dart';

class DnsTab extends StatelessWidget {
  const DnsTab({required this.onRefresh, this.controller, super.key});

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
      contentGenerator: () => [const DnsTabContent()],
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

class DnsTabContent extends StatelessWidget {
  const DnsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final dnsCache = context.select<StatusViewModel, DnsCache?>(
      (p) => p.getDnsCache,
    );

    final dnsReplies = context.select<StatusViewModel, DnsReplies?>(
      (p) => p.getDnsReplies,
    );

    final loc = AppLocalizations.of(context)!;

    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // DNS Cache
        if (dnsCache != null)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SectionLabel(
                  label: loc.dnsCacheMetrics,
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
                              data: _buildCachePercentages(dnsCache),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: _buildCachePercentages(dnsCache),
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(
                      data: _buildCachePercentages(dnsCache),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(
                    data: _buildCachePercentages(dnsCache),
                    dataUnit: '%',
                  ),
                ],
              ],
            ),
          )
        else
          NoDataChart(topLabel: loc.queryTypes),

        // DNS Replies
        if (dnsReplies != null)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SectionLabel(
                  label: loc.dnsReplyMetrics,
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
                              data: _buildDnsRepliesList(dnsReplies, loc),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: _buildDnsRepliesList(dnsReplies, loc),
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(
                      data: _buildDnsRepliesList(dnsReplies, loc),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(
                    data: _buildDnsRepliesList(dnsReplies, loc),
                    dataUnit: '%',
                  ),
                ],
              ],
            ),
          )
        else
          NoDataChart(topLabel: loc.upstreamServers),
      ],
    );
  }

  Map<String, double> _buildCachePercentages(DnsCache cache) {
    final map = <String, double>{};
    for (final tp in cache.typePercentages) {
      final typeName = tp.type.name.toUpperCase();
      final name = tp.isStale ? '$typeName (stale)' : typeName;
      map[name] = tp.percentage;
    }
    final total = map.values.fold(0.0, (a, b) => a + b);
    map['empty'] = (100.0 - total).clamp(0.0, 100.0);
    return map;
  }

  Map<String, double> _buildDnsRepliesList(
    DnsReplies info,
    AppLocalizations loc,
  ) {
    return {
      loc.localCacheReplies: info.localPercentage,
      loc.forwardedQueries: info.forwardedPercentage,
      loc.cacheOptimizerReplies: info.optimizedPercentage,
      loc.unansweredQueries: info.unansweredPercentage,
      loc.authoritativeReplies: info.authPercentage,
    };
  }
}
