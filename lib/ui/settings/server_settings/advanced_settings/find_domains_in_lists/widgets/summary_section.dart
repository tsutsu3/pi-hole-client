import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({required this.meta, super.key});

  final ListSearchMeta meta;

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
          subtitle: Text(meta.total.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.rule_rounded),
          title: Text(AppLocalizations.of(context)!.domainsExactMatches),
          subtitle: Text(meta.domainsExact.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.code_rounded),
          title: Text(AppLocalizations.of(context)!.domainsRegexMatches),
          subtitle: Text(meta.domainsRegex.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.check_circle_outline_rounded),
          title: Text(AppLocalizations.of(context)!.gravityAllowMatches),
          subtitle: Text(meta.gravityAllow.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.block_rounded),
          title: Text(AppLocalizations.of(context)!.gravityBlockMatches),
          subtitle: Text(meta.gravityBlock.toString()),
        ),
      ],
    );
  }
}
