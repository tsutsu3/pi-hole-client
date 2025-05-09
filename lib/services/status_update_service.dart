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

  int? _previousRefreshTime;
  bool _isAutoRefreshRunning = false;

  bool get isAutoRefreshRunning => _isAutoRefreshRunning;

  /// Start timer for auto refresh
  void startAutoRefresh() {
    if (!_isAutoRefreshRunning) {
      logger.d('Starting Auto Refresh');
      _startAutoRefresh();
    }
  }

  /// Refresh the status data once
  Future<void> refreshOnce() async {
    logger.d('Refresh once Server Status');
    await _refreshOnce();
  }

  void stopAutoRefresh() {
    if (_isAutoRefreshRunning) {
      logger.d('Disposing Status Update Service');
      _stopAutoRefresh();
    }
  }

  /// Start timer for auto refresh
  void _startAutoRefresh() {
    if (_isAutoRefreshRunning) return;
    _isAutoRefreshRunning = true;

    _setupStatusDataTimer();
    _setupOverTimeDataTimer();
  }

  /// Stop timer for auto refresh
  void _stopAutoRefresh() {
    _isAutoRefreshRunning = false;
    _statusDataTimer?.cancel();
    _overTimeDataTimer?.cancel();
    _statusDataTimer = null;
    _overTimeDataTimer = null;
  }

  /// Refresh the status data once
  Future<void> _refreshOnce() async {
    if ((await Future.wait([_fetchStatusData(), _fetchOverTimeData()]))
        .every((result) => result)) {
      _statusProvider.setIsServerConnected(true);
    } else {
      _statusProvider.setIsServerConnected(false);
    }
  }

  Future<bool> _fetchStatusData() async {
    if (_serversProvider.selectedServer == null) return false;

    final apiGateway = _serversProvider.selectedApiGateway;
    final statusResult = await apiGateway?.realtimeStatus();

    if (statusResult?.result == APiResponseType.success) {
      _statusProvider.setRealtimeStatus(statusResult!.data!);
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
      _statusProvider.setOvertimeDataLoadingStatus(1);
      _statusProvider.setStatusLoading(LoadStatus.loaded);

      final List<String?> clients = statusResult.data!.clients.map((client) {
        return client.name.isNotEmpty ? client.name : client.ip;
      }).toList();
      _filtersProvider.setClients(List<String>.from(clients));

      return true;
    } else {
      _statusProvider.setOvertimeDataLoadingStatus(2);
      return false;
    }
  }

  // ----------------------------------------
  // Callbacks for StatusData
  // ----------------------------------------
  void _setupStatusDataTimer() {
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
      final statusResult = await apiGateway?.realtimeStatus();

      if (statusResult?.result == APiResponseType.success) {
        _serversProvider.updateselectedServerStatus(
          statusResult!.data!.status == 'enabled',
        );
        _statusProvider.setRealtimeStatus(statusResult.data!);

        if (!_statusProvider.isServerConnected) {
          _statusProvider.setIsServerConnected(true);
        }
      } else {
        if (selectedUrlBefore == currentServer.address) {
          if (_statusProvider.isServerConnected) {
            _statusProvider.setIsServerConnected(false);
          }
          if (_statusProvider.getStatusLoading == LoadStatus.loading) {
            _statusProvider.setStatusLoading(LoadStatus.error);
          }
        }
      }
    }

    timerFn();
    _statusDataTimer = Timer.periodic(
      Duration(seconds: _appConfigProvider.getAutoRefreshTime!),
      (timer) => timerFn(timer: timer),
    );
  }

  // ----------------------------------------
  // Callbacks for OverTimeData
  // ----------------------------------------
  void _setupOverTimeDataTimer() {
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

        final List<String?> clients = statusResult.data!.clients.map((client) {
          return client.name.isNotEmpty ? client.name : client.ip;
        }).toList();
        _filtersProvider.setClients(List<String>.from(clients));

        _statusProvider.setOvertimeDataLoadingStatus(1);

        if (!_statusProvider.isServerConnected) {
          _statusProvider.setIsServerConnected(true);
        }
      } else {
        if (statusUrlBefore == currentServer.address) {
          if (_statusProvider.isServerConnected) {
            _statusProvider.setIsServerConnected(false);
          }
          if (_statusProvider.getOvertimeDataLoadStatus == 0) {
            _statusProvider.setOvertimeDataLoadingStatus(2);
          }
        }
      }
    }

    timerFn();
    _overTimeDataTimer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) => timerFn(timer: timer),
    );
  }
}
