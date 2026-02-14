import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content_list.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/subscriptions/viewmodel/subscriptions_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/add_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/group_tile.dart';
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
    final serversProvider = Provider.of<ServersProvider>(context);
    final groupsProvider = Provider.of<GroupsProvider>(context);
    final clientsListProvider = Provider.of<ClientsListProvider>(context);
    final domainsViewModel = Provider.of<DomainsViewModel>(context);
    final subscriptionsViewModel = Provider.of<SubscriptionsViewModel>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;

    final clients = clientsListProvider.clients;
    final allDomains = [
      ...domainsViewModel.whitelistDomains,
      ...domainsViewModel.blacklistDomains,
    ];
    final allAdlists = [
      ...subscriptionsViewModel.whitelistAdlists,
      ...subscriptionsViewModel.blacklistAdlists,
    ];

    final groups = widget.searchTerm.isNotEmpty
        ? groupsProvider.groups
              .where(
                (group) =>
                    group.name.contains(widget.searchTerm) ||
                    (group.comment ?? '').contains(widget.searchTerm),
              )
              .toList()
        : groupsProvider.groups;

    Future<void> onAddGroup(GroupRequest value) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.groupAdding);

      final result = await apiGateway?.createGroup(body: value);

      process.close();

      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        await groupsProvider.loadGroups();
        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupAdded,
        );
      } else if (result?.result == APiResponseType.alreadyAdded) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupAlreadyAdded,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupAddFailed,
        );
      }
    }

    Future<void> onToggleGroupEnabled(Group group, bool enabled) async {
      final body = GroupRequest(
        name: group.name,
        comment: group.comment,
        enabled: enabled,
      );

      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.groupUpdating);

      final result = await apiGateway?.updateGroup(
        name: group.name,
        body: body,
      );

      process.close();

      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        await groupsProvider.loadGroups();
        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.groupUpdated,
        );
      } else {
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
          loadStatus: groupsProvider.loadingStatus,
          onRefresh: () async => groupsProvider.loadGroups(),
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
