import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:provider/provider.dart';

/// Shared scaffold for domains screens.
///
/// Handles the common AppBar (with search toggle), optional group-filter chip
/// row, and TabBar/TabBarView structure.  The caller is responsible for
/// building the [tabs] and [tabChildren] lists and for passing [groupChip]
/// and [extraActions] when needed.
class DomainsScaffold extends StatelessWidget {
  const DomainsScaffold({
    required this.tabController,
    required this.tabs,
    required this.tabChildren,
    required this.onSearchClose,
    this.groupChip,
    this.extraActions,
    super.key,
  });

  final TabController tabController;

  /// Tab labels — one [Widget] per tab.
  final List<Widget> tabs;

  /// Content for each tab inside [TabBarView].
  final List<Widget> tabChildren;

  /// Called when the user dismisses the search bar.
  final VoidCallback onSearchClose;

  /// Optional chip shown in the AppBar bottom area (e.g. active group filter).
  /// When non-null the bottom area is 98 px tall; otherwise 46 px.
  final Widget? groupChip;

  /// Extra action buttons shown in the AppBar when *not* in search mode
  /// (e.g. the group-filter icon button). Placed before the trailing spacer.
  final List<Widget>? extraActions;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DomainsViewModel>(context);

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: viewModel.searchMode
              ? TextFormField(
                  initialValue: viewModel.searchTerm,
                  onChanged: viewModel.onSearch,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.domainsSearch,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : Text(AppLocalizations.of(context)!.domains),
          actions: [
            if (!viewModel.searchMode)
              IconButton(
                onPressed: () => viewModel.setSearchMode(true),
                icon: const Icon(Icons.search_rounded),
              ),
            if (viewModel.searchMode)
              IconButton(
                onPressed: onSearchClose,
                icon: const Icon(Icons.close_rounded),
              ),
            if (!viewModel.searchMode && extraActions != null) ...extraActions!,
            const SizedBox(width: 10),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(groupChip != null ? 98 : 46),
            child: Column(
              children: [
                if (groupChip != null)
                  Container(
                    width: double.maxFinite,
                    height: 52,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 16),
                        groupChip!,
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                TabBar(
                  controller: tabController,
                  onTap: viewModel.setSelectedTab,
                  tabs: tabs,
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(controller: tabController, children: tabChildren),
      ),
    );
  }
}
