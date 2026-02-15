import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_last_hours_bar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_last_hours_line.dart';
import 'package:provider/provider.dart';

/// A widget that displays a graph of queries over time on the home screen.
///
/// Depending on the [AppConfigViewModel]'s `homeVisualizationMode`, this widget
/// will render either a line chart ([QueriesLastHoursLine]) or a bar chart
/// ([QueriesLastHoursBar]) using the overtime data provided by [StatusViewModel].
///
/// The `reducedData` parameter is passed to the chart widgets to determine
/// whether the data should be displayed in a reduced form.
///
/// Requires [AppConfigViewModel] and [StatusViewModel] to be available in the widget tree.
class QueriesGraph extends StatelessWidget {
  const QueriesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = context.read<AppConfigViewModel>();
    final overtimeDataJson = context
        .select<StatusViewModel, Map<String, dynamic>?>(
          (provider) => provider.getOvertimeDataJson,
        );

    if (appConfigViewModel.homeVisualizationMode == 0) {
      return QueriesLastHoursLine(
        data: overtimeDataJson!,
        reducedData: appConfigViewModel.reducedDataCharts,
      );
    } else {
      return QueriesLastHoursBar(
        data: overtimeDataJson!,
        reducedData: appConfigViewModel.reducedDataCharts,
      );
    }
  }
}
