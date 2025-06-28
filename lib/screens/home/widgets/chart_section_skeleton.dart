import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A skeleton widget for the chart section, used as a placeholder while loading data.
///
/// Displays a section label and a skeleton container styled to match the chart area.
/// The width of the section adapts based on the provided [width] and the
/// [ResponsiveConstants.medium] breakpoint.
///
/// - [label]: The text label for the section.
/// - [width]: The current width of the parent container, used for responsive layout.
class ChartSectionSkeleton extends StatelessWidget {
  const ChartSectionSkeleton({
    required this.label,
    required this.width,
    super.key,
  });

  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(label: label),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Skeletonizer(
              child: Skeleton.leaf(
                child: Container(
                  width: double.infinity,
                  height: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
