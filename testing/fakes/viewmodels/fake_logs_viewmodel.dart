import 'dart:ui';

import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

/// A fake [LogsViewModel] for widget tests.
///
/// Allows setting internal state directly. All filter state, screen state,
/// and action methods can be controlled for test scenarios.
class FakeLogsViewModel extends LogsViewModel {
  // --- Screen state ---

  LoadStatus _loadStatus = LoadStatus.loaded;
  List<Log> _logsList = [];
  List<Log>? _logsListDisplay;
  int _sortStatus = 0;
  bool _isLoadingMore = false;
  Log? _selectedLog;
  String _searchText = '';
  bool _hasActiveChips = false;
  bool _screenActive = true;
  bool _isFiltering = false;
  double _logsPerQuery = 2.0;

  // --- Filter state ---

  List<int> _statusSelected = [];
  List<String> _selectedClients = [];
  String? _selectedDomain;
  DateTime? _startTime;
  DateTime? _endTime;
  List<String> _totalClients = [];
  List<int> _statusAllowedAndRetried = [];
  RequestStatus _requestStatus = RequestStatus.all;
  List<int> _defaultSelected = [];

  // --- Call tracking ---

  int setSearchTextCallCount = 0;
  String? lastSearchText;

  int setSelectedLogCallCount = 0;
  int setRequestStatusCallCount = 0;
  RequestStatus? lastRequestStatus;

  int updateSortStatusCallCount = 0;
  int? lastSortStatus;

  int initScreenCallCount = 0;
  int disposeScreenCallCount = 0;
  int initializeLoadCallCount = 0;
  int applyFilterAndLoadCallCount = 0;
  int configureLiveCallCount = 0;
  int addDomainToListCallCount = 0;

  // --- Getters ---

  @override
  LoadStatus get loadStatus => _loadStatus;

  @override
  List<Log> get logsList => _logsList;

  @override
  List<Log> get logsListDisplay => _logsListDisplay ?? _logsList;

  @override
  int get sortStatus => _sortStatus;

  @override
  bool get isLoadingMore => _isLoadingMore;

  @override
  Log? get selectedLog => _selectedLog;

  @override
  String get searchText => _searchText;

  @override
  bool get hasActiveChips => _hasActiveChips;

  @override
  bool get screenActive => _screenActive;

  @override
  bool get isFiltering => _isFiltering;

  @override
  double get logsPerQuery => _logsPerQuery;

  @override
  List<int> get statusSelected => _statusSelected;

  @override
  List<String> get selectedClients => _selectedClients;

  @override
  String? get selectedDomain => _selectedDomain;

  @override
  DateTime? get startTime => _startTime;

  @override
  DateTime? get endTime => _endTime;

  @override
  List<String> get totalClients => _totalClients;

  @override
  List<int> get statusAllowedAndRetried => _statusAllowedAndRetried;

  @override
  RequestStatus get requestStatus => _requestStatus;

  @override
  List<int> get defaultSelected => _defaultSelected;

  @override
  bool isAllowedOrRetried(QueryStatusType? status) => true;

  // --- Setters for test state ---

  set loadStatus(LoadStatus value) {
    _loadStatus = value;
    notifyListeners();
  }

  set logsList(List<Log> value) {
    _logsList = value;
    if (_logsListDisplay == null) {
      logsDisplayNotifier.value = value;
    }
    notifyListeners();
  }

  set logsListDisplay(List<Log>? value) {
    _logsListDisplay = value;
    logsDisplayNotifier.value = value ?? _logsList;
    notifyListeners();
  }

  set sortStatus(int value) {
    _sortStatus = value;
    notifyListeners();
  }

  set selectedLog(Log? value) {
    _selectedLog = value;
    notifyListeners();
  }

  set searchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  set hasActiveChips(bool value) {
    _hasActiveChips = value;
    notifyListeners();
  }

  set screenActive(bool value) {
    _screenActive = value;
    notifyListeners();
  }

  set isFiltering(bool value) {
    _isFiltering = value;
    notifyListeners();
  }

  set logsPerQuery(double value) {
    _logsPerQuery = value;
    notifyListeners();
  }

