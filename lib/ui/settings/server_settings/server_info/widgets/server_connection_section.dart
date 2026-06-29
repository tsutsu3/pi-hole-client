import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/list_tile_title.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ServerConnectionSection extends StatelessWidget {
  const ServerConnectionSection({
    required this.serverAlias,
    required this.serverAddress,
    this.mfaEnabled,
    super.key,
  });

  final String serverAlias;
  final String serverAddress;
  final bool? mfaEnabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final locale = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.keep(child: SectionLabel(label: locale.connectingServer)),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(child: Icon(Icons.storage_outlined)),
          title: Skeleton.keep(
            child: listTileTitle(serverAlias, colorScheme: colorScheme),
          ),
          subtitle: Skeleton.keep(
            child: Text(
              serverAddress,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Icon(
            Icons.check_circle_rounded,
            color: Theme.of(context).extension<AppColors>()!.commonGreen,
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(child: Icon(Icons.lock_person_rounded)),
          title: Skeleton.keep(
            child: listTileTitleNoPadding(locale.mfa, colorScheme: colorScheme),
          ),
          trailing: Text(
            switch (mfaEnabled) {
              true => locale.enabled,
              false => locale.disabled,
              null => locale.notApplicable,
            },
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
