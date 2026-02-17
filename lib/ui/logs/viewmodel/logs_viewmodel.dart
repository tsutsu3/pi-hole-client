import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/config/query_types.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/domain/use_cases/live_logs_service.dart';
import 'package:pi_hole_client/domain/use_cases/logs_pagination_service.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel/filters_interface.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel/filters_v5.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel/filters_v6.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';

/// ViewModel for the Logs screen.
///
/// Manages query log loading, pagination, live updates, filtering, sorting,
/// and search. Absorbs the former `FiltersViewModel` — all filter state
/// (status, time range, clients, domain, request status) lives here.
///
/// Injected via `ChangeNotifierProxyProvider2` from `RepositoryBundle` and
/// [ServersViewModel]; the [update] method keeps the repository reference
/// and API version in sync.
class LogsViewModel extends ChangeNotifier {
  LogsViewModel();

  // ------------------------------------------
  // Filter state (always available, replaces FiltersViewModel)
  // ------------------------------------------

  String _apiVersion = 'v5';
  late Filters _filters = FiltersV5();

  String get apiVersion => _apiVersion;

  List<int> get statusAllowedAndRetried => _filters.statusAllowedAndRetried;
  List<int> get defaultSelected => _filters.defaultSelected;
  List<int> get statusSelected => _filters.statusSelected;
  String get statusSelectedString => _filters.statusSelectedString;
  DateTime? get startTime => _filters.startTime;
  DateTime? get endTime => _filters.endTime;
  List<String> get totalClients => _filters.totalClients;
  List<String> get selectedClients => _filters.selectedClients;
  String? get selectedDomain => _filters.selectedDomain;
  RequestStatus get requestStatus => _filters.requestStatus;

  /// Sets the selected query-status filter indices.
  void setStatusSelected(List<int> values) {
    _filters.setStatusSelected(values);
    notifyListeners();
  }

  /// Sets the start of the time-range filter.
  void setStartTime(DateTime value) {
    _filters.setStartTime(value);
    notifyListeners();
  }

  /// Sets the end of the time-range filter.
  void setEndTime(DateTime value) {
    _filters.setEndTime(value);
    notifyListeners();
  }

  /// Resets all filters (status, time, clients, domain) to defaults.
  void resetFilters() {
    _filters.resetFilters();
    notifyListeners();
  }

  /// Resets the time-range filter.
  void resetTime() {
    _filters.resetTime();
    notifyListeners();
  }

  /// Resets the status filter to its defaults.
  void resetStatus() {
    _filters.resetStatus();
    notifyListeners();
  }

  /// Replaces the full list of available clients (used by `StatusUpdateService`).
  void setClients(List<String> clients) {
    _filters.setClients(clients);
    notifyListeners();
  }

  /// Sets the client filter to the given subset.
  void setSelectedClients(List<String> selectedClients) {
    _filters.setSelectedClients(selectedClients);
    notifyListeners();
  }

  /// Sets the domain filter (or `null` to clear).
  void setSelectedDomain(String? domain) {
    _filters.setSelectedDomain(domain);
    notifyListeners();
  }

  /// Resets the client filter (deselects all).
  void resetClients() {
    _filters.resetClients();
    notifyListeners();
  }

  /// Sets the request-status preset (allowed / blocked / all).
  void setRequestStatus(RequestStatus status) {
    _filters.setRequestStatus(status);
    notifyListeners();
  }

  /// Converts the int-based [statusSelected] to a [Set<QueryStatusType>].
  Set<QueryStatusType> get selectedStatusTypes {
    final statuses = _apiVersion == 'v6' ? queryStatusesV6 : queryStatusesV5;
    return _filters.statusSelected.map((index) {
      final status = statuses.firstWhere(
        (s) => s.index == index,
        orElse: () {
          logger.w('Unknown status index: $index, falling back to first');
          return statuses.first;
        },
      );
      return _apiVersion == 'v6'
          ? convertQueryStatusTypeV6(status.key)
          : convertQueryStatusTypeV5(int.tryParse(status.key));
    }).toSet();
  }

