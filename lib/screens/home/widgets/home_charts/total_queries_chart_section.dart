import 'package:flutter/material.dart';
import 'package:pi_hole_client/config2/enums.dart';
import 'package:pi_hole_client/config2/responsive.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_content.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_skeleton.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/error_data_chart.dart';
import 'package:provider/provider.dart';

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
        child = ErrorDataChart(
          topLabel: AppLocalizations.of(context)!.totalQueries24,
        );
      case LoadStatus.loading:
        child = const QueriesSkeleton();
      case LoadStatus.loaded:
        child = _hasData(overtimeDataJson)
            ? const QueriesContent()
            : NoDataChart(
                topLabel: AppLocalizations.of(context)!.totalQueries24,
              );
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: child,
    );
  }

  /// Checks whether the query data contains any non-zero values.
  ///
  /// This is used to determine whether to show the chart or the fallback [NoDataChart].
  ///
  /// Parameters:
  /// - [overtimeDataJson]: The JSON data containing query statistics.
  bool _hasData(Map<String, dynamic>? overtimeDataJson) {
    if (overtimeDataJson == null) return false;
    return _checkExistsData(
          overtimeDataJson['domains_over_time'] ?? {},
        ) ||
        _checkExistsData(
          overtimeDataJson['ads_over_time'] ?? {},
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
}
