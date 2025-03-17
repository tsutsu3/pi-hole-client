import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/adaptive_trailing_text.dart';
import 'package:pi_hole_client/widgets/list_tile_title.dart';
import 'package:pi_hole_client/widgets/pihole_icon.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class PiholeVersionSection extends StatelessWidget {
  const PiholeVersionSection({required this.version, super.key});

  final dynamic version;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.piholeVersion),
        ListTile(
          dense: true,
          leading: const PiholeIcon(),
          title: listTileTitleNoPadding('Core', colorScheme: colorScheme),
          subtitle: Text('${version?.core.local.branch ?? '-'}'),
          trailing:
              AdaptiveTrailingText(text: version?.core.local.version ?? '-'),
        ),
        ListTile(
          dense: true,
          leading: const PiholeIcon(),
          title: listTileTitleNoPadding('FTL', colorScheme: colorScheme),
          subtitle: Text('${version?.ftl.local.branch ?? '-'}'),
          trailing:
              AdaptiveTrailingText(text: version?.ftl.local.version ?? '-'),
        ),
        ListTile(
          dense: true,
          leading: const PiholeIcon(),
          title: listTileTitleNoPadding('Web', colorScheme: colorScheme),
          subtitle: Text('${version?.web.local.branch ?? '-'}'),
          trailing:
              AdaptiveTrailingText(text: version?.web.local.version ?? '-'),
        ),
        ListTile(
          dense: true,
          leading: const PiholeIcon(),
          title: listTileTitleNoPadding('Docker', colorScheme: colorScheme),
          subtitle: const Text('-'),
          trailing:
              AdaptiveTrailingText(text: version?.docker.local.version ?? '-'),
        ),
      ],
    );
  }
}
