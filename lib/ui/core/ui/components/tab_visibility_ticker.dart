import 'package:flutter/material.dart';

/// Wraps a [TabBarView] page child and unmounts it when the tab is inactive.
///
/// `TabBarView` uses `PageView` internally and does NOT inject
/// [TickerMode(enabled: false)] for non-active pages. Pages that stay alive
/// in the [PageView] cache therefore keep [TickerMode] enabled and continue
/// to register Provider `select` subscriptions.
///
/// This widget solves the problem by **unmounting** inactive pages entirely
/// (returning [SizedBox.shrink]) so their elements are disposed and all
/// Provider subscriptions are cleared. Scroll position is preserved externally
/// via [ScrollController] passed from the parent.
///
/// During tab-switch animations both the departing and arriving pages are kept
/// mounted (via [TabController.indexIsChanging]) to avoid the slide-out content
/// disappearing mid-animation.
///
/// Wrap each page of a `TabBarView` with this widget:
///
/// ```dart
/// TabBarView(
///   controller: _tabController,
///   children: [
///     TabVisibilityTicker(controller: _tabController!, index: 0, child: PageA()),
///     TabVisibilityTicker(controller: _tabController!, index: 1, child: PageB()),
///   ],
/// )
/// ```
class TabVisibilityTicker extends StatelessWidget {
  const TabVisibilityTicker({
    required this.controller,
    required this.index,
    required this.child,
    super.key,
  });

  final TabController controller;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Register a dependency on the branch-level TickerMode so this widget
    // rebuilds when StatefulShellRoute deactivates the statistics branch.
    final branchActive = TickerMode.valuesOf(context).enabled;
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        if (!branchActive) return const SizedBox.shrink();
        final isActive = controller.index == index;
        // Keep both pages mounted during transition so the slide animation
        // doesn't show an empty departing page.
        final isTransitioning =
            controller.indexIsChanging &&
            (controller.index == index || controller.previousIndex == index);
        return (isActive || isTransitioning) ? child : const SizedBox.shrink();
      },
    );
  }
}
