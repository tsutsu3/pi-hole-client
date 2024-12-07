// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/animations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:provider/provider.dart';

import 'package:pi_hole_client/widgets/navigation_rail.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/screens/home/home.dart';
import 'package:pi_hole_client/screens/logs/logs.dart';
import 'package:pi_hole_client/screens/settings/settings.dart';
import 'package:pi_hole_client/screens/domains/domains.dart';
import 'package:pi_hole_client/screens/statistics/statistics.dart';

import 'package:pi_hole_client/widgets/start_warning_modal.dart';
import 'package:pi_hole_client/widgets/bottom_nav_bar.dart';

import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/constants/app_screens.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> with WidgetsBindingObserver {
  final List<Widget> pages = [
    const Home(),
    const Statistics(),
    const Logs(),
    const DomainLists(),
    const Settings()
  ];

  final List<Widget> pagesNotSelected = [
    const ServersPage(isFromBase: true),
    const Settings()
  ];

  void fetchMainData(Server server) async {
    final statusProvider = Provider.of<StatusProvider>(context, listen: false);
    final serversProvider =
        Provider.of<ServersProvider>(context, listen: false);
    final apiGateway = serversProvider.selectedApiGateway;

    final result = await Future.wait(
        [apiGateway!.realtimeStatus(), apiGateway.fetchOverTimeData()]);

    final realtimeStatusResponse = result[0] as RealtimeStatusResponse;
    final overTimeDataResponse = result[1] as FetchOverTimeDataResponse;

    if (realtimeStatusResponse.result == APiResponseType.success &&
        overTimeDataResponse.result == APiResponseType.success) {
      statusProvider.setRealtimeStatus(realtimeStatusResponse.data!);
      statusProvider.setOvertimeData(overTimeDataResponse.data!);
      serversProvider.updateselectedServerStatus(
          realtimeStatusResponse.data!.status == 'enabled' ? true : false);

      statusProvider.setOvertimeDataLoadingStatus(1);
      statusProvider.setStatusLoading(LoadStatus.loaded);

      statusProvider.setStartAutoRefresh(true);
      statusProvider.setIsServerConnected(true);
    } else {
      statusProvider.setOvertimeDataLoadingStatus(2);
      statusProvider.setStatusLoading(LoadStatus.error);

      statusProvider.setIsServerConnected(false);
    }
  }

  @override
  void initState() {
    final serversProvider =
        Provider.of<ServersProvider>(context, listen: false);

    WidgetsBinding.instance.addObserver(this);

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appConfigProvider =
          Provider.of<AppConfigProvider>(context, listen: false);
      if (appConfigProvider.importantInfoReaden == false) {
        await showDialog<String>(
            context: context,
            builder: (BuildContext context) => const ImportantInfoModal());
      }
    });

    if (serversProvider.selectedServer != null) {
      fetchMainData(serversProvider.selectedServer!);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final domainsListProvider =
        Provider.of<DomainsListProvider>(context, listen: false);

    final width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness == Brightness.light
            ? Brightness.light
            : Brightness.dark,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: Scaffold(
        body: width > 900
            ? Row(
                children: [
                  CustomNavigationRail(
                    screens: serversProvider.selectedServer != null
                        ? appScreens
                        : appScreensNotSelected,
                    selectedScreen: serversProvider.selectedServer != null
                        ? appConfigProvider.selectedTab
                        : appConfigProvider.selectedTab > 1
                            ? 0
                            : appConfigProvider.selectedTab,
                    onChange: (selected) {
                      if (selected != 3) {
                        domainsListProvider.setSelectedTab(null);
                      }
                      appConfigProvider.setSelectedTab(selected);
                    },
                  ),
                  Expanded(
                    child: PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder:
                            ((child, primaryAnimation, secondaryAnimation) =>
                                FadeThroughTransition(
                                  animation: primaryAnimation,
                                  secondaryAnimation: secondaryAnimation,
                                  child: child,
                                )),
                        child: serversProvider.selectedServer != null
                            ? pages[appConfigProvider.selectedTab]
                            : pagesNotSelected[appConfigProvider.selectedTab > 1
                                ? 0
                                : appConfigProvider.selectedTab]),
                  ),
                ],
              )
            : PageTransitionSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder:
                    ((child, primaryAnimation, secondaryAnimation) =>
                        FadeThroughTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        )),
                child: serversProvider.selectedServer != null
                    ? pages[appConfigProvider.selectedTab]
                    : pagesNotSelected[appConfigProvider.selectedTab > 1
                        ? 0
                        : appConfigProvider.selectedTab]),
        bottomNavigationBar: width <= 900
            ? BottomNavBar(
                screens: serversProvider.selectedServer != null
                    ? appScreens
                    : appScreensNotSelected,
                selectedScreen: serversProvider.selectedServer != null
                    ? appConfigProvider.selectedTab
                    : appConfigProvider.selectedTab > 1
                        ? 0
                        : appConfigProvider.selectedTab,
                onChange: (selected) {
                  if (selected != 3) {
                    domainsListProvider.setSelectedTab(null);
                  }
                  appConfigProvider.setSelectedTab(selected);
                },
              )
            : null,
      ),
    );
  }
}
