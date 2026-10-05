import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/actions/handle_totp_reauth.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:provider/provider.dart';

/// Runs a screen-level data load in response to a user gesture (pull to
/// refresh, the app bar's refresh action), recovering from an expired 2FA
/// session the same way the home screen does.
///
/// If [load] throws [TotpRequiredException], a TOTP prompt is shown via
/// [handleTotpReauth] and [load] is retried once the session is recovered.
/// Any other error is rethrown to the caller - it is already recorded in the
/// screen's `Command.errors`, so the error UI keeps working.
///
/// The cancelled-2FA mark is cleared first: a refresh the user explicitly
/// asks for must be allowed to prompt again. Automatic paths (auto-refresh
/// ticks, app resume) keep respecting the mark.
Future<void> refreshWithTotpRecovery(
  BuildContext context,
  Future<void> Function() load,
) async {
  final serversViewModel = context.read<ServersViewModel>();
  final address = serversViewModel.selectedServer?.address;
  if (address != null) {
    serversViewModel.clearTotpReauthDeclined(address);
  }

  try {
    await load();
  } on TotpRequiredException {
    if (!context.mounted) return;
    final recovered = await handleTotpReauth(context);
    if (recovered && context.mounted) {
      await load();
    }
  }
}
