import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/refresh_server_status.dart';
import 'package:pi_hole_client/functions/server_management.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/disable_modal.dart';
import 'package:pi_hole_client/screens/home/widgets/home_appbar.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts.dart';
import 'package:pi_hole_client/screens/home/widgets/home_tile.dart';
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
    final serversProvider = Provider.of<ServersProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final width = MediaQuery.of(context).size.width;

    Widget tiles() {
      switch (statusProvider.getStatusLoading) {
        case LoadStatus.loading:
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.loadingStats,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          );

        case LoadStatus.loaded:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              runSpacing: 16,
              children: [
                HomeTileItem(
                  icon: Icons.public,
                  iconColor:
                      Theme.of(context).extension<DataVisColors>()!.blueDark!,
                  color: Theme.of(context).extension<DataVisColors>()!.blue!,
                  label: AppLocalizations.of(context)!.totalQueries,
                  value: intFormat(
                    statusProvider.getRealtimeStatus!.dnsQueriesToday,
                    Platform.localeName,
                  ),
                  width: width,
                ),
                HomeTileItem(
                  icon: Icons.block,
                  iconColor:
                      Theme.of(context).extension<DataVisColors>()!.redDark!,
                  color: Theme.of(context).extension<DataVisColors>()!.red!,
                  label: AppLocalizations.of(context)!.queriesBlocked,
                  value: intFormat(
                    statusProvider.getRealtimeStatus!.adsBlockedToday,
                    Platform.localeName,
                  ),
                  width: width,
                ),
                HomeTileItem(
                  icon: Icons.pie_chart,
                  iconColor:
                      Theme.of(context).extension<DataVisColors>()!.orangeDark!,
                  color: Theme.of(context).extension<DataVisColors>()!.orange!,
                  label: AppLocalizations.of(context)!.percentageBlocked,
                  value:
                      '${formatPercentage(statusProvider.getRealtimeStatus!.adsPercentageToday, Platform.localeName)}%',
                  width: width,
                ),
                HomeTileItem(
                  icon: Icons.list,
                  iconColor:
                      Theme.of(context).extension<DataVisColors>()!.greenDark!,
                  color: Theme.of(context).extension<DataVisColors>()!.green!,
                  label: AppLocalizations.of(context)!.domainsAdlists,
                  value: intFormat(
                    statusProvider.getRealtimeStatus!.domainsBeingBlocked,
                    Platform.localeName,
                  ),
                  width: width,
                ),
              ],
            ),
          );

        case LoadStatus.error:
          return Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.statsNotLoaded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          );

        // default:
        //   return const SizedBox();
      }
    }

    Future<void> enableDisableServer() async {
      if (statusProvider.isServerConnected == true &&
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
                                  tiles(),
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
                      bottom: isVisible &&
                              statusProvider.getStatusLoading ==
                                  LoadStatus.loaded
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
