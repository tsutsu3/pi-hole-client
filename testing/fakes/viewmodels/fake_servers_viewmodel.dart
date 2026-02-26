import 'dart:async';

import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';

import '../repositories/local/fake_server_repository.dart';

/// A fake [ServersViewModel] for widget tests.
///
/// Allows setting internal state directly instead of going through
/// `ServerRepository` calls. Call tracking fields let tests verify
/// that expected methods were invoked.
class FakeServersViewModel extends ServersViewModel {
  FakeServersViewModel() : super(FakeServerRepository());

  Server? _selectedServer;
  bool? _selectedServerEnabled;
  List<Server> _serversList = [];
  List<Server> _serversWithUnverifiedCertificates = [];
  bool _unverifiedBannerDismissed = false;
  Server? _connectingServer;

  // Call tracking for verification
  int setDefaultServerCallCount = 0;
  Server? lastSetDefaultServer;

  int removeServerCallCount = 0;
  String? lastRemovedServerAddress;

  int setUnverifiedBannerDismissedCallCount = 0;
  bool? lastUnverifiedBannerDismissedValue;

  int addServerCallCount = 0;
  int editServerCallCount = 0;
  int setselectedServerCallCount = 0;
  int updateselectedServerStatusCallCount = 0;

  // --- Getters ---

  @override
  Server? get selectedServer => _selectedServer;

  @override
  bool? get selectedServerEnabled => _selectedServerEnabled;

  @override
  List<Server> get getServersList => _serversList;

  @override
  List<Server> get serversWithUnverifiedCertificates =>
      _serversWithUnverifiedCertificates;

  @override
  bool get unverifiedBannerDismissed => _unverifiedBannerDismissed;

  @override
  Server? get connectingServer => _connectingServer;

  // --- Setters for test state ---
  // ignore_for_file: avoid_setters_without_getters

  set selectedServer(Server? value) {
    _selectedServer = value;
    notifyListeners();
  }

  set selectedServerEnabled(bool? value) {
    _selectedServerEnabled = value;
    notifyListeners();
  }

  set serversList(List<Server> value) {
    _serversList = value;
    notifyListeners();
  }

  set serversWithUnverifiedCertificates(List<Server> value) {
    _serversWithUnverifiedCertificates = value;
    notifyListeners();
  }

  // --- Method overrides with tracking ---

  @override
  void setselectedServer({required Server? server, bool? toHomeTab}) {
    _selectedServer = server;
    if (server == null) _selectedServerEnabled = null;
    setselectedServerCallCount++;
    notifyListeners();
  }

  @override
  void updateselectedServerStatus(bool enabled) {
    _selectedServerEnabled = enabled;
    updateselectedServerStatusCallCount++;
    notifyListeners();
  }

  @override
  void setConnectingServer(Server server) {
    _connectingServer = server;
  }

  @override
  void clearConnectingServer() {
    _connectingServer = null;
  }

  @override
  void setUnverifiedBannerDismissed(bool dismissed) {
    _unverifiedBannerDismissed = dismissed;
    setUnverifiedBannerDismissedCallCount++;
    lastUnverifiedBannerDismissedValue = dismissed;
    notifyListeners();
  }

  @override
  Future<bool> setDefaultServer(Server server) async {
    setDefaultServerCallCount++;
    lastSetDefaultServer = server;
    return true;
  }

  @override
  Future<bool> removeServer(String serverAddress) async {
    removeServerCallCount++;
    lastRemovedServerAddress = serverAddress;
    _serversList = _serversList
        .where((s) => s.address != serverAddress)
        .toList();
    notifyListeners();
    return true;
  }

  @override
  Future<bool> addServer(Server server) async {
    addServerCallCount++;
    _serversList = [..._serversList, server];
    notifyListeners();
    return true;
  }

  @override
  Future<bool> editServer(Server server) async {
    editServerCallCount++;
    notifyListeners();
    return true;
  }

  @override
  FutureOr<Map<String, dynamic>> checkUrlExists(String url) async {
    return {'result': 'success', 'exists': false};
  }
}
