import 'dart:async';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';

/// Data Auto Refresh Service
///
/// A service that periodically updates the server status data.
class StatusUpdateService {
  StatusUpdateService({
    required ServersProvider serversProvider,
    required StatusProvider statusProvider,
    required AppConfigProvider appConfigProvider,
    required FiltersProvider filtersProvider,
  })  : _serversProvider = serversProvider,
        _statusProvider = statusProvider,
        _appConfigProvider = appConfigProvider,
        _filtersProvider = filtersProvider;

  final ServersProvider _serversProvider;
  final StatusProvider _statusProvider;
  final AppConfigProvider _appConfigProvider;
  final FiltersProvider _filtersProvider;

  Timer? _statusDataTimer;
  Timer? _overTimeDataTimer;
  Timer? _metricsDataTimer;

  int? _previousRefreshTime;
  bool _isAutoRefreshRunning = false;

  bool get isAutoRefreshRunning => _isAutoRefreshRunning;

  /// Extracts client names from the RealtimeStatusResponse and sets them in the filters provider.
  ///
  /// In topSources, client keys are formatted as either:
  /// - `hostname|ip`  (if hostname is available)
  /// - `ip`           (if no hostname is available)
  ///
  /// This method extracts only the hostname part when available.
  /// If no hostname is present, the IP address is used as-is.
  void setClientsFromTopSources(RealtimeStatusResponse statusResult) {
    final clients = statusResult.data!.topSources.keys
        .map((client) => client.split('|').first)
        .toList();
    _filtersProvider.setClients(List<String>.from(clients));
  }

  /// Start timer for auto refresh
  ///
  /// Parameters:
  /// - [runImmediately]: If true, the refresh will start immediately.
  /// - [isDelay]: If true, the refresh will be delayed by a short duration.
  void startAutoRefresh({
    bool runImmediately = true,
    bool isDelay = false,
  }) {
    if (!_isAutoRefreshRunning) {
      logger.d(
        'Starting Auto Refresh: (${_serversProvider.selectedServer?.alias}) ${_serversProvider.selectedServer?.address}',
      );
      _startAutoRefresh(runImmediately: runImmediately, isDelay: isDelay);
    }
  }

  /// Refresh the status data once
  Future<void> refreshOnce() async {
    logger.d('Refresh once Server Status');
    await _refreshOnce();
  }

  void stopAutoRefresh() {
    if (_isAutoRefreshRunning) {
      logger.d(
        'Stop Status Update Service. (${_serversProvider.selectedServer?.alias}) ${_serversProvider.selectedServer?.address}',
      );
      _stopAutoRefresh();
    }
  }

  /// Start timer for auto refresh
  void _startAutoRefresh({
    bool runImmediately = true,
    bool isDelay = false,
  }) {
    if (_isAutoRefreshRunning) return;
    _isAutoRefreshRunning = true;

    _setupStatusDataTimer(runImmediately: runImmediately);
    _setupOverTimeDataTimer(runImmediately: runImmediately, isDelay: isDelay);
    _setupMetricsDataTimer(runImmediately: runImmediately, isDelay: isDelay);
  }

  /// Stop timer for auto refresh
  void _stopAutoRefresh() {
    _isAutoRefreshRunning = false;
    _statusDataTimer?.cancel();
    _overTimeDataTimer?.cancel();
    _metricsDataTimer?.cancel();
    _statusDataTimer = null;
    _overTimeDataTimer = null;
    _metricsDataTimer = null;
  }

  /// Refresh the status data once
  Future<void> _refreshOnce() async {
    // _fetchStatusData issues 8 HTTP requests (4 APIs in 2 batches),
    // so we start it immediately to give it a head start.
    // The others are slightly delayed to avoid overwhelming the connection pool.
    if ((await Future.wait(
      [
        _fetchStatusData(),
        Future.delayed(const Duration(milliseconds: 100))
            .then((_) => _fetchOverTimeData()),
        Future.delayed(const Duration(milliseconds: 100))
            .then((_) => _fetchMetricsData()),
      ],
    ))
        .every((result) => result)) {
      _statusProvider.setIsServerConnected(true);
    } else {
      logger.w(
        'Failed to fetch all status data. ',
      );
      _statusProvider.setIsServerConnected(false);
    }
  }

  Future<bool> _fetchStatusData() async {
    if (_serversProvider.selectedServer == null) return false;

    final apiGateway = _serversProvider.selectedApiGateway;
    final statusResult = await apiGateway?.realtimeStatus(clientCount: 0);

    if (statusResult?.result == APiResponseType.success) {
      _statusProvider.setRealtimeStatus(statusResult!.data!);

      setClientsFromTopSources(statusResult);

      _serversProvider.updateselectedServerStatus(
        statusResult.data!.status == 'enabled',
      );
      return true;
    } else {
      _statusProvider.setStatusLoading(LoadStatus.error);
      return false;
    }
  }

