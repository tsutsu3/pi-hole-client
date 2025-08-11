import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';

class CustomTabContent extends StatelessWidget {
  const CustomTabContent({
    required this.loadingGenerator,
    required this.contentGenerator,
    required this.errorGenerator,
    required this.loadStatus,
    required this.onRefresh,
    this.controller,
    super.key,
  });

  final Widget Function() loadingGenerator;
  final List<Widget> Function() contentGenerator;
  final Widget Function() errorGenerator;
  final LoadStatus loadStatus;
  final Future<void> Function() onRefresh;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    switch (loadStatus) {
      case LoadStatus.loading:
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) => CustomScrollView(
              controller: controller,
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: loadingGenerator(),
                  ),
                ),
              ],
            ),
          ),
        );

      case LoadStatus.loaded:
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return RefreshIndicator(
                onRefresh: onRefresh,
                edgeOffset: 95,
                child: CustomScrollView(
                  controller: controller,
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(contentGenerator()),
                    ),
                  ],
                ),
              );
            },
          ),
        );

      case LoadStatus.error:
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) => CustomScrollView(
              controller: controller,
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 95, left: 16, right: 16),
                    child: errorGenerator(),
                  ),
                ),
              ],
            ),
          ),
        );

      // default:
      //   return const SizedBox();
    }
  }
}
