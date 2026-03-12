import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/routing/route_extra.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/etc/logs_actions_service.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/active_filter_chips.dart';
import 'package:pi_hole_client/ui/logs/widgets/log_details_screen.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_app_bar.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_content_view.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_filters_modal.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({
    required this.logsViewModel,
    required this.appConfigViewModel,
    super.key,
  });

  final LogsViewModel logsViewModel;
  final AppConfigViewModel appConfigViewModel;

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> with WidgetsBindingObserver {
  bool showSearchBar = false;
  // True while a pull-to-refresh gesture is in progress.
  // Suppresses LinearProgressIndicator so the circular RefreshIndicator
  // spinner is the only loading indicator during user-initiated refresh.
  bool _isPullRefreshing = false;

  late LogActionsService logActSvc;
  late ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();

  Timer? debounce;
  static const int _logsTabIndex = 2;

  late final AppConfigViewModel _appConfigViewModel;
  late final LogsViewModel _logsViewModel;
  late int _lastKnownTab;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    scrollController = ScrollController()..addListener(_scrollListener);

    _appConfigViewModel = widget.appConfigViewModel;
    _lastKnownTab = _appConfigViewModel.selectedTab;
    _appConfigViewModel.addListener(_onAppConfigChanged);

    _logsViewModel = widget.logsViewModel;

    logActSvc = LogActionsService(
      logsViewModel: _logsViewModel,
      context: context,
      appConfigViewModel: _appConfigViewModel,
    );

    _logsViewModel.initScreen(logsPerQuery: _appConfigViewModel.logsPerQuery);
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

    final currentTab = _appConfigViewModel.selectedTab;
    if (currentTab != _lastKnownTab) {
      final previousTab = _lastKnownTab;
      _lastKnownTab = currentTab;

      // Reload logs when returning to the logs tab
      if (previousTab != _logsTabIndex && currentTab == _logsTabIndex) {
        _logsViewModel.initializeLoad();
      }
    }

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
    return ListenableBuilder(
      listenable: widget.logsViewModel,
      builder: (context, _) => _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final logsViewModel = widget.logsViewModel;

    final width = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final bottomNavBarHeight = MediaQuery.of(context).viewPadding.bottom;

    final logsListDisplay = logsViewModel.logsListDisplay;

    void showLogDetails(Log log) {
      logsViewModel.setSelectedLog(log);
      if (width <= ResponsiveConstants.large) {
        _appConfigViewModel.setDetailScreenOpen(true);
        context
            .pushNamed(
              Routes.logsDetails,
              extra: LogDetailsExtra(
                log: log,
                whiteBlackList: logActSvc.whiteBlackList,
              ),
            )
            .then((_) => _appConfigViewModel.setDetailScreenOpen(false));
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
              // Hide LinearProgressIndicator while the user is actively
              // pull-to-refreshing — the circular RefreshIndicator spinner
              // already provides sufficient feedback in that case.
              isRevalidating:
                  logsViewModel.isRevalidating && !_isPullRefreshing,
              onRefresh: () async {
                setState(() => _isPullRefreshing = true);
                try {
                  if (logsViewModel.isFiltering) {
                    await logsViewModel.applyFilterAndLoad(
                      inStartTime: logsViewModel.startTime,
                      inEndTime: logsViewModel.endTime,
                    );
                  } else {
                    await logsViewModel.initializeLoad();
                  }
                } finally {
                  if (mounted) setState(() => _isPullRefreshing = false);
                }
              },
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
