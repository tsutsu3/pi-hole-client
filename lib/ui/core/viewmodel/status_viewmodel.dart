import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase_v5.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase_v6.dart';
import 'package:pi_hole_client/utils/logger.dart';

/// ViewModel for the Home and Statistics screens.
///
/// Manages periodic polling of Pi-hole server status data (realtime status,
/// overtime charts, FTL metrics) and exposes the cached results to the UI.
///
/// Replaces the former `StatusUpdateService` + dumb `StatusViewModel` pair.
/// All timer/fetch logic now lives here; ViewModel→ViewModel communication
/// is eliminated via value + callback injection through [update].
class StatusViewModel with ChangeNotifier {
  // ---------------------------------------------------------------------------
  // Dependencies (injected via [update] from ProxyProvider)
  // ---------------------------------------------------------------------------
  RealtimeStatusRepository? _realtimeStatusRepository;
  MetricsRepository? _metricsRepository;
  DnsRepository? _dnsRepository;
  FtlRepository? _ftlRepository;
  String? _apiVersion;

  // Values extracted from ServersViewModel / AppConfigViewModel.
  // No ViewModel references are held — only primitive values + callbacks.
  String? _selectedServerAddress;
  String? _selectedServerAlias;
  bool _isConnecting = false;
  int? _autoRefreshTime;
  void Function(bool)? _onUpdateServerStatus;

  // ---------------------------------------------------------------------------
  // State
  // ---------------------------------------------------------------------------
  LoadStatus _serverStatus = LoadStatus.loading;
  LoadStatus _statusLoading = LoadStatus.loading;
  LoadStatus _overtimeDataLoading = LoadStatus.loading;
  RealtimeStatus? _realtimeStatus;
  OverTime? _overtimeData;
  FtlDnsMetrics? _ftlDnsMetrics;

  // ---------------------------------------------------------------------------
  // Timer management
  // ---------------------------------------------------------------------------
  Timer? _statusDataTimer;
  Timer? _overTimeDataTimer;
  Timer? _metricsDataTimer;
  int? _previousRefreshTime;
  bool _isAutoRefreshRunning = false;

  // ---------------------------------------------------------------------------
  // Getters — API unchanged from the former StatusViewModel so that all 15+
  // UI widgets using `context.select<StatusViewModel, ...>` need zero changes.
  // ---------------------------------------------------------------------------
  LoadStatus get getServerStatus => _serverStatus;

  bool get isServerLoading => _serverStatus == LoadStatus.loading;

  RealtimeStatus? get getRealtimeStatus => _realtimeStatus;

  LoadStatus get getStatusLoading => _statusLoading;

  OverTime? get getOvertimeData => _overtimeData;

  FtlDnsMetrics? get getFtlDnsMetrics => _ftlDnsMetrics;

  DnsCache? get getDnsCache => _ftlDnsMetrics?.cache;

  DnsReplies? get getDnsReplies => _ftlDnsMetrics?.replies;

  LoadStatus get getOvertimeDataLoadStatus => _overtimeDataLoading;

  bool get isAutoRefreshRunning => _isAutoRefreshRunning;

  /// Derived getter: extracts client hostnames from the current
  /// [RealtimeStatus]. Used by `LogsViewModel` via ProxyProvider to replace
  /// the former `StatusUpdateService._setClientsFromTopSources()` push.
  ///
  /// In topSources, client keys are formatted as either:
  /// - `hostname|ip`  (if hostname is available)
  /// - `ip`           (if no hostname is available)
  List<String> get topClientNames {
    if (_realtimeStatus == null) return [];
    return _realtimeStatus!.topClients.topSources
        .map((source) => source.source.split('|').first)
        .toList();
  }

