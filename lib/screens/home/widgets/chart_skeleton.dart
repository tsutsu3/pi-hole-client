import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartSkeleton extends StatelessWidget {
  const ChartSkeleton({
    required this.selectedTheme,
    super.key,
  });

  final ThemeMode selectedTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: LineChart(
        LineChartData(
          lineBarsData: [],
          minY: 0,
          maxY: 100,
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) => FlLine(
              color: selectedTheme == ThemeMode.light
                  ? Colors.black12
                  : Colors.white12,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
            bottomTitles: const AxisTitles(),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                reservedSize: 35,
                getTitlesWidget: (value, widget) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide(
                color: selectedTheme == ThemeMode.light
                    ? Colors.black12
                    : Colors.white12,
              ),
              bottom: BorderSide(
                color: selectedTheme == ThemeMode.light
                    ? Colors.black12
                    : Colors.white12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
