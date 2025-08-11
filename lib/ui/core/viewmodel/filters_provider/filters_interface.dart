import 'package:pi_hole_client/config/enums.dart';

abstract interface class Filters {
  List<int> get statusAllowedAndRetried;

  List<int> get defaultSelected;

  List<int> get statusSelected;

  String get statusSelectedString;

  DateTime? get startTime;

  DateTime? get endTime;

  List<String> get totalClients;

  List<String> get selectedClients;

  String? get selectedDomain;

  RequestStatus get requestStatus;

  void setStatusSelected(List<int> values);

  void setStartTime(DateTime value);

  void setEndTime(DateTime value);

  void resetFilters();

  void resetTime();

  void resetStatus();

  void setClients(List<String> clients);

  void setSelectedClients(List<String> selectedClients);

  void setSelectedDomain(String? domain);

  void resetClients();

  void setRequestStatus(RequestStatus status);
}
