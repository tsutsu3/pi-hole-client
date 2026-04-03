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
/// During tab-switch animations (both gesture swipes and programmatic
/// [TabController.animateTo] taps) both the departing and arriving pages are
/// kept mounted by listening to [TabController.animation], which updates on
/// every frame regardless of how the transition was initiated.
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
    if (!branchActive) return const SizedBox.shrink();
    return AnimatedBuilder(
      animation: controller.animation!,
      builder: (context, _) {
        // A tab is visible when the animation is within 1 unit of this index.
        // This covers the active tab at rest and either participant during a
        // gesture swipe or animated transition.
        final isVisible = (controller.animation!.value - index).abs() < 1.0;
        return isVisible ? child : const SizedBox.shrink();
      },
    );
  }
}
