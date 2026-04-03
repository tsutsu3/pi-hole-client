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
/// mounted. Two conditions are combined to handle all transition types:
///
/// - **Gesture swipe**: [TabController.animation] updates every frame while the
///   user drags, so `animation.value` is used to detect adjacent tabs in view.
/// - **Programmatic non-adjacent jump** (e.g. tab 0 → tab 2): the animation
///   value starts far from the destination, so [TabController.indexIsChanging]
///   is additionally checked to mount both endpoints immediately.
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
    return ListenableBuilder(
      listenable: Listenable.merge([controller.animation, controller]),
      builder: (context, _) {
        // Gesture swipe: animation.value moves continuously, so mount any tab
        // within 1 unit of the current value (i.e. the two adjacent tabs).
        final inSwipeRange =
            (controller.animation!.value - index).abs() < 1.0;
        // Programmatic non-adjacent jump: indexIsChanging is true and both
        // the departure and destination tabs must be mounted immediately,
        // even when the animation value is still far from the destination.
        final isEndpoint =
            controller.indexIsChanging &&
            (controller.index == index || controller.previousIndex == index);
        return (inSwipeRange || isEndpoint) ? child : const SizedBox.shrink();
      },
    );
  }
}
