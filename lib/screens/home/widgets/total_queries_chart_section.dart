import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/chart_skeleton.dart';
import 'package:pi_hole_client/screens/home/widgets/queries_last_hours_bar.dart';
import 'package:pi_hole_client/screens/home/widgets/queries_last_hours_line.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/widgets/error_data_chart.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A responsive widget that renders the total DNS query statistics section.
///
/// Displays a 24-hour line or bar chart of:
/// - Blocked queries (ads)
/// - Allowed queries
///
/// Includes:
/// - Section label
/// - `fl_chart` line graph
/// - Legend showing color-coded query types
///
/// The layout adapts based on screen width using [FractionallySizedBox].
/// If no valid data is present, a [NoDataChart] is displayed instead.
class TotalQueriesChartSection extends StatelessWidget {
  const TotalQueriesChartSection({
    required this.width,
    required this.statusProvider,
    required this.appConfigProvider,
    super.key,
  });

  final double width;
  final StatusProvider statusProvider;
  final AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    final status = statusProvider.getOvertimeDataLoadStatus;

    Widget child;
    switch (status) {
      case LoadStatus.error:
        child = _buildErrorChart(context);
      case LoadStatus.loading:
        child = _buildSkeleton(context);
      case LoadStatus.loaded:
        child = _hasData()
            ? _buildLoadedContent(context)
            : _buildNoDataChart(context);
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: child,
    );
  }

  Widget _buildErrorChart(BuildContext context) {
    return ErrorDataChart(
      topLabel: AppLocalizations.of(context)!.totalQueries24,
    );
  }

  Widget _buildSkeleton(BuildContext context) {
    return Skeletonizer(
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
            child: ChartSkeleton(
              selectedTheme: appConfigProvider.selectedTheme,
            ),
          ),
          Skeleton.keep(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendDot(
                  context,
                  0,
                  AppLocalizations.of(context)!.blocked,
                ),
                _buildLegendDot(
                  context,
                  3,
                  AppLocalizations.of(context)!.notBlocked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: AppLocalizations.of(context)!.totalQueries24,
        ),
        Container(
          width: double.maxFinite,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildQueriesGraph(
            appConfigProvider,
            statusProvider,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLegendDot(
              context,
              0,
              AppLocalizations.of(context)!.blocked,
            ),
            _buildLegendDot(
              context,
              3,
              AppLocalizations.of(context)!.notBlocked,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNoDataChart(BuildContext context) {
    return NoDataChart(
      topLabel: AppLocalizations.of(context)!.totalQueries24,
    );
  }

  /// Checks whether the query data contains any non-zero values.
  ///
  /// This is used to determine whether to show the chart or the fallback [NoDataChart].
  bool _hasData() {
    return statusProvider.getOvertimeDataJson != null &&
            _checkExistsData(
              statusProvider.getOvertimeDataJson!['domains_over_time'],
            ) ||
        _checkExistsData(
          statusProvider.getOvertimeDataJson!['ads_over_time'],
        );
  }

  /// Builds a small colored dot with a label to indicate chart data type.
  ///
  /// Used to represent "Blocked" or "Not Blocked" in the legend section.
  ///
  /// [colorIndex] determines the color from the [GraphColors] extension.
  /// [label] is the translated description of the query type.
  Widget _buildLegendDot(BuildContext context, int colorIndex, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context)
                .extension<GraphColors>()!
                .getColor(colorIndex),
          ),
        ),
        const SizedBox(width: 10),
        Text(label),
      ],
    );
  }

  /// Checks whether any value in the given [data] map is greater than 0.
  ///
  /// Returns `true` if at least one non-zero value exists; otherwise `false`.
  ///
  /// Used to determine if sufficient data exists to render a chart.
  bool _checkExistsData(Map<String, dynamic> data) {
    var exists = false;
    for (final element in data.keys) {
      if (data[element] > 0) {
        exists = true;
        break;
      }
    }
    return exists;
  }

  /// Builds the chart widget for total and blocked queries over the last 24 hours.
  ///
  /// The chart type is determined by homeVisualizationMode:
  /// - 0 = Line chart ([QueriesLastHoursLine])
  /// - 1 = Bar chart ([QueriesLastHoursBar])
  ///
  /// Additional flags like `reducedDataCharts` influence chart rendering.
  ///
  /// - [appConfigProvider]: Provides user config such as visualization mode and flags.
  /// - [statusProvider]: Supplies parsed client activity data from the server.
  ///
  /// Returns either a [QueriesLastHoursLine] or [QueriesLastHoursBar].
  Widget _buildQueriesGraph(
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
  ) {
    if (appConfigProvider.homeVisualizationMode == 0) {
      return QueriesLastHoursLine(
        data: statusProvider.getOvertimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
      );
    } else {
      return QueriesLastHoursBar(
        data: statusProvider.getOvertimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
      );
    }
  }
}
