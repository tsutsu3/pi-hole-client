import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/api_versions.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/color_helpers.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/edit_domain_modal.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';

class DomainDetailsScreen extends StatefulWidget {
  const DomainDetailsScreen({
    required this.domain,
    required this.remove,
    required this.groups,
    this.colors,
    this.onUpdated,
    super.key,
  });

  final Domain domain;
  final void Function(Domain) remove;
  final Map<int, String> groups;
  final AppColors? colors;
  final void Function(Domain)? onUpdated;

  @override
  State<DomainDetailsScreen> createState() => _DomainDetailsScreenState();
}

class _DomainDetailsScreenState extends State<DomainDetailsScreen> {
  late Domain _domain;
  late ServersViewModel serversViewModel;
  late DomainsViewModel viewModel;
  late AppConfigViewModel appConfigViewModel;
  late bool isV5;

  @override
  void initState() {
    super.initState();
    _domain = widget.domain;
  }

  @override
  void didUpdateWidget(covariant DomainDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.domain != widget.domain) {
      setState(() {
        _domain = widget.domain;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigViewModel = context.watch<AppConfigViewModel>();
    serversViewModel = context.watch<ServersViewModel>();
    viewModel = context.watch<DomainsViewModel>();
    isV5 =
        serversViewModel.selectedServer?.apiVersion == SupportedApiVersions.v5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.domainDetails),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.domainDelete,
                message: AppLocalizations.of(context)!.domainDeleteMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  widget.remove(widget.domain);
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
          children: [
            ListTile(
              leading: const Icon(Icons.domain),
              title: Text(AppLocalizations.of(context)!.domain),
              subtitle: Text(_domain.name),
            ),
            ListTile(
              leading: const Icon(Icons.category_rounded),
              title: Text(AppLocalizations.of(context)!.type),
              subtitle: Text(getDomainTypeLabel(_domain.type, _domain.kind)),
              subtitleTextStyle: widget.colors != null
                  ? TextStyle(
                      color: domainTypeColor(
                        widget.colors!,
                        _domain.type,
                        _domain.kind,
                      ),
                    )
                  : null,
            ),
            ListTile(
              leading: const Icon(Icons.check),
              title: Text(AppLocalizations.of(context)!.status),
              subtitle: Text(
                _domain.enabled
                    ? AppLocalizations.of(context)!.enabled
                    : AppLocalizations.of(context)!.disabled,
              ),
              trailing: isV5
                  ? null
                  : Switch(
                      value: _domain.enabled,
                      onChanged: (value) {
                        onEditDomain(_domain.copyWith(enabled: value));
                      },
                    ),
              onTap: isV5
                  ? null
                  : () {
                      onEditDomain(_domain.copyWith(enabled: !_domain.enabled));
                    },
            ),
            if (!isV5)
              ListTile(
                leading: const Icon(Icons.group_rounded),
                title: Text(AppLocalizations.of(context)!.groups),
                subtitle: Text(getGroupNames().join(', ')),
                trailing: Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: openGroupsModal,
              ),
            ListTile(
              leading: const Icon(Icons.comment_rounded),
              title: Text(AppLocalizations.of(context)!.comment),
              subtitle: Text(
                _domain.comment == '' || _domain.comment == null
                    ? AppLocalizations.of(context)!.noComment
                    : _domain.comment!,
              ),
              trailing: isV5
                  ? null
                  : Icon(
                      Icons.edit_rounded,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              onTap: isV5 ? null : openCommentModal,
            ),
            ListTile(
              leading: const Icon(Icons.event_available_rounded),
              title: Text(AppLocalizations.of(context)!.dateAdded),
              subtitle: Text(
                formatTimestamp(_domain.dateAdded, kUnifiedDateFormat),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit_calendar_rounded),
              title: Text(AppLocalizations.of(context)!.dateModified),
              subtitle: Text(
                formatTimestamp(_domain.dateModified, kUnifiedDateFormat),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getGroupNames() {
    final groupNames = <String>[];
    for (final group in _domain.groups) {
      groupNames.add(widget.groups[group]!);
    }
    return groupNames;
  }

  Future<void> onEditDomain(Domain updated) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.updating);

    try {
      await viewModel.updateDomain.runAsync(updated);
      if (!mounted) return;
      process.close();

      setState(() {
        _domain = updated;
      });
      widget.onUpdated?.call(_domain);

      showSuccessSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context)!.domainUpdated,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();

      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context)!.domainUpdateFailed,
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
        builder: (ctx) => EditDomainModal(
          domain: _domain,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditDomain,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditDomainModal(
          domain: _domain,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditDomain,
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
        builder: (ctx) => EditDomainModal(
          domain: _domain,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditDomain,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditDomainModal(
          domain: _domain,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditDomain,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}
