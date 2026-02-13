import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
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
class DhcpListView extends StatelessWidget {
  const DhcpListView({
    required this.leases,
    required this.currentClientIp,
    required this.onLeaseTap,
    super.key,
  });

  final List<DhcpLease> leases;
  final String currentClientIp;
  final void Function(DhcpLease)? onLeaseTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leases.length,
      itemBuilder: (context, index) {
        final lease = leases[index];
        return ListTile(
          leading: _buildStatusIcon(context, lease.expires),
          title: Text(
            lease.name.isEmpty
                ? AppLocalizations.of(context)!.unknown
                : lease.name,
          ),
          subtitle: Text(lease.ip),
          trailing: lease.ip == currentClientIp
              ? Chip(
                  avatar: const Icon(Icons.star_rounded),
                  label: Text(AppLocalizations.of(context)!.inUse),
                )
              : null,
          onTap: () => onLeaseTap?.call(lease),
        );
      },
    );
  }

  /// Builds the status icon based on the lease's expiration timestamp.
  /// - Green hourglass: lease expires in more than 16 hours.
  /// - Orange hourglass: lease expires in 8-16 hours.
  /// - Red hourglass: lease expires in less than 8 hours.
  /// - Grey question mark: lease has never been active (expires == null or epoch 0)
  Widget _buildStatusIcon(BuildContext context, DateTime? expires) {
    final theme = Theme.of(context).extension<AppColors>()!;

    IconData iconData;
    Color iconColor;

    if (expires == null || expires.millisecondsSinceEpoch == 0) {
      iconData = Icons.question_mark_rounded;
      iconColor = theme.queryGrey ?? Colors.grey;
    } else {
      final now = DateTime.now();
      final hours = expires.difference(now).inHours;

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
