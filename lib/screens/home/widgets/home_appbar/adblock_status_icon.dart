import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:provider/provider.dart';

/// A widget that displays an icon representing the current ad-block server status.
///
/// The icon and its color change based on the following conditions:
/// - If the server is connected and enabled, a green verified user icon is shown.
/// - If the server is connected but not enabled, a red "bad" icon is shown.
/// - If the server is not connected, a grey shield icon is shown.
///
/// This widget uses [StatusProvider] to determine the server connection status,
/// and [ServersProvider] to access the selected server's enabled state and color theme.
class AdBlockStatusIcon extends StatelessWidget {
  const AdBlockStatusIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isServerConnected = context.select<StatusProvider, bool>(
      (p) => p.isServerConnected,
    );

    final colors = context.select<ServersProvider, AppColors>(
      (p) => p.colors,
    );

    final enableSelectedServer = context.select<ServersProvider, bool>(
      (p) => p.selectedServer!.enabled ?? false,
    );

    return Icon(
      isServerConnected
          ? enableSelectedServer
              ? Icons.verified_user_rounded
              : Icons.gpp_bad_rounded
          : Icons.shield_rounded,
      size: 30,
      color: isServerConnected
          ? enableSelectedServer
              ? convertColor(colors, Colors.green)
              : convertColor(colors, Colors.red)
          : Colors.grey,
    );
  }
}
