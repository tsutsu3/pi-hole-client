import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
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
  bool isLoadingMore = false;

  List<Log> logsList = [];
  Log? selectedLog;

  bool loadInProgress = false;
  bool fullyFinished = false;

  late LogsPaginationService? paginationService;
  late ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();

  /// Loads logs from the API gateway with optional filtering and pagination.
  ///
  /// This method fetches logs based on the provided parameters and updates the
  /// internal logs list. It supports replacing old logs or appending new logs
  /// for pagination. The method also handles the initialization of the
  /// pagination service and manages loading state.
  ///
  /// Parameters:
  /// - [replaceOldLogs]: If `true`, replaces the current logs with newly fetched logs.
  ///   If `false`, appends the new logs to the existing list.
  /// - [inStartTime]: An optional start time for the logs to be fetched.
  /// - [inEndTime]: An optional end time for the logs to be fetched.
  ///
  /// Returns a [Future] that completes when the logs have been loaded.
  /// If no API gateway is selected or the pagination service fails to initialize,
  /// the method returns early.
  Future<dynamic> loadLogs({
    required bool replaceOldLogs,
    DateTime? inStartTime,
    DateTime? inEndTime,
  }) async {
    final logsPerQuery =
        Provider.of<AppConfigProvider>(context, listen: false).logsPerQuery;

    final serversProvider =
        Provider.of<ServersProvider>(context, listen: false);
    final apiGateway = serversProvider.selectedApiGateway;

    if (apiGateway == null) {
      logger.e('No API Gateway selected.');
      return;
    }

    if (replaceOldLogs ||
        paginationService == null ||
        paginationService!.finished) {
      DateTime endTime;

      if (replaceOldLogs || paginationService == null) {
        endTime = inEndTime ?? DateTime.now();
      } else {
        // Calculate next window
        endTime = paginationService!.startTime.subtract(
          Duration(
            hours: logsPerQuery.floor(),
            minutes: ((logsPerQuery - logsPerQuery.floor()) * 60).toInt(),
          ),
        );
      }

      final startTime = inStartTime ??
          (logsPerQuery == 0.5
              ? endTime.subtract(const Duration(minutes: 30))
              : endTime.subtract(Duration(hours: logsPerQuery.toInt())));

      paginationService = LogsPaginationService(
        apiGateway: apiGateway,
        startTime: startTime,
        endTime: endTime,
        logPeriodHours: logsPerQuery,
      );

      logger.d('PaginationService initialized with: '
          'startTime: $startTime, endTime: $endTime');
    }

    setState(() => isLoadingMore = true);

    final fetchedLogs = await paginationService!.loadNextPage();

    setState(() => isLoadingMore = false);

    if (fetchedLogs.isEmpty) {
      setState(() => loadStatus = 1);
      return;
    }

    setState(() {
      if (replaceOldLogs) {
        logsList = fetchedLogs.reversed.toList();
      } else {
        logsList.addAll(fetchedLogs.reversed);
      }
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

    if (_searchController.text != '') {
      tempLogs = tempLogs.where((log) {
        if (log.url.contains(_searchController.text)) {
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
    _scrollController = ScrollController()..addListener(_scrollListener);
    loadLogs(replaceOldLogs: true);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500 && !isLoadingMore) {
      _enqueueLoad();
    }
  }

  Future<void> _enqueueLoad() async {
    if (loadInProgress) return;

    loadInProgress = true;

    logger.w('calling loadLogs from scroll listener');
    await loadLogs(replaceOldLogs: false);

    loadInProgress = false;
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
        _scrollController.animateTo(
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
                    controller: _scrollController,
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
        _scrollController.animateTo(
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
                      _searchController.text = '';
                    });
                    if (_scrollController.positions.isNotEmpty) {
                      _scrollController.animateTo(
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
                      setState(() => _searchController.text = '');
                      if (_scrollController.positions.isNotEmpty) {
                        _scrollController.animateTo(
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
                      controller: _searchController,
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
