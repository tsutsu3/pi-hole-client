import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/providers/filters_provider/filters_interface.dart';
import 'package:pi_hole_client/providers/filters_provider/filters_v5.dart';
import 'package:pi_hole_client/providers/filters_provider/filters_v6.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';

class FiltersProvider with ChangeNotifier implements Filters {
  FiltersProvider({ServersProvider? serversProvider}) {
    // Default filtersProvider is FiltersProviderV5.
    // Update filtersPorviders version when update ServersProvider.
    final version = serversProvider?.selectedServer?.apiVersion ?? 'v5';
    _updateFiltersVersion(version);
  }

  late Filters? _filters;

  @override
  List<int> get statusAllowedAndRetried {
    return _filters!.statusAllowedAndRetried;
  }

  @override
  List<int> get defaultSelected {
    return _filters!.defaultSelected;
  }

  @override
  List<int> get statusSelected {
    return _filters!.statusSelected;
  }

  @override
  String get statusSelectedString {
    return _filters!.statusSelectedString;
  }

  @override
  DateTime? get startTime {
    return _filters!.startTime;
  }

  @override
  DateTime? get endTime {
    return _filters!.endTime;
  }

  @override
  List<String> get totalClients {
    return _filters!.totalClients;
  }

  @override
  List<String> get selectedClients {
    return _filters!.selectedClients;
  }

  @override
  String? get selectedDomain {
    return _filters!.selectedDomain;
  }

  @override
  RequestStatus get requestStatus {
    return _filters!.requestStatus;
  }

  void update(ServersProvider? provider) {
    final version = provider?.selectedServer?.apiVersion ?? 'v5';
    _updateFiltersVersion(version);
  }

  @override
  void setStatusSelected(List<int> values) {
    _filters!.setStatusSelected(values);
    notifyListeners();
  }

  @override
  void setStartTime(DateTime value) {
    _filters!.setStartTime(value);
    notifyListeners();
  }

  @override
  void setEndTime(DateTime value) {
    _filters!.setEndTime(value);
    notifyListeners();
  }

  @override
  void resetFilters() {
    _filters!.resetFilters();
    notifyListeners();
  }

  @override
  void resetTime() {
    _filters!.resetTime();
    notifyListeners();
  }

  @override
  void resetStatus() {
    _filters!.resetStatus();
    notifyListeners();
  }

  @override
  void setClients(List<String> clients) {
    _filters!.setClients(clients);
    notifyListeners();
  }

  @override
  void setSelectedClients(List<String> selectedClients) {
    _filters!.setSelectedClients(selectedClients);
    notifyListeners();
  }

  @override
  void setSelectedDomain(String? domain) {
    _filters!.setSelectedDomain(domain);
    notifyListeners();
  }

  @override
  void resetClients() {
    _filters!.resetClients();
    notifyListeners();
  }

  @override
  void setRequestStatus(RequestStatus status) {
    _filters!.setRequestStatus(status);
    notifyListeners();
  }

  void _updateFiltersVersion(String version) {
    _filters = version == 'v5' ? FiltersV5() : FiltersV6();
  }
}
