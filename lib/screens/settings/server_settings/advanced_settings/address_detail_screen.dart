import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/api/v6/network/interfaces.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class AddressDetailScreen extends StatelessWidget {
  const AddressDetailScreen({
    required this.address,
    required this.title,
    super.key,
  });

  final InterfaceAddress address;
  final String title;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.adlistAddress),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(12),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionLabel(label: locale.addressDetails),
              CustomListTile(
                leadingIcon: Icons.location_on_rounded,
                label: locale.local,
                description: address.local ?? locale.unknown,
              ),
              CustomListTile(
                leadingIcon: Icons.location_on_rounded,
                label: locale.broadcast,
                description: address.broadcast ?? 'N/A',
              ),
              CustomListTile(
                leadingIcon: Icons.location_on_outlined,
                label: locale.scope,
                description: address.scope,
              ),
              CustomListTile(
                leadingIcon: Icons.location_on_outlined,
                label: locale.flags,
                description: address.flags.join(', '),
              ),
              SectionLabel(label: locale.lifetimes),
              CustomListTile(
                leadingIcon: Icons.access_time_outlined,
                label: locale.preferredLifetime,
                description: address.prefered == 4294967295
                    ? locale.forever
                    : address.prefered.toString(),
              ),
              CustomListTile(
                leadingIcon: Icons.access_time_outlined,
                label: locale.validLifetime,
                description: address.valid == 4294967295
                    ? locale.forever
                    : address.valid.toString(),
              ),
              SectionLabel(label: locale.timestamps),
              CustomListTile(
                leadingIcon: Icons.event_available_rounded,
                label: locale.created,
                description: formatUnixTime(
                  address.cstamp.round(),
                  kUnifiedDateTimeLogFormat,
                ),
              ),
              CustomListTile(
                leadingIcon: Icons.event_repeat_rounded,
                label: locale.lastUpdated,
                description: formatUnixTime(
                  address.tstamp.round(),
                  kUnifiedDateTimeLogFormat,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
