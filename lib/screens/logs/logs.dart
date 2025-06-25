import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
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
import 'package:pi_hole_client/screens/logs/log_details_screen.dart';
import 'package:pi_hole_client/screens/logs/log_tile.dart';
import 'package:pi_hole_client/screens/logs/logs_filters_modal.dart';
import 'package:pi_hole_client/screens/logs/no_logs_message.dart';
import 'package:pi_hole_client/services/logs_pagination_service.dart';
import 'package:pi_hole_client/widgets/custom_radio.dart';
import 'package:provider/provider.dart';

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  DateTime? masterStartTime;
  DateTime? masterEndTime;

  int loadStatus = 0;
  int sortStatus = 0;

  bool showSearchBar = false;
  bool isLoadingMore = true;

  List<Log> logsList = [];
  Log? selectedLog;

  late LogsPaginationService? paginationService;
  late ApiGateway? apiGateway;
  late double? logsPerQuery;
  late ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();

  Timer? debounce;

  /// Loads logs within a specified time range.
  ///
  /// If [replaceOldLogs] is `true`, the existing logs in [logsList] will be cleared before adding new logs.
  /// Optionally, you can specify [inStartTime] and [inEndTime] to define the time range for the logs to load.
  /// If [inEndTime] is not provided, the current time is used.
  /// If [inStartTime] is not provided, it is calculated based on [logsPerQuery].
  ///
  /// The method resets the pagination service with the new time range and loads the next page of logs.
  /// The loaded logs are then added to [logsList].
  ///
  /// Returns a [Future] that completes when the logs have been loaded.
  Future<dynamic> loadLogs({
    required bool replaceOldLogs,
    DateTime? inStartTime,
    DateTime? inEndTime,
  }) async {
    setState(() {
      loadStatus = 0;
    });

    if (inStartTime != null) {
      isLoadingMore = false;
    }

    final endTime = inEndTime ?? DateTime.now();
    final startTime = inStartTime ??
        endTime.subtract(Duration(minutes: (logsPerQuery! * 60).toInt()));

    paginationService!.reset(startTime, endTime);

    if (replaceOldLogs) {
      setState(() {
        logsList.clear();
      });
    }

    final newLogs = await paginationService?.loadNextPage() ?? [];
    setState(() {
      logsList.addAll(newLogs);
    });

    setState(() {
      loadStatus = 1;
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
      loadStatus = 0;
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
      loadStatus = 1;
    });
  }

  void scrollListener() {
    if (scrollController.position.extentAfter < 500) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 100), () {
        logger.w('calling loadLogs from scroll listener');
        enqueueLoad();
      });
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
      if (paginationService!.finished) {
        if (!isLoadingMore) {
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
      final newLogs = await paginationService!.loadNextPage();

      if (newLogs.isNotEmpty) {
        setState(() {
          logsList.addAll(newLogs);
        });
        return;
      }

      // 3. If no logs were loaded, increment the empty window count
      if (paginationService!.finished) {
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
                loadStatus = 0;
              });
              loadLogs(
                replaceOldLogs: true,
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
                loadStatus = 0;
              });
              loadLogs(
                replaceOldLogs: true,
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

    Widget status() {
      switch (loadStatus) {
        case 0:
          return SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.loadingLogs,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        case 1:
          return RefreshIndicator(
            onRefresh: () async {
              await loadLogs(replaceOldLogs: true);
            },
            child: logsListDisplay.isNotEmpty
                ? ListView.builder(
                    controller: scrollController,
                    itemCount: isLoadingMore == true
                        ? logsListDisplay.length + 1
                        : logsListDisplay.length,
                    itemBuilder: (context, index) {
                      if (isLoadingMore == true &&
                          index == logsListDisplay.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return LogTile(
                          log: logsListDisplay[index],
                          showLogDetails: showLogDetails,
                          isLogSelected: logsListDisplay[index] == selectedLog,
                        );
                      }
                    },
                  )
                : NoLogsMessage(logsPerQuery: appConfigProvider.logsPerQuery),
          );

        case 2:
          return SizedBox(
            width: double.maxFinite,
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
                  AppLocalizations.of(context)!.couldntLoadLogs,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );

        default:
          return const SizedBox();
      }
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

    bool areFiltersApplied() {
      if (filtersProvider.statusSelected.length <
              serversProvider.numShown - 1 ||
          filtersProvider.startTime != null ||
          filtersProvider.endTime != null ||
          filtersProvider.selectedClients.length <
              filtersProvider.totalClients.length ||
          filtersProvider.selectedDomain != null) {
        return true;
      } else {
        return false;
      }
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

    Widget scaffold() {
      return Scaffold(
        appBar: showSearchBar == true
            ? AppBar(
                toolbarHeight: 60,
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      showSearchBar = false;
                      searchController.text = '';
                    });
                    if (scrollController.positions.isNotEmpty) {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                  splashRadius: 20,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() => searchController.text = '');
                      if (scrollController.positions.isNotEmpty) {
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    icon: const Icon(Icons.clear_rounded),
                    splashRadius: 20,
                  ),
                ],
                title: Container(
                  width: width - 136,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Center(
                    child: TextField(
                      controller: searchController,
                      onChanged: searchLogs,
                      autofocus: true,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: AppLocalizations.of(context)!.searchUrl,
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : AppBar(
                title: Text(AppLocalizations.of(context)!.queryLogs),
                toolbarHeight: 60,
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showSearchBar = true;
                      });
                    },
                    icon: const Icon(Icons.search_rounded),
                    splashRadius: 20,
                  ),
                  IconButton(
                    onPressed: showFiltersModal,
                    icon: const Icon(Icons.filter_list_rounded),
                    splashRadius: 20,
                  ),
                  PopupMenuButton(
                    splashRadius: 20,
                    icon: const Icon(Icons.sort_rounded),
                    onSelected: updateSortStatus,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.arrow_downward_rounded),
                                  const SizedBox(width: 15),
                                  Flexible(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .fromLatestToOldest,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomRadio(
                              value: 0,
                              groupValue: sortStatus,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.arrow_upward_rounded),
                                  const SizedBox(width: 15),
                                  Flexible(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .fromOldestToLatest,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomRadio(
                              value: 1,
                              groupValue: sortStatus,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                bottom: areFiltersApplied() == true
                    ? PreferredSize(
                        preferredSize: const Size(double.maxFinite, 50),
                        child: Container(
                          width: double.maxFinite,
                          height: 50,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(width: 5),
                              if (filtersProvider.startTime != null ||
                                  filtersProvider.endTime != null)
                                buildChip(
                                  AppLocalizations.of(context)!.time,
                                  const Icon(Icons.access_time_rounded),
                                  () {
                                    filtersProvider.resetTime();
                                    setState(() {
                                      loadStatus = 0;
                                    });
                                    loadLogs(replaceOldLogs: true);
                                  },
                                ),
                              if (filtersProvider.statusSelected.length <
                                  serversProvider.numShown - 1)
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
                              if (filtersProvider.selectedClients.isNotEmpty &&
                                  filtersProvider.selectedClients.length <
                                      filtersProvider.totalClients.length)
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
                              if (filtersProvider.selectedDomain != null)
                                buildChip(
                                  filtersProvider.selectedDomain!,
                                  const Icon(Icons.http_rounded),
                                  () {
                                    scrollToTop();
                                    filtersProvider.setSelectedDomain(null);
                                  },
                                ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                      )
                    : const PreferredSize(
                        preferredSize: Size.zero,
                        child: SizedBox(),
                      ),
              ),
        body: SafeArea(
          child: status(),
        ),
      );
    }

    if (width > ResponsiveConstants.large) {
      return Row(
        children: [
          Expanded(
            flex: width > ResponsiveConstants.xLarge ? 2 : 3,
            child: scaffold(),
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
      return scaffold();
    }
  }
}
