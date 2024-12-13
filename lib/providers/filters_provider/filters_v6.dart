import 'package:pi_hole_client/providers/filters_provider/filters_interface.dart';
import 'package:pi_hole_client/screens/logs/logs_filters_modal.dart';

class FiltersV6 implements Filters {
  List<int> _statusSelected = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18
  ];
  DateTime? _startTime;
  DateTime? _endTime;
  List<String> _totalClients = [];
  List<String> _selectedClients = [];
  String? _selectedDomain;
  RequestStatus _requestStatus = RequestStatus.all;
  final List<String> _logStatusString = [
    // OKs
    "FORWARDED",
    "CACHE",
    // NGs
    "REGEX",
    "GRAVITY",
    "DENYLIST",
    "EXTERNAL_BLOCKED_IP",
    "EXTERNAL_BLOCKED_NULL",
    "EXTERNAL_BLOCKED_NXRA",
    "EXTERNAL_BLOCKED_EDE15",
    "DENYLIST_CNAME",
    "GRAVITY_CNAME",
    "REGEX_CNAME",
    // Others
    "CACHE_STALE",
    "RETRIED",
    "RETRIED_DNSSEC",
    "IN_PROGRESS",
    "SPECIAL_DOMAIN",
    "UNKNOWN",
    // Not a status
    "DBBUSY",
  ];

  @override
  List<int> get statusSelected {
    return _statusSelected;
  }

  @override
  String get statusSelectedString {
    return _logStatusString[_statusSelected[0]];
  }

  @override
  DateTime? get startTime {
    return _startTime;
  }

  @override
  DateTime? get endTime {
    return _endTime;
  }

  @override
  List<String> get totalClients {
    return _totalClients;
  }

  @override
  List<String> get selectedClients {
    return _selectedClients;
  }

  @override
  String? get selectedDomain {
    return _selectedDomain;
  }

  @override
  RequestStatus get requestStatus {
    return _requestStatus;
  }

  @override
  void setStatusSelected(List<int> values) {
    _statusSelected = values;
    if (values ==
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]) {
      _requestStatus = RequestStatus.all;
    } else if (values == [1, 2]) {
      _requestStatus = RequestStatus.allowed;
    } else if (values == [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]) {
      _requestStatus = RequestStatus.blocked;
    }
  }

  @override
  void setStartTime(DateTime value) {
    _startTime = value;
  }

  @override
  void setEndTime(DateTime value) {
    _endTime = value;
  }

  @override
  void resetFilters() {
    _statusSelected = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18
    ];
    _requestStatus = RequestStatus.all;
    _startTime = null;
    _endTime = null;
    _selectedClients = _totalClients;
    _selectedDomain = null;
  }

  @override
  void resetTime() {
    _startTime = null;
    _endTime = null;
  }

  @override
  void resetStatus() {
    _statusSelected = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18
    ];
    _requestStatus = RequestStatus.all;
  }

  @override
  void setClients(List<String> clients) {
    if (_totalClients.isEmpty) {
      _selectedClients = clients;
    }
    _totalClients = clients;
  }

  @override
  void setSelectedClients(List<String> selectedClients) {
    _selectedClients = selectedClients;
  }

  @override
  void setSelectedDomain(String? domain) {
    _selectedDomain = domain;
  }

  @override
  void resetClients() {
    _selectedClients = _totalClients;
  }

  @override
  void setRequestStatus(RequestStatus status) {
    _requestStatus = status;
    if (status == RequestStatus.all) {
      _statusSelected = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18
      ];
    } else if (status == RequestStatus.allowed) {
      _statusSelected = [1, 2];
    } else if (status == RequestStatus.blocked) {
      _statusSelected = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    }
  }
}