  // ---------------------------------------------------------------------------
  // update() — called by ChangeNotifierProxyProvider2 whenever
  // RepositoryBundle or ServersViewModel changes.
  // ---------------------------------------------------------------------------
  void update({
    RealtimeStatusRepository? realtimeStatusRepository,
    MetricsRepository? metricsRepository,
    DnsRepository? dnsRepository,
    FtlRepository? ftlRepository,
    String? apiVersion,
    String? selectedServerAddress,
    String? selectedServerAlias,
    bool isConnecting = false,
    int? autoRefreshTime,
    void Function(bool)? onUpdateServerStatus,
  }) {
    final serverChanged = selectedServerAddress != _selectedServerAddress;

    _realtimeStatusRepository = realtimeStatusRepository;
    _metricsRepository = metricsRepository;
    _dnsRepository = dnsRepository;
    _ftlRepository = ftlRepository;
    _apiVersion = apiVersion;
    _selectedServerAddress = selectedServerAddress;
    _selectedServerAlias = selectedServerAlias;
    _isConnecting = isConnecting;
    _autoRefreshTime = autoRefreshTime;
    _onUpdateServerStatus = onUpdateServerStatus;

    // When the server changes, reset all state (functionally equivalent to
    // disposing and recreating the ViewModel).
    if (serverChanged) {
      final wasRunning = _isAutoRefreshRunning;
      stopAutoRefresh();
      _realtimeStatus = null;
      _overtimeData = null;
      _ftlDnsMetrics = null;
      // When auto-refresh was already running (e.g. ServerConnectionService
      // just set serverStatus=loaded and called startAutoRefresh), preserve
      // _serverStatus to avoid a visible "disconnected" flicker.  The
      // restarted auto-refresh will update it on success/failure.
      if (!wasRunning) {
        _serverStatus = LoadStatus.loading;
      }
      _statusLoading = LoadStatus.loading;
      _overtimeDataLoading = LoadStatus.loading;
      notifyListeners();

      // If auto-refresh was running before the server change (e.g. started by
      // Base or ServerConnectionService), restart it with the new server's
      // repositories.  Deferred via microtask so that notifyListeners() during
      // the Provider build phase doesn't cause a re-entrant build.
      if (wasRunning && _selectedServerAddress != null) {
        Future.microtask(() {
          if (!_isAutoRefreshRunning && _selectedServerAddress != null) {
            startAutoRefresh();
          }
        });
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Public methods — used by ServerConnectionService, Base, etc.
  // ---------------------------------------------------------------------------

  /// Sets the server connection status imperatively.
  /// Used by `ServerConnectionService` during server connection flow.
  void setServerStatus(LoadStatus status) {
    _serverStatus = status;
    notifyListeners();
  }

  /// Start timer for auto refresh.
  ///
  /// - [runImmediately]: If true, the refresh will start immediately.
  /// - [isDelay]: If true, the refresh will be delayed by a short duration.
  /// - [showLoadingIndicator]: If true, shows a loading indicator during the
  ///   refresh.
  void startAutoRefresh({
    bool runImmediately = true,
    bool isDelay = false,
    bool showLoadingIndicator = true,
  }) {
    if (!_isAutoRefreshRunning) {
      logger.d(
        'Starting Auto Refresh: '
        '($_selectedServerAlias) $_selectedServerAddress',
      );
      _startAutoRefresh(
        runImmediately: runImmediately,
        isDelay: isDelay,
        showLoadingIndicator: showLoadingIndicator,
      );
    }
  }

  /// Refresh the status data once. Returns true if all data fetched
  /// successfully.
  Future<bool> refreshOnce() async {
    logger.d('Refresh once Server Status');
    return _refreshOnce();
  }

  /// Stop auto-refresh timers.
  void stopAutoRefresh({bool showLoadingIndicator = true}) {
    if (_isAutoRefreshRunning) {
      logger.d(
        'Stop Auto Refresh: '
        '($_selectedServerAlias) $_selectedServerAddress',
      );
      _stopAutoRefresh(showLoadingIndicator: showLoadingIndicator);
    }
  }

  // ---------------------------------------------------------------------------
  // Private — auto-refresh lifecycle
  // ---------------------------------------------------------------------------

  void _startAutoRefresh({
    bool runImmediately = true,
    bool isDelay = false,
    bool showLoadingIndicator = true,
  }) {
    if (_isAutoRefreshRunning) return;
    _isAutoRefreshRunning = true;

    if (showLoadingIndicator) {
      _statusLoading = LoadStatus.loading;
      _overtimeDataLoading = LoadStatus.loading;
      notifyListeners();
    } else {
      // Skip loading UI on resume, but still notify listeners to trigger
      // data reload.
      notifyListeners();
    }

    _setupStatusDataTimer(runImmediately: runImmediately);
    _setupOverTimeDataTimer(runImmediately: runImmediately, isDelay: isDelay);
    _setupMetricsDataTimer(runImmediately: runImmediately, isDelay: isDelay);
  }

  void _stopAutoRefresh({bool showLoadingIndicator = true}) {
    if (showLoadingIndicator) {
      _statusLoading = LoadStatus.loading;
      _overtimeDataLoading = LoadStatus.loading;
      notifyListeners();
    }

    _isAutoRefreshRunning = false;
    _statusDataTimer?.cancel();
    _overTimeDataTimer?.cancel();
    _metricsDataTimer?.cancel();
    _statusDataTimer = null;
    _overTimeDataTimer = null;
    _metricsDataTimer = null;
  }

  // ---------------------------------------------------------------------------
  // Private — one-shot refresh
  // ---------------------------------------------------------------------------

  Future<bool> _refreshOnce() async {
    // _fetchStatusData issues multiple HTTP requests, so we start it
    // immediately to give it a head start. The others are slightly delayed
    // to avoid overwhelming the connection pool.
    final (statusOk, overtimeOk, metricsOk) = await (
      _fetchStatusData(),
      Future.delayed(
        const Duration(milliseconds: 100),
      ).then((_) => _fetchOverTimeData()),
      Future.delayed(
        const Duration(milliseconds: 100),
      ).then((_) => _fetchMetricsData()),
    ).wait;

    if (statusOk && overtimeOk && metricsOk) {
      _serverStatus = LoadStatus.loaded;
      notifyListeners();
      return true;
    } else {
      logger.w('Failed to fetch all status data.');
      _serverStatus = LoadStatus.error;
      notifyListeners();
      return false;
    }
  }

  // ---------------------------------------------------------------------------
  // Private — data fetchers
  // ---------------------------------------------------------------------------

  /// Creates the appropriate [RealtimeStatusUseCase] based on API version.
  RealtimeStatusUseCase? _createRealtimeStatusUseCase() {
    if (_apiVersion == 'v6') {
      final metrics = _metricsRepository;
      final dns = _dnsRepository;
      if (metrics == null || dns == null) return null;
      return RealtimeStatusUseCaseV6(
        metricsRepository: metrics,
        dnsRepository: dns,
      );
    } else {
      final repo = _realtimeStatusRepository;
      if (repo == null) return null;
      return RealtimeStatusUseCaseV5(repository: repo);
    }
  }

  Future<bool> _fetchStatusData() async {
    if (_selectedServerAddress == null) return false;

    final useCase = _createRealtimeStatusUseCase();
    if (useCase == null) return false;

    final result = await useCase.fetchRealtimeStatus();

    return result.fold(
      (status) {
        _realtimeStatus = status;
        _statusLoading = LoadStatus.loaded;
        _onUpdateServerStatus?.call(status.status == DnsBlockingStatus.enabled);
        notifyListeners();
        return true;
      },
      (error) {
        _statusLoading = LoadStatus.error;
        notifyListeners();
        return false;
      },
    );
  }

  Future<bool> _fetchOverTimeData() async {
    if (_selectedServerAddress == null) return false;

    final metricsRepo = _metricsRepository;
    if (metricsRepo == null) return false;

    final result = await metricsRepo.fetchOverTime();

    return result.fold(
      (overTime) {
        _overtimeData = overTime;
        _overtimeDataLoading = LoadStatus.loaded;
        _statusLoading = LoadStatus.loaded;
        notifyListeners();
        return true;
      },
      (error) {
        _overtimeDataLoading = LoadStatus.error;
        notifyListeners();
        return false;
      },
    );
  }

  Future<bool> _fetchMetricsData() async {
    if (_selectedServerAddress == null) return false;

    final ftlRepo = _ftlRepository;
    if (ftlRepo == null) return false;

    final result = await ftlRepo.fetchInfoMetrics();

    return result.fold(
      (metrics) {
        _ftlDnsMetrics = metrics;
        notifyListeners();
        return true;
      },
      (error) {
        // v5 returns NotSupportedException for metrics — that's OK.
        // Genuine errors (e.g. network) should propagate as failure.
        if (error is NotSupportedException) return true;
        return false;
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Private — timer setup (status data)
  // ---------------------------------------------------------------------------
  void _setupStatusDataTimer({bool runImmediately = true}) {
    _previousRefreshTime ??= _autoRefreshTime;

    Future<void> timerFn({Timer? timer}) async {
      if (_autoRefreshTime != _previousRefreshTime) {
        logger.d('Auto Refresh Time Changed. Restarting Timer');
        timer?.cancel();
        _previousRefreshTime = _autoRefreshTime;
        _setupStatusDataTimer();
        return;
      }

      if (_selectedServerAddress == null) {
        timer?.cancel();
        return;
      }
      final selectedUrlBefore = _selectedServerAddress;

      if (_isConnecting) {
        logger.d(
          'Skipping status data fetch due to ongoing connection attempt',
        );
        return;
      }

      final useCase = _createRealtimeStatusUseCase();
      if (useCase == null) return;

      final result = await useCase.fetchRealtimeStatus();

      if (_selectedServerAddress != selectedUrlBefore) {
        logger.d(
          'Skipping stale status update: server was changed during fetch. '
          'Previous: $selectedUrlBefore, '
          'Selected: $_selectedServerAddress',
        );
        return;
      }

      result.fold(
        (status) {
          _onUpdateServerStatus?.call(
            status.status == DnsBlockingStatus.enabled,
          );
          _realtimeStatus = status;
          _statusLoading = LoadStatus.loaded;
          notifyListeners();

          if (_serverStatus != LoadStatus.loaded) {
            _serverStatus = LoadStatus.loaded;
            notifyListeners();
          }
        },
        (error) {
          if (selectedUrlBefore == _selectedServerAddress) {
            if (_serverStatus == LoadStatus.loaded) {
              logger.w(
                'Server disconnected: $error. '
                '$_selectedServerAlias ($_selectedServerAddress)',
              );
              _serverStatus = LoadStatus.error;
              notifyListeners();
            }
            if (_statusLoading == LoadStatus.loading) {
              _statusLoading = LoadStatus.error;
              notifyListeners();
            }
          }
        },
      );
    }

    if (runImmediately) {
      timerFn();
    }

    _statusDataTimer = Timer.periodic(
      // Add a slight negative offset to avoid
      // 'ClientException: Connection closed before full header was received'.
      // This error occurs frequently on certain devices (e.g. Pixel 6a) when
      // using exact intervals (e.g. 5000ms). Using a slightly shorter interval
      // (e.g. 4700ms) prevents hitting the edge of server-side timeout.
      Duration(milliseconds: _autoRefreshTime! * 1000 - 300),
      (timer) => timerFn(timer: timer),
    );
  }

  // ---------------------------------------------------------------------------
  // Private — timer setup (overtime data)
  // ---------------------------------------------------------------------------
  void _setupOverTimeDataTimer({
    bool runImmediately = true,
    bool isDelay = false,
  }) {
    Future<void> timerFn({Timer? timer}) async {
      if (_selectedServerAddress == null) {
        timer?.cancel();
        return;
      }
      final selectedUrlBefore = _selectedServerAddress;

      if (_isConnecting) {
        logger.d(
          'Skipping overtime data fetch due to ongoing connection attempt',
        );
        return;
      }

      final metricsRepo = _metricsRepository;
      if (metricsRepo == null) return;

      final result = await metricsRepo.fetchOverTime();

      if (_selectedServerAddress != selectedUrlBefore) {
        logger.d(
          'Skipping stale overtime data update: server was changed during '
          'fetch. Previous: $selectedUrlBefore, '
          'Selected: $_selectedServerAddress',
        );
        return;
      }

      result.fold(
        (overTime) {
          _overtimeData = overTime;
          _overtimeDataLoading = LoadStatus.loaded;
          notifyListeners();

          if (_serverStatus != LoadStatus.loaded) {
            _serverStatus = LoadStatus.loaded;
            notifyListeners();
          }
        },
        (error) {
          if (selectedUrlBefore == _selectedServerAddress) {
            if (_serverStatus == LoadStatus.loaded) {
              logger.w(
                'Server disconnected: $error. '
                '$_selectedServerAlias ($_selectedServerAddress)',
              );
              _serverStatus = LoadStatus.error;
              notifyListeners();
            }
            if (_overtimeDataLoading == LoadStatus.loading) {
              _overtimeDataLoading = LoadStatus.error;
              notifyListeners();
            }
          }
        },
      );
    }

    void start() {
      if (runImmediately) {
        timerFn();
      }

      _overTimeDataTimer = Timer.periodic(
        const Duration(minutes: 1),
        (timer) => timerFn(timer: timer),
      );
    }

    if (isDelay) {
      Future.delayed(const Duration(milliseconds: 100), start);
    } else {
      start();
    }
  }

  // ---------------------------------------------------------------------------
  // Private — timer setup (metrics data)
  // ---------------------------------------------------------------------------
  void _setupMetricsDataTimer({
    bool runImmediately = true,
    bool isDelay = false,
  }) {
    Future<void> timerFn({Timer? timer}) async {
      if (_selectedServerAddress == null) {
        timer?.cancel();
        return;
      }
      final selectedUrlBefore = _selectedServerAddress;

      if (_isConnecting) {
        logger.d(
          'Skipping metrics data fetch due to ongoing connection attempt',
        );
        return;
      }

      final ftlRepo = _ftlRepository;
      if (ftlRepo == null) return;

      final result = await ftlRepo.fetchInfoMetrics();

      if (_selectedServerAddress != selectedUrlBefore) {
        logger.d(
          'Skipping stale metrics update: server was changed during fetch. '
          'Previous: $selectedUrlBefore, '
          'Selected: $_selectedServerAddress',
        );
        return;
      }

      result.fold(
        (metrics) {
          _ftlDnsMetrics = metrics;
          notifyListeners();
        },
        (error) {
          // v5 returns NotSupportedException — that's OK
        },
      );
    }

    void start() {
      if (runImmediately) {
        timerFn();
      }

      _metricsDataTimer = Timer.periodic(
        Duration(seconds: _autoRefreshTime!),
        (timer) => timerFn(timer: timer),
      );
    }

    if (isDelay) {
      Future.delayed(const Duration(milliseconds: 100), start);
    } else {
      start();
    }
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------
  @override
  void dispose() {
    _statusDataTimer?.cancel();
    _overTimeDataTimer?.cancel();
    _metricsDataTimer?.cancel();
    super.dispose();
  }
}
