import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui2/core/themes/theme.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({
    required this.data,
    this.radiusScale = 3.0,
    super.key,
  });

  final Map<String, double> data;
  final double radiusScale;

  @override
  Widget build(BuildContext context) {
    final defaultColors = Theme.of(context).extension<GraphColors>()!.colors;
    final greyColor =
        Theme.of(context).extension<AppColors>()!.commonLightGrey!;

    final colorList = <Color>[];
    var colorIndex = 0;
    for (final key in data.keys) {
      if (key.toLowerCase() == 'empty') {
        colorList.add(greyColor);
      } else {
        colorList.add(defaultColors[colorIndex % defaultColors.length]);
        colorIndex++;
      }
    }

    return PieChart(
      dataMap: data,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / radiusScale,
      colorList: colorList,
      initialAngleInDegree: 270,
      chartType: ChartType.ring,
      legendOptions: const LegendOptions(showLegends: false),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
}
