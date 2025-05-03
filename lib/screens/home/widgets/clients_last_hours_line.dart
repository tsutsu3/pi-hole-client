import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/graph.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/graph.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ClientsLastHoursLine extends StatelessWidget {
  const ClientsLastHoursLine({
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

  /// Get the legend name for the tooltip.
  ///
  /// If the client has a name, it will be used, otherwise the IP address.
  /// If the name is longer than 14 characters, it will be truncated.
  String _getLegendName(Map<String, dynamic> data, LineBarSpot item) {
    if (data['clientsColors'][item.barIndex]['name'] != '') {
      if (data['clientsColors'][item.barIndex]['name'].length > 14) {
        return '${data['clientsColors'][item.barIndex]['name'].substring(0, 14)}...: ${item.y.toInt()}';
      }
      return '${data['clientsColors'][item.barIndex]['name']}: ${item.y.toInt()}';
    } else {
      return '${data['clientsColors'][item.barIndex]['ip']}: ${item.y.toInt()}';
    }
  }

  LineChartData mainData(Map<String, dynamic> data, ThemeMode selectedTheme) {
    final interval = calcInterval(data['topPoint']);
    return LineChartData(
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
      lineBarsData: data['data'],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => selectedTheme == ThemeMode.light
              ? const Color.fromRGBO(220, 220, 220, 0.9)
              : const Color.fromRGBO(35, 35, 35, 0.9),
          maxContentWidth: 300,
          fitInsideHorizontally: true,
          getTooltipItems: (items) {
            final tooltipItems = <LineTooltipItem>[];

            final showIndexes = <LineBarSpot>[];

            for (final item in items) {
              double fontSize = 14;

              // TODO: Fix this logic.
              // If "hide zero values" is enabled, setting font size to 0 will
              // prevent rendering while keeping tooltip structure intact.
              // However, an empty tooltip item still occupies vertical space,
              // resulting in extra space at the bottom of the tooltip.
              if (hideZeroValues) {
                fontSize = item.y.toInt() == 0 ? 0 : 14;
              }

              if (fontSize != 0) {
                showIndexes.add(item);
              }

              // Show legend only for the first 10 items.
              if (showIndexes.length > 10) {
                fontSize = 0;
              }

              if (item.barIndex < data['data'].length - 1) {
                tooltipItems.add(
                  LineTooltipItem(
                    _getLegendName(data, item),
                    textAlign: TextAlign.left,
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                      color: data['clientsColors'][item.barIndex]['color'],
                    ),
                  ),
                );
              }
            }

            return [
              LineTooltipItem(
                formatTimestampForChart(data['time'][items[0].x.toInt()]),
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: selectedTheme == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              ...tooltipItems,
            ];
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

    Map<String, dynamic> formatData(Map<String, dynamic> data) {
      final items = <LineChartBarData>[];
      final clientsColors = <Map<String, dynamic>>[];
      var topPoint = 0;
      final List<String> keys = data['over_time'].keys.toList();
      final interval = reducedData == true ? averageIntervalCount : 1;

      for (var i = 0; i < data['clients'].length; i++) {
        final client = <FlSpot>[];
        var xPosition = 0;
        for (var j = 0; j < data['over_time'].entries.length; j += interval) {
          if (data['over_time'][keys[j]][i] > topPoint) {
            topPoint = data['over_time'][keys[j]][i];
          }
          client.add(
            FlSpot(
              xPosition.toDouble(),
              data['over_time'][keys[j]][i].toDouble(),
            ),
          );
          xPosition++;
        }
        items.add(
          LineChartBarData(
            spots: client,
            color: getColor(data['clients'][i], i),
            isCurved: true,
            preventCurveOverShooting: true,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              color: getColor(data['clients'][i], i).withValues(alpha: 0.2),
            ),
          ),
        );
        clientsColors.add({
          'ip': data['clients'][i]['ip'],
          'name': data['clients'][i]['name'],
          'color': getColor(data['clients'][i], i),
        });
      }

      final timestamps = <String>[];
      final List<String> k = data['domains_over_time'].keys.toList();
      for (var i = 0; i < k.length; i += interval) {
        timestamps.add(k[i]);
      }

      /// Dummy data for legend
      final flatLine = <FlSpot>[];
      var xPosition = 0;
      for (var j = 0; j < data['over_time'].entries.length; j += interval) {
        flatLine.add(FlSpot(xPosition.toDouble(), 0));
        xPosition++;
      }
      items.add(
        LineChartBarData(
          spots: flatLine,
          color: Colors.transparent,
          barWidth: 0,
        ),
      );

      return {
        'data': items,
        'clientsColors': clientsColors,
        'topPoint': topPoint,
        'time': timestamps,
      };
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: LineChart(
        mainData(formatData(data), appConfigProvider.selectedTheme),
      ),
    );
  }
}
