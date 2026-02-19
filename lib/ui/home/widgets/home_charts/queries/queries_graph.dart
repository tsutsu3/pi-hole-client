import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_last_hours_bar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_last_hours_line.dart';
import 'package:provider/provider.dart';

class QueriesGraph extends StatelessWidget {
  const QueriesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = context.read<AppConfigViewModel>();
    final overtimeData = context.select<StatusViewModel, OverTime?>(
      (provider) => provider.getOvertimeData,
    );

    if (appConfigViewModel.homeVisualizationMode ==
        HomeVisualizationMode.lineArea) {
      return QueriesLastHoursLine(
        data: overtimeData!,
        reducedData: appConfigViewModel.reducedDataCharts,
      );
    } else {
      return QueriesLastHoursBar(
        data: overtimeData!,
        reducedData: appConfigViewModel.reducedDataCharts,
      );
    }
  }
}
