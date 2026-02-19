import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';

class StatusViewModel with ChangeNotifier {
  LoadStatus _serverStatus = LoadStatus.loading;

  LoadStatus _statusLoading = LoadStatus.loading;
  RealtimeStatus? _realtimeStatus;
  FtlDnsMetrics? _ftlDnsMetrics;

  LoadStatus _overtimeDataLoading = LoadStatus.loading;
  OverTime? _overtimeData;

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

  OverTime? get getOvertimeData {
    return _overtimeData;
  }

  FtlDnsMetrics? get getFtlDnsMetrics {
    return _ftlDnsMetrics;
  }

  DnsCache? get getDnsCache {
    return _ftlDnsMetrics?.cache;
  }

  DnsReplies? get getDnsReplies {
    return _ftlDnsMetrics?.replies;
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

  void setOvertimeData(OverTime value) {
    _overtimeData = value;
    notifyListeners();
  }

  void setFtlDnsMetrics(FtlDnsMetrics value) {
    _ftlDnsMetrics = value;
    notifyListeners();
  }
}
