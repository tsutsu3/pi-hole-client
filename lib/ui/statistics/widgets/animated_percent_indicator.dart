import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnimatedPercentIndicator extends StatelessWidget {
  const AnimatedPercentIndicator({
    required this.value,
    required this.total,
    super.key,
  });

  final int value;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = total == 0 ? 0.0 : (value / total).clamp(0.0, 1.0);
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 10,
      curve: Curves.easeOut,
      percent: percent,
      barRadius: const Radius.circular(5),
      progressColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.primaryContainer,
    );
  }
}
