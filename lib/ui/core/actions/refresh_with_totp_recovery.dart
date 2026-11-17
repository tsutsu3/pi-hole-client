import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/v6/totp_prompt_guard.dart';
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
/// The TOTP prompt is allowed first: a refresh the user explicitly asks for
/// must be allowed to prompt again, even after the user cancelled it.
/// Automatic paths (auto-refresh ticks, app resume) keep respecting the
/// cancel.
Future<void> refreshWithTotpRecovery(
  BuildContext context,
  Future<void> Function() load,
) async {
  final address = context.read<ServersViewModel>().selectedServer?.address;
  if (address != null) {
    context.read<TotpPromptGuard>().allowPrompt(address);
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
