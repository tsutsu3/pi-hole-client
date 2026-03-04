import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class StatisticsDetailScreen extends StatelessWidget {
  const StatisticsDetailScreen({required this.stats, super.key});

  final InterfaceStats stats;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(locale.statistics)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SectionLabel(label: locale.rxInfo),
            ListTile(
              leading: const Icon(Icons.move_to_inbox),
              title: Text(locale.rxBytes),
              subtitle: Text('${stats.rxBytes.value} ${stats.rxBytes.unit}'),
            ),
            ListTile(
              leading: const Icon(Icons.move_to_inbox),
              title: Text(locale.rxPackets),
              subtitle: Text(stats.rxPackets.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.download_rounded),
              title: Text(locale.rxErrors),
              subtitle: Text(stats.rxErrors.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.download_rounded),
              title: Text(locale.rxDropped),
              subtitle: Text(stats.rxDropped.toString()),
            ),
            SectionLabel(label: locale.txInfo),
            ListTile(
              leading: const Icon(Icons.outbox_rounded),
              title: Text(locale.txBytes),
              subtitle: Text('${stats.txBytes.value} ${stats.txBytes.unit}'),
            ),
            ListTile(
              leading: const Icon(Icons.outbox_rounded),
              title: Text(locale.txPackets),
              subtitle: Text(stats.txPackets.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.upload_rounded),
              title: Text(locale.txErrors),
              subtitle: Text(stats.txErrors.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.upload_rounded),
              title: Text(locale.txDropped),
              subtitle: Text(stats.txDropped.toString()),
            ),
            SectionLabel(label: locale.others),
            ListTile(
              leading: const Icon(Icons.podcasts_rounded),
              title: Text(locale.multicast),
              subtitle: Text(stats.multicast.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.sync_alt_rounded),
              title: Text(locale.collisions),
              subtitle: Text(stats.collisions.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
