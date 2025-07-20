import 'package:flutter/material.dart';
import 'package:pi_hole_client/data2/services/gateways/v6/models/network/interfaces.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';

class StatisticsDetailScreen extends StatelessWidget {
  const StatisticsDetailScreen({
    required this.stats,
    super.key,
  });

  final InterfaceStats stats;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.statistics),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SectionLabel(label: locale.rxInfo),
            CustomListTile(
              leadingIcon: Icons.move_to_inbox,
              label: locale.rxBytes,
              description: '${stats.rxBytes.value} ${stats.rxBytes.unit}',
            ),
            CustomListTile(
              leadingIcon: Icons.move_to_inbox,
              label: locale.rxPackets,
              description: stats.rxPackets.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.download_rounded,
              label: locale.rxErrors,
              description: stats.rxErrors.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.download_rounded,
              label: locale.rxDropped,
              description: stats.rxDropped.toString(),
            ),
            SectionLabel(label: locale.txInfo),
            CustomListTile(
              leadingIcon: Icons.outbox_rounded,
              label: locale.txBytes,
              description: '${stats.txBytes.value} ${stats.txBytes.unit}',
            ),
            CustomListTile(
              leadingIcon: Icons.outbox_rounded,
              label: locale.txPackets,
              description: stats.txPackets.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.upload_rounded,
              label: locale.txErrors,
              description: stats.txErrors.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.upload_rounded,
              label: locale.txDropped,
              description: stats.txDropped.toString(),
            ),
            SectionLabel(label: locale.others),
            CustomListTile(
              leadingIcon: Icons.podcasts_rounded,
              label: locale.multicast,
              description: stats.multicast.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.sync_alt_rounded,
              label: locale.collisions,
              description: stats.collisions.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
