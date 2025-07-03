import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/bar_chart_skeleton.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/line_chart_skeleton.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries_last_hours_bar.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries_last_hours_line.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/widgets/error_data_chart.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';
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
    super.key,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.watch<AppConfigProvider>();

    final overTimeDataLoadStatus = context.select<StatusProvider, LoadStatus>(
      (provider) => provider.getOvertimeDataLoadStatus,
    );

    final overtimeDataJson =
        context.select<StatusProvider, Map<String, dynamic>?>(
      (provider) => provider.getOvertimeDataJson,
    );

    Widget child;
    switch (overTimeDataLoadStatus) {
      case LoadStatus.error:
        child = _buildErrorChart(context);
      case LoadStatus.loading:
        child = _buildSkeleton(context, appConfigProvider);
      case LoadStatus.loaded:
        child = _hasData(overtimeDataJson)
            ? _buildLoadedContent(context, appConfigProvider, overtimeDataJson)
            : _buildNoDataChart(context);
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: child,
    );
  }

  /// Builds a widget that displays an error chart for total queries in the last 24 hours.
  ///
  /// This widget uses [ErrorDataChart] and sets the top label to the localized
  /// string for "total queries in 24 hours".
  ///
  /// [context] - The build context used to access localization resources.
  ///
  /// Returns an [ErrorDataChart] widget with the appropriate label.
  Widget _buildErrorChart(BuildContext context) {
    return ErrorDataChart(
      topLabel: AppLocalizations.of(context)!.totalQueries24,
    );
  }

  /// Builds a skeleton loading widget for the total queries chart section.
  ///
  /// This widget displays a placeholder UI while the actual data is loading.
  /// It includes a section label, a chart skeleton (either line or bar chart based on
  /// the current visualization mode), and a legend row with dots indicating
  /// "blocked" and "not blocked" queries.
  ///
  /// - [context]: The build context.
  /// - [appConfigProvider]: Provides app configuration such as theme, visualization mode,
  ///   and animation settings.
  ///
  /// Returns a [Widget] representing the skeleton UI for the total queries chart section.
  Widget _buildSkeleton(
    BuildContext context,
    AppConfigProvider appConfigProvider,
  ) {
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

  /// Builds the main content section for displaying the total queries chart.
  ///
  /// This widget displays a section label, a chart representing query data over time,
  /// and a legend indicating blocked and not blocked queries.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [appConfigProvider]: The provider for app configuration.
  /// - [overtimeDataJson]: The JSON data containing overtime query statistics.
  ///
  /// Returns a [Column] widget containing the section label, chart, and legend.
  Widget _buildLoadedContent(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    Map<String, dynamic>? overtimeDataJson,
  ) {
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
            overtimeDataJson,
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

  /// Builds a widget that displays a chart indicating no data is available.
  ///
  /// The [context] parameter is used to access localization resources for the top label.
  ///
  /// Returns a [NoDataChart] widget with a localized label for total queries in the last 24 hours.
  Widget _buildNoDataChart(BuildContext context) {
    return NoDataChart(
      topLabel: AppLocalizations.of(context)!.totalQueries24,
    );
  }

  /// Checks whether the query data contains any non-zero values.
  ///
  /// This is used to determine whether to show the chart or the fallback [NoDataChart].
  ///
  /// Parameters:
  /// - [overtimeDataJson]: The JSON data containing query statistics.
  bool _hasData(Map<String, dynamic>? overtimeDataJson) {
    return overtimeDataJson != null &&
            _checkExistsData(
              overtimeDataJson['domains_over_time'] ?? [],
            ) ||
        _checkExistsData(
          overtimeDataJson?['ads_over_time'] ?? [],
        );
  }

  /// Builds a small colored dot with a label to indicate chart data type.
  ///
  /// Used to represent "Blocked" or "Not Blocked" in the legend section.
  ///
  /// Parameters:
  /// - [context]: The build context for theme and localization.
  /// - [colorIndex] determines the color from the [GraphColors] extension.
  /// - [label] is the translated description of the query type.
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
  /// - [overtimeDataJson]: Contains the query data for the last 24 hours.
  ///
  /// Returns either a [QueriesLastHoursLine] or [QueriesLastHoursBar].
  Widget _buildQueriesGraph(
    AppConfigProvider appConfigProvider,
    Map<String, dynamic>? overtimeDataJson,
  ) {
    if (appConfigProvider.homeVisualizationMode == 0) {
      return QueriesLastHoursLine(
        data: overtimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
      );
    } else {
      return QueriesLastHoursBar(
        data: overtimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
      );
    }
  }
}
