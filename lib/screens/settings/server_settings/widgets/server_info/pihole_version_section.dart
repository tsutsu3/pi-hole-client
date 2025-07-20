import 'package:flutter/material.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/info_trailing.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/list_tile_title.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui2/core/ui/icons/pihole_icon.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PiholeVersionSection extends StatelessWidget {
  const PiholeVersionSection({required this.version, super.key});

  final dynamic version;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.keep(
          child:
              SectionLabel(label: AppLocalizations.of(context)!.piholeVersion),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: PiholeIcon(),
          ),
          title: Skeleton.keep(
            child: listTileTitleNoPadding('Core', colorScheme: colorScheme),
          ),
          subtitle: Text('${version?.core.local.branch ?? '-'}'),
          trailing: InfoTrailing(
            isUpdate: version?.core.canUpdate,
            text: version?.core.local.version ?? '-',
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: PiholeIcon(),
          ),
          title: Skeleton.keep(
            child: listTileTitleNoPadding('FTL', colorScheme: colorScheme),
          ),
          subtitle: Text('${version?.ftl.local.branch ?? '-'}'),
          trailing: InfoTrailing(
            isUpdate: version?.ftl.canUpdate,
            text: version?.ftl.local.version ?? '-',
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: PiholeIcon(),
          ),
          title: Skeleton.keep(
            child: listTileTitleNoPadding('Web', colorScheme: colorScheme),
          ),
          subtitle: Text('${version?.web.local.branch ?? '-'}'),
          trailing: InfoTrailing(
            isUpdate: version?.web.canUpdate,
            text: version?.web.local.version ?? '-',
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: PiholeIcon(),
          ),
          title: Skeleton.keep(
            child: listTileTitleNoPadding('Docker', colorScheme: colorScheme),
          ),
          subtitle: const Skeleton.replace(child: Text('-')),
          trailing: version?.docker.local.version.isNotEmpty
              ? InfoTrailing(
                  isUpdate: version?.docker.canUpdate,
                  text: version?.docker.local.version ?? '-',
                )
              : Skeleton.replace(
                  replacement: const InfoTrailing(
                    isUpdate: false,
                    text: '',
                  ),
                  child: Text(
                    version?.docker.local.version ?? '-',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
