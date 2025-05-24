import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/metrics.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/statistics/custom_pie_chart.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/screens/statistics/pie_chart_legend.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:pi_hole_client/widgets/tab_content.dart';
import 'package:provider/provider.dart';

class DnsTab extends StatelessWidget {
  const DnsTab({
    required this.onRefresh,
    this.controller,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final apiGateway = Provider.of<ServersProvider>(context).selectedApiGateway;

    apiGateway?.getMetrics();

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
      loadStatus: statusProvider.getStatusLoading,
      onRefresh: onRefresh,
      controller: controller,
    );
  }
}

class DnsTabContent extends StatelessWidget {
  const DnsTabContent({super.key});

  Map<String, double> _buildDnsRepliesList(DnsRepliesInfo info) {
    final entries = {
      'Local/cache replies': info.localPercentage,
      'Forwarded queries:': info.forwardedPercentage,
      'Cache optimizer replies': info.optimizedPercentage,
      'Unanswered queries': info.unansweredPercentage,
      'Authoritative replies': info.authPercentage,
    };

    return entries;
  }

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);

    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // DNS Cache
        if (statusProvider.getDnsCacheInfo != null)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SectionLabel(
                  label: AppLocalizations.of(context)!.dnsCacheMetrics,
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
                              data: statusProvider
                                  .getDnsCacheInfo!.typePercentages,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: statusProvider.getDnsCacheInfo!.typePercentages,
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(
                      data: statusProvider.getDnsCacheInfo!.typePercentages,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(
                    data: statusProvider.getDnsCacheInfo!.typePercentages,
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

        // DNS Replies
        if (statusProvider.getDnsRepliesInfo != null)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SectionLabel(
                  label: AppLocalizations.of(context)!.dnsReplyMetrics,
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
                              data: _buildDnsRepliesList(
                                statusProvider.getDnsRepliesInfo!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PieChartLegend(
                          data: _buildDnsRepliesList(
                            statusProvider.getDnsRepliesInfo!,
                          ),
                          dataUnit: '%',
                        ),
                      ),
                    ],
                  ),
                if (width <= ResponsiveConstants.medium) ...[
                  SizedBox(
                    width: width - 40,
                    child: CustomPieChart(
                      data: _buildDnsRepliesList(
                        statusProvider.getDnsRepliesInfo!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChartLegend(
                    data: _buildDnsRepliesList(
                      statusProvider.getDnsRepliesInfo!,
                    ),
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
