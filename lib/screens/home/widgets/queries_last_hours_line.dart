import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/graph.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/graph.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class QueriesLastHoursLine extends StatelessWidget {
  const QueriesLastHoursLine({
    required this.data,
    required this.reducedData,
    super.key,
  });

  final Map<String, dynamic> data;
  final bool reducedData;

  /// Create the legend for the tooltip.
  List<LineTooltipItem> _createLegend(
    Map<String, dynamic> data,
    List<LineBarSpot> items,
    ThemeMode selectedTheme,
  ) {
    final legend = List<LineTooltipItem>.filled(
      3,
      const LineTooltipItem('', TextStyle()),
    );

    for (final item in items) {
      switch (item.barIndex) {
        case 0:
          legend[0] = LineTooltipItem(
            formatTimestampForChart(data['time'][item.x.toInt()]),
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: selectedTheme == ThemeMode.light
                  ? Colors.black
                  : Colors.white,
            ),
          );
        case 1:
          legend[1] = LineTooltipItem(
            'Blocked: ${item.y.toInt()}',
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.blue,
            ),
          );
        case 2:
          legend[2] = LineTooltipItem(
            'Not blocked: ${item.y.toInt()}',
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.green,
            ),
          );
        default:
          break;
      }
    }

    return legend;
  }

  LineChartData mainData(
    Map<String, dynamic> data,
    ThemeMode selectedTheme,
    BuildContext context,
  ) {
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
      lineBarsData: [
        // Hidden bar to allow 3 items on tooltip
        // barIndex: 0
        LineChartBarData(
          spots: data['data']['flatLines'],
          color: Colors.transparent,
          barWidth: 0,
        ),
        // barIndex: 1
        LineChartBarData(
          spots: data['data']['ads'],
          color: Theme.of(context).extension<GraphColors>()!.getColor(0),
          isCurved: true,
          isStrokeCapRound: true,
          preventCurveOverShooting: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Theme.of(context)
                .extension<GraphColors>()!
                .getColor(0)
                .withValues(alpha: 0.2),
          ),
        ),
        // barIndex: 2
        LineChartBarData(
          spots: data['data']['domains'],
          color: Theme.of(context).extension<GraphColors>()!.getColor(3),
          isCurved: true,
          isStrokeCapRound: true,
          preventCurveOverShooting: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Theme.of(context)
                .extension<GraphColors>()!
                .getColor(3)
                .withValues(alpha: 0.2),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => selectedTheme == ThemeMode.light
              ? const Color.fromRGBO(220, 220, 220, 0.9)
              : const Color.fromRGBO(35, 35, 35, 0.9),
          fitInsideHorizontally: true,
          getTooltipItems: (items) => _createLegend(data, items, selectedTheme),
        ),
      ),
    );
  }

  int calcTopPoint(
    Map<String, dynamic> data,
    List<String> domainsKeys,
    List<String> adsKeys,
    int index,
  ) {
    final permitted = data['domains_over_time'][domainsKeys[index]] -
        data['ads_over_time'][adsKeys[index]];

    final blocked = data['ads_over_time'][adsKeys[index]];

    return permitted > blocked ? permitted : blocked;
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Map<String, dynamic> formatData(Map<String, dynamic> data) {
      final domains = <FlSpot>[];
      final ads = <FlSpot>[];
      final flatLines = <FlSpot>[];

      var xPosition = 0;
      var topPoint = 0;
      var tmp = 0;
      final List<String> domainsKeys = data['domains_over_time'].keys.toList();
      final List<String> adsKeys = data['ads_over_time'].keys.toList();
      final interval = reducedData == true ? averageIntervalCount : 1;

      if (domainsKeys.length != adsKeys.length) {
        return {
          'data': {'domains': [], 'ads': [], 'flatLines': []},
          'topPoint': 0,
          'time': [],
          'error': 'error',
        };
      }

      for (var i = 0;
          i < data['domains_over_time'].entries.length;
          i += interval) {
        tmp = calcTopPoint(data, domainsKeys, adsKeys, i);
        if (tmp > topPoint) {
          topPoint = tmp;
        }
        domains.add(
          FlSpot(
            xPosition.toDouble(),
            data['domains_over_time'][domainsKeys[i]].toDouble() -
                data['ads_over_time'][adsKeys[i]].toDouble(),
          ),
        );
        ads.add(
          FlSpot(
            xPosition.toDouble(),
            data['ads_over_time'][adsKeys[i]].toDouble(),
          ),
        );
        // Dummy data for legend
        flatLines.add(
          FlSpot(
            xPosition.toDouble(),
            0.0,
          ),
        );
        xPosition++;
      }

      final timestamps = <String>[];
      final List<String> k = data['domains_over_time'].keys.toList();
      for (var i = 0; i < k.length; i += interval) {
        timestamps.add(k[i]);
      }

      return {
        'data': {'domains': domains, 'ads': ads, 'flatLines': flatLines},
        'topPoint': topPoint,
        'time': timestamps,
      };
    }

    final formattedData = formatData(data);

    if (formattedData.containsKey('error')) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
            const SizedBox(height: 50),
            Text(
              AppLocalizations.of(context)!.chartsNotLoaded,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 22,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: LineChart(
        mainData(formattedData, appConfigProvider.selectedTheme, context),
      ),
    );
  }
}
