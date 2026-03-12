import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_actions.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlists_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlists_scaffold.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/icon_tab.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
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
      final gravityUpdateViewModel = context.read<GravityUpdateViewModel>();
      await gravityUpdateViewModel.load();
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
        ],
        groupChip: Chip(
          label: Text(
            '${AppLocalizations.of(context)!.groups}: ${widget.groupName}',
          ),
          deleteIcon: const Icon(Icons.close, size: 18),
          onDeleted: () => context.pop(),
        ),
        onSearchClose: () => setState(() {
          viewModel.setSearchMode(false);
          searchController.text = '';
          viewModel.onSearch('');
        }),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
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
      return buildScaffold(
        onTap: (adlist) {
          context.pushNamed(
            Routes.settingsServerAdlistsDetails,
            extra: (
              adlist,
              (Adlist s) {
                setState(() => selectedAdlist = null);
                remove(s);
              },
              groups,
              appConfigViewModel.colors,
              _viewModel,
            ),
          );
        },
      );
    } else {
      return buildScaffold();
    }
  }
}
