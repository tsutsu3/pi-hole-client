import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/model/v6/network/interfaces.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/adaptive_trailing_text.dart';
import 'package:pi_hole_client/ui/core/ui/components/list_tile_title.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/address_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/more_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/statistics_detail_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        leading: Skeleton.keep(child: Icon(icon)),
        title: Skeleton.keep(
          child: listTileTitle(label, colorScheme: colorScheme),
        ),
        trailing: AdaptiveTrailingText(text: value),
      );
    }

    Widget buildAddressesSection() {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: const Skeleton.keep(child: Icon(Icons.location_on_rounded)),
          childrenPadding: const EdgeInsets.only(left: 16.0),
          title: Skeleton.keep(
            child: listTileTitle(locale.addresses, colorScheme: colorScheme),
          ),
          children: interface.addresses.map((address) {
            final title =
                '${locale.adlistAddress}: ${address.family.name} ${address.address} / ${address.prefixlen} (${detectAddressType(address.family.name)} ${address.addressType})';

            return ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: listTileTitle(title, colorScheme: colorScheme),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AddressDetailScreen(address: address, title: title),
                  ),
                );
              },
            );
          }).toList(),
        ),
      );
    }

    Widget buildStatisticsSection() {
      return ListTile(
        leading: const Skeleton.keep(child: Icon(Icons.area_chart_rounded)),
        title: Skeleton.keep(
          child: listTileTitle(locale.statistics, colorScheme: colorScheme),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StatisticsDetailScreen(stats: interface.stats),
            ),
          );
        },
      );
    }

    Widget buildDetailsSection() {
      return ListTile(
        leading: const Skeleton.keep(child: Icon(Icons.info_rounded)),
        title: Skeleton.keep(
          child: listTileTitle(locale.moreDetails, colorScheme: colorScheme),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MoreDetailsScreen(interfaceData: interface),
            ),
          );
        },
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
