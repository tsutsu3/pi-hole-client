import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_legend_dot.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/skeleton/bar_chart_skeleton.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/skeleton/line_chart_skeleton.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A skeleton widget that displays a loading placeholder for the queries chart section
/// on the home screen. It shows a section label, a chart skeleton (either line or bar
/// based on the current visualization mode), and a legend for blocked and not blocked queries.
///
/// This widget uses the [Skeletonizer] to provide skeleton loading effects while data is being fetched.
/// The chart type and appearance are determined by the [AppConfigViewModel].
class QueriesSkeleton extends StatelessWidget {
  const QueriesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = context.read<AppConfigViewModel>();

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
            child: appConfigViewModel.homeVisualizationMode ==
                    HomeVisualizationMode.lineArea
                ? LineChartSkeleton(
                    selectedTheme: appConfigViewModel.selectedTheme,
                    showAnimation: appConfigViewModel.loadingAnimation,
                  )
                : BarChartSkeleton(
                    selectedTheme: appConfigViewModel.selectedTheme,
                    showAnimation: appConfigViewModel.loadingAnimation,
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
