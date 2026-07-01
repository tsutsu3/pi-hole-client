import 'dart:async';

import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/local/fake_server_repository.dart';

/// A fake [ServersViewModel] for widget tests.
///
/// Allows setting internal state directly instead of going through
/// `ServerRepository` calls. Call tracking and failure simulation delegate
/// to [FakeServerRepository] since Command fields cannot be overridden in
/// subclasses — the real Command logic runs against the fake repository.
class FakeServersViewModel extends ServersViewModel {
  factory FakeServersViewModel() {
    final repo = FakeServerRepository();
    return FakeServersViewModel._internal(repo);
  }

  FakeServersViewModel._internal(FakeServerRepository super.repo)
    : _fakeRepo = repo;

  final FakeServerRepository _fakeRepo;

  Server? _selectedServer;
  bool? _selectedServerEnabled;
  List<Server> _serversList = [];
  List<Server> _serversWithUnverifiedCertificates = [];
  bool _unverifiedBannerDismissed = false;
  Server? _connectingServer;
  final Set<String> _totpReauthDeclined = {};

  // --- Failure controls (delegate to repo) ---

  set shouldFailRemoveServer(bool value) => _fakeRepo.shouldFailDelete = value;

  set shouldFailReplaceServer(bool value) =>
      _fakeRepo.shouldFailReplace = value;

  set shouldFailEditServer(bool value) => _fakeRepo.shouldFailUpdate = value;

  set shouldFailSetDefaultServer(bool value) =>
      _fakeRepo.shouldFailUpdateDefault = value;

  set failFetchCredentials(bool value) =>
      _fakeRepo.shouldFailFetchCredentials = value;

  // --- Call tracking (delegate to repo) ---

  int get removeServerCallCount => _fakeRepo.deleteCallCount;
  String? get lastRemovedServerAddress => _fakeRepo.lastDeletedAddress;
  int get setDefaultServerCallCount => _fakeRepo.updateDefaultCallCount;
  int get addServerCallCount => _fakeRepo.insertCallCount;
  int get editServerCallCount => _fakeRepo.updateCallCount;
  int get replaceServerCallCount => _fakeRepo.replaceCallCount;
  String? get lastReplacedOldAddress => _fakeRepo.lastReplacedOldAddress;
  Server? get lastReplacedNewServer => _fakeRepo.lastReplacedNewServer;
  int get savePasswordCallCount => _fakeRepo.savePasswordCallCount;
  String? get lastSavedPasswordAddress => _fakeRepo.lastSavedPasswordAddress;
  String? get lastSavedPassword => _fakeRepo.lastSavedPassword;
  int get saveTokenCallCount => _fakeRepo.saveTokenCallCount;
  String? get lastSavedTokenAddress => _fakeRepo.lastSavedTokenAddress;
  String? get lastSavedToken => _fakeRepo.lastSavedToken;

  /// Counts calls to `deleteSid`. The production wrapper is added later; until
  /// then this stays 0, which is what the state-integrity tests assert against.
  int deleteSidCallCount = 0;

  /// Controls the result returned by [checkUrlExists] in tests.
  bool urlExistsResult = false;

  /// When true, [checkUrlExists] returns `result: 'fail'` to simulate an
  /// inconclusive uniqueness check.
  bool checkUrlExistsFails = false;

  // Additional call-tracking fields for non-Command methods
  int setselectedServerCallCount = 0;
  int updateselectedServerStatusCallCount = 0;
  int setUnverifiedBannerDismissedCallCount = 0;
  bool? lastUnverifiedBannerDismissedValue;
  int markTotpReauthDeclinedCallCount = 0;
  String? lastMarkedTotpReauthDeclinedAddress;
  int clearTotpReauthDeclinedCallCount = 0;
  String? lastClearedTotpReauthDeclinedAddress;

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
  void markTotpReauthDeclined(String address) {
    _totpReauthDeclined.add(address);
    markTotpReauthDeclinedCallCount++;
    lastMarkedTotpReauthDeclinedAddress = address;
  }

  @override
  void clearTotpReauthDeclined(String address) {
    _totpReauthDeclined.remove(address);
    clearTotpReauthDeclinedCallCount++;
    lastClearedTotpReauthDeclinedAddress = address;
  }

  @override
  bool isTotpReauthDeclined(String address) =>
      _totpReauthDeclined.contains(address);

  @override
  void setUnverifiedBannerDismissed(bool dismissed) {
    _unverifiedBannerDismissed = dismissed;
    setUnverifiedBannerDismissedCallCount++;
    lastUnverifiedBannerDismissedValue = dismissed;
    notifyListeners();
  }

  @override
  Future<Result<void>> deleteSid(String address) async {
    deleteSidCallCount++;
    return Success.unit();
  }

  @override
  FutureOr<Map<String, dynamic>> checkUrlExists(String url) async {
    if (checkUrlExistsFails) {
      return {'result': 'fail', 'exists': false};
    }
    return {'result': 'success', 'exists': urlExistsResult};
  }

  /// Controls the result returned by [inspectCertificate] in tests.
  CertificateInspection? certificateInspection;
  int inspectCertificateCallCount = 0;

  @override
  Future<CertificateInspection?> inspectCertificate(Server server) async {
    inspectCertificateCallCount++;
    return certificateInspection;
  }
}
