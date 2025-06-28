import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChartSkeleton extends StatefulWidget {
  const ChartSkeleton({
    required this.selectedTheme,
    super.key,
  });

  final ThemeMode selectedTheme;

  @override
  State<ChartSkeleton> createState() => _ChartSkeletonState();
}

class _ChartSkeletonState extends State<ChartSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final double _waveOffset1;
  late final double _waveOffset2;
  late final double _scale1;
  late final double _scale2;

  final _pointCount = 40;
  final _maxY = 100.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    final rand = Random();
    _waveOffset1 = rand.nextDouble() * 2 * pi;
    _waveOffset2 = rand.nextDouble() * 2 * pi;
    _scale1 = 1.0 + rand.nextDouble() * 0.5; // 1.0 to 1.5 scale
    _scale2 = 0.8 + rand.nextDouble() * 0.4; // 0.8 to 1.2 scale
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
      final t = time * 2 * pi;

      final frequency1 = 0.15 + 0.05 * variant;
      final frequency2 = 0.25 + 0.05 * variant;
      final timeScale = 1.0 + 0.3 * variant;
      const baseY = 50.0;

      final y = (sin(frequency1 * x - t * timeScale + offset) * 12 +
                  cos(frequency2 * x - t * timeScale * 1.2) * 6) *
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
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: _maxY,
        lineBarsData: [
          LineChartBarData(
            spots: _generateWavePoints(time, _waveOffset1, _scale1, 0),
            color: Theme.of(context).extension<GraphColors>()!.getColor(0),
            isCurved: true,
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
            spots: _generateWavePoints(time, _waveOffset2, _scale2, 1),
            color: Theme.of(context).extension<GraphColors>()!.getColor(3),
            isCurved: true,
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surface
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
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
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
          ],
        ),
      ),
    );
  }
}