  /// Converts the int-based [statusAllowedAndRetried] to a [Set<QueryStatusType>].
  Set<QueryStatusType> get allowedAndRetriedStatusTypes {
    final statuses = _apiVersion == 'v6' ? queryStatusesV6 : queryStatusesV5;
    return _filters.statusAllowedAndRetried.map((index) {
      final status = statuses.firstWhere(
        (s) => s.index == index,
        orElse: () {
          logger.w('Unknown status index: $index, falling back to first');
          return statuses.first;
        },
      );
      return _apiVersion == 'v6'
          ? convertQueryStatusTypeV6(status.key)
          : convertQueryStatusTypeV5(int.tryParse(status.key));
    }).toSet();
  }

  /// Whether the given status is an allowed/retried type (used for whitelist/blacklist button).
  bool isAllowedOrRetried(QueryStatusType? status) {
    if (status == null) return false;
    return allowedAndRetriedStatusTypes.contains(status);
  }

  /// All shown status types for filter comparison.
  Set<QueryStatusType> get allStatusTypes {
    final statuses = _apiVersion == 'v6' ? queryStatusesV6 : queryStatusesV5;
    return statuses.where((s) => s.isShown).map((s) {
      return _apiVersion == 'v6'
          ? convertQueryStatusTypeV6(s.key)
          : convertQueryStatusTypeV5(int.tryParse(s.key));
    }).toSet();
  }

  // ------------------------------------------
  // Screen state (active when Logs screen is visible)
  // ------------------------------------------

  MetricsRepository? _repository;
  double _logsPerQuery = 2.0;

  LogsPaginationService? _paginationService;
  LogsPaginationService? _livePaginationService;
  LiveLogsService? _liveLogsService;

  List<Log> _logsList = [];
  final Set<String> _loadedLogKeys = {};
  LoadStatus _loadStatus = LoadStatus.loading;
  int _sortStatus = 0;
  bool _isLoadingMore = false;
  bool _enableNextWindow = true;
  bool _isFiltering = false;
  Log? _selectedLog;
  String _searchText = '';

  Timer? _liveLogTimer;
  int? _liveLogIntervalSeconds;
  bool _isLiveTickInProgress = false;
  bool _screenActive = false;

  // Live log settings (set by UI from AppConfigViewModel)
  bool _liveLogEnabled = true;
  bool _isLivelogPaused = true;
  bool _isOnLogsTab = false;
  int _logAutoRefreshTime = 5;

  List<Log> get logsList => _logsList;
  LoadStatus get loadStatus => _loadStatus;
  int get sortStatus => _sortStatus;
  bool get isLoadingMore => _isLoadingMore;
  Log? get selectedLog => _selectedLog;
  String get searchText => _searchText;
  double get logsPerQuery => _logsPerQuery;
  bool get screenActive => _screenActive;
  bool get isFiltering => _isFiltering;

  // ------------------------------------------
  // Filtered/sorted logs for display
  // ------------------------------------------

  /// Returns logs filtered by status, client, domain, and search text,
  /// then sorted by timestamp according to [sortStatus].
  List<Log> get logsListDisplay {
    var logs = [..._logsList];

    logs = logs.where((log) {
      final statusMatch =
          log.status != null && selectedStatusTypes.contains(log.status);
      final deviceMatch =
          selectedClients.isEmpty || selectedClients.contains(log.device);
      final domainMatch = selectedDomain == null || log.url == selectedDomain;
      final searchMatch =
          _searchText.isEmpty ||
          log.url.toLowerCase().contains(_searchText.toLowerCase());
      return statusMatch && deviceMatch && domainMatch && searchMatch;
    }).toList();

    logs.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    if (_sortStatus == 0) logs = logs.reversed.toList();

    return logs;
  }

