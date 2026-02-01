import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/domain.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/domains_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_list.dart';
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

  Domain? selectedDomain;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );

    Future.microtask(() async {
      if (!mounted) return;

      final domainsListProvider = context.read<DomainsListProvider>();
      domainsListProvider.setLoadingStatus(LoadStatus.loading);
      domainsListProvider.setGroupFilter(widget.groupId);
      domainsListProvider.setSelectedTab(widget.initialTab);

      await domainsListProvider.fetchDomainsList();

      if (!mounted) return;
      final groupsProvider = context.read<GroupsProvider>();
      await groupsProvider.loadGroups();
    });
  }

  @override
  void dispose() {
    final domainsListProvider = context.read<DomainsListProvider>();
    domainsListProvider.clearGroupFilter();
    tabController.dispose();
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final domainsListProvider = Provider.of<DomainsListProvider>(context);
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;
    final groups = context.watch<GroupsProvider>().groupItems;

    Future<void> removeDomain(Domain domain) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.removeDomainFromList(domain);

      process.close();

      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        domainsListProvider.removeDomainFromList(domain);

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainRemoved,
        );
      } else if (result!.result == APiResponseType.error &&
          result.message != null &&
          result.message == 'not_exists') {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainNotExists,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.errorRemovingDomain,
        );
      }
    }

    Widget scaffold() {
      return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverAppBar(
                  title: domainsListProvider.searchMode
                      ? TextFormField(
                          initialValue: domainsListProvider.searchTerm,
                          onChanged: domainsListProvider.onSearch,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(
                              context,
                            )!.domainsSearch,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        )
                      : Text(AppLocalizations.of(context)!.domains),
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    if (domainsListProvider.searchMode == false)
                      IconButton(
                        onPressed: () =>
                            domainsListProvider.setSearchMode(true),
                        icon: const Icon(Icons.search),
                      ),
                    if (domainsListProvider.searchMode == true)
                      IconButton(
                        onPressed: () => setState(() {
                          domainsListProvider.setSearchMode(false);
                          searchController.text = '';
                          domainsListProvider.onSearch('');
                        }),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    const SizedBox(width: 10),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(96),
                    child: Column(
                      children: [
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
                                  '${AppLocalizations.of(context)!.groups}: ${widget.groupName}',
                                ),
                                deleteIcon: const Icon(Icons.close, size: 18),
                                onDeleted: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                        ),
                        TabBar(
                          controller: tabController,
                          onTap: domainsListProvider.setSelectedTab,
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
              ),
            ];
          },
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
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              flex:
                  MediaQuery.of(context).size.width > ResponsiveConstants.xLarge
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
                      colors: serversProvider.colors,
                    )
                  : SizedBox(
                      child: SafeArea(
                        child: Text(
                          AppLocalizations.of(context)!.domainsSelectLeftColumn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(body: scaffold());
    }
  }
}
