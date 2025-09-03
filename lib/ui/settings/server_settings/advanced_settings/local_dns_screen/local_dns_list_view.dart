import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
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
/// [localDnsInfo] provides the list of local DNS entries.
/// [onDeviceTap] is an optional callback invoked when a device is tapped.
class LocalDnsListView extends StatelessWidget {
  const LocalDnsListView({
    required this.localDnsInfo,
    required this.onDeviceTap,
    super.key,
  });

  final List<LocalDns> localDnsInfo;
  final void Function(LocalDns)? onDeviceTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppColors>()!;

    return ListView.builder(
      itemCount: localDnsInfo.length,
      itemBuilder: (context, index) {
        final localDns = localDnsInfo[index];
        return ListTile(
          leading: Icon(
            Icons.dns_rounded,
            color: theme.queryGreen ?? Colors.green,
          ),
          title: Text(localDns.name),
          subtitle: Text(localDns.ip),
          onTap: () => onDeviceTap?.call(localDns),
        );
      },
    );
  }
}
