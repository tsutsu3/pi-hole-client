import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_legend_dot.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/skeleton/bar_chart_skeleton.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/skeleton/line_chart_skeleton.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A skeleton widget that displays a loading placeholder for the queries chart section
/// on the home screen. It shows a section label, a chart skeleton (either line or bar
/// based on the current visualization mode), and a legend for blocked and not blocked queries.
///
/// This widget uses the [Skeletonizer] to provide skeleton loading effects while data is being fetched.
/// The chart type and appearance are determined by the [AppConfigProvider].
class QueriesSkeleton extends StatelessWidget {
  const QueriesSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.read<AppConfigProvider>();

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Theme.of(context).colorScheme.secondaryContainer,
        highlightColor: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.keep(
            child: SectionLabel(
              label: AppLocalizations.of(context)!.totalQueries24,
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: appConfigProvider.homeVisualizationMode == 0
                ? LineChartSkeleton(
                    selectedTheme: appConfigProvider.selectedTheme,
                    showAnimation: appConfigProvider.loadingAnimation,
                  )
                : BarChartSkeleton(
                    selectedTheme: appConfigProvider.selectedTheme,
                    showAnimation: appConfigProvider.loadingAnimation,
                  ),
          ),
          Skeleton.keep(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                QueriesLegendDot(
                  colorIndex: 0,
                  label: AppLocalizations.of(context)!.blocked,
                ),
                QueriesLegendDot(
                  colorIndex: 3,
                  label: AppLocalizations.of(context)!.notBlocked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
