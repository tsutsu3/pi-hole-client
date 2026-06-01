import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:result_dart/result_dart.dart';

class DomainsViewModel extends ChangeNotifier {
  DomainsViewModel({DomainRepository? domainRepository})
    : _domainRepository = domainRepository {
    loadDomains = Command.createAsyncNoParam<void>(
      _loadDomains,
      initialValue: null,
    );
    deleteDomain = Command.createAsyncNoResult<Domain>(_deleteDomain);
    addDomain = Command.createAsyncNoResult(_addDomain);
    updateDomain = Command.createAsyncNoResult<Domain>(_updateDomain);

    loadDomains.addListener(notifyListeners);
    loadDomains.isRunning.addListener(notifyListeners);
    loadDomains.errors.addListener(notifyListeners);
    deleteDomain.addListener(notifyListeners);
    deleteDomain.errors.addListener(notifyListeners);
    addDomain.addListener(notifyListeners);
    addDomain.errors.addListener(notifyListeners);
    updateDomain.addListener(notifyListeners);
    updateDomain.errors.addListener(notifyListeners);
  }

  DomainRepository? _domainRepository;

  // --- Commands ---
  late final Command<void, void> loadDomains;
  late final Command<Domain, void> deleteDomain;
  late final Command<({DomainType type, DomainKind kind, String domain}), void>
  addDomain;
  late final Command<Domain, void> updateDomain;

  // --- State ---
  List<Domain> _whitelistDomains = [];
  List<Domain> _blacklistDomains = [];
  List<Domain> _filteredWhitelistDomains = [];
  List<Domain> _filteredBlacklistDomains = [];
  int? _selectedTab;
  Domain? _selectedDomain;
  String _searchTerm = '';
  bool _searchMode = false;
  int? _groupFilter;
  LoadStatus _loadingStatus = LoadStatus.loading;
  bool _disposed = false;
  bool _isRevalidating = false;
  int _serverEpoch = 0;

  /// Bumped on every locally-confirmed add/delete/update. Used to detect a
  /// mutation that raced an in-flight revalidation, so its stale snapshot is
  /// not applied over the user's change.
  int _mutationSeq = 0;

  // --- Getters ---
  List<Domain> get whitelistDomains => _whitelistDomains;
  List<Domain> get blacklistDomains => _blacklistDomains;
  List<Domain> get filteredWhitelistDomains => _filteredWhitelistDomains;
  List<Domain> get filteredBlacklistDomains => _filteredBlacklistDomains;
  int? get selectedTab => _selectedTab;
  Domain? get selectedDomain => _selectedDomain;
  String get searchTerm => _searchTerm;
  bool get searchMode => _searchMode;
  int? get groupFilter => _groupFilter;

  LoadStatus get loadingStatus {
    return _loadingStatus;
  }

  bool get isRevalidating => _isRevalidating;

  /// Called by the app-level `ChangeNotifierProxyProvider` whenever the active
  /// [DomainRepository] changes (i.e. the selected server changed).
  ///
  /// The cached domain data is reset **immediately** so the previous server's
  /// domains never leak into the new server's screen. The reload itself is left
  /// to the next screen mount (`loadDomains.run()`): switching servers always
  /// navigates away from the Domains tab, so the screen is unmounted here and
  /// remounts — and reloads against the cleared cache — on return.
  void update({DomainRepository? domainRepository}) {
    if (domainRepository == null) return;
    final changed = domainRepository != _domainRepository;
    _domainRepository = domainRepository;
    if (!changed) return;

    _serverEpoch++;
    _resetCache();
    _loadingStatus = LoadStatus.loading;
    _isRevalidating = false;
    _safeNotifyListeners();
  }

  /// Clears the loaded and filtered domain lists (e.g. on a server switch or
  /// before the first load of a server).
  void _resetCache() {
    _whitelistDomains = [];
    _blacklistDomains = [];
    _filteredWhitelistDomains = [];
    _filteredBlacklistDomains = [];
  }

  // --- Command implementations ---
  Future<void> _loadDomains() async {
    final repository = _domainRepository;
    if (repository == null) return;

    final serverEpoch = _serverEpoch;

    // Stale-While-Revalidate: when a list is already loaded, keep it visible
    // and show a thin progress bar while fresh data is fetched in the
    // background. The full-screen spinner is only shown on the very first load
    // (and after a server switch, where the cache was just cleared), so
    // returning to the Domains tab no longer flashes a spinner.
    final hasCache =
        _whitelistDomains.isNotEmpty || _blacklistDomains.isNotEmpty;

    if (hasCache) {
      _isRevalidating = true;
      _safeNotifyListeners();
    } else {
      _loadingStatus = LoadStatus.loading;
      _resetCache();
      _safeNotifyListeners();
    }

    final mutationSeq = _mutationSeq;
    final result = await repository.fetchAllDomains();
    if (_disposed || serverEpoch != _serverEpoch) return;

    switch (result) {
      case Success():
        // A local add/delete/update was confirmed by the server while this
        // fetch was in flight; its snapshot predates that change, so applying
        // it would drop the user's mutation. Skip the assignment and keep the
        // locally-updated list (already correct: previous data plus the
        // confirmed change). External edits are picked up on the next reload.
        if (mutationSeq == _mutationSeq) {
          final lists = result.getOrNull();
          _whitelistDomains = [...lists.allowExact, ...lists.allowRegex];
          _blacklistDomains = [...lists.denyExact, ...lists.denyRegex];
          _applyFilters();
        }
        _loadingStatus = LoadStatus.loaded;
        _isRevalidating = false;
        _safeNotifyListeners();
      case Failure():
        _isRevalidating = false;
        // Keep the cached list visible when a background refresh fails; only
        // surface the error screen when there is nothing to show.
        if (!hasCache) {
          _loadingStatus = LoadStatus.error;
        }
        _safeNotifyListeners();
        throw result.exceptionOrNull();
    }
  }

