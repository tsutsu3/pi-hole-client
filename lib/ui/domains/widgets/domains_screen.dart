import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/modals/group_filter_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_actions.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_list.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_scaffold.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:pi_hole_client/ui/shell/app_shell.dart';
import 'package:provider/provider.dart';

class DomainsScreen extends StatefulWidget {
  const DomainsScreen({super.key});

  @override
  State<DomainsScreen> createState() => _DomainsScreenState();
}

class _DomainsScreenState extends State<DomainsScreen>
    with TickerProviderStateMixin {
  bool _initialized = false;
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  late final AppConfigViewModel _appConfigViewModel;
  int _lastKnownTab = AppShell.domainsIndex;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);

    _appConfigViewModel = context.read<AppConfigViewModel>();
    _appConfigViewModel.addListener(_onAppConfigChanged);
  }

  void _onAppConfigChanged() {
    final currentTab = _appConfigViewModel.selectedTab;
    if (currentTab == _lastKnownTab) return;

    final previousTab = _lastKnownTab;
    _lastKnownTab = currentTab;

    if (currentTab == AppShell.domainsIndex) {
      // Returning to domains tab — refresh only if a domain was added
      final logsVm = context.read<LogsViewModel>();
      if (logsVm.domainListDirty) {
        logsVm.clearDomainListDirty();
        context.read<DomainsViewModel>().loadDomains.run();
      }
    } else if (previousTab == AppShell.domainsIndex) {
      // Leaving domains tab — reset while hidden (no flash)
      context.read<DomainsViewModel>().setSelectedDomain(null);
      tabController.index = 0;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Provider.of<DomainsViewModel>(context, listen: false).setSelectedTab(0);
    }
  }

  @override
  void dispose() {
    _appConfigViewModel.removeListener(_onAppConfigChanged);
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
            onDomainSelected: viewModel.setSelectedDomain,
            selectedDomain: viewModel.selectedDomain,
          ),
          DomainsList(
            type: 'blacklist',
            scrollController: scrollController,
            onDomainSelected: viewModel.setSelectedDomain,
            selectedDomain: viewModel.selectedDomain,
          ),
        ],
        onSearchClose: () => setState(() {
          viewModel.setSearchMode(false);
          searchController.text = '';
          viewModel.onSearch('');
        }),
        groupChip: viewModel.groupFilter != null
            ? Chip(
                label: Text(
                  '${AppLocalizations.of(context)!.groups}: ${groups[viewModel.groupFilter] ?? ''}',
                ),
                deleteIcon: const Icon(Icons.close, size: 18),
                onDeleted: viewModel.clearGroupFilter,
              )
            : null,
        extraActions: [
          IconButton(
            onPressed: () => showGroupFilterModal(
              context: context,
              groups: groups,
              selectedGroupId: viewModel.groupFilter,
              onApply: viewModel.setGroupFilter,
            ),
            icon: const Icon(Icons.filter_list_rounded),
          ),
        ],
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Row(
        children: [
          Expanded(
            flex: MediaQuery.of(context).size.width > ResponsiveConstants.xLarge
                ? 2
                : 3,
            child: buildScaffold(),
          ),
          Expanded(
            flex: 3,
            child: viewModel.selectedDomain != null
                ? DomainDetailsScreen(
                    domain: viewModel.selectedDomain!,
                    remove: (Domain domain) {
                      viewModel.setSelectedDomain(null);
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    } else {
      return buildScaffold();
    }
  }
}
