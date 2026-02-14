import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';

class DomainsViewModel extends ChangeNotifier {
  DomainsViewModel();

  DomainRepository? _domainRepository;

  // --- Commands ---
  late final Command<void, void> loadDomains =
      Command.createAsyncNoParam<void>(_loadDomains, initialValue: null);
  late final Command<Domain, void> deleteDomain =
      Command.createAsyncNoResult<Domain>(_deleteDomain);
  late final Command<({DomainType type, DomainKind kind, String domain}), void>
      addDomain = Command.createAsyncNoResult(_addDomain);
  late final Command<Domain, void> updateDomain =
      Command.createAsyncNoResult<Domain>(_updateDomain);

  // --- State ---
  List<Domain> _whitelistDomains = [];
  List<Domain> _blacklistDomains = [];
  List<Domain> _filteredWhitelistDomains = [];
  List<Domain> _filteredBlacklistDomains = [];
  int? _selectedTab;
  String _searchTerm = '';
  bool _searchMode = false;
  int? _groupFilter;

  // --- Getters ---
  List<Domain> get whitelistDomains => _whitelistDomains;
  List<Domain> get blacklistDomains => _blacklistDomains;
  List<Domain> get filteredWhitelistDomains => _filteredWhitelistDomains;
  List<Domain> get filteredBlacklistDomains => _filteredBlacklistDomains;
  int? get selectedTab => _selectedTab;
  String get searchTerm => _searchTerm;
  bool get searchMode => _searchMode;
  int? get groupFilter => _groupFilter;

  LoadStatus get loadingStatus {
    if (loadDomains.isRunning.value) return LoadStatus.loading;
    if (loadDomains.errors.value != null) return LoadStatus.error;
    return LoadStatus.loaded;
  }

  // --- ProxyProvider update ---
  void update(DomainRepository? repository) {
    _domainRepository = repository;
  }

  // --- Command implementations ---
  Future<void> _loadDomains() async {
    final result = await _domainRepository!.fetchAllDomains();
    final lists = result.getOrThrow();
    _whitelistDomains = [...lists.allowExact, ...lists.allowRegex];
    _blacklistDomains = [...lists.denyExact, ...lists.denyRegex];
    _applyFilters();
    notifyListeners();
  }

  Future<void> _deleteDomain(Domain domain) async {
    final result = await _domainRepository!.deleteDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
    );
    result.getOrThrow();
    _removeDomainFromList(domain);
  }

  Future<void> _addDomain(
    ({DomainType type, DomainKind kind, String domain}) params,
  ) async {
    final result = await _domainRepository!.addDomain(
      params.type,
      params.kind,
      params.domain,
    );
    result.getOrThrow();
    await loadDomains.runAsync();
  }

  Future<void> _updateDomain(Domain domain) async {
    final result = await _domainRepository!.updateDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
      comment: domain.comment,
      groups: domain.groups,
      enabled: domain.enabled,
    );
    result.getOrThrow();
    await loadDomains.runAsync();
  }

  // --- Filter methods ---
  void setSelectedTab(int? tab) {
    _selectedTab = tab;
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
    if (domain.type == DomainType.allow) {
      _whitelistDomains =
          _whitelistDomains.where((d) => d.id != domain.id).toList();
      _filteredWhitelistDomains =
          _filteredWhitelistDomains.where((d) => d.id != domain.id).toList();
    } else {
      _blacklistDomains =
          _blacklistDomains.where((d) => d.id != domain.id).toList();
      _filteredBlacklistDomains =
          _filteredBlacklistDomains.where((d) => d.id != domain.id).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    loadDomains.dispose();
    deleteDomain.dispose();
    addDomain.dispose();
    updateDomain.dispose();
    super.dispose();
  }
}
