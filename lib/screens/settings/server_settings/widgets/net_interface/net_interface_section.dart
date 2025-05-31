import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/api/v6/network/interfaces.dart';
import 'package:pi_hole_client/widgets/adaptive_trailing_text.dart';
import 'package:pi_hole_client/widgets/list_tile_title.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class NetInterfaceSection extends StatelessWidget {
  const NetInterfaceSection(this.interface, {super.key});

  final InterfaceData interface;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final locale = AppLocalizations.of(context)!;

    String detectAddressType(String addressType) {
      switch (addressType) {
        case 'inet6':
          return 'IPv6';
        case 'inet':
          return 'IPv4';
        default:
          return locale.unknown;
      }
    }

    Widget buildDetailTile({
      required IconData icon,
      required String label,
      required String value,
    }) {
      return ListTile(
        dense: true,
        leading: Icon(icon),
        title: listTileTitle(label, colorScheme: colorScheme),
        trailing: AdaptiveTrailingText(text: value),
      );
    }

    Widget buildAddressesSection() {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: const Icon(Icons.location_on_rounded),
          childrenPadding: const EdgeInsets.only(left: 16.0),
          title: listTileTitle(locale.addresses, colorScheme: colorScheme),
          children: interface.addresses.map((address) {
            return ExpansionTile(
              childrenPadding: const EdgeInsets.only(left: 16.0),
              leading: const Icon(Icons.location_on_rounded),
              title: listTileTitle(
                '${locale.adlistAddress}: ${address.family.name} ${address.address} / ${address.prefixlen} (${detectAddressType(address.family.name)} ${address.addressType})',
                colorScheme: colorScheme,
              ),
              children: [
                buildDetailTile(
                  icon: Icons.location_on_outlined,
                  label: locale.local,
                  value: address.local ?? locale.unknown,
                ),
                buildDetailTile(
                  icon: Icons.location_on_outlined,
                  label: locale.broadcast,
                  value: address.broadcast ?? 'N/A',
                ),
                buildDetailTile(
                  icon: Icons.location_on_outlined,
                  label: locale.scope,
                  value: address.scope,
                ),
                buildDetailTile(
                  icon: Icons.location_on_outlined,
                  label: locale.flags,
                  value: address.flags.join(', '),
                ),
                buildDetailTile(
                  icon: Icons.access_time_outlined,
                  label: locale.preferredLifetime,
                  value: address.prefered == 4294967295
                      ? locale.forever
                      : address.prefered.toString(),
                ),
                buildDetailTile(
                  icon: Icons.access_time_outlined,
                  label: locale.validLifetime,
                  value: address.valid == 4294967295
                      ? locale.forever
                      : address.valid.toString(),
                ),
                buildDetailTile(
                  icon: Icons.access_time_outlined,
                  label: locale.created,
                  value: formatUnixTime(
                    address.cstamp.round(),
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
                buildDetailTile(
                  icon: Icons.access_time_outlined,
                  label: locale.lastUpdated,
                  value: formatUnixTime(
                    address.tstamp.round(),
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      );
    }

    Widget buildStatisticsSection() {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: const Icon(Icons.area_chart_rounded),
          childrenPadding: const EdgeInsets.only(left: 16.0),
          title: listTileTitle(locale.statistics, colorScheme: colorScheme),
          children: [
            buildDetailTile(
              icon: Icons.download,
              label: locale.rxBytes,
              value:
                  '${interface.stats.rxBytes.value} ${interface.stats.rxBytes.unit}',
            ),
            buildDetailTile(
              icon: Icons.download,
              label: locale.rxPackets,
              value: interface.stats.rxPackets.toString(),
            ),
            buildDetailTile(
              icon: Icons.download,
              label: locale.rxErrors,
              value: interface.stats.rxErrors.toString(),
            ),
            buildDetailTile(
              icon: Icons.download,
              label: locale.rxDropped,
              value: interface.stats.rxDropped.toString(),
            ),
            buildDetailTile(
              icon: Icons.upload,
              label: locale.txBytes,
              value:
                  '${interface.stats.txBytes.value} ${interface.stats.txBytes.unit}',
            ),
            buildDetailTile(
              icon: Icons.upload,
              label: locale.txPackets,
              value: interface.stats.txPackets.toString(),
            ),
            buildDetailTile(
              icon: Icons.upload,
              label: locale.txErrors,
              value: interface.stats.txErrors.toString(),
            ),
            buildDetailTile(
              icon: Icons.upload,
              label: locale.txDropped,
              value: interface.stats.txDropped.toString(),
            ),
            buildDetailTile(
              icon: Icons.podcasts_rounded,
              label: locale.multicast,
              value: interface.stats.multicast.toString(),
            ),
            buildDetailTile(
              icon: Icons.sync_alt_rounded,
              label: locale.collisions,
              value: interface.stats.collisions.toString(),
            ),
          ],
        ),
      );
    }

    Widget buildDetailsSection() {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: const Icon(Icons.info_rounded),
          childrenPadding: const EdgeInsets.only(left: 16.0),
          title: listTileTitle(locale.moreDetails, colorScheme: colorScheme),
          children: [
            buildDetailTile(
              icon: Icons.link_rounded,
              label: locale.carrier,
              value: interface.carrier ? locale.connected : locale.disconnected,
            ),
            buildDetailTile(
              icon: Icons.link_rounded,
              label: locale.carrierChanges,
              value: interface.carrierChanges.toString(),
            ),
            buildDetailTile(
              icon: Icons.link_rounded,
              label: locale.state,
              value: interface.state.toUpperCase(),
            ),
            buildDetailTile(
              icon: Icons.link_rounded,
              label: locale.parentDevice,
              value: interface.parentDevName == null
                  ? 'N/A'
                  : '${interface.parentDevName ?? 'N/A'} @ ${interface.parentDevBusName ?? 'N/A'}',
            ),
            buildDetailTile(
              icon: Icons.speed_rounded,
              label: locale.mtu,
              value:
                  '${interface.mtu} ${locale.bytes} (${locale.min}: ${interface.minMtu} ${locale.bytes}, ${locale.max}: ${interface.maxMtu} ${locale.bytes})',
            ),
            buildDetailTile(
              icon: Icons.speed_rounded,
              label: locale.txQueueLength,
              value: interface.txqlen.toString(),
            ),
            buildDetailTile(
              icon: Icons.speed_rounded,
              label: locale.scheduler,
              value: interface.qdisc ?? locale.unknown,
            ),
            buildDetailTile(
              icon: Icons.wifi_tethering_rounded,
              label: locale.broadcast,
              value: interface.broadcast,
            ),
            buildDetailTile(
              icon: Icons.wifi_tethering_rounded,
              label: locale.promiscuityMode,
              value:
                  interface.promiscuity == 0 ? locale.disabled : locale.enabled,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: '${interface.name} - ${interface.state.toUpperCase()}',
        ),
        buildDetailTile(
          icon: Icons.lan_rounded,
          label: locale.type,
          value: interface.type,
        ),
        buildDetailTile(
          icon: Icons.flag_rounded,
          label: locale.flags,
          value: interface.flags.join(', '),
        ),
        buildDetailTile(
          icon: Icons.tag_rounded,
          label: locale.hardwareAddress,
          value: interface.address,
        ),
        buildAddressesSection(),
        buildStatisticsSection(),
        buildDetailsSection(),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
