import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/models_old/search.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({required this.results, super.key});

  final SearchResultsInfo results;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.summary),
        const SizedBox(height: 8),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.summarize_rounded),
          title: Text(AppLocalizations.of(context)!.total),
          subtitle: Text(results.total.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.rule_rounded),
          title: Text(AppLocalizations.of(context)!.domainsExactMatches),
          subtitle: Text(results.domainsExact.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.code_rounded),
          title: Text(AppLocalizations.of(context)!.domainsRegexMatches),
          subtitle: Text(results.domainsRegex.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.check_circle_outline_rounded),
          title: Text(AppLocalizations.of(context)!.gravityAllowMatches),
          subtitle: Text(results.gravityAllow.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.block_rounded),
          title: Text(AppLocalizations.of(context)!.gravityBlockMatches),
          subtitle: Text(results.gravityBlock.toString()),
        ),
      ],
    );
  }
}
