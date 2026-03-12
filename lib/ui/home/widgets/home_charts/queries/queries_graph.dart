import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_last_hours_bar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_last_hours_line.dart';
import 'package:provider/provider.dart';

class QueriesGraph extends StatelessWidget {
  const QueriesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final visualizationMode = context
        .select<AppConfigViewModel, HomeVisualizationMode>(
          (vm) => vm.homeVisualizationMode,
        );
    final reducedData = context.select<AppConfigViewModel, bool>(
      (vm) => vm.reducedDataCharts,
    );
    final overtimeData = context.select<StatusViewModel, OverTime?>(
      (provider) => provider.getOvertimeData,
    );

    if (visualizationMode == HomeVisualizationMode.lineArea) {
      return QueriesLastHoursLine(
        data: overtimeData!,
        reducedData: reducedData,
      );
    } else {
      return QueriesLastHoursBar(data: overtimeData!, reducedData: reducedData);
    }
  }
}
