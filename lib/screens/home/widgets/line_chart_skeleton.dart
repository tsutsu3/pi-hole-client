import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LineChartSkeleton extends StatefulWidget {
  const LineChartSkeleton({
    required this.selectedTheme,
    this.nums = 2,
    this.showAnimation = true,
    super.key,
  });

  final ThemeMode selectedTheme;
  final int nums;
  final bool showAnimation;

  @override
  State<LineChartSkeleton> createState() => _LineChartSkeletonState();
}

class _LineChartSkeletonState extends State<LineChartSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final List<double> _waveOffsets;
  late final List<double> _scales;

  final _pointCount = 10;
  final _maxY = 100.0;

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

  List<FlSpot> _generateWavePoints(
    double time,
    double offset,
    double scale,
    int variant,
  ) {
    return List.generate(_pointCount, (i) {
      final x = i.toDouble();
      final t = time * 1.5 * pi;

      final frequency1 = 0.6 + 0.15 * variant;
      final frequency2 = 0.3 + 0.05 * variant;
      final timeScale = 1.0 + 0.2 * variant;
      const baseY = 50.0;

      final y = (sin(frequency1 * x - t * timeScale + offset) * 12 +
                  cos(frequency2 * x - t * timeScale * 1.1) * 8) *
              scale +
          baseY;

      return FlSpot(x, y);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLight = widget.selectedTheme == ThemeMode.light;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final time = _controller.value;
          return Stack(
            alignment: Alignment.center,
            children: [
              _buildWaveSkeleton(time, context, isLight),
              _buildLoading(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWaveSkeleton(
    double time,
    BuildContext context,
    bool isLight,
  ) {
    final colors2 = [
      Theme.of(context).extension<GraphColors>()!.getColor(0),
      Theme.of(context).extension<GraphColors>()!.getColor(3),
    ];

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: _maxY,
        lineBarsData: widget.showAnimation
            ? [
                for (int i = 0; i < widget.nums; i++)
                  LineChartBarData(
                    spots: _generateWavePoints(
                      time,
                      _waveOffsets[i],
                      _scales[i],
                      i,
                    ),
                    color: widget.nums == 2
                        ? colors2[i]
                        : Theme.of(context)
                            .extension<GraphColors>()!
                            .getColor(i),
                    isCurved: true,
                    dotData: const FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: widget.nums == 2
                          ? colors2[i].withValues(alpha: 0.2)
                          : Theme.of(context)
                              .extension<GraphColors>()!
                              .getColor(i)
                              .withValues(alpha: 0.2),
                    ),
                  ),
              ]
            : [],
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
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Align(
      child: Skeleton.keep(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).colorScheme.primary,
                size: 42,
              ),
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
    );
  }
}
