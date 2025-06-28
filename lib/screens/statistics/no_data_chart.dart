import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class NoDataChart extends StatelessWidget {
  const NoDataChart({
    required this.topLabel,
    super.key,
  });

  final String topLabel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SectionLabel(label: topLabel),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 16),
    //       child: Container(
    //         width: double.infinity,
    //         height: 360,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12),
    //           color: Theme.of(context).colorScheme.surfaceContainerHighest,
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return SizedBox(
      width: width,
      child: Column(
        children: [
          SectionLabel(
            label: topLabel,
          ),
          Container(
            height: 360,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceTint
                  .withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.show_chart_rounded,
                  size: 40,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.noData,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
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