  /// Whether any non-default filter is active (shown as chips in the app bar).
  bool get hasActiveChips {
    final hasTimeFilter = startTime != null || endTime != null;
    final hasStatusFilter = statusSelected.length < defaultSelected.length;
    final hasClientFilter =
        selectedClients.isNotEmpty &&
        selectedClients.length < totalClients.length;
    final hasDomainFilter = selectedDomain != null;
    return hasTimeFilter ||
        hasStatusFilter ||
        hasClientFilter ||
        hasDomainFilter;
  }

  // ------------------------------------------
  // Provider update (called by ChangeNotifierProxyProvider)
  // ------------------------------------------

  /// Called by `ChangeNotifierProxyProvider2` whenever the repository or
  /// server selection changes. Switches the filter delegate (V5/V6) when the
  /// API version changes.
  ///
  /// When the repository instance changes while the screen is active
  /// (i.e. server switch), reinitializes pagination services and reloads.
  void update({
    MetricsRepository? metricsRepository,
    ServersViewModel? serversViewModel,
  }) {
    final version = serversViewModel?.selectedServer?.apiVersion ?? 'v5';
    if (version != _apiVersion) {
      _apiVersion = version;
      _filters = version == 'v6' ? FiltersV6() : FiltersV5();
    }
    final repositoryChanged =
        metricsRepository != null && metricsRepository != _repository;
    if (metricsRepository != null) {
      _repository = metricsRepository;
    }
    if (repositoryChanged) {
      _filters = version == 'v6' ? FiltersV6() : FiltersV5();
    }
    if (repositoryChanged && _screenActive) {
      _paginationService = LogsPaginationService(repository: _repository!);
      _livePaginationService = LogsPaginationService(repository: _repository!);
      _scheduleInitializeLoad();
    }
  }

  // ------------------------------------------
  // Screen lifecycle
  // ------------------------------------------

  /// Called when Logs screen opens. Initializes pagination and starts loading.
  void initScreen({required double logsPerQuery}) {
    if (_repository == null) return;
    _screenActive = true;
    _logsPerQuery = logsPerQuery;

    _paginationService = LogsPaginationService(repository: _repository!);
    _livePaginationService = LogsPaginationService(repository: _repository!);

    _scheduleInitializeLoad();
  }

