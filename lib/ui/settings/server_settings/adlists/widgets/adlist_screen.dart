import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/routing/route_extra.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/modals/group_filter_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_actions.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlists_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlists_scaffold.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/gravity_update.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/icon_tab.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class AdlistScreen extends StatelessWidget {
  const AdlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serversViewModel = Provider.of<ServersViewModel>(context);
    final selectedServer = serversViewModel.selectedServer;

    if (selectedServer == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.adlists)),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    if (selectedServer.apiVersion == 'v5') {
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
      final gravityUpdateViewModel = context.read<GravityUpdateViewModel>();
      await gravityUpdateViewModel.load();
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
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);
    final groups = context.watch<GroupsViewModel>().groupItems;

    void remove(Adlist adlist) => deleteAdlist(
      context: context,
      viewModel: viewModel,
      appConfigViewModel: appConfigViewModel,
      adlist: adlist,
    );

    AdlistsScaffold buildScaffold({void Function(Adlist)? onTap}) {
      return AdlistsScaffold(
        tabController: tabController,
        tabs: [
          IconTab(
            icon: Icons.check_circle_rounded,
            label: AppLocalizations.of(context)!.allowList,
          ),
          IconTab(
            icon: Icons.block_rounded,
            label: AppLocalizations.of(context)!.blockList,
          ),
          IconTab(
            icon: Icons.rocket_launch_rounded,
            label: AppLocalizations.of(context)!.updateGravity,
          ),
        ],
        tabChildren: [
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
        onSearchClose: () => setState(() {
          viewModel.setSearchMode(false);
          searchController.text = '';
          viewModel.onSearch('');
        }),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      // 3 columns layout
      return Row(
        children: [
          Expanded(child: buildScaffold()),
          Expanded(
            child: selectedAdlist != null
                ? AdlistDetailsScreen(
                    adlist: selectedAdlist!,
                    remove: (adlist) {
                      setState(() => selectedAdlist = null);
                      remove(adlist);
                    },
                    groups: groups,
                    colors: appConfigViewModel.colors,
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
      return buildScaffold(
        onTap: (adlist) {
          context.pushNamed(
            Routes.settingsServerAdlistsDetails,
            extra: AdlistDetailsExtra(
              adlist: adlist,
              remove: (Adlist s) {
                setState(() => selectedAdlist = null);
                remove(s);
              },
              groups: groups,
              colors: appConfigViewModel.colors,
              viewModel: context.read<AdlistsViewModel>(),
            ),
          );
        },
      );
    } else {
      // mobile layout
      return buildScaffold();
    }
  }
}
