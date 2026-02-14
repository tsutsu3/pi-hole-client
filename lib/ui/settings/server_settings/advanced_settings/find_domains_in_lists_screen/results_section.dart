import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/adlist_results_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/domain_results_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/models.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/summary_section.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({
    required this.errorMessage,
    required this.hasSearched,
    required this.meta,
    required this.domainResults,
    required this.adlistResults,
    required this.colors,
    required this.onDomainTap,
    required this.onAdlistTap,
    super.key,
  });

  final String? errorMessage;
  final bool hasSearched;
  final ListSearchMeta? meta;
  final List<Domain> domainResults;
  final List<AdlistSearchGroup> adlistResults;
  final AppColors? colors;
  final ValueChanged<Domain> onDomainTap;
  final ValueChanged<Adlist> onAdlistTap;

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Text(
        errorMessage!,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }

    if (!hasSearched) {
      return const SizedBox.shrink();
    }

    if (meta == null ||
        (domainResults.isEmpty && adlistResults.isEmpty)) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(AppLocalizations.of(context)!.noResultsFound),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummarySection(meta: meta!),
        const SizedBox(height: 16),
        if (domainResults.isNotEmpty) ...[
          SectionLabel(label: AppLocalizations.of(context)!.domainLevelLists),
          const SizedBox(height: 8),
          DomainResultsList(
            results: domainResults,
            colors: colors,
            onTap: onDomainTap,
          ),
          const SizedBox(height: 16),
        ],
        if (adlistResults.isNotEmpty) ...[
          SectionLabel(label: AppLocalizations.of(context)!.listLevelLists),
          const SizedBox(height: 8),
          AdlistResultsList(results: adlistResults, onTap: onAdlistTap),
        ],
      ],
    );
  }
}
