import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';

/// A widget that displays a colored dot alongside a label, typically used for legends in charts.
///
/// The color of the dot is determined by the [colorIndex], which is used to fetch a color
/// from the [GraphColors] extension in the current theme. The [label] is displayed next to the dot.
///
/// Example usage:
/// ```dart
/// QueriesLegendDot(
///   colorIndex: 0,
///   label: 'Blocked Queries',
/// )
/// ```
class QueriesLegendDot extends StatelessWidget {
  const QueriesLegendDot({
    required this.colorIndex,
    required this.label,
    super.key,
  });

  final int colorIndex;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context)
                .extension<GraphColors>()!
                .getColor(colorIndex),
          ),
        ),
        const SizedBox(width: 10),
        Text(label),
      ],
    );
  }
}
