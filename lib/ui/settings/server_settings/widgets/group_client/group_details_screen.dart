import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/formats.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/edit_group_modal.dart';
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
  late ServersProvider serversProvider;
  late ApiGateway? apiGateway;
  late GroupsProvider groupsProvider;
  late AppConfigProvider appConfigProvider;

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
    serversProvider = context.watch<ServersProvider>();
    groupsProvider = context.watch<GroupsProvider>();
    apiGateway = serversProvider.selectedApiGateway;
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
              onTap: () =>
                  onEditGroup(_group.copyWith(enabled: !_group.enabled)),
              trailing: Switch(
                value: _group.enabled,
                onChanged: (value) =>
                    onEditGroup(_group.copyWith(enabled: value)),
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
          ],
        ),
      ),
    );
  }

  Future<void> removeGroup(Group group) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    final result = await apiGateway?.removeGroup(name: group.name);

    process.close();

    if (!mounted) return;

    if (result?.result == APiResponseType.success) {
      await groupsProvider.loadGroups();
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
    } else if (result?.result == APiResponseType.notFound) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupNotExists,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupRemoveFailed,
      );
    }
  }

  Future<void> onEditGroup(Group group) async {
    final body = GroupRequest(
      name: group.name,
      comment: group.comment,
      enabled: group.enabled,
    );

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.groupUpdating);

    final result = await apiGateway?.updateGroup(name: _group.name, body: body);

    process.close();

    if (result?.result == APiResponseType.success) {
      await groupsProvider.loadGroups();

      final updatedGroup = result?.data?.groups.firstWhere(
        (g) => g.name == group.name,
        orElse: () => group,
      );

      setState(() {
        _group = updatedGroup ?? group;
      });

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.groupUpdated,
      );
    } else {
      if (!mounted) return;
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
          onConfirm: (request) => onEditGroup(
            _group.copyWith(
              name: request.name,
              comment: request.comment,
              enabled: request.enabled,
            ),
          ),
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditGroupModal(
          group: _group,
          onConfirm: (request) => onEditGroup(
            _group.copyWith(
              name: request.name,
              comment: request.comment,
              enabled: request.enabled,
            ),
          ),
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}
