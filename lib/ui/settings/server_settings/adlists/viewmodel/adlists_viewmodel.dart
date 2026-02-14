import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';

class AdlistsViewModel extends ChangeNotifier {
  AdlistsViewModel();

  AdListRepository? _adListRepository;

  // --- Commands ---
  late final Command<void, void> loadAdlists =
      Command.createAsyncNoParam<void>(_loadAdlists, initialValue: null);
  late final Command<Adlist, void> deleteAdlist =
      Command.createAsyncNoResult<Adlist>(_deleteAdlist);
  late final Command<
      ({
        String address,
        ListType type,
        List<int>? groups,
        String? comment,
        bool? enabled,
      }),
      void> addAdlist = Command.createAsyncNoResult(_addAdlist);
  late final Command<Adlist, void> updateAdlist =
      Command.createAsyncNoResult<Adlist>(_updateAdlist);

  // --- State ---
  List<Adlist> _whitelistAdlists = [];
  List<Adlist> _blacklistAdlists = [];
  List<Adlist> _filteredWhitelistAdlists = [];
  List<Adlist> _filteredBlacklistAdlists = [];
  int? _selectedTab;
  String _searchTerm = '';
  bool _searchMode = false;
  int? _groupFilter;

  // --- Getters ---
  List<Adlist> get whitelistAdlists => _whitelistAdlists;
  List<Adlist> get blacklistAdlists => _blacklistAdlists;
  List<Adlist> get filteredWhitelistAdlists => _filteredWhitelistAdlists;
  List<Adlist> get filteredBlacklistAdlists => _filteredBlacklistAdlists;
  int? get selectedTab => _selectedTab;
  String get searchTerm => _searchTerm;
  bool get searchMode => _searchMode;
  int? get groupFilter => _groupFilter;

  LoadStatus get loadingStatus {
    if (loadAdlists.isRunning.value) return LoadStatus.loading;
    if (loadAdlists.errors.value != null) return LoadStatus.error;
    return LoadStatus.loaded;
  }

  // --- ProxyProvider update ---
  void update(AdListRepository? repository) {
    _adListRepository = repository;
  }

  // --- Command implementations ---
  Future<void> _loadAdlists() async {
    final adlists = (await _adListRepository!.fetchAdlists()).getOrThrow();
    _whitelistAdlists =
        adlists.where((a) => a.type == ListType.allow).toList();
    _blacklistAdlists =
        adlists.where((a) => a.type == ListType.block).toList();
    _applyFilters();
    notifyListeners();
  }

  Future<void> _deleteAdlist(Adlist adlist) async {
    final result = await _adListRepository!.deleteAdlist(
      adlist.address,
      adlist.type,
    );
    result.getOrThrow();
    _removeAdlistFromList(adlist);
  }

  Future<void> _addAdlist(
    ({
      String address,
      ListType type,
      List<int>? groups,
      String? comment,
      bool? enabled,
    }) params,
  ) async {
    final result = await _adListRepository!.addAdlist(
      params.address,
      params.type,
      groups: params.groups ?? [0],
      comment: params.comment,
      enabled: params.enabled,
    );
    result.getOrThrow();
    await loadAdlists.runAsync();
  }

  Future<void> _updateAdlist(Adlist adlist) async {
    final result = await _adListRepository!.updateAdlist(
      adlist.address,
      adlist.type,
      groups: adlist.groups,
      comment: adlist.comment,
      enabled: adlist.enabled,
    );
    result.getOrThrow();
    await loadAdlists.runAsync();
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
    _filteredWhitelistAdlists = _whitelistAdlists.where((adlist) {
      final matchesSearch =
          term.isEmpty || adlist.address.toLowerCase().contains(term);
      final matchesGroup =
          _groupFilter == null || adlist.groups.contains(_groupFilter);
      return matchesSearch && matchesGroup;
    }).toList();

    _filteredBlacklistAdlists = _blacklistAdlists.where((adlist) {
      final matchesSearch =
          term.isEmpty || adlist.address.toLowerCase().contains(term);
      final matchesGroup =
          _groupFilter == null || adlist.groups.contains(_groupFilter);
      return matchesSearch && matchesGroup;
    }).toList();
  }

  void _removeAdlistFromList(Adlist adlist) {
    if (adlist.type == ListType.allow) {
      _whitelistAdlists =
          _whitelistAdlists.where((a) => a.id != adlist.id).toList();
      _filteredWhitelistAdlists =
          _filteredWhitelistAdlists.where((a) => a.id != adlist.id).toList();
    } else {
      _blacklistAdlists =
          _blacklistAdlists.where((a) => a.id != adlist.id).toList();
      _filteredBlacklistAdlists =
          _filteredBlacklistAdlists.where((a) => a.id != adlist.id).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    loadAdlists.dispose();
    deleteAdlist.dispose();
    addAdlist.dispose();
    updateAdlist.dispose();
    super.dispose();
  }
}
