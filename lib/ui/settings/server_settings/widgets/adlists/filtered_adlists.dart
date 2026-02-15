import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlists_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class FilteredAdlists extends StatefulWidget {
  const FilteredAdlists({
    required this.groupId,
    required this.groupName,
    this.initialTab = 0,
    super.key,
  });

  final int groupId;
  final String groupName;
  final int initialTab;

  @override
  State<FilteredAdlists> createState() => _FilteredAdlistsState();
}

class _FilteredAdlistsState extends State<FilteredAdlists>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  late AdlistsViewModel _viewModel;

  Adlist? selectedAdlist;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );

    _viewModel = context.read<AdlistsViewModel>();

    Future.microtask(() async {
      if (!mounted) return;

      _viewModel.setGroupFilter(widget.groupId);
      _viewModel.setSelectedTab(widget.initialTab);

      _viewModel.loadAdlists.run();

      if (!mounted) return;
      final groupsViewModel = context.read<GroupsViewModel>();
      await groupsViewModel.loadGroups.runAsync();

      if (!mounted) return;
      final gravityUpdateProvider = context.read<GravityUpdateProvider>();
      await gravityUpdateProvider.load();
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
    final viewModel = Provider.of<AdlistsViewModel>(context);
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final groups = context.watch<GroupsViewModel>().groupItems;

    Future<void> removeAdlist(Adlist adlist) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      try {
        await viewModel.deleteAdlist.runAsync(adlist);

        if (!context.mounted) return;
        process.close();

        await Navigator.maybePop(context);

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistRemoved,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistDeleteError,
        );
      }
    }

    Tab buildIconTab(IconData icon, String label) {
      return Tab(
        child: Row(
          children: [Icon(icon), const SizedBox(width: 4), Text(label)],
        ),
      );
    }

    Widget scaffold({void Function(Adlist)? onTap}) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: viewModel.searchMode
                ? TextFormField(
                    initialValue: viewModel.searchTerm,
                    onChanged: viewModel.onSearch,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.adlistsSearch,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : Text(AppLocalizations.of(context)!.adlists),
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
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    controller: tabController,
                    onTap: viewModel.setSelectedTab,
                    tabs: [
                      buildIconTab(
                        Icons.check_circle_rounded,
                        AppLocalizations.of(context)!.allowList,
                      ),
                      buildIconTab(
                        Icons.block_rounded,
                        AppLocalizations.of(context)!.blockList,
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
              AdlistsList(
                type: 'whitelist',
                scrollController: scrollController,
                onAdlistSelected: (d) {
                  if (onTap != null) {
                    onTap(d);
                  } else {
                    setState(() => selectedAdlist = d);
                  }
                },
                selectedAdlist: selectedAdlist,
              ),
              AdlistsList(
                type: 'blacklist',
                scrollController: scrollController,
                onAdlistSelected: (d) {
                  if (onTap != null) {
                    onTap(d);
                  } else {
                    setState(() => selectedAdlist = d);
                  }
                },
                selectedAdlist: selectedAdlist,
              ),
            ],
          ),
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      return Row(
        children: [
          Expanded(child: scaffold()),
          Expanded(
            child: selectedAdlist != null
                ? AdlistDetailsScreen(
                    adlist: selectedAdlist!,
                    remove: (adlist) {
                      setState(() => selectedAdlist = null);
                      removeAdlist(adlist);
                    },
                    groups: groups,
                    colors: serversProvider.colors,
                  )
                : ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SafeArea(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.adlistsSelectLeftColumn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    } else if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return scaffold(
        onTap: (adlist) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdlistDetailsScreen(
                adlist: adlist,
                remove: (s) {
                  setState(() => selectedAdlist = null);
                  removeAdlist(s);
                },
                groups: groups,
                colors: serversProvider.colors,
              ),
            ),
          );
        },
      );
    } else {
      return scaffold();
    }
  }
}
