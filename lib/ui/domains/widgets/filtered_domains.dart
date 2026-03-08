import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_actions.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_list.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_scaffold.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class FilteredDomainLists extends StatefulWidget {
  const FilteredDomainLists({
    required this.groupId,
    required this.groupName,
    this.initialTab = 0,
    super.key,
  });

  final int groupId;
  final String groupName;
  final int initialTab;

  @override
  State<FilteredDomainLists> createState() => _FilteredDomainListsState();
}

class _FilteredDomainListsState extends State<FilteredDomainLists>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  late DomainsViewModel _viewModel;

  Domain? selectedDomain;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );

    _viewModel = context.read<DomainsViewModel>();

    Future.microtask(() async {
      if (!mounted) return;

      _viewModel.setGroupFilter(widget.groupId);
      _viewModel.setSelectedTab(widget.initialTab);

      _viewModel.loadDomains.run();

      if (!mounted) return;
      final groupsViewModel = context.read<GroupsViewModel>();
      await groupsViewModel.loadGroups.runAsync();
    });
  }

  @override
  void dispose() {
    _viewModel.clearGroupFilter();
    tabController.dispose();
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DomainsViewModel>(context);
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);
    final groups = context.watch<GroupsViewModel>().groupItems;

    Widget buildScaffold() {
      return DomainsScaffold(
        tabController: tabController,
        tabs: const [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded),
                Flexible(child: SizedBox(width: 16)),
                Flexible(
                  child: Text('Whitelist', overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.block),
                Flexible(child: SizedBox(width: 16)),
                Flexible(
                  child: Text('Blacklist', overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ],
        tabChildren: [
          DomainsList(
            type: 'whitelist',
            scrollController: scrollController,
            onDomainSelected: (d) => setState(() => selectedDomain = d),
            selectedDomain: selectedDomain,
          ),
          DomainsList(
            type: 'blacklist',
            scrollController: scrollController,
            onDomainSelected: (d) => setState(() => selectedDomain = d),
            selectedDomain: selectedDomain,
          ),
        ],
        onSearchClose: () => setState(() {
          viewModel.setSearchMode(false);
          searchController.text = '';
          viewModel.onSearch('');
        }),
        groupChip: Chip(
          label: Text(
            '${AppLocalizations.of(context)!.groups}: ${widget.groupName}',
          ),
          deleteIcon: const Icon(Icons.close, size: 18),
          onDeleted: () {
            Navigator.pop(context);
          },
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              flex:
                  MediaQuery.of(context).size.width > ResponsiveConstants.xLarge
                  ? 2
                  : 3,
              child: buildScaffold(),
            ),
            Expanded(
              flex: 3,
              child: selectedDomain != null
                  ? DomainDetailsScreen(
                      domain: selectedDomain!,
                      remove: (Domain domain) {
                        setState(() => selectedDomain = null);
                        deleteDomain(
                          context: context,
                          viewModel: viewModel,
                          appConfigViewModel: appConfigViewModel,
                          domain: domain,
                        );
                      },
                      groups: groups,
                      colors: appConfigViewModel.colors,
                    )
                  : SizedBox(
                      child: SafeArea(
                        child: Text(
                          AppLocalizations.of(context)!.domainsSelectLeftColumn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
    } else {
      return buildScaffold();
    }
  }
}
