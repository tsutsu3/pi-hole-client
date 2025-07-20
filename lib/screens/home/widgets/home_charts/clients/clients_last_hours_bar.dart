import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/graph.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/graph.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/themes/theme.dart';
import 'package:provider/provider.dart';

class ClientsLastHoursBar extends StatelessWidget {
  const ClientsLastHoursBar({
    required this.realtimeListIps,
    required this.data,
    required this.reducedData,
    required this.hideZeroValues,
    super.key,
  });

  final List<String> realtimeListIps;
  final Map<String, dynamic> data;
  final bool reducedData;
  final bool hideZeroValues;
  static final Map<int, Widget> _titleCache = {};

  String _getLegendName(
    Map<String, dynamic> data,
    BarChartRodData barChartRodData,
    int i,
  ) {
    if (data['clientsColors'][i]['name'] != '') {
      if (data['clientsColors'][i]['name'].length > 14) {
        return '\n${data['clientsColors'][i]['name'].substring(0, 14)}...: ${(barChartRodData.rodStackItems[i].toY - barChartRodData.rodStackItems[i].fromY).toInt()}';
      }
      return '\n${data['clientsColors'][i]['name']}: ${(barChartRodData.rodStackItems[i].toY - barChartRodData.rodStackItems[i].fromY).toInt()}';
    } else {
      return '\n${data['clientsColors'][i]['ip']}: ${(barChartRodData.rodStackItems[i].toY - barChartRodData.rodStackItems[i].fromY).toInt()}';
    }
  }

  BarChartData mainData(Map<String, dynamic> data, ThemeMode selectedTheme) {
    final interval = calcInterval(data['topPoint']);
    return BarChartData(
      gridData: FlGridData(
        drawVerticalLine: false,
        horizontalInterval: interval,
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
            interval: interval,
            reservedSize: 35,
            getTitlesWidget: (value, widget) {
              final key = value.toInt();
              return _titleCache.putIfAbsent(
                key,
                () => Text(
                  key.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
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
      barGroups: data['data'],
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (touchedSpot) => selectedTheme == ThemeMode.light
              ? const Color.fromRGBO(220, 220, 220, 0.9)
              : const Color.fromRGBO(35, 35, 35, 0.9),
          maxContentWidth: 300,
          fitInsideHorizontally: true,
          getTooltipItem:
              (barChartGroupData, groupIndex, barChartRodData, rodIndex) {
            final tooltipItems = <TextSpan>[];

            for (var i = 0; i < data['clientsColors'].length; i++) {
              if (hideZeroValues == true) {
                if (barChartRodData.rodStackItems[i].toY -
                        barChartRodData.rodStackItems[i].fromY >
                    0.0) {
                  tooltipItems.add(
                    TextSpan(
                      text: _getLegendName(data, barChartRodData, i),
                      style: TextStyle(
                        fontSize: 14,
                        color: data['clientsColors'][i]['color'],
                      ),
                    ),
                  );
                }
              } else {
                tooltipItems.add(
                  TextSpan(
                    text: _getLegendName(data, barChartRodData, i),
                    style: TextStyle(
                      fontSize: 14,
                      color: data['clientsColors'][i]['color'],
                    ),
                  ),
                );
              }
            }

            return BarTooltipItem(
              formatTimestampForChart(data['time'][groupIndex]),
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: selectedTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
              children: tooltipItems,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Color getColor(Map<String, dynamic> client, int index) {
      final exists = realtimeListIps.indexOf(data['clients'][index]['ip']);
      if (exists >= 0) {
        return Theme.of(context).extension<GraphColors>()!.getColor(exists);
      } else {
        return client['color'];
      }
    }

    Map<String, dynamic> formatData(
      Map<String, dynamic> data,
      double chartWidth,
      ThemeMode selectedTheme,
    ) {
      final items = <BarChartGroupData>[];
      final clientsColors = <Map<String, dynamic>>[];
      var topPoint = 0;
      final interval = reducedData == true ? averageIntervalCount : 1;

      final List<String> keys = data['over_time'].keys.toList();
      final int numClients = data['clients'].length;
      final barWidth = chartWidth /
          (reducedData == true
              ? keys.length / averageIntervalCount
              : keys.length) *
          0.8;

      for (var i = 0; i < numClients; i++) {
        clientsColors.add({
          'ip': data['clients'][i]['ip'],
          'name': data['clients'][i]['name'],
          'color': getColor(data['clients'][i], i),
        });
      }

      for (var j = 0; j < keys.length; j += interval) {
        final barRods = <BarChartRodData>[];
        var stackedHeight = 0.0;
        final stackItems = <BarChartRodStackItem>[];
        var tmpTopPoint = 0.0;

        for (var i = 0; i < numClients; i++) {
          final double yValue = data['over_time'][keys[j]][i].toDouble();
          tmpTopPoint += yValue.toInt();

          stackItems.add(
            BarChartRodStackItem(
              stackedHeight,
              stackedHeight + yValue,
              selectedTheme == ThemeMode.light
                  ? getColor(data['clients'][i], i).withValues(alpha: 0.8)
                  : getColor(data['clients'][i], i),
            ),
          );

          stackedHeight += yValue;
        }

        if (tmpTopPoint > topPoint) {
          topPoint = tmpTopPoint.toInt();
        }

        barRods.add(
          BarChartRodData(
            toY: stackedHeight,
            rodStackItems: stackItems,
            width: barWidth,
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
          ),
        );

        items.add(
          BarChartGroupData(
            x: j,
            barRods: barRods,
            barsSpace: 2,
          ),
        );
      }

      final timestamps = <String>[];
      for (var i = 0; i < keys.length; i += interval) {
        timestamps.add(keys[i]);
      }

      return {
        'data': items,
        'clientsColors': clientsColors,
        'topPoint': topPoint,
        'time': timestamps,
      };
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final chartWidth = constraints.maxWidth;

          return BarChart(
            mainData(
              formatData(data, chartWidth, appConfigProvider.selectedTheme),
              appConfigProvider.selectedTheme,
            ),
          );
        },
      ),
    );
  }
}
