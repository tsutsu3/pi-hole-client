import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BarChartSkeleton extends StatefulWidget {
  const BarChartSkeleton({
    required this.selectedTheme,
    this.barCount = 24,
    this.nums = 2,
    super.key,
  });

  final ThemeMode selectedTheme;
  final int barCount;
  final int nums;

  @override
  State<BarChartSkeleton> createState() => _BarChartSkeletonState();
}

class _BarChartSkeletonState extends State<BarChartSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final List<double> _waveOffsets;
  late final List<double> _scales;
  final double _maxY = 100;
  late double barWidth;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    final rand = Random();
    _waveOffsets =
        List.generate(widget.nums, (_) => rand.nextDouble() * 2 * pi);
    _scales = List.generate(widget.nums, (_) => 0.8 + rand.nextDouble() * 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BarChartGroupData> _generateBarGroups(
    double time,
    double offset,
    double scale,
    int variant,
  ) {
    final bars = <BarChartGroupData>[];

    for (var i = 0; i < widget.barCount; i++) {
      final phase = i * 0.3 + offset + variant * pi / 4;

      final base = 40.0 + sin(i * 0.15 + variant * pi) * 8;
      final amplitude = 30.0 + cos(i * 0.1 + variant) * 5;
      final total = base + sin(-time * 2 * pi + phase) * amplitude;

      final ratios = List.generate(widget.nums, (j) {
        final layerPhase = j * pi / 3;
        return 0.4 + 0.4 * sin(-time * 2 * pi + phase + layerPhase);
      });

      final sum = ratios.reduce((a, b) => a + b);
      final normalized = ratios.map((r) => r / sum).toList();

      final stackItems = <BarChartRodStackItem>[];
      var stackedHeight = 0.0;

      for (var j = 0; j < widget.nums; j++) {
        final height =
            (total * normalized[j]).clamp(0.0, _maxY - stackedHeight);
        final fromY = stackedHeight;
        final toY = fromY + height;
        stackedHeight = toY;

        stackItems.add(
          BarChartRodStackItem(
            fromY,
            toY,
            Theme.of(context)
                .extension<GraphColors>()!
                .getColor(j)
                .withValues(alpha: 0.6),
          ),
        );
      }

      bars.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: stackedHeight,
              rodStackItems: stackItems,
              width: barWidth,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
          ],
          barsSpace: 2,
        ),
      );
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    final isLight = widget.selectedTheme == ThemeMode.light;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final time = _controller.value;

        return LayoutBuilder(
          builder: (context, constraints) {
            barWidth = constraints.maxWidth / widget.barCount * 0.8;

            return Stack(
              alignment: Alignment.center,
              children: [
                _buildWaveSkeleton(time, isLight),
                _buildLoading(context),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildWaveSkeleton(double time, bool isLight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: BarChart(
        BarChartData(
          barGroups: _generateBarGroups(time, _waveOffsets[0], _scales[0], 0),
          maxY: _maxY,
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) => FlLine(
              color: isLight ? Colors.black12 : Colors.white12,
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
                getTitlesWidget: (value, _) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide(
                color: isLight ? Colors.black12 : Colors.white12,
              ),
              bottom: BorderSide(
                color: isLight ? Colors.black12 : Colors.white12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Skeleton.keep(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .dialogTheme
                  .backgroundColor!
                  .withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.loading,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
