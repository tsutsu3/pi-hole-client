import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class ErrorDataChart extends StatelessWidget {
  const ErrorDataChart({required this.topLabel, super.key});

  final String topLabel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Column(
        children: [
          SectionLabel(label: topLabel),
          Container(
            height: 360,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceTint.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ErrorMessage(
              message: AppLocalizations.of(context)!.chartsNotLoaded,
            ),
          ),
        ],
      ),
    );
  }
}