  set statusSelected(List<int> value) {
    _statusSelected = value;
    notifyListeners();
  }

  set selectedClients(List<String> value) {
    _selectedClients = value;
    notifyListeners();
  }

  set selectedDomain(String? value) {
    _selectedDomain = value;
    notifyListeners();
  }

  set startTime(DateTime? value) {
    _startTime = value;
    notifyListeners();
  }

  set endTime(DateTime? value) {
    _endTime = value;
    notifyListeners();
  }

  set totalClients(List<String> value) {
    _totalClients = value;
    notifyListeners();
  }

  set statusAllowedAndRetried(List<int> value) {
    _statusAllowedAndRetried = value;
    notifyListeners();
  }

  set requestStatus(RequestStatus value) {
    _requestStatus = value;
    notifyListeners();
  }

  set defaultSelected(List<int> value) {
    _defaultSelected = value;
    notifyListeners();
  }

  set isLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }

  // --- Method overrides with tracking ---

  @override
  void setSearchText(String text) {
    _searchText = text;
    setSearchTextCallCount++;
    lastSearchText = text;
    notifyListeners();
  }

  @override
  void setSelectedLog(Log? log) {
    _selectedLog = log;
    setSelectedLogCallCount++;
    notifyListeners();
  }

  @override
  void setRequestStatus(RequestStatus status) {
    _requestStatus = status;
    setRequestStatusCallCount++;
    lastRequestStatus = status;
    notifyListeners();
  }

  @override
  void updateSortStatus(int value) {
    _sortStatus = value;
    updateSortStatusCallCount++;
    lastSortStatus = value;
    notifyListeners();
  }

  @override
  void initScreen({required double logsPerQuery}) {
    _logsPerQuery = logsPerQuery;
    initScreenCallCount++;
  }

  @override
  void disposeScreen() {
    disposeScreenCallCount++;
  }

  @override
  Future<void> initializeLoad() async {
    initializeLoadCallCount++;
  }

  @override
  Future<void> applyFilterAndLoad({
    DateTime? inStartTime,
    DateTime? inEndTime,
  }) async {
    applyFilterAndLoadCallCount++;
  }

  @override
  Future<void> enqueueLoadMore() async {}

  @override
  void resetLogs() {}

  @override
  void configureLive({
    required bool liveLogEnabled,
    required bool isLivelogPaused,
    required bool isOnLogsTab,
    required int logAutoRefreshTime,
  }) {
    configureLiveCallCount++;
  }

  @override
  Future<Result<Domain>> addDomainToList({
    required String list,
    required String domain,
  }) async {
    addDomainToListCallCount++;
    return Success(
      Domain(
        id: 1,
        name: domain,
        punyCode: domain,
        type: list == 'white' ? DomainType.allow : DomainType.deny,
        kind: DomainKind.exact,
        comment: null,
        groups: const [0],
        enabled: true,
        dateAdded: DateTime.now(),
        dateModified: DateTime.now(),
      ),
    );
  }

  @override
  void resetFilters() {}

  @override
  void resetTime() {}

  @override
  void resetStatus() {}

  @override
  void resetClients() {}

  @override
  void setSelectedDomain(String? domain) {
    _selectedDomain = domain;
    notifyListeners();
  }

  @override
  void setStatusSelected(List<int> values) {
    _statusSelected = values;
    notifyListeners();
  }

  @override
  void setSelectedClients(List<String> selectedClients) {
    _selectedClients = selectedClients;
    notifyListeners();
  }

  @override
  void setStartTime(DateTime value) {
    _startTime = value;
    notifyListeners();
  }

  @override
  void setEndTime(DateTime value) {
    _endTime = value;
    notifyListeners();
  }

  @override
  void setClients(List<String> clients) {
    _totalClients = clients;
    notifyListeners();
  }

  @override
  void resumeScreen() {}

  @override
  void update({
    MetricsRepository? metricsRepository,
    DomainRepository? domainRepository,
    String? apiVersion,
    List<String>? topClientNames,
    VoidCallback? onRefreshClients,
  }) {}
}
