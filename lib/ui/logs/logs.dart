import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/log.dart';
import 'package:pi_hole_client/domain/use_cases/logs_pagination_service.dart';
import 'package:pi_hole_client/domain/use_cases/logs_screen_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/logs/etc/logs_actions_service.dart';
import 'package:pi_hole_client/ui/logs/widgets/active_filter_chips.dart';
import 'package:pi_hole_client/ui/logs/widgets/log_details_screen.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_app_bar.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_content_view.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_filters_modal.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  DateTime? masterStartTime;
  DateTime? masterEndTime;

  LoadStatus loadStatus = LoadStatus.loading;
  int sortStatus = 0;

  bool showSearchBar = false;
  bool isLoadingMore = false;
  bool enableNextWindow = true;

  List<Log> logsList = [];
  List<Log> logsListDisplay = [];
  Log? selectedLog;

  late LogsScreenService logsSvc;
  late LogActionsService logActSvc;
  late double? logsPerQuery;
  late ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();
  final maxEmptyWindows = 3;

  Timer? debounce;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()..addListener(scrollListener);

    logsPerQuery =
        Provider.of<AppConfigProvider>(context, listen: false).logsPerQuery;

    final apiGateway =
        Provider.of<ServersProvider>(context, listen: false).selectedApiGateway;

    final paginationService = LogsPaginationService(apiGateway: apiGateway!);

    logsSvc = LogsScreenService(
      scrollController: scrollController,
      searchController: searchController,
      logsPerQuery: logsPerQuery!,
      paginationService: paginationService,
    );

    logActSvc = LogActionsService(
      apiGateway: apiGateway,
      context: context,
      appConfigProvider: Provider.of<AppConfigProvider>(context, listen: false),
    );

    initializeLoad();
  }

  @override
  void dispose() {
    scrollController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 100), enqueueLoad);
    }
  }

  Future<void> initializeLoad() async {
    if (!mounted) return;
    setState(() {
      loadStatus = LoadStatus.loading;
    });

    final now = DateTime.now();
    final end = logsSvc.getWindowStart(now);

    logsSvc.resetPagination(now, end);

    await enqueueLoad();

    if (!mounted) return;
    setState(() {
      if (logsSvc.isError) {
        loadStatus = LoadStatus.error;
      } else {
        loadStatus = LoadStatus.loaded;
      }
    });
  }

  Future<void> resetLogs() async {
    setState(() {
      enableNextWindow = true;
      loadStatus = LoadStatus.loaded;
    });
  }

  /// Applies time-based filtering and reloads logs from the pagination service.
  ///
  /// This method is typically triggered when filters are applied or reset.
  /// It updates the [logsList] by clearing the previous logs and loading new
  /// logs based on the provided time range.
  ///
  /// The time window for loading is determined as follows:
  /// - If [inStartTime] and/or [inEndTime] are provided, they are used.
  /// - Otherwise, the end time is set to `DateTime.now()`, and the start time
  ///   is calculated using [logsSvc] (.getWindowStart).
  ///
  /// If the time range is explicitly provided, pagination is reset and new logs
  /// are fetched immediately. The UI loading indicators ([loadStatus] and
  /// [isLoadingMore]) are updated using [setState].
  ///
  /// After loading, [loadStatus] is updated based on the pagination state.
  ///
  /// Parameters:
  /// - [inStartTime]: Optional start of the time window for filtering logs.
  /// - [inEndTime]: Optional end of the time window for filtering logs.
  Future<void> applyFilterAndLoad({
    DateTime? inStartTime,
    DateTime? inEndTime,
  }) async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });

    final endTime = inEndTime ?? DateTime.now();
    final startTime = inStartTime ?? logsSvc.getWindowStart(endTime);

    if (inStartTime != null || inEndTime != null) {
      enableNextWindow = false;
      logsSvc.resetPagination(startTime, endTime);
      setState(() {
        logsList.clear();
        isLoadingMore = true;
      });

      final newLogs = await logsSvc.loadNextPage() ?? [];
      logger.d(
        'Loaded ${newLogs.length} logs from $startTime to $endTime',
      );

      setState(() {
        isLoadingMore = false;
        logsList.addAll(newLogs);
      });
    }

    setState(() {
      loadStatus = LoadStatus.loaded;
    });
  }

  /// Loads additional logs with support for time window-based pagination.
  ///
  /// This method attempts to load the next page of logs. If the current pagination
  /// window is exhausted and [enableNextWindow] is true, it shifts the window backward
  /// and retries. The process continues until new logs are loaded or the maximum number
  /// of empty windows ([maxEmptyWindows]) is reached.
  ///
  /// - On each attempt, if logs are found, they are added to [logsList] and the method returns early.
  /// - If no logs are returned and pagination is finished, the empty window counter is incremented.
  /// - When the maximum number of empty windows is hit, an error is logged and loading stops.
  ///
  /// The loading state is managed using [isLoadingMore], and diagnostic messages are logged for debugging.
  Future<void> enqueueLoad() async {
    const maxEmptyWindows = 3;

    for (var emptyWindowCount = 0; emptyWindowCount < maxEmptyWindows;) {
      if (!mounted) return;
      setState(() => isLoadingMore = true);

      final newLogs = await logsSvc.loadNextWithWindowSupport(
        enableNextWindow: enableNextWindow,
      );

      if (!mounted) return;
      setState(() => isLoadingMore = false);

      if (newLogs.isNotEmpty) {
        if (!mounted) return;
        setState(() => logsList.addAll(newLogs));
        return;
      }

      if (logsSvc.isPaginationFinished) {
        emptyWindowCount++;
      }
    }

    if (logsSvc.isError) {
      if (!mounted) return;
      setState(() {
        loadStatus = LoadStatus.error;
      });
    }

    logger.w('Max empty windows reached. Stop loading.');
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final filtersProvider = Provider.of<FiltersProvider>(context);

    final width = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final bottomNavBarHeight = MediaQuery.of(context).viewPadding.bottom;

    logsListDisplay = logsSvc.filterLogs(
      logs: logsList,
      statusSelected: filtersProvider.statusSelected,
      devicesSelected: filtersProvider.selectedClients,
      selectedDomain: filtersProvider.selectedDomain,
      sortStatus: sortStatus,
    );

    void showLogDetails(Log log) {
      setState(() => selectedLog = log);
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
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          builder: (context) => LogsFiltersModal(
            statusBarHeight: statusBarHeight,
            bottomNavBarHeight: bottomNavBarHeight,
            filterLogs: () {
              setState(() {
                masterStartTime = filtersProvider.startTime;
                masterEndTime = filtersProvider.endTime;
                loadStatus = LoadStatus.loading;
              });
              applyFilterAndLoad(
                inStartTime: filtersProvider.startTime,
                inEndTime: filtersProvider.endTime,
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
              setState(() {
                masterStartTime = filtersProvider.startTime;
                masterEndTime = filtersProvider.endTime;
                loadStatus = LoadStatus.loading;
              });
              applyFilterAndLoad(
                inStartTime: filtersProvider.startTime,
                inEndTime: filtersProvider.endTime,
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
      final searched = logsSvc.searchLogs(logsList, value);
      setState(() {
        logsListDisplay = searched;
      });
      filtersProvider.resetFilters();
    }

    bool hasActiveChips() {
      final hasTimeFilter =
          filtersProvider.startTime != null || filtersProvider.endTime != null;

      final hasStatusFilter =
          filtersProvider.statusSelected.length < serversProvider.numShown - 1;

      final hasClientFilter = filtersProvider.selectedClients.isNotEmpty &&
          filtersProvider.selectedClients.length <
              filtersProvider.totalClients.length;

      final hasDomainFilter = filtersProvider.selectedDomain != null;

      final hasActiveChips = hasTimeFilter ||
          hasStatusFilter ||
          hasClientFilter ||
          hasDomainFilter;

      return hasActiveChips;
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
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
          },
          onSearchClear: () {
            setState(() => searchController.text = '');
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
          },
          onSearchChanged: searchLogs,
          onSearchOpen: () {
            setState(() => showSearchBar = true);
          },
          onFilterTap: showFiltersModal,
          onSortChanged: _updateSortStatus,
          sortStatus: sortStatus,
          filterChips: ActiveFilterChips(
            filtersProvider: filtersProvider,
            serversProvider: serversProvider,
            logsSvc: logsSvc,
            logsListDisplay: logsListDisplay,
            onResetFilters: resetLogs,
            onResetTimeFilters: () {
              setState(() {
                loadStatus = LoadStatus.loading;
              });
              resetLogs();
            },
          ),
          searchController: searchController,
          width: width,
          hasActiveChips: hasActiveChips(),
        ),
        body: SafeArea(
          child: LogsContentView(
            loadStatus: loadStatus,
            logs: logsListDisplay,
            isLoadingMore: isLoadingMore,
            onRefresh: applyFilterAndLoad,
            onLogTap: showLogDetails,
            selectedLog: selectedLog,
            scrollController: scrollController,
            logsPerQuery: logsPerQuery ?? 0.5,
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
            child: selectedLog != null
                ? LogDetailsScreen(
                    log: selectedLog!,
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

  /// Updates the current sort status of the logs list.
  ///
  /// This is typically used to toggle between ascending and descending
  /// sort orders in the logs display.
  void _updateSortStatus(int value) {
    if (sortStatus != value) {
      logsSvc.forceScrollToTop();
      setState(() {
        sortStatus = value;
        logsListDisplay = logsListDisplay.reversed.toList();
      });
    }
  }
}
