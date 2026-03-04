import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/utils/format.dart';

class DhcpDetailScreen extends StatelessWidget {
  const DhcpDetailScreen({
    required this.lease,
    required this.onDelete,
    super.key,
  });

  final DhcpLease lease;
  final void Function(DhcpLease) onDelete;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.dhcp),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.deleteDhcp,
                message: AppLocalizations.of(context)!.deleteDhcpMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  onDelete(lease);
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
              SectionLabel(label: locale.clientInformation),
              ListTile(
                leading: const Icon(Icons.computer_rounded),
                title: Text(locale.hostname),
                subtitle: Text(lease.name),
              ),
              ListTile(
                leading: const Icon(Icons.memory_rounded),
                title: Text(locale.macAddress),
                subtitle: Text(lease.hwaddr),
              ),
              ListTile(
                leading: const Icon(Icons.tag_rounded),
                title: Text(locale.clientId),
                subtitle: Text(lease.clientid),
              ),
              const SizedBox(height: 16),
              SectionLabel(label: locale.leaseInfo),
              ListTile(
                leading: const Icon(Icons.location_on_rounded),
                title: Text(locale.ipAddress),
                subtitle: Text(lease.ip),
              ),
              ListTile(
                leading: const Icon(Icons.event_busy_rounded),
                title: Text(locale.expire),
                subtitle: Text(_buildLastQueryValue(locale)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildLastQueryValue(AppLocalizations locale) {
    final expires = lease.expires;
    if (expires == null || expires.millisecondsSinceEpoch == 0) {
      return locale.unknown;
    }

    final timestamp = formatTimestamp(expires, kUnifiedDateTimeLogFormat);
    final hoursAgo = (expires.difference(DateTime.now()).inMinutes / 60)
        .round();
    final relativeTime = locale.timeHoursIn(hoursAgo);

    return '$timestamp ($relativeTime)';
  }
}
