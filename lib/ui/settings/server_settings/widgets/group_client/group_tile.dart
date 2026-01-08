import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

class GroupTile extends StatelessWidget {
  const GroupTile({
    required this.group,
    required this.clientCount,
    required this.showGroupDetails,
    this.isGroupSelected,
    super.key,
  });

  final Group group;
  final int clientCount;
  final void Function(Group) showGroupDetails;
  final bool? isGroupSelected;

  @override
  Widget build(BuildContext context) {
    Widget statusIcon(bool enabled) {
      return Icon(
        enabled
            ? Icons.check_circle_outline_rounded
            : Icons.remove_circle_rounded,
        color: enabled
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).extension<AppColors>()!.queryGrey,
      );
    }

    final subtitleText =
        '${AppLocalizations.of(context)!.clients}: $clientCount';

    final Widget content = Row(
      children: [
        statusIcon(group.enabled),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitleText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).listTileTheme.textColor,
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Material(
          borderRadius: BorderRadius.circular(28),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () => showGroupDetails(group),
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 200),
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: isGroupSelected == true
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
              ),
              child: content,
            ),
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showGroupDetails(group),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: content,
          ),
        ),
      );
    }
  }
}
