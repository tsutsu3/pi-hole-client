import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';

class QueriesLastHoursLine extends StatelessWidget {
  const QueriesLastHoursLine({
    super.key,
    required this.data,
    required this.reducedData,
  });

  final Map<String, dynamic> data;
  final bool reducedData;

  LineChartData mainData(
    Map<String, dynamic> data,
    ThemeMode selectedTheme,
    BuildContext context,
  ) {
    final double interval = (data['topPoint'] / 5).toDouble() > 0
        ? (data['topPoint'] / 5).toDouble()
        : data['topPoint'].toDouble() > 0
            ? data['topPoint'].toDouble()
            : 1.0;
    return LineChartData(
      gridData: FlGridData(
        show: true,
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
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval:
                data['topPoint'] == 0 ? 1 : (data['topPoint'] / 5).toDouble(),
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
            width: 1,
          ),
          bottom: BorderSide(
            color: selectedTheme == ThemeMode.light
                ? Colors.black12
                : Colors.white12,
            width: 1,
          ),
        ),
      ),
      lineBarsData: [
        // Hidden bar to allow 3 items on tooltip
        LineChartBarData(
          spots: data['data']['domains'],
          color: Colors.transparent,
          barWidth: 0,
        ),
        LineChartBarData(
          spots: data['data']['ads'],
          color: Theme.of(context).extension<GraphColors>()!.getColor(0),
          isCurved: true,
          barWidth: 2,
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
        LineChartBarData(
          spots: data['data']['domains'],
          color: Theme.of(context).extension<GraphColors>()!.getColor(3),
          isCurved: true,
          barWidth: 2,
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
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => selectedTheme == ThemeMode.light
              ? const Color.fromRGBO(220, 220, 220, 0.9)
              : const Color.fromRGBO(35, 35, 35, 0.9),
          fitInsideHorizontally: true,
          getTooltipItems: (items) => [
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
            LineTooltipItem(
              'Not blocked: ${items[1].y.toInt().toString()}',
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.green,
              ),
            ),
            LineTooltipItem(
              'Blocked: ${items[2].y.toInt().toString()}',
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Map<String, dynamic> formatData(Map<String, dynamic> data) {
      final List<FlSpot> domains = [];
      final List<FlSpot> ads = [];

      int xPosition = 0;
      int topPoint = 0;
      List<String> domainsKeys = data['domains_over_time'].keys.toList();
      List<String> adsKeys = data['ads_over_time'].keys.toList();

      if (domainsKeys.length != adsKeys.length) {
        return {
          'data': {'domains': [], 'ads': []},
          'topPoint': 0,
          'time': [],
          'error': 'error',
        };
      }

      for (var i = 0;
          i < data['domains_over_time'].entries.length;
          reducedData == true ? i += 6 : i++) {
        if (data['domains_over_time'][domainsKeys[i]] > topPoint) {
          topPoint = data['domains_over_time'][domainsKeys[i]] -
              data['ads_over_time'][adsKeys[i]];
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
        xPosition++;
      }

      List<String> timestamps = [];
      final List<String> k = data['domains_over_time'].keys.toList();
      for (var i = 0; i < k.length; reducedData == true ? i += 6 : i++) {
        timestamps.add(k[i]);
      }

      return {
        'data': {'domains': domains, 'ads': ads},
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