  Future<bool> _fetchOverTimeData() async {
    if (_serversProvider.selectedServer == null) return false;

    final apiGateway = _serversProvider.selectedApiGateway;
    final statusResult = await apiGateway?.fetchOverTimeData();

    if (statusResult?.result == APiResponseType.success) {
      _statusProvider.setOvertimeData(statusResult!.data!);
      _statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loaded);
      _statusProvider.setStatusLoading(LoadStatus.loaded);

      return true;
    } else {
      _statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);
      return false;
    }
  }

  Future<bool> _fetchMetricsData() async {
    if (_serversProvider.selectedServer == null) return false;

    final apiGateway = _serversProvider.selectedApiGateway;
    final metricsResult = await apiGateway?.getMetrics();

    if (metricsResult?.result == APiResponseType.success) {
      _statusProvider.setMetricsInfo(metricsResult!.data!);
      return true;
    } else if (metricsResult?.result == APiResponseType.notSupported) {
      // pihole v5
      return true;
    } else {
      return false;
    }
  }

  // ----------------------------------------
  // Callbacks for StatusData
  // ----------------------------------------
  void _setupStatusDataTimer({bool runImmediately = true}) {
    _previousRefreshTime ??= _appConfigProvider.getAutoRefreshTime;

    Future<void> timerFn({Timer? timer}) async {
      if (_appConfigProvider.getAutoRefreshTime != _previousRefreshTime) {
        logger.d('Auto Refresh Time Changed. Restarting Timer');
        timer?.cancel();
        _previousRefreshTime = _appConfigProvider.getAutoRefreshTime;
        _setupStatusDataTimer();
        return;
      }

      final currentServer = _serversProvider.selectedServer;
      if (currentServer == null) {
        timer?.cancel();
        return;
      }
      final selectedUrlBefore = currentServer.address;

      final apiGateway = _serversProvider.selectedApiGateway;
      final statusResult = await apiGateway?.realtimeStatus(clientCount: 0);

      if (statusResult?.result == APiResponseType.success) {
        _serversProvider.updateselectedServerStatus(
          statusResult!.data!.status == 'enabled',
        );
        _statusProvider.setRealtimeStatus(statusResult.data!);

        setClientsFromTopSources(statusResult);

        if (!_statusProvider.isServerConnected) {
          _statusProvider.setIsServerConnected(true);
        }
      } else {
        if (selectedUrlBefore == currentServer.address) {
          if (_statusProvider.isServerConnected) {
            logger.w(
              'Server disconnected: ${statusResult?.result.name}. ${currentServer.alias} (${currentServer.address})',
            );
            _statusProvider.setIsServerConnected(false);
          }
          if (_statusProvider.getStatusLoading == LoadStatus.loading) {
            _statusProvider.setStatusLoading(LoadStatus.error);
          }
        }
      }
    }

    if (runImmediately) {
      timerFn();
    }

    _statusDataTimer = Timer.periodic(
      Duration(seconds: _appConfigProvider.getAutoRefreshTime!),
      (timer) => timerFn(timer: timer),
    );
  }

  // ----------------------------------------
  // Callbacks for OverTimeData
  // ----------------------------------------
  void _setupOverTimeDataTimer({
    bool runImmediately = true,
    bool isDelay = false,
  }) {
    Future<void> timerFn({Timer? timer}) async {
      final currentServer = _serversProvider.selectedServer;
      if (currentServer == null) {
        timer?.cancel();
        return;
      }
      final statusUrlBefore = currentServer.address;

      final apiGateway = _serversProvider.selectedApiGateway;
      final statusResult = await apiGateway?.fetchOverTimeData();

      if (statusResult?.result == APiResponseType.success) {
        _statusProvider.setOvertimeData(statusResult!.data!);

        _statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loaded);

        if (!_statusProvider.isServerConnected) {
          _statusProvider.setIsServerConnected(true);
        }
      } else {
        if (statusUrlBefore == currentServer.address) {
          if (_statusProvider.isServerConnected) {
            logger.w(
              'Server disconnected: ${statusResult?.result.name}. ${currentServer.alias} (${currentServer.address})',
            );
            _statusProvider.setIsServerConnected(false);
          }
          if (_statusProvider.getOvertimeDataLoadStatus == LoadStatus.loading) {
            _statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);
          }
        }
      }
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

  // ----------------------------------------
  // Callbacks for MetricsData
  // ----------------------------------------
  void _setupMetricsDataTimer({
    bool runImmediately = true,
    bool isDelay = false,
  }) {
    Future<void> timerFn({Timer? timer}) async {
      final currentServer = _serversProvider.selectedServer;
      if (currentServer == null) {
        timer?.cancel();
        return;
      }

      final apiGateway = _serversProvider.selectedApiGateway;
      final metricsResult = await apiGateway?.getMetrics();

      if (metricsResult?.result == APiResponseType.success) {
        _statusProvider.setMetricsInfo(metricsResult!.data!);
      }
    }

    void start() {
      if (runImmediately) {
        timerFn();
      }

      _metricsDataTimer = Timer.periodic(
        Duration(seconds: _appConfigProvider.getAutoRefreshTime!),
        (timer) => timerFn(timer: timer),
      );
    }

    if (isDelay) {
      Future.delayed(const Duration(milliseconds: 100), start);
    } else {
      start();
    }
  }
}
