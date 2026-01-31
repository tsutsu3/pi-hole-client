import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/model/v6/network/interfaces.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({required this.interfaceData, super.key});

  final InterfaceData interfaceData;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(locale.moreDetails)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SectionLabel(label: locale.connectionStatus),
          CustomListTile(
            leadingIcon: Icons.link_rounded,
            label: locale.carrier,
            description: interfaceData.carrier
                ? locale.connected
                : locale.disconnected,
          ),
          CustomListTile(
            leadingIcon: Icons.dns_rounded,
            label: locale.carrierChanges,
            description: interfaceData.carrierChanges.toString(),
          ),
          CustomListTile(
            leadingIcon: Icons.lan_rounded,
            label: locale.state,
            description: interfaceData.state.toUpperCase(),
          ),
          CustomListTile(
            leadingIcon: Icons.visibility_rounded,
            label: locale.promiscuityMode,
            description: interfaceData.promiscuity == 0
                ? locale.disabled
                : locale.enabled,
          ),
          SectionLabel(label: locale.deviceConfig),
          CustomListTile(
            leadingIcon: Icons.sync_alt_rounded,
            label: locale.deviceParent,
            description: interfaceData.parentDevName == null
                ? 'N/A'
                : '${interfaceData.parentDevName ?? 'N/A'} @ ${interfaceData.parentDevBusName ?? 'N/A'}',
          ),
          CustomListTile(
            leadingIcon: Icons.compare_arrows_rounded,
            label: locale.mtu,
            description:
                '${interfaceData.mtu} ${locale.bytes} (${locale.min}: ${interfaceData.minMtu} ${locale.bytes}, ${locale.max}: ${interfaceData.maxMtu} ${locale.bytes})',
          ),
          CustomListTile(
            leadingIcon: Icons.upload_file_rounded,
            label: locale.txQueueLength,
            description: interfaceData.txqlen.toString(),
          ),
          SectionLabel(label: locale.networkAttributes),
          CustomListTile(
            leadingIcon: Icons.speed_rounded,
            label: locale.scheduler,
            description: interfaceData.qdisc ?? locale.unknown,
          ),
          CustomListTile(
            leadingIcon: Icons.wifi_tethering_rounded,
            label: locale.broadcast,
            description: interfaceData.broadcast,
          ),
        ],
      ),
    );
  }
}
