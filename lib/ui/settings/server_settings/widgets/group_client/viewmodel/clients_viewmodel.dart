import 'package:collection/collection.dart';
import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/client_repository.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';

class ClientsViewModel extends ChangeNotifier {
  ClientsViewModel();

  ClientRepository? _clientRepository;

  static const MapEquality<String, String> _stringMapEquality =
      MapEquality<String, String>();
  static const MapEquality<int, String> _intStringMapEquality =
      MapEquality<int, String>();

  // --- Commands ---
  late final Command<void, void> loadClients =
      Command.createAsyncNoParam<void>(_loadClients, initialValue: null);
  late final Command<({String client, String? comment, List<int>? groups}), void>
      addClient = Command.createAsyncNoResult(_addClient);
  late final Command<({String client, String? comment, List<int>? groups}), void>
      updateClient = Command.createAsyncNoResult(_updateClient);
  late final Command<ManagedClient, void> deleteClient =
      Command.createAsyncNoResult<ManagedClient>(_deleteClient);

  // --- State ---
  List<ManagedClient> _clients = [];
  List<ManagedClient> _filteredClients = [];
  Map<String, String> _ipToMac = {};
  Map<int, String> _groupNames = {};
  String _searchTerm = '';
  bool _searchMode = false;

  // --- Getters ---
  List<ManagedClient> get clients => _clients;
  List<ManagedClient> get filteredClients => _filteredClients;
  String get searchTerm => _searchTerm;
  bool get searchMode => _searchMode;

  LoadStatus get loadingStatus {
    if (loadClients.isRunning.value) return LoadStatus.loading;
    if (loadClients.errors.value != null) return LoadStatus.error;
    return LoadStatus.loaded;
  }

  // --- ProxyProvider update ---
  void update(ClientRepository? repository) {
    _clientRepository = repository;
  }

  // --- Lookup updates ---
  void updateMacLookup(Map<String, String> ipToMac) {
    if (_stringMapEquality.equals(_ipToMac, ipToMac)) return;
    _ipToMac = Map<String, String>.from(ipToMac);
    if (_searchTerm.isNotEmpty) {
      _applyFilters();
      notifyListeners();
    }
  }

  void updateGroupLookup(Map<int, String> groupNames) {
    if (_intStringMapEquality.equals(_groupNames, groupNames)) return;
    _groupNames = Map<int, String>.from(groupNames);
    if (_searchTerm.isNotEmpty) {
      _applyFilters();
      notifyListeners();
    }
  }

  // --- Command implementations ---
  Future<void> _loadClients() async {
    final clients = (await _clientRepository!.fetchClients()).getOrThrow();
    _clients = clients;
    _applyFilters();
    notifyListeners();
  }

  Future<void> _addClient(
    ({String client, String? comment, List<int>? groups}) params,
  ) async {
    final result = await _clientRepository!.addClient(
      params.client,
      comment: params.comment,
      groups: params.groups ?? [0],
    );
    result.getOrThrow();
    await loadClients.runAsync();
  }

  Future<void> _updateClient(
    ({String client, String? comment, List<int>? groups}) params,
  ) async {
    final result = await _clientRepository!.updateClient(
      params.client,
      comment: params.comment,
      groups: params.groups ?? [0],
    );
    result.getOrThrow();
    await loadClients.runAsync();
  }

  Future<void> _deleteClient(ManagedClient client) async {
    final result = await _clientRepository!.deleteClient(client.client);
    result.getOrThrow();
    _clients = _clients.where((c) => c.id != client.id).toList();
    _applyFilters();
    notifyListeners();
  }

  // --- Filter methods ---
  void setSearchMode(bool value) {
    _searchMode = value;
    notifyListeners();
  }

  void onSearch(String value) {
    _searchTerm = value;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    final term = _searchTerm.toLowerCase();
    _filteredClients = _clients.where((client) {
      if (term.isEmpty) return true;
      return _matchesSearch(client, term);
    }).toList();
  }

  bool _matchesSearch(ManagedClient client, String term) {
    final name = (client.name ?? '').toLowerCase();
    final comment = (client.comment ?? '').toLowerCase();
    final clientId = client.client.toLowerCase();
    final mac = (_ipToMac[client.client] ?? '').toLowerCase();
    final groupNames =
        client.groups.map((id) => (_groupNames[id] ?? '').toLowerCase()).join(
          ' ',
        );
    return clientId.contains(term) ||
        name.contains(term) ||
        comment.contains(term) ||
        mac.contains(term) ||
        groupNames.contains(term);
  }

  @override
  void dispose() {
    loadClients.dispose();
    addClient.dispose();
    updateClient.dispose();
    deleteClient.dispose();
    super.dispose();
  }
}
