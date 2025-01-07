import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({
    super.key,
    required this.data,
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
      ringStrokeWidth: 20,
      legendOptions: const LegendOptions(showLegends: false),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
}
