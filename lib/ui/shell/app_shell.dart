import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/ui/core/model/app_screens.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/layout/bottom_nav_bar.dart';
import 'package:pi_hole_client/ui/core/ui/layout/navigation_rail.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:provider/provider.dart';

/// The main application shell that provides NavigationRail (desktop)
/// or BottomNavBar (mobile) around the [StatefulShellRoute] content.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  /// Branch indices in StatefulShellRoute
  static const int homeIndex = 0;
  static const int statisticsIndex = 1;
  static const int logsIndex = 2;
  static const int domainsIndex = 3;
  static const int settingsIndex = 4;

  /// Root paths for each branch (used for BottomNavBar visibility)
  static const _branchRootPaths = {
    '/home',
    '/statistics',
    '/logs',
    '/domains',
    '/settings',
  };

  @override
  Widget build(BuildContext context) {
    final hasSelectedServer = context.select<ServersViewModel, bool>(
      (sp) => sp.selectedServer != null,
    );
    final width = MediaQuery.of(context).size.width;
    final screens = hasSelectedServer ? appScreens : appScreensNotSelected;

    // Map displayed index <-> branch index
    final branchIndices = hasSelectedServer
        ? [homeIndex, statisticsIndex, logsIndex, domainsIndex, settingsIndex]
        : [homeIndex, settingsIndex];

    final currentBranch = navigationShell.currentIndex;
    final displayedIndex = branchIndices.indexOf(currentBranch);
    final safeDisplayedIndex = displayedIndex >= 0 ? displayedIndex : 0;

    void onTabChanged(int displayedIdx) {
      final branchIdx = branchIndices[displayedIdx];

      // Keep AppConfigViewModel.selectedTab in sync for live-log config
      context.read<AppConfigViewModel>().setSelectedTab(branchIdx);

      // Reset log selection when navigating away from logs
      if (hasSelectedServer && branchIdx != logsIndex) {
        context.read<LogsViewModel>().setSelectedLog(null);
      }

      navigationShell.goBranch(
        branchIdx,
        initialLocation: branchIdx == navigationShell.currentIndex,
      );
    }

    // Determine whether to show BottomNavBar on mobile.
    // Hide it for sub-routes (e.g. /settings/app/theme) so they appear full-screen.
    final currentPath = GoRouterState.of(context).uri.path;
    final detailOpen = context.select<AppConfigViewModel, bool>(
      (vm) => vm.detailScreenOpen,
    );
    final showBottomNav = _branchRootPaths.contains(currentPath) && !detailOpen;

    if (width > ResponsiveConstants.large) {
      // Desktop: NavigationRail + content
      return Scaffold(
        body: Row(
          children: [
            CustomNavigationRail(
              screens: screens,
              selectedScreen: safeDisplayedIndex,
              onChange: onTabChanged,
            ),
            Expanded(child: _animatedShell(navigationShell, currentBranch)),
          ],
        ),
      );
    }

    // Mobile: content + optional BottomNavBar
    return Scaffold(
      body: _animatedShell(navigationShell, currentBranch),
      bottomNavigationBar: showBottomNav
          ? BottomNavBar(
              screens: screens,
              selectedScreen: safeDisplayedIndex,
              onChange: onTabChanged,
            )
          : null,
    );
  }

  Widget _animatedShell(Widget child, int branchIndex) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, primary, secondary) => FadeThroughTransition(
        animation: primary,
        secondaryAnimation: secondary,
        child: child,
      ),
      child: KeyedSubtree(key: ValueKey<int>(branchIndex), child: child),
    );
  }
}
