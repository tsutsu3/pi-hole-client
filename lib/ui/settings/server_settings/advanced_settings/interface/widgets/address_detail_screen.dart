import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/utils/format.dart';

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
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 72),
              child: Text(
                title,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
              ListTile(
                leading: const Icon(Icons.location_on_rounded),
                title: Text(locale.local),
                subtitle: Text(address.local ?? locale.unknown),
              ),
              ListTile(
                leading: const Icon(Icons.location_on_rounded),
                title: Text(locale.broadcast),
                subtitle: Text(address.broadcast ?? 'N/A'),
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: Text(locale.scope),
                subtitle: Text(address.scope),
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: Text(locale.flags),
                subtitle: Text(address.flags.join(', ')),
              ),
              SectionLabel(label: locale.lifetimes),
              ListTile(
                leading: const Icon(Icons.access_time_outlined),
                title: Text(locale.preferredLifetime),
                subtitle: Text(
                  address.prefered == 4294967295
                      ? locale.forever
                      : address.prefered.toString(),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.access_time_outlined),
                title: Text(locale.validLifetime),
                subtitle: Text(
                  address.valid == 4294967295
                      ? locale.forever
                      : address.valid.toString(),
                ),
              ),
              SectionLabel(label: locale.timestamps),
              ListTile(
                leading: const Icon(Icons.event_available_rounded),
                title: Text(locale.created),
                subtitle: Text(
                  formatUnixTime(
                    address.cstamp.round(),
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.event_repeat_rounded),
                title: Text(locale.lastUpdated),
                subtitle: Text(
                  formatUnixTime(
                    address.tstamp.round(),
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
