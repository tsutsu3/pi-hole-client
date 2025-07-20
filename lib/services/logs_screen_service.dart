import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config2/enums.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/services/logs_pagination_service.dart';
import 'package:pi_hole_client/utils2/logger.dart';

/// A helper service that encapsulates logic for handling log filtering, sorting,
/// pagination, and scroll behavior in the logs screen UI.
///
/// This service is designed to isolate pure UI-agnostic operations such as:
/// - Filtering and sorting logs based on various criteria
/// - Managing pagination state and loading additional pages
/// - Scrolling to top when necessary
///
/// It holds shared controllers such as [ScrollController] and [TextEditingController]
/// and delegates pagination operations to [LogsPaginationService].
///
/// Intended to be used by a UI screen (e.g., `Logs`) to simplify stateful logic
/// and improve testability by separating concerns.
///
/// Example usage:
/// ```dart
/// final service = LogsScreenService(
///   scrollController: scrollController,
///   searchController: searchController,
///   logsPerQuery: 0.5,
///   paginationService: paginationService,
/// );
/// ```
class LogsScreenService {
  LogsScreenService({
    required this.scrollController,
    required this.searchController,
    required this.logsPerQuery,
    required this.paginationService,
  });

  final ScrollController scrollController;
  final TextEditingController searchController;
  final double logsPerQuery;
  final LogsPaginationService paginationService;

  bool get isLoaded => paginationService.finished == LoadStatus.loaded;
  bool get isError => paginationService.finished == LoadStatus.error;
  bool get isLoading => paginationService.finished == LoadStatus.loading;

  bool get isPaginationFinished =>
      paginationService.finished == LoadStatus.loaded ||
      paginationService.finished == LoadStatus.error;

  /// Initializes the window for log retrieval based on the provided [now] timestamp.
  ///
  /// This method calculates the start of the window using [getWindowStart] and then
  /// resets the pagination to cover the period from the calculated start time to [now].
  ///
  /// [now]: The current date and time used to determine the window range.
  void initializeWindow(DateTime now) {
    final start = getWindowStart(now);
    resetPagination(start, now);
  }

  /// Determines the current [LoadStatus] based on the state of the pagination service.
  ///
  /// Returns:
  ///   - [LoadStatus.loaded] if the pagination service has finished loading successfully.
  ///   - [LoadStatus.error] if the pagination service encountered an error.
  ///   - [LoadStatus.loading] if the pagination service is still loading.
  ///
  /// This method helps to map the pagination service's status to a corresponding [LoadStatus] value
  /// for use in the UI or other logic.
  LoadStatus getLoadStatusFromPagination() {
    final finished = paginationService.finished;
    if (finished == LoadStatus.loaded) {
      return LoadStatus.loaded;
    } else if (finished == LoadStatus.error) {
      return LoadStatus.error;
    } else {
      return LoadStatus.loading;
    }
  }

  /// Checks if any filter is currently active based on the provided parameters.
  ///
  /// Returns `true` if at least one of the following conditions is met:
  /// - [statusSelected] is not empty
  /// - [clients] is not empty
  /// - [domain] is not null
  /// - The text in [searchController] is not empty
  ///
  /// [statusSelected]: A list of selected status codes.
  /// [clients]: A list of selected client identifiers.
  /// [domain]: The selected domain, or null if none is selected.
  bool hasActiveFilter({
    required List<int> statusSelected,
    required List<String> clients,
    required String? domain,
  }) {
    return statusSelected.isNotEmpty ||
        clients.isNotEmpty ||
        domain != null ||
        searchController.text.isNotEmpty;
  }

  /// Filters and sorts a list of [Log] objects based on the provided criteria.
  ///
  /// The filtering is performed according to the following parameters:
  /// - [logs]: The original list of [Log] objects to filter.
  /// - [statusSelected]: A list of status codes (as integers) to include in the results.
  /// - [devicesSelected]: A list of device identifiers (as strings) to include. If empty, all devices are included.
  /// - [selectedDomain]: If provided, only logs with a matching [Log.url] are included.
  /// - [sortStatus]: Determines the sort order of the results by [Log.dateTime]. If `0`, the list is reversed (descending).
  ///
  /// The method also applies a search filter using the text from [searchController].
  ///
  /// Returns a new list of [Log] objects that match all the specified filters and are sorted accordingly.
  List<Log> filterLogs({
    required List<Log> logs,
    required List<int> statusSelected,
    required List<String> devicesSelected,
    required String? selectedDomain,
    required int sortStatus,
  }) {
    var tempLogs = [...logs];

    tempLogs = tempLogs.where((log) {
      final statusMatch =
          log.status != null && statusSelected.contains(int.parse(log.status!));
      final deviceMatch =
          devicesSelected.isEmpty || devicesSelected.contains(log.device);
      final domainMatch = selectedDomain == null || log.url == selectedDomain;
      final searchMatch = searchController.text.isEmpty ||
          log.url.contains(searchController.text);
      return statusMatch && deviceMatch && domainMatch && searchMatch;
    }).toList();

    tempLogs.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    if (sortStatus == 0) tempLogs = tempLogs.reversed.toList();

    return tempLogs;
  }

