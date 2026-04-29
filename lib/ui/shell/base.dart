import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/ui/modals/start_warning_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

/// Lifecycle wrapper that manages app lifecycle events (resume/pause,
/// window minimize/restore) and initial setup (server connection, auto-refresh).
///
/// Used as the outermost `ShellRoute` builder in the router configuration.
/// All navigation layout (NavigationRail, BottomNavBar) is handled by `AppShell`.
class Base extends StatefulWidget {
  const Base({required this.child, super.key});

  final Widget child;

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base>
    with WidgetsBindingObserver, WindowListener {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isDesktopPlatform()) {
        logger.d('Desktop Platform detected');
        windowManager.addListener(this);
      }

      setupWidgetChannel();

      final serversViewModel = context.read<ServersViewModel>();

      final appConfigViewModel = context.read<AppConfigViewModel>();

      if (appConfigViewModel.importantInfoReaden == false) {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => const StartInfoModal(),
        );
        if (!mounted) return;
      }

      if (serversViewModel.selectedServer != null) {
        await _fetchAndUpdateStatus();

        if (!mounted) return;
        context.read<StatusViewModel>().startAutoRefresh();
      }
    });
  }

  void setupWidgetChannel() {
    const MethodChannel('pihole/widget').setMethodCallHandler((call) async {
      if (call.method != 'openServer') return;
      final args = call.arguments;
      if (args is! Map) return;
      final serverId = args['serverId'];
      if (serverId is! String || serverId.isEmpty) return;

      if (!mounted) return;
      final serversViewModel = context.read<ServersViewModel>();
      Server? target;
      for (final server in serversViewModel.getServersList) {
        if (server.address == serverId) {
          target = server;
          break;
        }
      }
      if (target == null) return;

      // Reset to loading before navigating — prevents stale error state
      // (yellow icon) from showing while reconnecting after a prior failure.
      context.read<StatusViewModel>().setServerStatus(LoadStatus.loading);
      serversViewModel.setselectedServer(server: target, toHomeTab: true);

      // Wait for ProxyProvider2 to rebuild the bundle for the (possibly new)
      // server before reading it via context.read<RepositoryBundle?>().
      await WidgetsBinding.instance.endOfFrame;
      if (!mounted) return;

      await _fetchAndUpdateStatus();
      if (!mounted) return;
      context.read<StatusViewModel>().startAutoRefresh(
        showLoadingIndicator: false,
      );
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    if (isDesktopPlatform()) {
      windowManager.removeListener(this);
    }

    const MethodChannel('pihole/widget').setMethodCallHandler(null);

    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // Only for desktop when restored from minimized
      if (!isDesktopPlatform()) {
        await onResumed();
      }
    } else if (state == AppLifecycleState.paused) {
      onPaused();
    }
  }

  @override
  void onWindowMinimize() {
    onPaused();
  }

  @override
  void onWindowRestore() {
    onResumed();
  }

  bool isDesktopPlatform() {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }

  /// Start auto-refresh
  ///
  /// ## Mobile
  /// - When the device screen is unlocked/turned on
  /// - When the app returns from the background
  /// ## Desktop
  /// - When the window is restored from being minimized
  Future<void> onResumed() async {
    final serversViewModel = context.read<ServersViewModel>();
    final statusViewModel = context.read<StatusViewModel>();

    if (serversViewModel.selectedServer != null) {
      await _fetchAndUpdateStatus();
      statusViewModel.startAutoRefresh(showLoadingIndicator: false);
    }
  }

  /// Fetches the blocking status and updates [ServersViewModel].
  ///
  /// Session renewal for v6 is handled transparently inside
  /// fetchBlockingStatus via runWithResultRetry + clearAndRenewSid,
  /// so no explicit fallback is needed here.
  Future<void> _fetchAndUpdateStatus() async {
    final serversViewModel = context.read<ServersViewModel>();
    final server = serversViewModel.selectedServer;
    final bundle = context.read<RepositoryBundle?>();
    if (bundle == null || server == null) return;

    final result = await bundle.dns.fetchBlockingStatus();

    serversViewModel.updateselectedServerStatus(
      result.getOrNull()?.status == DnsBlockingStatus.enabled,
    );
    await WidgetChannel.sendBlockingUpdated(serverAddress: server.address);
  }

  /// Stop auto-refresh
  ///
  /// ## Mobile
  /// - When the device screen is locked/turned off
  /// - When the app goes to the background
  /// ## Desktop
  /// - When the window is minimized
  void onPaused() {
    final statusViewModel = context.read<StatusViewModel>();
    statusViewModel.stopAutoRefresh(showLoadingIndicator: false);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
