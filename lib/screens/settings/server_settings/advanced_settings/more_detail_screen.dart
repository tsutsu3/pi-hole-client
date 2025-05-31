import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/api/v6/network/interfaces.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';

class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({
    super.key,
    required this.interfaceData,
  });

  final InterfaceData interfaceData;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.moreDetails),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomListTile(
            leadingIcon: Icons.link_rounded,
            label: locale.carrier,
            description:
                interfaceData.carrier ? locale.connected : locale.disconnected,
          ),
          CustomListTile(
            leadingIcon: Icons.link_rounded,
            label: locale.carrierChanges,
            description: interfaceData.carrierChanges.toString(),
          ),
          CustomListTile(
            leadingIcon: Icons.link_rounded,
            label: locale.state,
            description: interfaceData.state.toUpperCase(),
          ),
          CustomListTile(
            leadingIcon: Icons.link_rounded,
            label: locale.parentDevice,
            description: interfaceData.parentDevName == null
                ? 'N/A'
                : '${interfaceData.parentDevName ?? 'N/A'} @ ${interfaceData.parentDevBusName ?? 'N/A'}',
          ),
          CustomListTile(
            leadingIcon: Icons.speed_rounded,
            label: locale.mtu,
            description:
                '${interfaceData.mtu} ${locale.bytes} (${locale.min}: ${interfaceData.minMtu} ${locale.bytes}, ${locale.max}: ${interfaceData.maxMtu} ${locale.bytes})',
          ),
          CustomListTile(
            leadingIcon: Icons.speed_rounded,
            label: locale.txQueueLength,
            description: interfaceData.txqlen.toString(),
          ),
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
          CustomListTile(
            leadingIcon: Icons.wifi_tethering_rounded,
            label: locale.promiscuityMode,
            description: interfaceData.promiscuity == 0
                ? locale.disabled
                : locale.enabled,
          ),
        ],
      ),
    );
  }
}
