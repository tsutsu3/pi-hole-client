import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/domains/delete_domain_modal.dart';
import 'package:pi_hole_client/screens/domains/domain_comment_modal.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class DomainDetailsScreen extends StatelessWidget {
  const DomainDetailsScreen({
    required this.domain,
    required this.remove,
    super.key,
    this.colors,
  });

  final Domain domain; // useonly id
  final void Function(Domain) remove;
  final AppColors? colors;

  Widget actionCustomListTile({
    required IconData leadingIcon,
    required String label,
    required String? description,
    required GestureTapCallback? onTap,
    Color? color,
    Widget? trailing,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: CustomListTile(
          leadingIcon: leadingIcon,
          label: label,
          description: description,
          color: color,
          trailing: trailing,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final domainProvider = Provider.of<DomainsListProvider>(context);
    final serverProvider = Provider.of<ServersProvider>(context, listen: false);
    final apiGateway = serverProvider.selectedApiGateway;
    var newDomain = domainProvider.getDomainById(domain.id);

    if (newDomain == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.domainDetails),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              ),
              const SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)!.domainNotExists,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.domainDetails),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => DeleteDomainModal(
                onConfirm: () {
                  Navigator.maybePop(context);
                  remove(domain);
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
              description: newDomain.domain,
            ),
            CustomListTile(
              leadingIcon: Icons.category_rounded,
              label: AppLocalizations.of(context)!.type,
              description: getDomainType(newDomain.type),
              color: colors != null
                  ? convertColorFromNumber(colors!, newDomain.type)
                  : null,
            ),
            CustomListTile(
              leadingIcon: Icons.schedule_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description: formatTimestamp(newDomain.dateAdded, 'yyyy-MM-dd'),
            ),
            CustomListTile(
              leadingIcon: Icons.update_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description:
                  formatTimestamp(newDomain.dateModified, 'yyyy-MM-dd'),
            ),
            CustomListTile(
              leadingIcon: Icons.check,
              label: AppLocalizations.of(context)!.status,
              description: newDomain.enabled == 1
                  ? AppLocalizations.of(context)!.enabled
                  : AppLocalizations.of(context)!.disabled,
            ),
            // Comment
            actionCustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: newDomain.comment == '' || newDomain.comment == null
                  ? AppLocalizations.of(context)!.noComment
                  : newDomain.comment,
              onTap: () async {
                final newComment = await showModal<String>(
                  context: context,
                  builder: (context) => DomainCommentModal(
                    domain: newDomain!,
                    readonly:
                        apiGateway!.server.apiVersion == 'v5' ? true : false,
                  ),
                );

                if (newComment != null && newComment != newDomain!.comment) {
                  if (context.mounted) {
                    newDomain = newDomain!.copyWith(comment: newComment);
                    final resp = await apiGateway!.updateDomain(newDomain!);
                    if (resp.result == APiResponseType.success) {
                      domainProvider.updateDomain(newDomain!);
                    }
                  }
                }
              },
              trailing: Icon(
                Icons.open_in_new_rounded,
                size: 20,
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant
                    .withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
