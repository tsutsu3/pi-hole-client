import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';

/// A fake [StatusViewModel] for widget tests.
///
/// Allows setting internal state that is normally populated by
/// [StatusViewModel.update] and the auto-refresh cycle.
class FakeStatusViewModel extends StatusViewModel {
  LoadStatus _statusLoading = LoadStatus.loaded;
  LoadStatus _serverStatus = LoadStatus.loaded;
  LoadStatus _overtimeDataLoading = LoadStatus.loaded;
  RealtimeStatus? _realtimeStatus;
  OverTime? _overtimeData;
  FtlDnsMetrics? _ftlDnsMetrics;

  @override
  LoadStatus get getStatusLoading => _statusLoading;

  @override
  LoadStatus get getServerStatus => _serverStatus;

  @override
  bool get isServerLoading => _serverStatus == LoadStatus.loading;

  @override
  RealtimeStatus? get getRealtimeStatus => _realtimeStatus;

  @override
  OverTime? get getOvertimeData => _overtimeData;

  @override
  LoadStatus get getOvertimeDataLoadStatus => _overtimeDataLoading;

  @override
  FtlDnsMetrics? get getFtlDnsMetrics => _ftlDnsMetrics;

  @override
  DnsCache? get getDnsCache => _ftlDnsMetrics?.cache;

  @override
  DnsReplies? get getDnsReplies => _ftlDnsMetrics?.replies;

  // Setters for test state
  // ignore_for_file: avoid_setters_without_getters
  set statusLoading(LoadStatus value) {
    _statusLoading = value;
    notifyListeners();
  }

  set serverStatus(LoadStatus value) {
    _serverStatus = value;
    notifyListeners();
  }

  set overtimeDataLoading(LoadStatus value) {
    _overtimeDataLoading = value;
    notifyListeners();
  }

  set realtimeStatus(RealtimeStatus? value) {
    _realtimeStatus = value;
    notifyListeners();
  }

  set overtimeData(OverTime? value) {
    _overtimeData = value;
    notifyListeners();
  }

  set ftlDnsMetrics(FtlDnsMetrics? value) {
    _ftlDnsMetrics = value;
    notifyListeners();
  }
}
