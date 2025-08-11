import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/graph.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:pi_hole_client/utils/graph.dart';
import 'package:provider/provider.dart';

class QueriesLastHoursBar extends StatelessWidget {
  const QueriesLastHoursBar({
    required this.data,
    required this.reducedData,
    super.key,
  });

  final Map<String, dynamic> data;
  final bool reducedData;
  static final Map<int, Widget> _titleCache = {};

  BarChartData mainData(
    Map<String, dynamic> data,
    ThemeMode selectedTheme,
    BuildContext context,
  ) {
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
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final timeList = data['time'] as List<String>;
            final safeIndex = groupIndex.clamp(0, timeList.length - 1);
            final timeLabel = formatTimestampForChart(timeList[safeIndex]);

            final stacks = rod.rodStackItems;
            double blocked = 0;
            double notBlocked = 0;

            if (stacks.length >= 2) {
              blocked = stacks[0].toY - stacks[0].fromY;
              notBlocked = stacks[1].toY - stacks[1].fromY;
            }

            return BarTooltipItem(
              '$timeLabel\n',
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: selectedTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
              children: [
                TextSpan(
                  text: 'Blocked: ${blocked.toInt()}\n',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: 'Not blocked: ${notBlocked.toInt()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Map<String, dynamic> formatData(
      Map<String, dynamic> data,
      double chartWidth,
      ThemeMode selectedTheme,
    ) {
      final items = <BarChartGroupData>[];

      var topPoint = 0;
      final List<String> domainsKeys = data['domains_over_time'].keys.toList();
      final List<String> adsKeys = data['ads_over_time'].keys.toList();
      final interval = reducedData == true ? averageIntervalCount : 1;
      final barWidth = chartWidth /
          (reducedData == true
              ? domainsKeys.length / averageIntervalCount
              : domainsKeys.length) *
          0.8;

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
        final barRods = <BarChartRodData>[];
        var stackedHeight = 0.0;
        var adsHeight = 0.0;
        final stackItems = <BarChartRodStackItem>[];

        stackedHeight = data['domains_over_time'][domainsKeys[i]].toDouble();
        adsHeight = data['ads_over_time'][adsKeys[i]].toDouble();

        if (stackedHeight > topPoint) {
          topPoint = stackedHeight.toInt();
        }

        // blocked
        stackItems.add(
          BarChartRodStackItem(
            0.0,
            adsHeight,
            selectedTheme == ThemeMode.light
                ? Theme.of(context)
                    .extension<GraphColors>()!
                    .getColor(0)
                    .withValues(alpha: 0.8)
                : Theme.of(context).extension<GraphColors>()!.getColor(0),
          ),
        );

        // not blocked
        stackItems.add(
          BarChartRodStackItem(
            adsHeight,
            stackedHeight,
            selectedTheme == ThemeMode.light
                ? Theme.of(context)
                    .extension<GraphColors>()!
                    .getColor(3)
                    .withValues(alpha: 0.8)
                : Theme.of(context).extension<GraphColors>()!.getColor(3),
          ),
        );

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
            x: i,
            barRods: barRods,
            barsSpace: 2,
          ),
        );
      }

      final timestamps = <String>[];
      final List<String> k = data['domains_over_time'].keys.toList();
      for (var i = 0; i < k.length; i += interval) {
        timestamps.add(k[i]);
      }

      return {
        'data': items,
        'topPoint': topPoint,
        'time': timestamps,
      };
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final chartWidth = constraints.maxWidth;
          final formattedData =
              formatData(data, chartWidth, appConfigProvider.selectedTheme);

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

          return BarChart(
            mainData(
              formattedData,
              appConfigProvider.selectedTheme,
              context,
            ),
          );
        },
      ),
    );
  }
}
