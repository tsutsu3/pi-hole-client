import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/group_filter_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlists_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/gravity_update.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class AdlistScreen extends StatelessWidget {
  const AdlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);

    final selectedServer = serversProvider.selectedServer;

    if (selectedServer == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.adlists)),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    final apiGateway = serversProvider.selectedApiGateway;

    if (apiGateway?.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.adlists)),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return const AdlistScreenWidget();
  }
}

class AdlistScreenWidget extends StatefulWidget {
  const AdlistScreenWidget({super.key});

  @override
  State<AdlistScreenWidget> createState() => _AdlistScreenWidgetState();
}

class _AdlistScreenWidgetState extends State<AdlistScreenWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();

  Adlist? selectedAdlist;

  @override
  void initState() {
    super.initState();

    final viewModel = context.read<AdlistsViewModel>();

    Future.microtask(() async {
      viewModel.loadAdlists.run();

      if (!mounted) return;
      final groupsViewModel = context.read<GroupsViewModel>();
      await groupsViewModel.loadGroups.runAsync();

      if (!mounted) return;
      final gravityUpdateProvider = context.read<GravityUpdateProvider>();
      await gravityUpdateProvider.load();
    });

    viewModel.setSelectedTab(0);
    tabController = TabController(length: 3, vsync: this);
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
        length: 3,
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
                      buildIconTab(
                        Icons.rocket_launch_rounded,
                        AppLocalizations.of(context)!.updateGravity,
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
              const GravityUpdate(),
            ],
          ),
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      // 3 columns layout
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
      // 2 columns layout
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
      // mobile layout
      return scaffold();
    }
  }
}
