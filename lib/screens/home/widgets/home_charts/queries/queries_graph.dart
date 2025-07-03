import 'package:flutter/material.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_last_hours_bar.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_last_hours_line.dart';
import 'package:provider/provider.dart';

/// A widget that displays a graph of queries over time on the home screen.
///
/// Depending on the [AppConfigProvider]'s `homeVisualizationMode`, this widget
/// will render either a line chart ([QueriesLastHoursLine]) or a bar chart
/// ([QueriesLastHoursBar]) using the overtime data provided by [StatusProvider].
///
/// The `reducedData` parameter is passed to the chart widgets to determine
/// whether the data should be displayed in a reduced form.
///
/// Requires [AppConfigProvider] and [StatusProvider] to be available in the widget tree.
class QueriesGraph extends StatelessWidget {
  const QueriesGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.read<AppConfigProvider>();
    final overtimeDataJson =
        context.select<StatusProvider, Map<String, dynamic>?>(
      (provider) => provider.getOvertimeDataJson,
    );

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
