import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    required this.searchController,
    required this.maxResultsController,
    required this.partialMatch,
    required this.isLoading,
    required this.onPartialChanged,
    required this.onSearchSubmitted,
    required this.onSearchPressed,
    super.key,
  });

  final TextEditingController searchController;
  final TextEditingController maxResultsController;
  final bool partialMatch;
  final bool isLoading;
  final ValueChanged<bool> onPartialChanged;
  final VoidCallback onSearchSubmitted;
  final VoidCallback onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.search),
        const SizedBox(height: 8),
        TextField(
          controller: searchController,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.findDomainsSearchLabel,
            prefixIcon: const Icon(Icons.search_rounded),
            border: const OutlineInputBorder(),
          ),
          onSubmitted: (_) => onSearchSubmitted(),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: maxResultsController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.maxResultsToReturnLabel,
            prefixIcon: const Icon(Icons.format_list_numbered_rounded),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          value: partialMatch,
          title: Text(AppLocalizations.of(context)!.usePartialMatching),
          onChanged: onPartialChanged,
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: isLoading ? null : onSearchPressed,
          icon: const Icon(Icons.search_rounded),
          label: Text(AppLocalizations.of(context)!.search),
        ),
      ],
    );
  }
}
