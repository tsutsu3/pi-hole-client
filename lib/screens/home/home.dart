import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config2/enums.dart';
import 'package:pi_hole_client/config2/responsive.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/disable_modal.dart';
import 'package:pi_hole_client/screens/home/widgets/home_appbar.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts.dart';
import 'package:pi_hole_client/screens/home/widgets/home_tiles.dart';
import 'package:pi_hole_client/ui2/core/logic/refresh_server_status.dart';
import 'package:pi_hole_client/ui2/core/logic/server_management.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isVisible;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    isVisible = true;
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (mounted && isVisible == false) {
          setState(() => isVisible = true);
        }
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = context.watch<ServersProvider>();

    final appConfigProvider = context.read<AppConfigProvider>();

    final statusLoading = context.select<StatusProvider, LoadStatus>(
      (provider) => provider.getStatusLoading,
    );

    final isConnectionAttemptFinished = context.select<StatusProvider, bool>(
      (p) => !p.isServerLoading,
    );

    final width = MediaQuery.of(context).size.width;

    Future<void> enableDisableServer() async {
      if (isConnectionAttemptFinished == true &&
          serversProvider.selectedServer != null) {
        if (serversProvider.selectedServer?.enabled == true) {
          if (width > ResponsiveConstants.medium) {
            await showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (_) => DisableModal(
                onDisable: (time) => disableServer(time, context),
                window: true,
              ),
            );
          } else {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => DisableModal(
                onDisable: (time) => disableServer(time, context),
                window: false,
              ),
              backgroundColor: Colors.transparent,
            );
          }
        } else {
          await enableServer(context);
        }
      }
    }

    return serversProvider.selectedServer != null
        ? Stack(
            children: [
              Scaffold(
                body: SafeArea(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context,
                          ),
                          sliver: HomeAppBar(
                            innerBoxIsScrolled: innerBoxIsScrolled,
                          ),
                        ),
                      ];
                    },
                    body: SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                        builder: (context) => RefreshIndicator(
                          edgeOffset: 70,
                          onRefresh: () async {
                            await refreshServerStatus(context);
                          },
                          child: CustomScrollView(
                            slivers: [
                              SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                              ),
                              SliverList.list(
                                children: [
                                  HomeTiles(width: width),
                                  const SizedBox(height: 24),
                                  const HomeCharts(),
                                  const SizedBox(height: 90),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      bottom: isVisible && statusLoading == LoadStatus.loaded
                          ? appConfigProvider.showingSnackbar
                              ? 70
                              : 20
                          : -70,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed: enableDisableServer,
                        child: const Icon(Icons.shield_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
