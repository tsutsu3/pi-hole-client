import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content_list.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/add_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/group_tile.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class GroupsList extends StatefulWidget {
  const GroupsList({
    required this.scrollController,
    required this.searchTerm,
    required this.onGroupSelected,
    required this.selectedGroup,
    super.key,
  });

  final ScrollController scrollController;
  final String searchTerm;
  final void Function(Group) onGroupSelected;
  final Group? selectedGroup;

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = true;
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (mounted && isVisible == false) {
        setState(() => isVisible = true);
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupsViewModel = Provider.of<GroupsViewModel>(context);
    final clientsViewModel = Provider.of<ClientsViewModel>(context);
    final domainsViewModel = Provider.of<DomainsViewModel>(context);
    final adlistsViewModel = Provider.of<AdlistsViewModel>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final clients = clientsViewModel.clients;
    final allDomains = [
      ...domainsViewModel.whitelistDomains,
      ...domainsViewModel.blacklistDomains,
    ];
    final allAdlists = [
      ...adlistsViewModel.whitelistAdlists,
      ...adlistsViewModel.blacklistAdlists,
    ];

    final groups = widget.searchTerm.isNotEmpty
        ? groupsViewModel.groups
              .where(
                (group) =>
                    group.name.contains(widget.searchTerm) ||
                    (group.comment ?? '').contains(widget.searchTerm),
              )
              .toList()
        : groupsViewModel.groups;

    Future<void> onAddGroup(
      ({String name, String? comment, bool? enabled}) value,
    ) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.groupAdding);

      try {
        await groupsViewModel.addGroup.runAsync(value);

        if (!context.mounted) return;
        process.close();

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupAdded,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupAddFailed,
        );
      }
    }

    Future<void> onToggleGroupEnabled(Group group, bool enabled) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.groupUpdating);

      try {
        await groupsViewModel.updateGroup.runAsync((
          name: group.name,
          comment: group.comment,
          enabled: enabled,
        ));

        if (!context.mounted) return;
        process.close();

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupUpdated,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupUpdateFailed,
        );
      }
    }

    void openModalAddGroup() {
      final mediaQuery = MediaQuery.of(context);
      final isSmallLandscape =
          mediaQuery.size.width > mediaQuery.size.height &&
          mediaQuery.size.height < ResponsiveConstants.medium;

      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useSafeArea: !isSmallLandscape,
          useRootNavigator: false,
          builder: (ctx) => AddGroupModal(onConfirm: onAddGroup, window: true),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => AddGroupModal(onConfirm: onAddGroup, window: false),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    return Stack(
      children: [
        CustomTabContentList(
          loadingGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.loadingList,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          itemsCount: groups.length,
          contentWidget: (index) {
            final thisGroup = groups[index];
            return Padding(
              padding:
                  index == 0 &&
                      MediaQuery.of(context).size.width >
                          ResponsiveConstants.large
                  ? const EdgeInsets.only(top: 16)
                  : EdgeInsets.zero,
              child: GroupTile(
                group: thisGroup,
                clientCount: clients
                    .where((client) => client.groups.contains(thisGroup.id))
                    .length,
                domainCount: allDomains
                    .where((domain) => domain.groups.contains(thisGroup.id))
                    .length,
                adlistCount: allAdlists
                    .where((sub) => sub.groups.contains(thisGroup.id))
                    .length,
                isGroupSelected: widget.selectedGroup == thisGroup,
                showGroupDetails: (g) => widget.onGroupSelected(g),
                onToggleEnabled: onToggleGroupEnabled,
              ),
            );
          },
          noData: Container(
            height: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.groupsNone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          errorGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 50, color: Colors.red),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.groupsNotLoaded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          loadStatus: groupsViewModel.loadingStatus,
          onRefresh: () async => groupsViewModel.loadGroups.runAsync(),
          bottomSpaceHeight: 80,
        ),
        SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                bottom: isVisible
                    ? appConfigProvider.showingSnackbar
                          ? 70
                          : 20
                    : -70,
                right: 20,
                child: FloatingActionButton(
                  onPressed: openModalAddGroup,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
