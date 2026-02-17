import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/etc/logs_actions_service.dart';
import 'package:pi_hole_client/ui/logs/viewmodel/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/active_filter_chips.dart';
import 'package:pi_hole_client/ui/logs/widgets/log_details_screen.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_app_bar.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_content_view.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_filters_modal.dart';
import 'package:provider/provider.dart';

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> with WidgetsBindingObserver {
  bool showSearchBar = false;

  late LogActionsService logActSvc;
  late ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();

  Timer? debounce;
  static const int _logsTabIndex = 2;

  late final AppConfigViewModel _appConfigViewModel;
  late final LogsViewModel _logsViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    scrollController = ScrollController()..addListener(_scrollListener);

    _appConfigViewModel = context.read<AppConfigViewModel>();
    _appConfigViewModel.addListener(_onAppConfigChanged);

    _logsViewModel = context.read<LogsViewModel>();

    final apiGateway = context.read<ServersViewModel>().selectedApiGateway;

    logActSvc = LogActionsService(
      apiGateway: apiGateway!,
      context: context,
      appConfigViewModel: _appConfigViewModel,
    );

    _logsViewModel.initScreen(
      logsPerQuery: _appConfigViewModel.logsPerQuery,
    );
    _syncLiveConfig();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _logsViewModel.disposeScreen();
    } else if (state == AppLifecycleState.resumed) {
      _logsViewModel.resumeScreen();
      _syncLiveConfig();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _logsViewModel.disposeScreen();
    _appConfigViewModel.removeListener(_onAppConfigChanged);
    scrollController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(
        const Duration(milliseconds: 100),
        _logsViewModel.enqueueLoadMore,
      );
    }
  }

  void _onAppConfigChanged() {
    if (!mounted) return;
    _syncLiveConfig();
  }

  void _syncLiveConfig() {
    _logsViewModel.configureLive(
      liveLogEnabled: _appConfigViewModel.liveLog,
      isLivelogPaused: _appConfigViewModel.isLivelogPaused,
      isOnLogsTab: _appConfigViewModel.selectedTab == _logsTabIndex,
      logAutoRefreshTime: _appConfigViewModel.logAutoRefreshTime,
    );
  }

  void _scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final logsViewModel = context.watch<LogsViewModel>();

    final width = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final bottomNavBarHeight = MediaQuery.of(context).viewPadding.bottom;

    final logsListDisplay = logsViewModel.logsListDisplay;

    void showLogDetails(Log log) {
      logsViewModel.setSelectedLog(log);
      if (width <= ResponsiveConstants.large) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogDetailsScreen(
              log: log,
              whiteBlackList: logActSvc.whiteBlackList,
            ),
          ),
        );
      }
    }

    void showFiltersModal() {
      if (width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useRootNavigator: false,
          builder: (context) => LogsFiltersModal(
            statusBarHeight: statusBarHeight,
            bottomNavBarHeight: bottomNavBarHeight,
            filterLogs: () {
              logsViewModel.applyFilterAndLoad(
                inStartTime: logsViewModel.startTime,
                inEndTime: logsViewModel.endTime,
              );
            },
            window: true,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) => LogsFiltersModal(
            statusBarHeight: statusBarHeight,
            bottomNavBarHeight: bottomNavBarHeight,
            filterLogs: () {
              logsViewModel.applyFilterAndLoad(
                inStartTime: logsViewModel.startTime,
                inEndTime: logsViewModel.endTime,
              );
            },
            window: false,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    void searchLogs(String value) {
      logsViewModel.setSearchText(value);
      logsViewModel.resetFilters();
    }

    Widget buildScaffold(BuildContext context) {
      return Scaffold(
        appBar: LogsAppBar(
          showSearchBar: showSearchBar,
          onSearchClose: () {
            setState(() {
              showSearchBar = false;
              searchController.text = '';
            });
            logsViewModel.setSearchText('');
            _scrollToTop();
          },
          onSearchClear: () {
            setState(() => searchController.text = '');
            logsViewModel.setSearchText('');
            _scrollToTop();
          },
          onSearchChanged: searchLogs,
          onSearchOpen: () {
            setState(() => showSearchBar = true);
          },
          onFilterTap: showFiltersModal,
          onSortChanged: (value) {
            logsViewModel.updateSortStatus(value);
            _scrollToTop();
          },
          onRefresh: logsViewModel.initializeLoad,
          sortStatus: logsViewModel.sortStatus,
          filterChips: ActiveFilterChips(
            logsViewModel: logsViewModel,
            onResetFilters: logsViewModel.resetLogs,
            onResetTimeFilters: logsViewModel.initializeLoad,
            onScrollToTop: _scrollToTop,
          ),
          searchController: searchController,
          width: width,
          hasActiveChips: logsViewModel.hasActiveChips,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              if (logsViewModel.isFiltering) return;
              await logsViewModel.initializeLoad();
            },
            child: LogsContentView(
              loadStatus: logsViewModel.loadStatus,
              logs: logsListDisplay,
              isLoadingMore: logsViewModel.isLoadingMore,
              onRefresh: logsViewModel.initializeLoad,
              onLogTap: showLogDetails,
              selectedLog: logsViewModel.selectedLog,
              scrollController: scrollController,
              logsPerQuery: logsViewModel.logsPerQuery,
            ),
          ),
        ),
      );
    }

    if (width > ResponsiveConstants.large) {
      return Row(
        children: [
          Expanded(
            flex: width > ResponsiveConstants.xLarge ? 2 : 3,
            child: buildScaffold(context),
          ),
          Expanded(
            flex: 3,
            child: logsViewModel.selectedLog != null
                ? LogDetailsScreen(
                    log: logsViewModel.selectedLog!,
                    whiteBlackList: logActSvc.whiteBlackList,
                  )
                : SizedBox(
                    child: SafeArea(
                      child: Text(
                        AppLocalizations.of(context)!.selectLogsLeftColumn,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    } else {
      return buildScaffold(context);
    }
  }
}
