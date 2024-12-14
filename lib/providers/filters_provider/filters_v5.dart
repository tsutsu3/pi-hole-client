import 'package:pi_hole_client/providers/filters_provider/filters_interface.dart';
import 'package:pi_hole_client/screens/logs/logs_filters_modal.dart';

class FiltersV5 implements Filters {
  List<int> _statusSelected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  DateTime? _startTime;
  DateTime? _endTime;
  List<String> _totalClients = [];
  List<String> _selectedClients = [];
  String? _selectedDomain;
  RequestStatus _requestStatus = RequestStatus.all;
  final List<String> _logStatusString = [
    "Blocked (gravity)",
    "OK (forwarded)",
    "OK (cache)",
    "Blocked (regex blacklist)",
    "Blocked (exact blacklist)",
    "Blocked (external, IP)",
    "Blocked (external, NULL)",
    "Blocked (external, NXRA)",
    "Blocked (gravity, CNAME)",
    "Blocked (regex blacklist, CNAME)",
    "Blocked (exact blacklist, CNAME)",
    "Retried",
    "Retried (ignored)",
    "OK (already forwarded)",
    "Database is busy"
  ];

  @override
  List<int> get defaultSelected {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  }

  @override
  List<int> get statusSelected {
    return _statusSelected;
  }

  @override
  String get statusSelectedString {
    // Convert 1-based index in _statusSelected to 0-based index for _logStatusString.
    return _logStatusString[_statusSelected[0] - 1];
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
    if (values == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]) {
      _requestStatus = RequestStatus.all;
    } else if (values == [2, 3]) {
      _requestStatus = RequestStatus.allowed;
    } else if (values == [1, 4, 5, 6, 7, 8, 9, 10, 11, 14]) {
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
    _statusSelected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
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
    _statusSelected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
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
      _statusSelected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    } else if (status == RequestStatus.allowed) {
      _statusSelected = [2, 3];
    } else if (status == RequestStatus.blocked) {
      _statusSelected = [1, 4, 5, 6, 7, 8, 9, 10, 11];
    }
  }
}
