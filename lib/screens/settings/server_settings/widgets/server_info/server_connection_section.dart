import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/widgets/list_tile_title.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ServerConnectionSection extends StatelessWidget {
  const ServerConnectionSection({required this.server, super.key});

  final Server? server;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.keep(
          child: SectionLabel(
            label: AppLocalizations.of(context)!.connectingServer,
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: Icon(Icons.storage_outlined),
          ),
          title: Skeleton.keep(
            child: listTileTitle(
              server?.alias ?? AppLocalizations.of(context)!.unknown,
              colorScheme: colorScheme,
            ),
          ),
          subtitle: Skeleton.keep(
            child: Text(
              server?.address ?? AppLocalizations.of(context)!.unknown,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Icon(
            Icons.check_circle_rounded,
            color: Theme.of(context).extension<AppColors>()!.commonGreen,
          ),
        ),
      ],
    );
  }
}
