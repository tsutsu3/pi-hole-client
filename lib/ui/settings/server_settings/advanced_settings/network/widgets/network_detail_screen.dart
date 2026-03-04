import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/utils/format.dart';

class NetworkDetailScreen extends StatelessWidget {
  const NetworkDetailScreen({
    required this.device,
    required this.onDelete,
    super.key,
  });

  final Device device;
  final void Function(Device) onDelete;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

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
                title: AppLocalizations.of(context)!.deviceDelete,
                message: AppLocalizations.of(context)!.deviceDeleteMessage,
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
              ListTile(
                leading: const Icon(Icons.memory_rounded),
                title: Text(locale.macAddress),
                subtitle: Text(device.hwaddr),
              ),
              ListTile(
                leading: const Icon(Icons.business_rounded),
                title: Text(locale.vendor),
                subtitle: Text(
                  device.macVendor == '' || device.macVendor == null
                      ? locale.unknown
                      : device.macVendor!,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.device_hub_rounded),
                title: Text(locale.interface),
                subtitle: Text(device.interface),
              ),
              ListTile(
                leading: const Icon(Icons.confirmation_number_rounded),
                title: Text(locale.id),
                subtitle: Text(device.id.toString()),
              ),
              const SizedBox(height: 16),
              SectionLabel(label: locale.activity),
              ListTile(
                leading: const Icon(Icons.query_stats_rounded),
                title: Text(locale.lastQuery),
                subtitle: Text(_buildLastQueryValue(locale)),
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart_rounded),
                title: Text(locale.queryCount),
                subtitle: Text(device.numQueries.toString()),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today_rounded),
                title: Text(locale.firstSeen),
                subtitle: Text(
                  device.firstSeen == DateTime.fromMillisecondsSinceEpoch(0)
                      ? locale.never
                      : formatTimestamp(
                          device.firstSeen,
                          kUnifiedDateTimeLogFormat,
                        ),
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
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: ListTile(
                            leading: const Icon(Icons.location_on_outlined),
                            title: Text(ip.ip),
                            subtitle: Text(ip.name ?? locale.unknown),
                          ),
                          initiallyExpanded: device.ips.length == 1,
                          tilePadding: const EdgeInsets.only(right: 16),
                          childrenPadding: const EdgeInsets.only(left: 16.0),
                          children: [
                            ListTile(
                              leading: const Icon(Icons.language_rounded),
                              title: Text(locale.ipAddress),
                              subtitle: Text(ip.ip),
                            ),
                            ListTile(
                              leading: const Icon(Icons.label_rounded),
                              title: Text(locale.hostname),
                              subtitle: Text(ip.name ?? locale.unknown),
                            ),
                            ListTile(
                              leading: const Icon(Icons.access_time_rounded),
                              title: Text(locale.lastSeen),
                              subtitle: Text(
                                formatTimestamp(
                                  ip.lastSeen,
                                  kUnifiedDateTimeLogFormat,
                                ),
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

  String _buildLastQueryValue(AppLocalizations locale) {
    final isUnknown = device.lastQuery.millisecondsSinceEpoch == 0;
    if (isUnknown) {
      return locale.unknown;
    }

    final timestamp = formatTimestamp(
      device.lastQuery,
      kUnifiedDateTimeLogFormat,
    );
    final hoursAgo =
        (DateTime.now().difference(device.lastQuery).inMinutes / 60).round();
    final relativeTime = locale.timeHoursAgo(hoursAgo);

    return '$timestamp ($relativeTime)';
  }
}