  Future<void> _deleteDomain(Domain domain) async {
    final repository = _domainRepository;
    if (repository == null) {
      throw Exception('DomainRepository not available');
    }
    final result = await repository.deleteDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
    );
    if (_disposed) return;
    switch (result) {
      case Success():
        _removeDomainFromList(domain);
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _addDomain(
    ({DomainType type, DomainKind kind, String domain}) params,
  ) async {
    final repository = _domainRepository;
    if (repository == null) {
      throw Exception('DomainRepository not available');
    }
    final result = await repository.addDomain(
      params.type,
      params.kind,
      params.domain,
    );
    if (_disposed) return;
    switch (result) {
      case Success():
        final domain = result.getOrNull();
        _mutationSeq++;
        if (domain.type == DomainType.allow) {
          _whitelistDomains = [..._whitelistDomains, domain];
        } else {
          _blacklistDomains = [..._blacklistDomains, domain];
        }
        _applyFilters();
        _safeNotifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _updateDomain(Domain domain) async {
    final repository = _domainRepository;
    if (repository == null) {
      throw Exception('DomainRepository not available');
    }
    final result = await repository.updateDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
      comment: domain.comment,
      groups: domain.groups,
      enabled: domain.enabled,
    );
    if (_disposed) return;
    switch (result) {
      case Success():
        final updated = result.getOrNull();
        _mutationSeq++;
        // Replace in-place and remove from the other list (handles type changes).
        if (updated.type == DomainType.allow) {
          _whitelistDomains = [
            for (final d in _whitelistDomains)
              if (d.id == updated.id) updated else d,
          ];
          _blacklistDomains = _blacklistDomains
              .where((d) => d.id != updated.id)
              .toList();
        } else {
          _blacklistDomains = [
            for (final d in _blacklistDomains)
              if (d.id == updated.id) updated else d,
          ];
          _whitelistDomains = _whitelistDomains
              .where((d) => d.id != updated.id)
              .toList();
        }
        _applyFilters();
        _safeNotifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  // --- Filter methods ---
  void setSelectedTab(int? tab) {
    _selectedTab = tab;
  }

  void setSelectedDomain(Domain? domain) {
    _selectedDomain = domain;
    notifyListeners();
  }

  void setSearchMode(bool value) {
    _searchMode = value;
    notifyListeners();
  }

  void setGroupFilter(int? groupId) {
    _groupFilter = groupId;
    _applyFilters();
    notifyListeners();
  }

  void clearGroupFilter() => setGroupFilter(null);

  void onSearch(String value) {
    _searchTerm = value;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    final term = _searchTerm.toLowerCase();
    _filteredWhitelistDomains = _whitelistDomains.where((domain) {
      final matchesSearch =
          term.isEmpty || domain.name.toLowerCase().contains(term);
      final matchesGroup =
          _groupFilter == null || domain.groups.contains(_groupFilter);
      return matchesSearch && matchesGroup;
    }).toList();

    _filteredBlacklistDomains = _blacklistDomains.where((domain) {
      final matchesSearch =
          term.isEmpty || domain.name.toLowerCase().contains(term);
      final matchesGroup =
          _groupFilter == null || domain.groups.contains(_groupFilter);
      return matchesSearch && matchesGroup;
    }).toList();
  }

  void _removeDomainFromList(Domain domain) {
    _mutationSeq++;
    if (domain.type == DomainType.allow) {
      _whitelistDomains = _whitelistDomains
          .where((d) => d.id != domain.id)
          .toList();
      _filteredWhitelistDomains = _filteredWhitelistDomains
          .where((d) => d.id != domain.id)
          .toList();
    } else {
      _blacklistDomains = _blacklistDomains
          .where((d) => d.id != domain.id)
          .toList();
      _filteredBlacklistDomains = _filteredBlacklistDomains
          .where((d) => d.id != domain.id)
          .toList();
    }
    _safeNotifyListeners();
  }

  void _safeNotifyListeners() {
    if (_disposed) return;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    loadDomains.removeListener(notifyListeners);
    loadDomains.isRunning.removeListener(notifyListeners);
    loadDomains.errors.removeListener(notifyListeners);
    deleteDomain.removeListener(notifyListeners);
    deleteDomain.errors.removeListener(notifyListeners);
    addDomain.removeListener(notifyListeners);
    addDomain.errors.removeListener(notifyListeners);
    updateDomain.removeListener(notifyListeners);
    updateDomain.errors.removeListener(notifyListeners);
    loadDomains.dispose();
    deleteDomain.dispose();
    addDomain.dispose();
    updateDomain.dispose();
    super.dispose();
  }
}
