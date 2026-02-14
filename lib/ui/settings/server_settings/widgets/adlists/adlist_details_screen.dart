import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/formats.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/edit_adlist_modal.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:provider/provider.dart';

class AdlistDetailsScreen extends StatefulWidget {
  const AdlistDetailsScreen({
    required this.adlist,
    required this.remove,
    required this.groups,
    this.colors,
    this.onUpdated,
    super.key,
  });

  final Adlist adlist;
  final void Function(Adlist) remove;
  final void Function(Adlist)? onUpdated;
  final Map<int, String> groups;
  final AppColors? colors;

  @override
  State<AdlistDetailsScreen> createState() =>
      _AdlistDetailsScreenState();
}

class _AdlistDetailsScreenState extends State<AdlistDetailsScreen> {
  late Adlist _adlist;

  @override
  void initState() {
    super.initState();
    _adlist = widget.adlist;
  }

  @override
  void didUpdateWidget(covariant AdlistDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.adlist != widget.adlist) {
      setState(() {
        _adlist = widget.adlist;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeLabel = _adlist.type == ListType.block ? 'block' : 'allow';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.adlistDetails),
        actions: [
          IconButton(
            onPressed: () => openUrl(_adlist.address),
            icon: const Icon(Icons.travel_explore_rounded),
            tooltip: AppLocalizations.of(context)!.adlistsSearchOnline,
          ),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.adlistDelete,
                message: AppLocalizations.of(context)!.adlistDeleteMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  widget.remove(_adlist);
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
            SectionLabel(label: AppLocalizations.of(context)!.adlistSettings),
            CustomListTile(
              leadingIcon: Icons.public_rounded,
              label: AppLocalizations.of(context)!.adlistAddress,
              description: _adlist.address,
            ),
            CustomListTile(
              leadingIcon: Icons.category_rounded,
              label: AppLocalizations.of(context)!.type,
              description: typeLabel,
              color: _adlist.type == ListType.block
                  ? Theme.of(context).extension<AppColors>()!.commonRed
                  : Theme.of(context).extension<AppColors>()!.commonGreen,
            ),
            CustomListTile(
              leadingIcon: Icons.check_rounded,
              label: AppLocalizations.of(context)!.status,
              description: _adlist.enabled
                  ? AppLocalizations.of(context)!.enabled
                  : AppLocalizations.of(context)!.disabled,
              onTap: () {
                onEditAdlist(_adlist.copyWith(enabled: !_adlist.enabled));
              },
              trailing: Switch(
                value: _adlist.enabled,
                onChanged: (value) {
                  onEditAdlist(_adlist.copyWith(enabled: value));
                },
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.group_rounded,
              label: AppLocalizations.of(context)!.groups,
              description: getGroupNames().join(', '),
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openGroupsModal,
            ),
            CustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: _adlist.comment == null || _adlist.comment!.isEmpty
                  ? AppLocalizations.of(context)!.noComment
                  : _adlist.comment,
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openCommentModal,
            ),
            SectionLabel(label: AppLocalizations.of(context)!.adlistInfo),
            CustomListTile(
              leadingIcon: Icons.label_outline_rounded,
              label: AppLocalizations.of(context)!.id,
              description: _adlist.id.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.monitor_heart_outlined,
              label: AppLocalizations.of(context)!.adlistStatus,
              description: getAdlistStatusType(
                _adlist.status.index,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.domain_add_rounded,
              label: AppLocalizations.of(context)!.domains,
              description: _adlist.number.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.domain_disabled_rounded,
              label: AppLocalizations.of(context)!.domainsInvalid,
              description: _adlist.invalidDomains.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.event_available_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description: formatTimestamp(
                _adlist.dateAdded,
                kUnifiedDateTimeFormat,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.edit_calendar_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description: formatTimestamp(
                _adlist.dateModified,
                kUnifiedDateTimeFormat,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.event_repeat_rounded,
              label: AppLocalizations.of(context)!.dateUpdated,
              description: formatTimestamp(
                _adlist.dateUpdated,
                kUnifiedDateTimeFormat,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getGroupNames() {
    final groupNames = <String>[];
    for (final group in _adlist.groups) {
      final name = widget.groups[group];
      if (name != null) groupNames.add(name);
    }
    return groupNames;
  }

  Future<void> onEditAdlist(Adlist updated) async {
    final viewModel = context.read<AdlistsViewModel>();
    final appConfigProvider = context.read<AppConfigProvider>();

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.adlistUpdating);

    try {
      await viewModel.updateAdlist.runAsync(updated);

      if (!mounted) return;
      process.close();

      setState(() {
        _adlist = updated;
      });
      widget.onUpdated?.call(_adlist);

      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistUpdated,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistUpdateFailed,
      );
    }
  }

  void openCommentModal() {
    final mediaQuery = MediaQuery.of(context);
    final isSmallLandscape =
        mediaQuery.size.width > mediaQuery.size.height &&
        mediaQuery.size.height < ResponsiveConstants.medium;

    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useSafeArea: !isSmallLandscape,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (ctx) => EditAdlistModal(
          adlist: _adlist,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditAdlist,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditAdlistModal(
          adlist: _adlist,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditAdlist,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }

  void openGroupsModal() {
    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (ctx) => EditAdlistModal(
          adlist: _adlist,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditAdlist,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditAdlistModal(
          adlist: _adlist,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditAdlist,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}
