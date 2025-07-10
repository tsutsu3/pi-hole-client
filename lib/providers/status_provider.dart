import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/models/metrics.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/models/realtime_status.dart';

class StatusProvider with ChangeNotifier {
  LoadStatus _serverStatus = LoadStatus.loading;

  LoadStatus _statusLoading = LoadStatus.loading;
  RealtimeStatus? _realtimeStatus;
  MetricsInfo? _metricsInfo;

  LoadStatus _overtimeDataLoading = LoadStatus.loading;
  OverTimeData? _overtimeData;

  LoadStatus get getServerStatus {
    return _serverStatus;
  }

  bool get isServerLoading {
    return _serverStatus == LoadStatus.loading;
  }

  RealtimeStatus? get getRealtimeStatus {
    return _realtimeStatus;
  }

  LoadStatus get getStatusLoading {
    return _statusLoading;
  }

  OverTimeData? get getOvertimeData {
    return _overtimeData;
  }

  MetricsInfo? get getMetricsInfo {
    return _metricsInfo;
  }

  DnsCacheInfo? get getDnsCacheInfo {
    if (_metricsInfo != null) {
      return _metricsInfo!.dnsCache;
    }

    return null;
  }

  DnsRepliesInfo? get getDnsRepliesInfo {
    if (_metricsInfo != null) {
      return _metricsInfo!.dnsReplies;
    }

    return null;
  }

  Map<String, dynamic>? get getOvertimeDataJson {
    if (_overtimeData != null) {
      return _overtimeData!.toJson();
    } else {
      return null;
    }
  }

  LoadStatus get getOvertimeDataLoadStatus {
    return _overtimeDataLoading;
  }

  void setServerStatus(LoadStatus status) {
    _serverStatus = status;
    notifyListeners();
  }

  void setStatusLoading(LoadStatus status) {
    _statusLoading = status;
    notifyListeners();
  }

  void setRealtimeStatus(RealtimeStatus realtimeStatus) {
    _realtimeStatus = realtimeStatus;
    _statusLoading = LoadStatus.loaded;
    notifyListeners();
  }

  void setOvertimeDataLoadingStatus(LoadStatus status) {
    _overtimeDataLoading = status;
    notifyListeners();
  }

  void setOvertimeData(OverTimeData value) {
    _overtimeData = value;
    notifyListeners();
  }

  void setMetricsInfo(MetricsInfo value) {
    _metricsInfo = value;
    notifyListeners();
  }
}
