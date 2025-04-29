import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    List<String> getGroupNames() {
      final groupNames = <String>[];
      for (final group in _domain.groups) {
        groupNames.add(widget.groups[group]!);
      }
      return groupNames;
    }

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
              trailing: Switch(
                value: _domain.enabled == 1,
                onChanged: (value) {
                  // onEditDomain(
                  //   _domain
                  //       .copyWith(
                  //         enabled: value,
                  //       )
                  //       .toJson(),
                  // );
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
              // onTap: openGroupsModal,
            ),
            CustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: _domain.comment == ''
                  ? AppLocalizations.of(context)!.noComment
                  : _domain.comment,
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              // onTap: openCommentModal,
            ),
            CustomListTile(
              leadingIcon: Icons.schedule_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description:
                  formatTimestamp(widget.domain.dateAdded, 'yyyy-MM-dd'),
            ),
            CustomListTile(
              leadingIcon: Icons.update_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description:
                  formatTimestamp(widget.domain.dateModified, 'yyyy-MM-dd'),
            ),
          ],
        ),
      ),
    );
  }
}
