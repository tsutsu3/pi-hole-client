import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/logs/widgets/log_details_screen.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_app_bar.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_content_view.dart';
import 'package:pi_hole_client/screens/logs/widgets/logs_filters_modal.dart';
import 'package:pi_hole_client/services/logs_pagination_service.dart';
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
  Log? selectedLog;

  late LogsPaginationService? paginationService;
  late ApiGateway? apiGateway;
  late double? logsPerQuery;
  late ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();

  Timer? debounce;

  Future<void> resetLogs() async {
    setState(() {
      enableNextWindow = true;
      loadStatus = LoadStatus.loaded;
    });
  }

  Future<void> applyFilterAndLoad({
    DateTime? inStartTime,
    DateTime? inEndTime,
  }) async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });

    enableNextWindow = false;

    final endTime = inEndTime ?? DateTime.now();
    final startTime = inStartTime ??
        endTime.subtract(Duration(minutes: (logsPerQuery! * 60).toInt()));

    if (inStartTime != null || inEndTime != null) {
      paginationService!.reset(startTime, endTime);
      setState(() {
        logsList.clear();
        isLoadingMore = true;
      });

      final newLogs = await paginationService?.loadNextPage() ?? [];
      logger.d(
        'Loaded ${newLogs.length} logs from $startTime to $endTime',
      );

      setState(() {
        isLoadingMore = false;
        logsList.addAll(newLogs);
      });
    }

    setState(() {
      if (paginationService!.finished == LoadStatus.loaded) {
        loadStatus = LoadStatus.loaded;
      } else if (paginationService!.finished == LoadStatus.error) {
        loadStatus = LoadStatus.error;
      } else {
        loadStatus = LoadStatus.loading;
      }
    });
  }

  List<Log> filterLogs({
    required List<int> statusSelected,
    required List<String> devicesSelected,
    required String? selectedDomain,
    List<Log>? logs,
  }) {
    var tempLogs = logs != null ? [...logs] : [...logsList];

    tempLogs = tempLogs.where((log) {
      if (log.status != null &&
          statusSelected.contains(int.parse(log.status!))) {
        return true;
      } else {
        return false;
      }
    }).toList();

    if (devicesSelected.isNotEmpty) {
      tempLogs = tempLogs.where((log) {
        if (devicesSelected.contains(log.device)) {
          return true;
        } else {
          return false;
        }
      }).toList();
    }

    if (selectedDomain != null) {
      tempLogs = tempLogs.where((log) => log.url == selectedDomain).toList();
    }

    if (searchController.text != '') {
      tempLogs = tempLogs.where((log) {
        if (log.url.contains(searchController.text)) {
          return true;
        } else {
          return false;
        }
      }).toList();
    }

    if (sortStatus == 1) {
      tempLogs.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    } else {
      tempLogs.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      tempLogs = tempLogs.reversed.toList();
    }

    return tempLogs;
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()..addListener(scrollListener);

    logsPerQuery =
        Provider.of<AppConfigProvider>(context, listen: false).logsPerQuery;

    apiGateway =
        Provider.of<ServersProvider>(context, listen: false).selectedApiGateway;

    paginationService = LogsPaginationService(apiGateway: apiGateway!);

    initializeLoad();
  }

  @override
  void dispose() {
    scrollController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  Future<void> initializeLoad() async {
    setState(() {
      loadStatus = LoadStatus.loading;
    });

    final now = DateTime.now();

    paginationService?.reset(
      now.subtract(
        Duration(minutes: (logsPerQuery! * 60).toInt()),
      ),
      now,
    );

    await enqueueLoad();

    setState(() {
      if (paginationService!.finished == LoadStatus.loaded) {
        loadStatus = LoadStatus.loaded;
      } else if (paginationService!.finished == LoadStatus.error) {
        loadStatus = LoadStatus.error;
      } else {
        loadStatus = LoadStatus.loading;
      }
    });
  }

  void scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 100), enqueueLoad);
    }
  }

  /// Loads the next page of logs asynchronously, handling pagination and empty results.
  ///
  /// This method attempts to load additional logs using the [paginationService].
  /// If the pagination window is finished and loading more is enabled, it advances
  /// the window by a fixed duration and resets the pagination service. It will
  /// attempt to load logs up to maxEmptyWindows times if no new logs are found,
  /// incrementing an empty window counter each time. If new logs are loaded, they
  /// are added to [logsList] and the method returns. If the maximum number of empty
  /// windows is reached without loading new logs, loading is stopped and an error
  /// is logged.
  Future<void> enqueueLoad() async {
    const maxEmptyWindows = 3;
    for (var emptyWindowCount = 0; emptyWindowCount < maxEmptyWindows;) {
      // 1. If pagination has finished, advance the window
      if (paginationService!.finished == LoadStatus.loaded) {
        if (!enableNextWindow) {
          logger.w('Pagination finished and loading more is disabled.');
          return;
        }

        final diff = Duration(minutes: (logsPerQuery! * 60).toInt());
        final startTime = paginationService!.startTime!.subtract(diff);
        final endTime = paginationService!.startTime!;
        logger.d(
          'Resetting pagination service with new window: $startTime to $endTime',
        );
        paginationService!.reset(startTime, endTime);
      }

      // 2. Load the next page of logs
      logger.d('Loading next page of logs...');
      setState(() {
        isLoadingMore = true;
      });
      final newLogs = await paginationService!.loadNextPage();
      setState(() {
        isLoadingMore = false;
      });

      if (newLogs.isNotEmpty) {
        setState(() {
          logsList.addAll(newLogs);
        });
        return;
      }

      // 3. If no logs were loaded, increment the empty window count
      if (paginationService!.finished == LoadStatus.loaded ||
          paginationService!.finished == LoadStatus.error) {
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
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final apiGateway = serversProvider.selectedApiGateway;

    final width = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final bottomNavBarHeight = MediaQuery.of(context).viewPadding.bottom;

    var logsListDisplay = filterLogs(
      statusSelected: filtersProvider.statusSelected,
      devicesSelected: filtersProvider.selectedClients,
      selectedDomain: filtersProvider.selectedDomain,
    );

    void updateSortStatus(value) {
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

    Future<void> whiteBlackList(String list, Log log) async {
      final loading = ProcessModal(context: context);
      loading.open(
        list == 'white'
            ? AppLocalizations.of(context)!.addingWhitelist
            : AppLocalizations.of(context)!.addingBlacklist,
      );
      final result = await apiGateway?.setWhiteBlacklist(log.url, list);
      loading.close();

      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        if (result!.data!.message.contains('Added')) {
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: list == 'white'
                ? AppLocalizations.of(context)!.addedWhitelist
                : AppLocalizations.of(context)!.addedBlacklist,
          );
        } else {
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: list == 'white'
                ? AppLocalizations.of(context)!.alreadyWhitelist
                : AppLocalizations.of(context)!.alreadyBlacklist,
          );
        }
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: list == 'white'
              ? AppLocalizations.of(context)!.couldntAddWhitelist
              : AppLocalizations.of(context)!.couldntAddBlacklist,
        );
      }
    }

    void showLogDetails(Log log) {
      setState(() => selectedLog = log);
      if (width <= ResponsiveConstants.large) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogDetailsScreen(
              log: log,
              whiteBlackList: whiteBlackList,
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

    Widget buildChip(String label, Icon icon, Function() onDeleted) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Chip(
          label: Text(label),
          avatar: icon,
          onDeleted: onDeleted,
        ),
      );
    }

    void scrollToTop() {
      if (logsListDisplay.isNotEmpty) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    }

    List<Widget> _buildFilterChips() {
      final chips = <Widget>[];

      if (filtersProvider.startTime != null ||
          filtersProvider.endTime != null) {
        chips.add(
          buildChip(
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

      if (filtersProvider.statusSelected.length <
          serversProvider.numShown - 1) {
        chips.add(
          buildChip(
            filtersProvider.statusSelected.length == 1
                ? filtersProvider.statusSelectedString
                : '${filtersProvider.statusSelected.length} ${AppLocalizations.of(context)!.statusSelected}',
            const Icon(Icons.shield),
            () {
              scrollToTop();
              filtersProvider.resetStatus();
            },
          ),
        );
      }

      if (filtersProvider.selectedClients.isNotEmpty &&
          filtersProvider.selectedClients.length <
              filtersProvider.totalClients.length) {
        chips.add(
          buildChip(
            filtersProvider.selectedClients.length == 1
                ? filtersProvider.selectedClients[0]
                : '${filtersProvider.selectedClients.length} ${AppLocalizations.of(context)!.clientsSelected}',
            const Icon(Icons.devices),
            () {
              scrollToTop();
              filtersProvider.resetClients();
            },
          ),
        );
      }

      if (filtersProvider.selectedDomain != null) {
        chips.add(
          buildChip(
            filtersProvider.selectedDomain!,
            const Icon(Icons.http_rounded),
            () {
              scrollToTop();
              filtersProvider.setSelectedDomain(null);
            },
          ),
        );
      }

      return chips;
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
          onSortChanged: updateSortStatus,
          sortStatus: sortStatus,
          filterChips: _buildFilterChips(),
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
                    whiteBlackList: whiteBlackList,
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
}
