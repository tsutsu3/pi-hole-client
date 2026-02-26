import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/enums.dart';

class DomainsViewModel extends ChangeNotifier {
  DomainsViewModel({required DomainRepository domainRepository})
      : _domainRepository = domainRepository;

  final DomainRepository _domainRepository;

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
  Domain? _selectedDomain;
  String _searchTerm = '';
  bool _searchMode = false;
  int? _groupFilter;

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
    if (loadDomains.isRunning.value) return LoadStatus.loading;
    if (loadDomains.errors.value != null) return LoadStatus.error;
    return LoadStatus.loaded;
  }

  // --- Command implementations ---
  Future<void> _loadDomains() async {
    final result = await _domainRepository.fetchAllDomains();
    final lists = result.getOrThrow();
    _whitelistDomains = [...lists.allowExact, ...lists.allowRegex];
    _blacklistDomains = [...lists.denyExact, ...lists.denyRegex];
    _applyFilters();
    notifyListeners();
  }

  Future<void> _deleteDomain(Domain domain) async {
    final result = await _domainRepository.deleteDomain(
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
    final result = await _domainRepository.addDomain(
      params.type,
      params.kind,
      params.domain,
    );
    final domain = result.getOrThrow();
    if (domain.type == DomainType.allow) {
      _whitelistDomains = [..._whitelistDomains, domain];
    } else {
      _blacklistDomains = [..._blacklistDomains, domain];
    }
    _applyFilters();
    notifyListeners();
  }

  Future<void> _updateDomain(Domain domain) async {
    final result = await _domainRepository.updateDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
      comment: domain.comment,
      groups: domain.groups,
      enabled: domain.enabled,
    );
    final updated = result.getOrThrow();
    // Replace in-place and remove from the other list (handles type changes).
    if (updated.type == DomainType.allow) {
      _whitelistDomains = [
        for (final d in _whitelistDomains)
          if (d.id == updated.id) updated else d,
      ];
      _blacklistDomains = _blacklistDomains.where((d) => d.id != updated.id).toList();
    } else {
      _blacklistDomains = [
        for (final d in _blacklistDomains)
          if (d.id == updated.id) updated else d,
      ];
      _whitelistDomains = _whitelistDomains.where((d) => d.id != updated.id).toList();
    }
    _applyFilters();
    notifyListeners();
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
