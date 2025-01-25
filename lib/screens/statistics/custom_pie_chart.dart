import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({
    required this.data,
    super.key,
  });

  final Map<String, double> data;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: data,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 3,
      colorList: Theme.of(context).extension<GraphColors>()!.colors,
      initialAngleInDegree: 270,
      chartType: ChartType.ring,
      legendOptions: const LegendOptions(showLegends: false),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
}
