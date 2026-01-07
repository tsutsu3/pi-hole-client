import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

class ClientsListProvider with ChangeNotifier {
  ClientsListProvider({required this.serversProvider});

  ServersProvider? serversProvider;

  static const MapEquality<String, String> _stringMapEquality =
      MapEquality<String, String>();
  static const MapEquality<int, String> _intStringMapEquality =
      MapEquality<int, String>();

  LoadStatus _loadingStatus = LoadStatus.loading;
  List<ClientItem> _clients = [];
  List<ClientItem> _filteredClients = [];
  Map<String, String> _ipToMac = {};
  Map<int, String> _groupNames = {};

  String _searchTerm = '';
  bool _searchMode = false;

  LoadStatus get loadingStatus => _loadingStatus;
  List<ClientItem> get clients => _clients;
  List<ClientItem> get filteredClients => _filteredClients;
  String get searchTerm => _searchTerm;
  bool get searchMode => _searchMode;

  void update(ServersProvider? provider) {
    serversProvider = provider;
  }

  void setLoadingStatus(LoadStatus status) {
    _loadingStatus = status;
    notifyListeners();
  }

  void setSearchMode(bool value) {
    _searchMode = value;
    notifyListeners();
  }

  void updateMacLookup(Map<String, String> ipToMac) {
    if (_stringMapEquality.equals(_ipToMac, ipToMac)) {
      return;
    }
    _ipToMac = Map<String, String>.from(ipToMac);
    if (_searchTerm.isNotEmpty) {
      onSearch(_searchTerm);
    }
  }

  void updateGroupLookup(Map<int, String> groupNames) {
    if (_intStringMapEquality.equals(_groupNames, groupNames)) {
      return;
    }
    _groupNames = Map<int, String>.from(groupNames);
    if (_searchTerm.isNotEmpty) {
      onSearch(_searchTerm);
    }
  }

  void onSearch(String value) {
    _searchTerm = value;

    if (value.isNotEmpty) {
      _filteredClients = _clients
          .where((client) => _matchesSearch(client, value))
          .toList();
    } else {
      _filteredClients = _clients;
    }

    notifyListeners();
  }

  Future<void> fetchClients() async {
    final apiGateway = serversProvider?.selectedApiGateway;
    final result = await apiGateway?.getClients();
    if (result?.result == APiResponseType.success) {
      _clients = result?.data?.clients ?? [];
      _filteredClients = _clients
          .where((client) => _matchesSearch(client, _searchTerm))
          .toList();
      _loadingStatus = LoadStatus.loaded;
    } else {
      _loadingStatus = LoadStatus.error;
    }
    notifyListeners();
  }

  void removeClientFromList(ClientItem client) {
    _clients = _clients.where((item) => item.id != client.id).toList();
    _filteredClients = _filteredClients
        .where((item) => item.id != client.id)
        .toList();
    notifyListeners();
  }

  bool _matchesSearch(ClientItem client, String rawTerm) {
    final term = rawTerm.toLowerCase();
    final name = (client.name ?? '').toLowerCase();
    final comment = (client.comment ?? '').toLowerCase();
    final clientId = client.client.toLowerCase();
    final mac = (_ipToMac[client.client] ?? '').toLowerCase();
    final groupNames = client.groups
        .map((id) => (_groupNames[id] ?? '').toLowerCase())
        .join(' ');
    return clientId.contains(term) ||
        name.contains(term) ||
        comment.contains(term) ||
        mac.contains(term) ||
        groupNames.contains(term);
  }
}
