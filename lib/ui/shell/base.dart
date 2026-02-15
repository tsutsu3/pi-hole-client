import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/app_screens.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/layout/bottom_nav_bar.dart';
import 'package:pi_hole_client/ui/core/ui/layout/navigation_rail.dart';
import 'package:pi_hole_client/ui/core/ui/modals/start_warning_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/domains_page.dart';
import 'package:pi_hole_client/ui/home/home.dart';
import 'package:pi_hole_client/ui/logs/logs.dart';
import 'package:pi_hole_client/ui/servers/servers.dart';
import 'package:pi_hole_client/ui/settings/settings.dart';
import 'package:pi_hole_client/ui/statistics/statistics.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base>
    with WidgetsBindingObserver, WindowListener {
  final pages = [
    const Home(),
    const Statistics(),
    const Logs(),
    const DomainsPage(),
    const Settings(),
  ];

  final List<Widget> pagesNotSelected = [
    const ServersPage(isFromBase: true),
    const Settings(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isDesktopPlatform()) {
        logger.d('Desktop Platform detected');
        windowManager.addListener(this);
      }

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
        final result = await serversViewModel.selectedApiGateway?.loginQuery();
        serversViewModel.updateselectedServerStatus(result?.status == 'enabled');

        if (!mounted) return;
        context.read<StatusUpdateService>().startAutoRefresh();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    if (isDesktopPlatform()) {
      windowManager.removeListener(this);
    }

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
    final statusUpdateService = context.read<StatusUpdateService>();

    if (serversViewModel.selectedServer != null) {
      await serversViewModel.selectedApiGateway?.loginQuery();
      statusUpdateService.startAutoRefresh(showLoadingIndicator: false);
    }
  }

  /// Stop auto-refresh
  ///
  /// ## Mobile
  /// - When the device screen is locked/turned off
  /// - When the app goes to the background
  /// ## Desktop
  /// - When the window is minimized
  void onPaused() {
    final statusUpdateService = context.read<StatusUpdateService>();
    statusUpdateService.stopAutoRefresh(showLoadingIndicator: false);
  }

  Widget _buildPageTransitionSwitcher(Widget child) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }

  void _handleTabChange(int selected, AppConfigViewModel appConfigViewModel) {
    appConfigViewModel.setSelectedTab(selected);
  }

  @override
  Widget build(BuildContext context) {
    // Listen only to necessary properties
    final hasSelectedServer = context.select<ServersViewModel, bool>(
      (sp) => sp.selectedServer != null,
    );
    final selectedTab = context.select<AppConfigViewModel, int>(
      (acp) => acp.selectedTab,
    );
    // Determine the current tab index, mimicking _currentTabIndex logic
    final currentTab = (!hasSelectedServer && selectedTab > 1)
        ? 0
        : selectedTab;
    final screens = hasSelectedServer ? appScreens : appScreensNotSelected;
    final currentPage = hasSelectedServer
        ? pages[currentTab]
        : pagesNotSelected[currentTab];

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: width > ResponsiveConstants.large
          ? Row(
              children: [
                CustomNavigationRail(
                  screens: screens,
                  selectedScreen: currentTab,
                  onChange: (selected) {
                    _handleTabChange(
                      selected,
                      context.read<AppConfigViewModel>(),
                    );
                  },
                ),
                Expanded(child: _buildPageTransitionSwitcher(currentPage)),
              ],
            )
          : _buildPageTransitionSwitcher(currentPage),
      bottomNavigationBar: width <= ResponsiveConstants.large
          ? BottomNavBar(
              screens: screens,
              selectedScreen: currentTab,
              onChange: (selected) {
                _handleTabChange(
                  selected,
                  context.read<AppConfigViewModel>(),
                );
              },
            )
          : null,
    );
  }
}
