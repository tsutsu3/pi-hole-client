import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/api/v6/network/interfaces.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';

class AddressDetailScreen extends StatelessWidget {
  const AddressDetailScreen({
    required this.title,
    required this.address,
    super.key,
  });

  final String title;
  final InterfaceAddress address;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
