// ignore_for_file: use_build_context_synchronously

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/constants/app_screens.dart';
import 'package:pi_hole_client/constants/responsive.dart';
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
        context.read<StatusUpdateService>().startAutoRefresh();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<Widget> get _currentPages {
    final serversProvider = context.read<ServersProvider>();
    return serversProvider.selectedServer != null ? pages : pagesNotSelected;
  }

  int _currentTabIndex(
    ServersProvider serversProvider,
    AppConfigProvider appConfigProvider,
  ) {
    final tab = appConfigProvider.selectedTab;
    if (serversProvider.selectedServer == null && tab > 1) {
      return 0;
    }
    return tab;
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
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final domainsListProvider =
        Provider.of<DomainsListProvider>(context, listen: false);

    final width = MediaQuery.of(context).size.width;
    final currentTab = _currentTabIndex(serversProvider, appConfigProvider);

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
        body: width > ResponsiveConstants.large
            ? Row(
                children: [
                  CustomNavigationRail(
                    screens: serversProvider.selectedServer != null
                        ? appScreens
                        : appScreensNotSelected,
                    selectedScreen: currentTab,
                    onChange: (selected) {
                      _handleTabChange(
                        selected,
                        domainsListProvider,
                        appConfigProvider,
                      );
                    },
                  ),
                  Expanded(
                    child:
                        _buildPageTransitionSwitcher(_currentPages[currentTab]),
                  ),
                ],
              )
            : _buildPageTransitionSwitcher(_currentPages[currentTab]),
        bottomNavigationBar: width <= ResponsiveConstants.large
            ? BottomNavBar(
                screens: serversProvider.selectedServer != null
                    ? appScreens
                    : appScreensNotSelected,
                selectedScreen: currentTab,
                onChange: (selected) {
                  _handleTabChange(
                    selected,
                    domainsListProvider,
                    appConfigProvider,
                  );
                },
              )
            : null,
      ),
    );
  }
}
