import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/domains/widgets/edit_domain_modal.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/delete_modal.dart';
import 'package:provider/provider.dart';

class DomainDetailsScreen extends StatefulWidget {
  const DomainDetailsScreen({
    required this.domain,
    required this.remove,
    required this.groups,
    this.colors,
    super.key,
  });

  final Domain domain;
  final void Function(Domain) remove;
  final Map<int, String> groups;
  final AppColors? colors;

  @override
  State<DomainDetailsScreen> createState() => _DomainDetailsScreenState();
}

class _DomainDetailsScreenState extends State<DomainDetailsScreen> {
  late Domain _domain;
  late ServersProvider serversProvider;
  late ApiGateway? apiGateway;
  late DomainsListProvider domainsListProvider;
  late AppConfigProvider appConfigProvider;
  late bool isV5;

  @override
  void initState() {
    super.initState();
    _domain = widget.domain.copyWith();
  }

  @override
  void didUpdateWidget(covariant DomainDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.domain != widget.domain) {
      setState(() {
        _domain = widget.domain.copyWith();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigProvider = context.watch<AppConfigProvider>();
    serversProvider = context.watch<ServersProvider>();
    domainsListProvider = context.watch<DomainsListProvider>();
    apiGateway = serversProvider.selectedApiGateway;
    isV5 =
        serversProvider.selectedServer?.apiVersion == SupportedApiVersions.v5;
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
                title: AppLocalizations.of(context)!.deleteDomain,
                message: AppLocalizations.of(context)!.deleteDomainMessage,
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
            CustomListTile(
              leadingIcon: Icons.domain,
              label: AppLocalizations.of(context)!.domain,
              description: widget.domain.domain,
            ),
            CustomListTile(
              leadingIcon: Icons.category_rounded,
              label: AppLocalizations.of(context)!.type,
              description: getDomainType(widget.domain.type),
              color: widget.colors != null
                  ? convertColorFromNumber(widget.colors!, widget.domain.type)
                  : null,
            ),
            CustomListTile(
              leadingIcon: Icons.check,
              label: AppLocalizations.of(context)!.status,
              description: widget.domain.enabled == 1
                  ? AppLocalizations.of(context)!.enabled
                  : AppLocalizations.of(context)!.disabled,
              trailing: isV5
                  ? null
                  : Switch(
                      value: _domain.enabled == 1,
                      onChanged: (value) {
                        onEditDomain(
                          _domain
                              .copyWith(
                                enabled: value ? 1 : 0,
                              )
                              .toJson(),
                        );
                      },
                    ),
              onTap: isV5
                  ? null
                  : () {
                      onEditDomain(
                        _domain
                            .copyWith(
                              enabled: _domain.enabled == 1 ? 0 : 1,
                            )
                            .toJson(),
                      );
                    },
            ),
            if (!isV5)
              CustomListTile(
                leadingIcon: Icons.group_rounded,
                label: AppLocalizations.of(context)!.groups,
                description: getGroupNames().join(', '),
                trailing: isV5
                    ? null
                    : Icon(
                        Icons.edit_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                onTap: isV5 ? null : openGroupsModal,
              ),
            CustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: _domain.comment == '' || _domain.comment == null
                  ? AppLocalizations.of(context)!.noComment
                  : _domain.comment,
              trailing: isV5
                  ? null
                  : Icon(
                      Icons.edit_rounded,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              onTap: isV5 ? null : openCommentModal,
            ),
            CustomListTile(
              leadingIcon: Icons.event_available_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description:
                  formatTimestamp(_domain.dateAdded, kUnifiedDateFormat),
            ),
            CustomListTile(
              leadingIcon: Icons.edit_calendar_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description:
                  formatTimestamp(_domain.dateModified, kUnifiedDateFormat),
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

  Future<void> onEditDomain(Map<String, dynamic> value) async {
    final body = DomainRequest.fromJson(value);

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.updatingAdlist);

    final result = await apiGateway?.updateDomain(body: body);

    process.close();

    if (result?.result == APiResponseType.success) {
      await domainsListProvider.fetchDomainsList();

      setState(() {
        _domain = result!.data!.copyWith();
      });

      if (!mounted) return;

      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.domainUpdated,
      );
    } else {
      if (!mounted) return;

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.cannotEditDomain,
      );
    }
  }

  void openCommentModal() {
    final mediaQuery = MediaQuery.of(context);
    final isSmallLandscape = mediaQuery.size.width > mediaQuery.size.height &&
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
