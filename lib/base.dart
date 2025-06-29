import 'dart:io';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/app_screens.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/domains/domains.dart';
import 'package:pi_hole_client/screens/home/home.dart';
import 'package:pi_hole_client/screens/logs/logs.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/screens/settings/settings.dart';
import 'package:pi_hole_client/screens/statistics/statistics.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:pi_hole_client/widgets/bottom_nav_bar.dart';
import 'package:pi_hole_client/widgets/navigation_rail.dart';
import 'package:pi_hole_client/widgets/start_warning_modal.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base>
    with WidgetsBindingObserver, WindowListener {
  final List<Widget> pages = [
    const Home(),
    const Statistics(),
    const Logs(),
    const DomainLists(),
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

      final serversProvider = context.read<ServersProvider>();

      final appConfigProvider = context.read<AppConfigProvider>();

      if (appConfigProvider.importantInfoReaden == false) {
        await showDialog<String>(
          context: context,
          builder: (BuildContext context) => const StartInfoModal(),
        );
        if (!mounted) return;
      }

      if (serversProvider.selectedServer != null) {
        final result = await serversProvider.selectedApiGateway?.loginQuery();
        serversProvider.updateselectedServerStatus(
          result?.status == 'enabled' ? true : false,
        );

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
    final serversProvider = context.read<ServersProvider>();
    final statusUpdateService = context.read<StatusUpdateService>();

    if (serversProvider.selectedServer != null) {
      await serversProvider.selectedApiGateway?.loginQuery();
      statusUpdateService.startAutoRefresh();
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
    statusUpdateService.stopAutoRefresh();
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

  void _handleTabChange(
    int selected,
    DomainsListProvider domainsListProvider,
    AppConfigProvider appConfigProvider,
  ) {
    if (selected != 3) {
      domainsListProvider.setSelectedTab(null);
    }
    appConfigProvider.setSelectedTab(selected);
  }

  @override
  Widget build(BuildContext context) {
    // Listen only to necessary properties
    final hasSelectedServer = context.select<ServersProvider, bool>(
      (sp) => sp.selectedServer != null,
    );
    final selectedTab = context.select<AppConfigProvider, int>(
      (acp) => acp.selectedTab,
    );
    final domainsListProvider = context.read<DomainsListProvider>();

    // Determine the current tab index, mimicking _currentTabIndex logic
    final currentTab =
        (!hasSelectedServer && selectedTab > 1) ? 0 : selectedTab;
    final screens = hasSelectedServer ? appScreens : appScreensNotSelected;
    final currentPage =
        hasSelectedServer ? pages[currentTab] : pagesNotSelected[currentTab];

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
                      domainsListProvider,
                      context.read<AppConfigProvider>(),
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
                  domainsListProvider,
                  context.read<AppConfigProvider>(),
                );
              },
            )
          : null,
    );
  }
}
