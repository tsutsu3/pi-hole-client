import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/devices.dart';

/// A [StatelessWidget] that displays a list of network devices with their status,
/// last query time, and IP addresses.
///
/// Each device is represented as a [ListTile] showing:
/// - A status icon indicating the device's activity (active, inactive, or unknown).
/// - The device's IP addresses and optional names.
/// - The last query timestamp or a "never" label if the device was never active.
/// - A trailing chip if the device is currently in use (matches [currentClientIp]).
///
/// Tapping a device triggers the [onDeviceTap] callback with the selected [DeviceInfo].
///
/// {@tool snippet}
/// Example usage:
/// ```dart
/// NetworkListView(
///   devicesInfo: myDevicesInfo,
///  currentClientIp: currentIp,
///   onDeviceTap: (device) {
///    print('Selected device: ${device.ips.first.ip}');
///  },
// )
/// ```
/// {@end-tool}
class NetworkListView extends StatelessWidget {
  const NetworkListView({
    required this.devicesInfo,
    required this.currentClientIp,
    required this.onDeviceTap,
    super.key,
  });

  final DevicesInfo devicesInfo;
  final String currentClientIp;
  final void Function(DeviceInfo)? onDeviceTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devicesInfo.devices.length,
      itemBuilder: (context, index) {
        final device = devicesInfo.devices[index];
        return ListTile(
          leading: _buildStatusIcon(context, device.lastQuery),
          title: _buildDeviceTitle(context, device),
          subtitle: Text(
            device.lastQuery == DateTime.fromMillisecondsSinceEpoch(0)
                ? AppLocalizations.of(context)!.never
                : formatTimestamp(
                    device.lastQuery,
                    kUnifiedDateTimeLogFormat,
                  ),
          ),
          trailing: device.ips.any((ip) => ip.ip == currentClientIp)
              ? Chip(
                  avatar: const Icon(Icons.star_rounded),
                  label: Text(AppLocalizations.of(context)!.inUse),
                )
              : null,
          onTap: () => onDeviceTap?.call(device),
        );
      },
    );
  }

  /// Builds the status icon based on the device's last query timestamp.
  /// - Green check: active within 24h
  /// - Yellow warning: active within 24-48h
  /// - Red error: inactive >48h
  /// - Grey unknown: never active (lastQuery == UnixTime(0))
  Widget _buildStatusIcon(BuildContext context, DateTime lastQuery) {
    final theme = Theme.of(context).extension<AppColors>()!;

    IconData iconData;
    Color iconColor;

    if (lastQuery.millisecondsSinceEpoch == 0) {
      iconData = Icons.question_mark_rounded;
      iconColor = theme.queryGrey ?? Colors.grey;
    } else {
      final now = DateTime.now();
      final hours = now.difference(lastQuery).inHours;

      if (hours < 24) {
        iconData = Icons.check_rounded;
        iconColor = theme.queryGreen ?? Colors.green;
      } else if (hours < 48) {
        iconData = Icons.access_time_rounded;
        iconColor = theme.queryOrange ?? Colors.orange;
      } else {
        iconData = Icons.hourglass_bottom;
        iconColor = theme.queryRed ?? Colors.red;
      }
    }

    return Icon(iconData, size: 24, color: iconColor);
  }

  /// Builds a widget displaying the device's IP addresses and their optional names.
  ///
  /// If the device has no IP addresses, displays a localized "unknown" label.
  /// Otherwise, lists each IP address, appending its name in parentheses if available.
  ///
  /// [context] - The build context used for localization.
  /// [device] - The device information containing IP addresses and optional names.
  ///
  /// Returns a [Text] widget with the formatted device IP information.
  Widget _buildDeviceTitle(BuildContext context, DeviceInfo device) {
    if (device.ips.isEmpty) {
      return Text(
        AppLocalizations.of(context)!.unknown,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      );
    }

    final ipLines = device.ips.map((ip) {
      final namePart = ip.name != null ? ' (${ip.name})' : '';
      return '${ip.ip}$namePart';
    }).join('\n');

    return Text(
      ipLines,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
