import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:provider/provider.dart';

class LogRefreshButton extends StatelessWidget {
  const LogRefreshButton({Future<void> Function()? onRefresh, super.key})
    : _onRefresh = onRefresh;

  final Future<void> Function()? _onRefresh;

  @override
  Widget build(BuildContext context) {
    final liveLog = context.select<AppConfigViewModel, bool>((p) => p.liveLog);
    final liveLogResume = context.select<AppConfigViewModel, bool>(
      (p) => p.isLivelogPaused,
    );
    final appConfigViewModel = context.read<AppConfigViewModel>();
    final loc = AppLocalizations.of(context)!;

    if (!liveLog) {
      return IconButton(
        tooltip: loc.refresh,
        icon: const Icon(Icons.refresh),
        onPressed: () {
          _onRefresh?.call();
        },
      );
    }

    if (!liveLogResume) {
      return IconButton(
        tooltip: loc.pause,
        icon: const Icon(Icons.pause_rounded),
        onPressed: () {
          appConfigViewModel.setLivelogPaused(true);
        },
      );
    }

    return IconButton(
      tooltip: loc.resume,
      icon: const Icon(Icons.auto_mode_rounded),
      onPressed: () {
        appConfigViewModel.setLivelogPaused(false);
      },
    );
  }
}
