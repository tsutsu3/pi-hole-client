import 'package:collection/collection.dart';
import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/client_repository.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:result_dart/result_dart.dart';

class ClientsViewModel extends ChangeNotifier {
  ClientsViewModel({required ClientRepository clientRepository})
    : _clientRepository = clientRepository {
    loadClients = Command.createAsyncNoParam<void>(
      _loadClients,
      initialValue: null,
    );
    addClient = Command.createAsyncNoResult(_addClient);
    updateClient = Command.createAsyncNoResult(_updateClient);
    deleteClient = Command.createAsyncNoResult<ManagedClient>(_deleteClient);

    loadClients.addListener(notifyListeners);
    loadClients.isRunning.addListener(notifyListeners);
    loadClients.errors.addListener(notifyListeners);
    addClient.addListener(notifyListeners);
    addClient.errors.addListener(notifyListeners);
    updateClient.addListener(notifyListeners);
    updateClient.errors.addListener(notifyListeners);
    deleteClient.addListener(notifyListeners);
    deleteClient.errors.addListener(notifyListeners);
  }

  final ClientRepository _clientRepository;

  static const MapEquality<String, String> _stringMapEquality =
      MapEquality<String, String>();
  static const MapEquality<int, String> _intStringMapEquality =
      MapEquality<int, String>();

  // --- Commands ---
  late final Command<void, void> loadClients;
  late final Command<
    ({String client, String? comment, List<int>? groups}),
    void
  >
  addClient;
  late final Command<
    ({String client, String? comment, List<int>? groups}),
    void
  >
  updateClient;
  late final Command<ManagedClient, void> deleteClient;

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
    final result = await _clientRepository.fetchClients();
    switch (result) {
      case Success():
        _clients = result.getOrNull();
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _addClient(
    ({String client, String? comment, List<int>? groups}) params,
  ) async {
    final result = await _clientRepository.addClient(
      params.client,
      comment: params.comment,
      groups: params.groups ?? [0],
    );
    switch (result) {
      case Success():
        _clients = [..._clients, result.getOrNull()];
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _updateClient(
    ({String client, String? comment, List<int>? groups}) params,
  ) async {
    final result = await _clientRepository.updateClient(
      params.client,
      comment: params.comment,
      groups: params.groups ?? [0],
    );
    switch (result) {
      case Success():
        final updated = result.getOrNull();
        _clients = _clients
            .map((c) => c.id == updated.id ? updated : c)
            .toList();
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _deleteClient(ManagedClient client) async {
    final result = await _clientRepository.deleteClient(client.client);
    switch (result) {
      case Success():
        _clients = _clients.where((c) => c.id != client.id).toList();
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
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
    final groupNames = client.groups
        .map((id) => (_groupNames[id] ?? '').toLowerCase())
        .join(' ');
    return clientId.contains(term) ||
        name.contains(term) ||
        comment.contains(term) ||
        mac.contains(term) ||
        groupNames.contains(term);
  }

  @override
  void dispose() {
    loadClients.removeListener(notifyListeners);
    loadClients.isRunning.removeListener(notifyListeners);
    loadClients.errors.removeListener(notifyListeners);
    addClient.removeListener(notifyListeners);
    addClient.errors.removeListener(notifyListeners);
    updateClient.removeListener(notifyListeners);
    updateClient.errors.removeListener(notifyListeners);
    deleteClient.removeListener(notifyListeners);
    deleteClient.errors.removeListener(notifyListeners);
    loadClients.dispose();
    addClient.dispose();
    updateClient.dispose();
    deleteClient.dispose();
    super.dispose();
  }
}
