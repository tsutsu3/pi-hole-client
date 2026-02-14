import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/helpers.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/models.dart';

class AdlistResultsList extends StatelessWidget {
  const AdlistResultsList({
    required this.results,
    required this.onTap,
    super.key,
  });

  final List<AdlistSearchGroup> results;
  final ValueChanged<Adlist> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: results.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final group = results[index];
        return AdlistResultCard(
          group: group,
          onTap: () => onTap(group.adlist),
        );
      },
    );
  }
}

class AdlistResultCard extends StatelessWidget {
  const AdlistResultCard({
    required this.group,
    required this.onTap,
    super.key,
  });

  final AdlistSearchGroup group;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final adlist = group.adlist;
    final listType = adlist.type == ListType.allow
        ? AppLocalizations.of(context)!.allowList
        : AppLocalizations.of(context)!.blockList;
    final enabledLabel = adlist.enabled
        ? AppLocalizations.of(context)!.enabled
        : AppLocalizations.of(context)!.disabled;
    final appColors = Theme.of(context).extension<AppColors>()!;
    final listBadgeColor = adlist.type == ListType.allow
        ? appColors.commonGreen
        : appColors.commonRed;
    final enabledBadgeColor = adlist.enabled
        ? Theme.of(context).colorScheme.primary
        : appColors.queryGrey;
    final listBadgeBackground = listBadgeColor?.withAlpha(38);
    final enabledBadgeBackground = adlist.enabled
        ? Theme.of(context).colorScheme.primaryContainer
        : appColors.queryGrey?.withAlpha(38);
    final groupCount = adlist.groups.length;
    final groupLabel = groupCount == 1
        ? AppLocalizations.of(context)!.groupSettings
        : AppLocalizations.of(context)!.groups;
    final comment = (adlist.comment ?? '').trim();

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                adlist.address,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Tag(
                    label: listType,
                    icon: Icons.shield_rounded,
                    backgroundColor: listBadgeBackground,
                    foregroundColor: listBadgeColor,
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    label: enabledLabel,
                    icon: adlist.enabled
                        ? Icons.check_circle_outline_rounded
                        : Icons.remove_circle_outline_rounded,
                    backgroundColor: enabledBadgeBackground,
                    foregroundColor: enabledBadgeColor,
                  ),
                  const SizedBox(width: 8),
                  Tag(
                    label: '$groupCount $groupLabel',
                    icon: Icons.group_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              IconMetaRow(
                icon: Icons.event_repeat_rounded,
                text:
                    '${formatTimestamp(adlist.dateUpdated)} (${adlist.number} ${AppLocalizations.of(context)!.domains.toLowerCase()})',
              ),
              const SizedBox(height: 8),
              IconMetaRow(
                icon: Icons.comment_rounded,
                text: comment.isNotEmpty
                    ? comment
                    : AppLocalizations.of(context)!.noComment,
              ),
              const SizedBox(height: 6),
              ExpansionTile(
                key: PageStorageKey<String>(adlist.address),
                title: Text(AppLocalizations.of(context)!.matchingEntries),
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(left: 8, right: 8),
                children: [
                  MatchingList(
                    matches: group.matchingDomains,
                    storageKey: PageStorageKey<String>(
                      'matching-${adlist.id}',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconMetaRow extends StatelessWidget {
  const IconMetaRow({required this.icon, required this.text, super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({
    required this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ?? Theme.of(context).colorScheme.primaryContainer;
    final fgColor = foregroundColor ?? Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 14, color: fgColor),
          if (icon != null) const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MatchingList extends StatelessWidget {
  const MatchingList({required this.matches, this.storageKey, super.key});

  final List<String> matches;
  final PageStorageKey<String>? storageKey;

  @override
  Widget build(BuildContext context) {
    const itemHeight = 24.0;
    final visibleItems = min(10, matches.length);
    return SizedBox(
      height: itemHeight * visibleItems,
      child: ListView.builder(
        key: storageKey,
        primary: false,
        itemCount: matches.length,
        itemExtent: itemHeight,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final domain = matches[index];
          return Row(
            children: [
              const Icon(Icons.circle, size: 6),
              const SizedBox(width: 8),
              Expanded(child: Text(domain)),
            ],
          );
        },
      ),
    );
  }
}
