import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';

class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({required this.interfaceData, super.key});

  final NetInterface interfaceData;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(locale.moreDetails)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SectionLabel(label: locale.connectionStatus),
          ListTile(
            leading: const Icon(Icons.link_rounded),
            title: Text(locale.carrier),
            subtitle: Text(
              interfaceData.carrier ? locale.connected : locale.disconnected,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dns_rounded),
            title: Text(locale.carrierChanges),
            subtitle: Text(interfaceData.carrierChanges.toString()),
          ),
          ListTile(
            leading: const Icon(Icons.lan_rounded),
            title: Text(locale.state),
            subtitle: Text(interfaceData.state.toUpperCase()),
          ),
          ListTile(
            leading: const Icon(Icons.visibility_rounded),
            title: Text(locale.promiscuityMode),
            subtitle: Text(
              interfaceData.promiscuity == 0 ? locale.disabled : locale.enabled,
            ),
          ),
          SectionLabel(label: locale.deviceConfig),
          ListTile(
            leading: const Icon(Icons.sync_alt_rounded),
            title: Text(locale.deviceParent),
            subtitle: Text(
              interfaceData.parentDevName == null
                  ? 'N/A'
                  : '${interfaceData.parentDevName ?? 'N/A'} @ ${interfaceData.parentDevBusName ?? 'N/A'}',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.compare_arrows_rounded),
            title: Text(locale.mtu),
            subtitle: Text(
              '${interfaceData.mtu} ${locale.bytes} (${locale.min}: ${interfaceData.minMtu} ${locale.bytes}, ${locale.max}: ${interfaceData.maxMtu} ${locale.bytes})',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.upload_file_rounded),
            title: Text(locale.txQueueLength),
            subtitle: Text(interfaceData.txqlen.toString()),
          ),
          SectionLabel(label: locale.networkAttributes),
          ListTile(
            leading: const Icon(Icons.speed_rounded),
            title: Text(locale.scheduler),
            subtitle: Text(interfaceData.qdisc ?? locale.unknown),
          ),
          ListTile(
            leading: const Icon(Icons.wifi_tethering_rounded),
            title: Text(locale.broadcast),
            subtitle: Text(interfaceData.broadcast),
          ),
        ],
      ),
    );
  }
}
