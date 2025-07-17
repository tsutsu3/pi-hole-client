import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/devices.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/delete_modal.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class NetworkDetailScreen extends StatelessWidget {
  const NetworkDetailScreen({
    required this.device,
    required this.onDelete,
    super.key,
  });

  final DeviceInfo device;
  final void Function(DeviceInfo) onDelete;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final isUnknown =
        device.lastQuery == DateTime.fromMillisecondsSinceEpoch(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.device),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.deleteDevice,
                message: AppLocalizations.of(context)!.deleteDeviceMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  onDelete(device);
                },
              ),
            ),
            icon: const Icon(Icons.delete_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionLabel(label: locale.deviceInfo),
              CustomListTile(
                leadingIcon: Icons.memory_rounded,
                label: locale.macAddress,
                description: device.hwaddr,
              ),
              CustomListTile(
                leadingIcon: Icons.business_rounded,
                label: locale.vendor,
                description: device.macVendor == '' || device.macVendor == null
                    ? locale.unknown
                    : device.macVendor!,
              ),
              CustomListTile(
                leadingIcon: Icons.device_hub_rounded,
                label: locale.interface,
                description: device.interface,
              ),
              CustomListTile(
                leadingIcon: Icons.confirmation_number_rounded,
                label: locale.id,
                description: device.id.toString(),
              ),
              const SizedBox(height: 16),
              SectionLabel(label: locale.activity),
              CustomListTile(
                leadingIcon: Icons.query_stats_rounded,
                label: locale.lastQuery,
                description: isUnknown
                    ? locale.unknown
                    : '${formatTimestamp(device.lastQuery, kUnifiedDateTimeLogFormat)} '
                        '(${locale.timeHoursAgo(DateTime.now().difference(device.lastQuery).inHours)})',
              ),
              CustomListTile(
                leadingIcon: Icons.bar_chart_rounded,
                label: locale.queryCount,
                description: device.numQueries.toString(),
              ),
              CustomListTile(
                leadingIcon: Icons.calendar_today_rounded,
                label: locale.firstSeen,
                description:
                    device.firstSeen == DateTime.fromMillisecondsSinceEpoch(0)
                        ? locale.never
                        : formatTimestamp(
                            device.firstSeen,
                            kUnifiedDateTimeLogFormat,
                          ),
              ),
              const SizedBox(height: 16),
              SectionLabel(label: locale.ipAddresses),
              Column(
                children: device.ips.map((ip) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: CustomListTile(
                            leadingIcon: Icons.location_on_outlined,
                            label: ip.ip,
                            description: ip.name ?? locale.unknown,
                          ),
                          initiallyExpanded: device.ips.length == 1,
                          tilePadding: const EdgeInsets.only(right: 16),
                          childrenPadding: const EdgeInsets.only(left: 16.0),
                          children: [
                            CustomListTile(
                              leadingIcon: Icons.language_rounded,
                              label: locale.ipAddress,
                              description: ip.ip,
                            ),
                            CustomListTile(
                              leadingIcon: Icons.label_rounded,
                              label: locale.hostname,
                              description: ip.name ?? locale.unknown,
                            ),
                            CustomListTile(
                              leadingIcon: Icons.access_time_rounded,
                              label: locale.lastSeen,
                              description: formatTimestamp(
                                ip.lastSeen,
                                kUnifiedDateTimeLogFormat,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
