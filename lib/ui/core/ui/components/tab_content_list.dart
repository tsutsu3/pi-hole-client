import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';

/// A reusable tab content widget that supports loading, loaded, and error states.
///
/// This widget is designed to be used inside tab views, with or without `NestedScrollView`.
/// It automatically handles:
/// - Loading state with a custom loading widget
/// - Loaded state with a scrollable list of items
/// - Empty state when no data is present
/// - Error state with a custom error widget
/// - Pull-to-refresh functionality
///
/// If used within a `NestedScrollView`, it safely injects the `SliverOverlapInjector`.
class CustomTabContentList extends StatelessWidget {
  const CustomTabContentList({
    required this.loadingGenerator,
    required this.itemsCount,
    required this.contentWidget,
    required this.noData,
    required this.errorGenerator,
    required this.loadStatus,
    required this.onRefresh,
    this.bottomSpaceHeight = 0,
    super.key,
  });

  /// A widget builder for the loading state.
  final Widget Function() loadingGenerator;

  /// The number of items in the list.
  final int itemsCount;

  /// A widget builder for each item in the list.
  final Widget Function(int index) contentWidget;

  /// A widget displayed when the list is empty.
  final Widget noData;

  /// A widget builder for the error state.
  final Widget Function() errorGenerator;

  /// The current load status (loading, loaded, or error).
  final LoadStatus loadStatus;

  /// A callback function triggered by pull-to-refresh.
  final Future<void> Function() onRefresh;

  /// Optional space to add at the bottom of the scroll view. Default is 0 (no space).
  final double bottomSpaceHeight;

  /// Returns a safe `SliverOverlapInjector` if inside a `NestedScrollView`,
  /// otherwise returns an empty `SliverToBoxAdapter`.
  SingleChildRenderObjectWidget _safeOverlapInjector(BuildContext context) {
    try {
      return SliverOverlapInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      );
    } catch (e) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (loadStatus) {
      case LoadStatus.loading:
        return SafeArea(
          top: false,
          bottom: false,
          child: CustomScrollView(
            slivers: [
              _safeOverlapInjector(context),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: loadingGenerator(),
                ),
              ),
            ],
          ),
        );

      case LoadStatus.loaded:
        return SafeArea(
          top: false,
          bottom: false,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            edgeOffset: 95,
            child: CustomScrollView(
              slivers: <Widget>[
                _safeOverlapInjector(context),
                if (itemsCount > 0)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => contentWidget(index),
                      childCount: itemsCount,
                    ),
                  ),
                if (itemsCount == 0) SliverFillRemaining(child: noData),
                if (bottomSpaceHeight > 0)
                  SliverToBoxAdapter(
                    child: SizedBox(height: bottomSpaceHeight),
                  ),
              ],
            ),
          ),
        );

      case LoadStatus.error:
        return SafeArea(
          top: false,
          bottom: false,
          child: CustomScrollView(
            slivers: [
              _safeOverlapInjector(context),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.only(top: 95, left: 16, right: 16),
                  child: errorGenerator(),
                ),
              ),
            ],
          ),
        );
    }
  }
}
