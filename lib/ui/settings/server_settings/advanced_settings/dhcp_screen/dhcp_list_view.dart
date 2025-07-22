import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/services/api/shared/models/dhcp.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

/// A widget that displays a list of DHCP leases in a scrollable view.
///
/// Each lease is represented as a [ListTile] showing the device name, IP address,
/// and a status icon indicating the lease's expiration status:
/// - Green hourglass: lease expires in more than 16 hours.
/// - Orange hourglass: lease expires in 8-16 hours.
/// - Red hourglass: lease expires in less than 8 hours.
/// - Grey question mark: lease has never been active.
///
/// If the lease IP matches [currentClientIp], a chip labeled "In Use" is shown.
///
/// [dhcpsInfo] provides the list of DHCP leases.
/// [currentClientIp] is the IP address of the current client device.
/// [onDeviceTap] is an optional callback invoked when a device is tapped.
class DhcpListView extends StatelessWidget {
  const DhcpListView({
    required this.dhcpsInfo,
    required this.currentClientIp,
    required this.onDeviceTap,
    super.key,
  });

  final DhcpsInfo dhcpsInfo;
  final String currentClientIp;
  final void Function(DhcpInfo)? onDeviceTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dhcpsInfo.leases.length,
      itemBuilder: (context, index) {
        final dhcp = dhcpsInfo.leases[index];
        return ListTile(
          leading: _buildStatusIcon(context, dhcp.expires),
          title: Text(
            dhcp.name.isEmpty
                ? AppLocalizations.of(context)!.unknown
                : dhcp.name,
          ),
          subtitle: Text(dhcp.ip),
          trailing: dhcp.ip == currentClientIp
              ? Chip(
                  avatar: const Icon(Icons.star_rounded),
                  label: Text(AppLocalizations.of(context)!.inUse),
                )
              : null,
          onTap: () => onDeviceTap?.call(dhcp),
        );
      },
    );
  }

  /// Builds the status icon based on the dhcp's last query timestamp.
  /// - Green hourglass: lease expires in more than 16 hours.
  /// - Orange hourglass: lease expires in 8-16 hours.
  /// - Red hourglass: lease expires in less than 8 hours.
  /// - Grey question mark: lease has never been active (expire == UnixTime(0))
  Widget _buildStatusIcon(BuildContext context, DateTime expire) {
    final theme = Theme.of(context).extension<AppColors>()!;

    IconData iconData;
    Color iconColor;

    if (expire.millisecondsSinceEpoch == 0) {
      iconData = Icons.question_mark_rounded;
      iconColor = theme.queryGrey ?? Colors.grey;
    } else {
      final now = DateTime.now();
      final hours = expire.difference(now).inHours;

      if (hours < 8) {
        iconData = Icons.hourglass_empty_rounded;
        iconColor = theme.queryRed ?? Colors.red;
      } else if (hours < 16) {
        iconData = Icons.hourglass_bottom_rounded;
        iconColor = theme.queryOrange ?? Colors.orange;
      } else {
        iconData = Icons.hourglass_top_rounded;
        iconColor = theme.queryGreen ?? Colors.green;
      }
    }

    return Icon(iconData, size: 24, color: iconColor);
  }
}
