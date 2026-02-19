import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/chart_utils.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';

class QueriesLastHoursLine extends StatelessWidget {
  const QueriesLastHoursLine({
    required this.data,
    required this.reducedData,
    super.key,
  });

  final OverTime data;
  final bool reducedData;
  static final Map<int, Widget> _titleCache = {};

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    final formattedData = _formatData(data);

    if (formattedData.containsKey('error')) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 50, color: Colors.red),
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
        _mainData(formattedData, appConfigViewModel.selectedTheme, context),
      ),
    );
  }

  Map<String, dynamic> _formatData(OverTime data) {
    final domains = <FlSpot>[];
    final ads = <FlSpot>[];
    final flatLines = <FlSpot>[];

    var xPosition = 0;
    var topPoint = 0;
    final interval = reducedData == true ? averageIntervalCount : 1;

    final domainsOverTime = data.domainsOverTime;
    final adsOverTime = data.adsOverTime;

    if (domainsOverTime.length != adsOverTime.length) {
      return {
        'data': {'domains': [], 'ads': [], 'flatLines': []},
        'topPoint': 0,
        'time': [],
        'error': 'error',
      };
    }

    for (var i = 0; i < domainsOverTime.length; i += interval) {
      final domainCount = domainsOverTime[i].count;
      final adCount = adsOverTime[i].count;
      final permitted = domainCount - adCount;
      final tmp = permitted > adCount ? permitted : adCount;
      if (tmp > topPoint) topPoint = tmp;

      domains.add(
        FlSpot(xPosition.toDouble(), (domainCount - adCount).toDouble()),
      );
      ads.add(FlSpot(xPosition.toDouble(), adCount.toDouble()));
      flatLines.add(FlSpot(xPosition.toDouble(), 0.0));
      xPosition++;
    }

    final timestamps = <String>[];
    for (var i = 0; i < domainsOverTime.length; i += interval) {
      timestamps.add(
        (domainsOverTime[i].timestamp.millisecondsSinceEpoch ~/ 1000)
            .toString(),
      );
    }

    return {
      'data': {'domains': domains, 'ads': ads, 'flatLines': flatLines},
      'topPoint': topPoint,
      'time': timestamps,
    };
  }

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

  LineChartData _mainData(
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
            getTitlesWidget: (value, widget) {
              final key = value.toInt();
              return _titleCache.putIfAbsent(
                key,
                () =>
                    Text(key.toString(), style: const TextStyle(fontSize: 12)),
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
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Theme.of(
              context,
            ).extension<GraphColors>()!.getColor(0).withValues(alpha: 0.2),
          ),
        ),
        // barIndex: 2
        LineChartBarData(
          spots: data['data']['domains'],
          color: Theme.of(context).extension<GraphColors>()!.getColor(3),
          isCurved: true,
          isStrokeCapRound: true,
          preventCurveOverShooting: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Theme.of(
              context,
            ).extension<GraphColors>()!.getColor(3).withValues(alpha: 0.2),
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
}