  /// Schedules [initializeLoad] after the current frame to avoid calling
  /// [notifyListeners] during the build phase.
  void _scheduleInitializeLoad() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_screenActive) initializeLoad();
    });
  }

  /// Called when Logs screen closes. Stops timers.
  void disposeScreen() {
    _screenActive = false;
    _stopLiveTimer();
  }

  // ------------------------------------------
  // Load management
  // ------------------------------------------

  /// Performs a fresh load: resets the cache, fetches the first page of logs
  /// for the current time window, and starts the live-log timer.
  Future<void> initializeLoad() async {
    _stopLiveTimer();
    _resetLogsCache();
    _isFiltering = false;
    _enableNextWindow = true;
    _loadStatus = LoadStatus.loading;
    notifyListeners();

    final now = DateTime.now();
    final start = _getWindowStart(now);
    _paginationService!.reset(start, now);

    await _enqueueLoad();

    if (_paginationService!.finished == LoadStatus.error) {
      _loadStatus = LoadStatus.error;
      notifyListeners();
      return;
    }

    _loadStatus = LoadStatus.loaded;
    notifyListeners();

    final endTime = _paginationService!.endTime ?? DateTime.now();
    _resetLiveBaseline(endTime: endTime);
    _configureLiveUpdates();
  }

  /// Applies the current filter state and reloads logs.
  ///
  /// When [inStartTime] or [inEndTime] is given, a single page is fetched for
  /// that exact range and further window expansion is disabled.
  Future<void> applyFilterAndLoad({
    DateTime? inStartTime,
    DateTime? inEndTime,
  }) async {
    _stopLiveTimer();
    _loadStatus = LoadStatus.loading;
    _isFiltering = true;
    notifyListeners();

    final endTime = inEndTime ?? DateTime.now();
    final startTime = inStartTime ?? _getWindowStart(endTime);

    if (inStartTime != null || inEndTime != null) {
      _enableNextWindow = false;
      _paginationService!.reset(startTime, endTime);
      _resetLogsCache();
      _isLoadingMore = true;
      notifyListeners();

      final newLogs = await _paginationService!.loadNextPage();
      logger.d('Loaded ${newLogs.length} logs from $startTime to $endTime');

      _isLoadingMore = false;
      notifyListeners();
      _addLogs(newLogs);
    }

    _loadStatus = LoadStatus.loaded;
    notifyListeners();

    final liveEndTime = _paginationService!.endTime ?? DateTime.now();
    _resetLiveBaseline(endTime: liveEndTime);
    _configureLiveUpdates();
  }

  /// Resets the filtering state so that window expansion resumes normally.
  void resetLogs() {
    _enableNextWindow = true;
    _loadStatus = LoadStatus.loaded;
    _isFiltering = false;
    notifyListeners();
  }

  Future<void> _enqueueLoad() async {
    const maxEmptyWindows = 3;

    for (var emptyWindowCount = 0; emptyWindowCount < maxEmptyWindows;) {
      _isLoadingMore = true;
      notifyListeners();

      final newLogs = await _loadNextWithWindowSupport();

      _isLoadingMore = false;
      notifyListeners();

      if (newLogs.isNotEmpty) {
        _addLogs(newLogs);
        return;
      }

      if (_isPaginationFinished) {
        emptyWindowCount++;
      }
    }

    if (_paginationService!.finished == LoadStatus.error) {
      _loadStatus = LoadStatus.error;
      notifyListeners();
      _stopLiveTimer();
    }

    logger.w('Max empty windows reached. Stop loading.');
  }

  /// Triggered by the scroll listener to load the next page of logs.
  ///
  /// No-op when a load is already in progress.
  Future<void> enqueueLoadMore() async {
    if (_isLoadingMore || _paginationService == null) return;
    await _enqueueLoad();
  }

  bool get _isPaginationFinished =>
      _paginationService!.finished == LoadStatus.loaded ||
      _paginationService!.finished == LoadStatus.error;

  Future<List<Log>> _loadNextWithWindowSupport() async {
    if (_paginationService!.finished == LoadStatus.loaded &&
        _enableNextWindow) {
      _moveToPreviousWindow();
    } else if (_paginationService!.finished == LoadStatus.loaded &&
        !_enableNextWindow) {
      logger.w('Pagination finished and loading more is disabled.');
      return [];
    }

    final logs = await _paginationService!.loadNextPage();
    logger.d('Loaded ${logs.length} logs from pagination');
    return logs;
  }

  void _moveToPreviousWindow() {
    final diff = Duration(minutes: (_logsPerQuery * 60).toInt());
    final start = _paginationService!.startTime!.subtract(diff);
    final end = _paginationService!.startTime!;
    logger.d('Advancing window to $start - $end');
    _paginationService!.reset(start, end);
  }

  DateTime _getWindowStart(DateTime end) {
    return end.subtract(Duration(minutes: (_logsPerQuery * 60).toInt()));
  }

  // ------------------------------------------
  // Log cache (dedup)
  // ------------------------------------------

  void _resetLogsCache() {
    _logsList = [];
    _loadedLogKeys.clear();
  }

  void _addLogs(List<Log> logs, {bool prepend = false}) {
    final uniqueLogs = _filterNewLogs(logs);
    if (uniqueLogs.isEmpty) return;

    if (prepend) {
      _logsList = [...uniqueLogs, ..._logsList];
    } else {
      _logsList = [..._logsList, ...uniqueLogs];
    }
    notifyListeners();
  }

  List<Log> _filterNewLogs(List<Log> logs) {
    final unique = <Log>[];
    for (final log in logs) {
      final key = _logKey(log);
      if (_loadedLogKeys.add(key)) {
        unique.add(log);
      }
    }
    return unique;
  }

  String _logKey(Log log) {
    if (log.id != null) return 'id_${log.id}';
    return [
      log.dateTime.microsecondsSinceEpoch,
      log.type.name,
      log.url,
      log.device,
    ].join('|');
  }

  // ------------------------------------------
  // UI actions
  // ------------------------------------------

  /// Selects a log entry to show in the detail pane.
  void setSelectedLog(Log? log) {
    _selectedLog = log;
    notifyListeners();
  }

  /// Updates the URL search text used by [logsListDisplay].
  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  /// Changes sort order: `0` = newest first, `1` = oldest first.
  void updateSortStatus(int value) {
    if (_sortStatus != value) {
      _sortStatus = value;
      notifyListeners();
    }
  }

  // ------------------------------------------
  // Live log management
  // ------------------------------------------

  /// Called by the widget to update live log configuration from AppConfigViewModel.
  void configureLive({
    required bool liveLogEnabled,
    required bool isLivelogPaused,
    required bool isOnLogsTab,
    required int logAutoRefreshTime,
  }) {
    _liveLogEnabled = liveLogEnabled;
    _isLivelogPaused = isLivelogPaused;
    _isOnLogsTab = isOnLogsTab;
    _logAutoRefreshTime = logAutoRefreshTime;
    _configureLiveUpdates();
  }

  bool get _shouldRunLiveLog {
    if (!_screenActive) return false;
    if (_liveLogsService == null) return false;
    if (!_liveLogEnabled) return false;
    if (_isLivelogPaused) return false;
    if (!_isOnLogsTab) return false;
    if (_loadStatus != LoadStatus.loaded) return false;
    return true;
  }

  void _configureLiveUpdates() {
    if (!_shouldRunLiveLog) {
      _stopLiveTimer();
      return;
    }

    final interval = _logAutoRefreshTime;
    if (interval <= 0) {
      _stopLiveTimer();
      return;
    }

    if (_liveLogTimer != null && _liveLogIntervalSeconds == interval) {
      return;
    }

    _startLiveTimer(interval);
  }

  void _resetLiveBaseline({DateTime? endTime}) {
    if (_livePaginationService == null) return;
    _liveLogsService = LiveLogsService(
      paginationService: _livePaginationService!,
      endTime: endTime ?? DateTime.now(),
    );
  }

  void _startLiveTimer(int intervalSeconds) {
    _stopLiveTimer();
    _liveLogIntervalSeconds = intervalSeconds;
    final adjustedMs = intervalSeconds == 5
        ? intervalSeconds * 1000 - 300
        : intervalSeconds * 1000;
    _liveLogTimer = Timer.periodic(
      Duration(milliseconds: adjustedMs),
      (_) => _handleLiveTick(),
    );
    _handleLiveTick();
  }

  void _stopLiveTimer() {
    if (_liveLogTimer != null) {
      logger.d('Stopping live log timer');
      _liveLogTimer?.cancel();
      _liveLogTimer = null;
      _liveLogIntervalSeconds = null;
      _isLiveTickInProgress = false;
    }
  }

  Future<void> _handleLiveTick() async {
    if (_isLiveTickInProgress) return;
    if (!_shouldRunLiveLog) {
      _stopLiveTimer();
      return;
    }
    if (_isFiltering) {
      logger.d('Skipping live log tick due to active filtering');
      return;
    }

    _isLiveTickInProgress = true;
    try {
      final logs = await _liveLogsService?.tickOnce() ?? const <Log>[];
      if (logs.isEmpty) return;
      _addLogs(logs, prepend: true);
    } catch (error, stackTrace) {
      logger.e('Live log refresh failed: $error', stackTrace: stackTrace);
    } finally {
      _isLiveTickInProgress = false;
    }
  }
}
