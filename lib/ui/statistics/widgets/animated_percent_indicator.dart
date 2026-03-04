import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnimatedPercentIndicator extends StatefulWidget {
  const AnimatedPercentIndicator({
    required this.value,
    required this.total,
    super.key,
  });

  final int value;
  final int total;

  @override
  State<AnimatedPercentIndicator> createState() =>
      _AnimatedPercentIndicatorState();
}

class _AnimatedPercentIndicatorState extends State<AnimatedPercentIndicator> {
  late double _percent;

  @override
  void initState() {
    super.initState();
    _percent = _computePercent();
  }

  @override
  void didUpdateWidget(covariant AnimatedPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newPercent = _computePercent();
    if (newPercent != _percent) {
      setState(() {
        _percent = newPercent;
      });
    }
  }

  double _computePercent() {
    return widget.total == 0
        ? 0.0
        : (widget.value / widget.total).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 10,
      curve: Curves.easeOut,
      percent: _percent,
      barRadius: const Radius.circular(5),
      progressColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.primaryContainer,
    );
  }
}
