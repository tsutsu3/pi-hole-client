import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/logs/widgets/log_details_screen.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_app_bar.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_content_view.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_filters_modal.dart';
import 'package:pi_hole_client/services/logs_actions_service.dart';
import 'package:pi_hole_client/services/logs_pagination_service.dart';
import 'package:pi_hole_client/services/logs_screen_service.dart';
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
    setState(() {
      loadStatus = LoadStatus.loading;
    });

    final now = DateTime.now();
    final end = logsSvc.getWindowStart(now);

    logsSvc.resetPagination(now, end);

    await enqueueLoad();

    setState(() {
      loadStatus = LoadStatus.loaded;
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

    enableNextWindow = false;

    final endTime = inEndTime ?? DateTime.now();
    final startTime = inStartTime ?? logsSvc.getWindowStart(endTime);

    if (inStartTime != null || inEndTime != null) {
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

  Future<void> enqueueLoad() async {
    const maxEmptyWindows = 3;

    for (var emptyWindowCount = 0; emptyWindowCount < maxEmptyWindows;) {
      setState(() => isLoadingMore = true);
      final newLogs = await logsSvc.loadNextWithWindowSupport(
        enableNextWindow: enableNextWindow,
      );
      setState(() => isLoadingMore = false);

      if (newLogs.isNotEmpty) {
        setState(() => logsList.addAll(newLogs));
        return;
      }

      if (logsSvc.isPaginationFinished) {
        emptyWindowCount++;
        logger.w('Empty window count: $emptyWindowCount');
      }
    }

    logger.e('Max empty windows reached. Stop loading.');
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
      final searched = logsList
          .where((log) => log.url.toLowerCase().contains(value.toLowerCase()))
          .toList();
      setState(() {
        logsListDisplay = searched;
      });
      filtersProvider.resetFilters();
    }

    Widget _buildScaffold(BuildContext context) {
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
          filterChips: _buildFilterChips(
            context,
            filtersProvider,
            serversProvider,
            logsListDisplay,
          ),
          searchController: searchController,
          width: width,
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
            child: _buildScaffold(context),
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
      return _buildScaffold(context);
    }
  }

  /// Updates the current sort status of the logs list.
  ///
  /// This is typically used to toggle between ascending and descending
  /// sort orders in the logs display.
  void _updateSortStatus(int value) {
    if (sortStatus != value) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      setState(() {
        sortStatus = value;
        logsListDisplay = logsListDisplay.reversed.toList();
      });
    }
  }

  /// Scrolls the associated scroll controller to the top of the list view
  /// if the provided [logsListDisplay] is not empty.
  void _scrollToTop(List<Log> logsListDisplay) {
    if (logsListDisplay.isNotEmpty) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Builds a list of filter chips based on the current filter selections.
  ///
  /// This method generates a list of [Widget]s representing the active filters
  /// applied in the logs screen. Each chip corresponds to a specific filter
  /// (time, status, clients, or domain) and provides a way for the user to
  /// remove that filter. When a chip is tapped, the corresponding filter is
  /// reset and the logs are refreshed as needed.
  ///
  /// Parameters:
  /// - [context]: The build context used for localization and widget building.
  /// - [filtersProvider]: The provider managing the current filter selections.
  /// - [serversProvider]: The provider managing server-related data.
  ///
  /// Returns:
  ///   A list of [Widget]s representing the active filter chips.
  List<Widget> _buildFilterChips(
    BuildContext context,
    FiltersProvider filtersProvider,
    ServersProvider serversProvider,
    List<Log> logsListDisplay,
  ) {
    final chips = <Widget>[];

    if (filtersProvider.startTime != null || filtersProvider.endTime != null) {
      chips.add(
        _buildChip(
          AppLocalizations.of(context)!.time,
          const Icon(Icons.access_time_rounded),
          () {
            filtersProvider.resetTime();
            setState(() {
              loadStatus = LoadStatus.loading;
            });
            resetLogs();
          },
        ),
      );
    }

    if (filtersProvider.statusSelected.length < serversProvider.numShown - 1) {
      chips.add(
        _buildChip(
          filtersProvider.statusSelected.length == 1
              ? filtersProvider.statusSelectedString
              : '${filtersProvider.statusSelected.length} ${AppLocalizations.of(context)!.statusSelected}',
          const Icon(Icons.shield),
          () {
            _scrollToTop(logsListDisplay);
            filtersProvider.resetStatus();
            resetLogs();
          },
        ),
      );
    }

    if (filtersProvider.selectedClients.isNotEmpty &&
        filtersProvider.selectedClients.length <
            filtersProvider.totalClients.length) {
      chips.add(
        _buildChip(
          filtersProvider.selectedClients.length == 1
              ? filtersProvider.selectedClients[0]
              : '${filtersProvider.selectedClients.length} ${AppLocalizations.of(context)!.clientsSelected}',
          const Icon(Icons.devices),
          () {
            _scrollToTop(logsListDisplay);
            filtersProvider.resetClients();
            resetLogs();
          },
        ),
      );
    }

    if (filtersProvider.selectedDomain != null) {
      chips.add(
        _buildChip(
          filtersProvider.selectedDomain!,
          const Icon(Icons.http_rounded),
          () {
            _scrollToTop(logsListDisplay);
            filtersProvider.setSelectedDomain(null);
            resetLogs();
          },
        ),
      );
    }

    return chips;
  }

  /// Builds a styled [Chip] widget with a label, an icon as the avatar, and a delete action.
  ///
  /// [label] - The text to display inside the chip.
  /// [icon] - The icon to display as the chip's avatar.
  /// [onDeleted] - The callback function to execute when the chip's delete icon is tapped.
  ///
  /// Returns a [Padding] widget containing the configured [Chip].
  Widget _buildChip(String label, Icon icon, Function() onDeleted) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(label),
        avatar: icon,
        onDeleted: onDeleted,
      ),
    );
  }
}
