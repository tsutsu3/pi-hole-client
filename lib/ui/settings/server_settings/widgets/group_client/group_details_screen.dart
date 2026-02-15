import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/formats.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/domains/filtered_domains.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/filtered_adlists.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/edit_group_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({
    required this.group,
    required this.remove,
    super.key,
  });

  final Group group;
  final void Function(Group) remove;

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  late Group _group;
  late GroupsViewModel groupsViewModel;
  late AppConfigProvider appConfigProvider;
  late ClientsViewModel clientsViewModel;
  late DomainsViewModel domainsViewModel;
  late AdlistsViewModel adlistsViewModel;

  @override
  void initState() {
    super.initState();
    _group = widget.group.copyWith();
  }

  @override
  void didUpdateWidget(covariant GroupDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.group != widget.group) {
      setState(() {
        _group = widget.group.copyWith();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigProvider = context.watch<AppConfigProvider>();
    groupsViewModel = context.watch<GroupsViewModel>();
    clientsViewModel = context.watch<ClientsViewModel>();
    domainsViewModel = context.watch<DomainsViewModel>();
    adlistsViewModel = context.watch<AdlistsViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.groupDetails),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.groupDelete,
                message: AppLocalizations.of(context)!.groupDeleteMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  removeGroup(_group);
                },
              ),
            ),
            icon: const Icon(Icons.delete_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.groupSettings),
            CustomListTile(
              leadingIcon: Icons.check_rounded,
              label: AppLocalizations.of(context)!.status,
              description: _group.enabled
                  ? AppLocalizations.of(context)!.enabled
                  : AppLocalizations.of(context)!.disabled,
              onTap: () => onEditGroup((
                name: _group.name,
                comment: _group.comment,
                enabled: !_group.enabled,
              )),
              trailing: Switch(
                value: _group.enabled,
                onChanged: (value) => onEditGroup((
                  name: _group.name,
                  comment: _group.comment,
                  enabled: value,
                )),
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.group_rounded,
              label: AppLocalizations.of(context)!.groupName,
              description: _group.name,
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openEditGroupModal,
            ),
            CustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: _group.comment == null || _group.comment!.isEmpty
                  ? AppLocalizations.of(context)!.noComment
                  : _group.comment!,
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openEditGroupModal,
            ),
            SectionLabel(label: AppLocalizations.of(context)!.groupInfo),
            CustomListTile(
              leadingIcon: Icons.label_outline_rounded,
              label: AppLocalizations.of(context)!.id,
              description: _group.id.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.event_available_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description: formatTimestamp(
                _group.dateAdded,
                kUnifiedDateTimeFormat,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.edit_calendar_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description: formatTimestamp(
                _group.dateModified,
                kUnifiedDateTimeFormat,
              ),
            ),
            SectionLabel(label: AppLocalizations.of(context)!.groupMembers),
            _buildMemberCountTile(
              icon: Icons.devices_rounded,
              label: AppLocalizations.of(context)!.clients,
              count: clientsViewModel.clients
                  .where((c) => c.groups.contains(_group.id))
                  .length,
            ),
            _buildMemberCountTile(
              icon: Icons.check_circle_outline_rounded,
              label: AppLocalizations.of(context)!.domainsWhitelist,
              count: domainsViewModel.whitelistDomains
                  .where((d) => d.groups.contains(_group.id))
                  .length,
              onTap: () => _navigateToFilteredDomains(initialTab: 0),
            ),
            _buildMemberCountTile(
              icon: Icons.block_rounded,
              label: AppLocalizations.of(context)!.domainsBlacklist,
              count: domainsViewModel.blacklistDomains
                  .where((d) => d.groups.contains(_group.id))
                  .length,
              onTap: () => _navigateToFilteredDomains(initialTab: 1),
            ),
            _buildMemberCountTile(
              icon: Icons.playlist_add_check_rounded,
              label: AppLocalizations.of(context)!.adlistsAllow,
              count: adlistsViewModel.whitelistAdlists
                  .where((s) => s.groups.contains(_group.id))
                  .length,
              onTap: () => _navigateToFilteredAdlists(initialTab: 0),
            ),
            _buildMemberCountTile(
              icon: Icons.playlist_remove_rounded,
              label: AppLocalizations.of(context)!.adlistsBlock,
              count: adlistsViewModel.blacklistAdlists
                  .where((s) => s.groups.contains(_group.id))
                  .length,
              onTap: () => _navigateToFilteredAdlists(initialTab: 1),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> removeGroup(Group group) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    try {
      await groupsViewModel.deleteGroup.runAsync(group);

      if (!mounted) return;
      process.close();

      widget.remove(group);
      if (!mounted) return;
      if (MediaQuery.of(context).size.width <= ResponsiveConstants.large) {
        await Navigator.maybePop(context);
      }

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupRemoved,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupRemoveFailed,
      );
    }
  }

  Future<void> onEditGroup(
    ({String name, String? comment, bool? enabled}) params,
  ) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.groupUpdating);

    try {
      await groupsViewModel.updateGroup.runAsync(params);

      if (!mounted) return;
      process.close();

      final updatedGroup = groupsViewModel.groups.firstWhere(
        (g) => g.name == params.name,
        orElse: () => _group.copyWith(
          comment: params.comment,
          enabled: params.enabled ?? _group.enabled,
        ),
      );

      setState(() {
        _group = updatedGroup;
      });

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupUpdated,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupUpdateFailed,
      );
    }
  }

  void openEditGroupModal() {
    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (ctx) => EditGroupModal(
          group: _group,
          onConfirm: (request) => onEditGroup((
            name: _group.name,
            comment: request.comment,
            enabled: request.enabled,
          )),
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditGroupModal(
          group: _group,
          onConfirm: (request) => onEditGroup((
            name: _group.name,
            comment: request.comment,
            enabled: request.enabled,
          )),
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }

  Widget _buildMemberCountTile({
    required IconData icon,
    required String label,
    required int count,
    VoidCallback? onTap,
  }) {
    return CustomListTile(
      leadingIcon: icon,
      label: label,
      description: count.toString(),
      onTap: onTap,
      trailing: onTap != null
          ? Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          : null,
    );
  }

  void _navigateToFilteredDomains({required int initialTab}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilteredDomainLists(
          groupId: _group.id,
          groupName: _group.name,
          initialTab: initialTab,
        ),
      ),
    );
  }

  void _navigateToFilteredAdlists({required int initialTab}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilteredAdlists(
          groupId: _group.id,
          groupName: _group.name,
          initialTab: initialTab,
        ),
      ),
    );
  }
}
