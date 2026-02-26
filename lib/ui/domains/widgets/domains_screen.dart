import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/group_filter_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
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

  Domain? selectedDomain;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
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

    Future<void> removeDomain(Domain domain) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      try {
        await viewModel.deleteDomain.runAsync(domain);
        if (!context.mounted) return;
        process.close();

        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.domainRemoved,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.errorRemovingDomain,
        );
      }
    }

    Widget scaffold() {
      return DefaultTabController(
        length: 2,
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
                  onPressed: () => setState(() {
                    viewModel.setSearchMode(false);
                    searchController.text = '';
                    viewModel.onSearch('');
                  }),
                  icon: const Icon(Icons.close_rounded),
                ),
              if (!viewModel.searchMode)
                IconButton(
                  onPressed: () => showGroupFilterModal(
                    context: context,
                    groups: groups,
                    selectedGroupId: viewModel.groupFilter,
                    onApply: viewModel.setGroupFilter,
                  ),
                  icon: const Icon(Icons.filter_list_rounded),
                ),
              const SizedBox(width: 10),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                viewModel.groupFilter != null ? 96 : 46,
              ),
              child: Column(
                children: [
                  if (viewModel.groupFilter != null)
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 16),
                          Chip(
                            label: Text(
                              '${AppLocalizations.of(context)!.groups}: ${groups[viewModel.groupFilter] ?? ''}',
                            ),
                            deleteIcon: const Icon(Icons.close, size: 18),
                            onDeleted: viewModel.clearGroupFilter,
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  TabBar(
                    controller: tabController,
                    onTap: viewModel.setSelectedTab,
                    tabs: const [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_rounded),
                            Flexible(child: SizedBox(width: 16)),
                            Flexible(
                              child: Text(
                                'Whitelist',
                                overflow: TextOverflow.ellipsis,
                              ),
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
                              child: Text(
                                'Blacklist',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
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
          ),
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Row(
        children: [
          Expanded(
            flex: MediaQuery.of(context).size.width > ResponsiveConstants.xLarge
                ? 2
                : 3,
            child: scaffold(),
          ),
          Expanded(
            flex: 3,
            child: selectedDomain != null
                ? DomainDetailsScreen(
                    domain: selectedDomain!,
                    remove: (domain) {
                      setState(() => selectedDomain = null);
                      removeDomain(domain);
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
      return scaffold();
    }
  }
}