  /// Searches for logs that contain the specified [keyword] in their URL.
  ///
  /// This method filters the provided list of [logs], returning only those
  /// logs whose `url` property contains the [keyword], case-insensitively.
  ///
  /// - [logs]: The list of [Log] objects to search within.
  /// - [keyword]: The string to search for within each log's URL.
  ///
  /// Returns a new list of [Log] objects that match the search criteria.
  List<Log> searchLogs(List<Log> logs, String keyword) {
    return logs
        .where((log) => log.url.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  /// Toggles the sort order of the provided list of [Log] objects by reversing the list.
  ///
  /// Takes the current list of logs and returns a new list with the order reversed.
  /// This can be used to switch between ascending and descending order in a log view.
  ///
  /// [currentLogs] The current list of [Log] objects to be reversed.
  /// Returns a new list of [Log] objects in the opposite order.
  List<Log> toggleSort(List<Log> currentLogs) {
    return currentLogs.reversed.toList();
  }

  /// Scrolls the associated scroll controller to the top of the list view if the provided [logsListDisplay] is not empty.
  ///
  /// Animates the scroll position to the top (offset 0) over 250 milliseconds using an ease-in-out curve.
  ///
  /// [logsListDisplay] - The list of logs currently displayed. The scroll action only occurs if this list is not empty.
  void scrollToTop(List<Log> logsListDisplay) {
    if (logsListDisplay.isNotEmpty) {
      _scrollToTop();
    }
  }

  /// Scrolls the associated scroll controller to the top
  void forceScrollToTop() {
    _scrollToTop();
  }

  /// Resets the pagination state using the provided [start] and [end] date range.
  ///
  /// This method delegates the reset operation to the [paginationService],
  /// allowing the pagination to be re-initialized for a new time interval.
  ///
  /// [start] - The start date of the new pagination range.
  /// [end] - The end date of the new pagination range.
  void resetPagination(DateTime start, DateTime end) {
    paginationService.reset(start, end);
  }

  /// Loads the next page of logs asynchronously.
  ///
  /// This method uses the [paginationService] to fetch the next set of logs,
  /// logs the number of logs loaded for debugging purposes, and returns the list
  /// of [Log] objects. Returns `null` if no logs are loaded.
  ///
  /// Returns a [Future] that completes with a list of [Log] objects or `null`.
  Future<List<Log>?> loadNextPage() async {
    final logs = await paginationService.loadNextPage();
    logger.d('Loaded ${logs.length} logs from pagination');
    return logs;
  }

  /// Loads the next page of logs and advances the window if needed.
  ///
  /// This method handles both pagination and window shifting logic:
  /// - If pagination is finished and `enableNextWindow` is true, it shifts the window.
  /// - Then it attempts to load the next page.
  /// - Returns loaded logs or an empty list if none were loaded.
  Future<List<Log>> loadNextWithWindowSupport({
    required bool enableNextWindow,
  }) async {
    if (isLoaded && enableNextWindow) {
      moveToPreviousWindow();
    } else if (isLoaded && !enableNextWindow) {
      logger.w('Pagination finished and loading more is disabled.');
      return [];
    }

    final logs = await loadNextPage() ?? [];
    return logs;
  }

  /// Moves the pagination window to the previous time segment.
  ///
  /// This function calculates a new pagination window by shifting the current
  /// start and end time backwards by the duration defined by `logsPerQuery`.
  /// It then resets the pagination service with the new time window.
  ///
  /// Example:
  /// If `logsPerQuery` is 0.5 (i.e., 30 minutes), the window will be moved
  /// 30 minutes earlier than the current window.
  ///
  /// Useful when more data is needed beyond the currently loaded pagination window.
  void moveToPreviousWindow() {
    final diff = Duration(minutes: (logsPerQuery * 60).toInt());
    final start = paginationService.startTime!.subtract(diff);
    final end = paginationService.startTime!;
    logger.d('Advancing window to $start - $end');
    paginationService.reset(start, end);
  }

  /// Calculates the start time of a window based on the given [end] time.
  ///
  /// The window size is determined by multiplying [logsPerQuery] by 60 minutes.
  /// Returns a [DateTime] representing the start of the window.
  DateTime getWindowStart(DateTime end) {
    return end.subtract(Duration(minutes: (logsPerQuery * 60).toInt()));
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }
}
