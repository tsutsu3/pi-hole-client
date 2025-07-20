import 'package:flutter/material.dart';
import 'package:pi_hole_client/models/host.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/adaptive_trailing_text.dart';
import 'package:pi_hole_client/ui2/core/ui/list_tile_title.dart';
import 'package:pi_hole_client/ui2/core/ui/section_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HostInformationSection extends StatelessWidget {
  const HostInformationSection({required this.host, super.key});

  final HostInfo? host;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.keep(
          child: SectionLabel(label: AppLocalizations.of(context)!.host),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: Icon(Icons.connected_tv_rounded),
          ),
          title: Skeleton.keep(
            child: listTileTitle(
              AppLocalizations.of(context)!.host,
              colorScheme: colorScheme,
            ),
          ),
          trailing: AdaptiveTrailingText(
            text: host?.hostName ?? AppLocalizations.of(context)!.unknown,
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: Icon(Icons.tag_rounded),
          ),
          title: Skeleton.keep(
            child: listTileTitle(
              AppLocalizations.of(context)!.model,
              colorScheme: colorScheme,
            ),
          ),
          trailing: AdaptiveTrailingText(
            text: host?.model ?? AppLocalizations.of(context)!.unknown,
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Skeleton.keep(
              child: listTileTitle(
                AppLocalizations.of(context)!.moreDetails,
                colorScheme: colorScheme,
              ),
            ),
            children: [
              ListTile(
                dense: true,
                leading: const Icon(Icons.settings_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.system,
                  colorScheme: colorScheme,
                ),
                trailing: AdaptiveTrailingText(
                  text: host?.sysName ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.architecture_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.arch,
                  colorScheme: colorScheme,
                ),
                trailing: AdaptiveTrailingText(
                  text: host?.arch ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.system_update_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.release,
                  colorScheme: colorScheme,
                ),
                trailing: AdaptiveTrailingText(
                  text: host?.release ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.verified_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.version,
                  colorScheme: colorScheme,
                ),
                trailing: AdaptiveTrailingText(
                  text: host?.version ?? AppLocalizations.of(context)!.unknown,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
