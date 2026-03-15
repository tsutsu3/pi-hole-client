import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:result_dart/result_dart.dart';

class AdlistsViewModel extends ChangeNotifier {
  AdlistsViewModel({required AdListRepository adListRepository})
    : _adListRepository = adListRepository {
    loadAdlists = Command.createAsyncNoParam<void>(
      _loadAdlists,
      initialValue: null,
    );
    deleteAdlist = Command.createAsyncNoResult<Adlist>(_deleteAdlist);
    addAdlist = Command.createAsyncNoResult(_addAdlist);
    updateAdlist = Command.createAsyncNoResult<Adlist>(_updateAdlist);

    loadAdlists.addListener(notifyListeners);
    loadAdlists.isRunning.addListener(notifyListeners);
    loadAdlists.errors.addListener(notifyListeners);
    deleteAdlist.addListener(notifyListeners);
    deleteAdlist.errors.addListener(notifyListeners);
    addAdlist.addListener(notifyListeners);
    addAdlist.errors.addListener(notifyListeners);
    updateAdlist.addListener(notifyListeners);
    updateAdlist.errors.addListener(notifyListeners);
  }

  final AdListRepository _adListRepository;

  // --- Commands ---
  late final Command<void, void> loadAdlists;
  late final Command<Adlist, void> deleteAdlist;
  late final Command<
    ({
      String address,
      ListType type,
      List<int>? groups,
      String? comment,
      bool? enabled,
    }),
    void
  >
  addAdlist;
  late final Command<Adlist, void> updateAdlist;

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

  // --- Command implementations ---
  Future<void> _loadAdlists() async {
    final result = await _adListRepository.fetchAdlists();
    switch (result) {
      case Success():
        final adlists = result.getOrNull();
        _whitelistAdlists = adlists
            .where((a) => a.type == ListType.allow)
            .toList();
        _blacklistAdlists = adlists
            .where((a) => a.type == ListType.block)
            .toList();
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _deleteAdlist(Adlist adlist) async {
    final result = await _adListRepository.deleteAdlist(
      adlist.address,
      adlist.type,
    );
    switch (result) {
      case Success():
        _removeAdlistFromList(adlist);
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _addAdlist(
    ({
      String address,
      ListType type,
      List<int>? groups,
      String? comment,
      bool? enabled,
    })
    params,
  ) async {
    final result = await _adListRepository.addAdlist(
      params.address,
      params.type,
      groups: params.groups ?? [0],
      comment: params.comment,
      enabled: params.enabled,
    );
    switch (result) {
      case Success():
        final added = result.getOrNull();
        if (added.type == ListType.allow) {
          _whitelistAdlists = [..._whitelistAdlists, added];
        } else {
          _blacklistAdlists = [..._blacklistAdlists, added];
        }
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _updateAdlist(Adlist adlist) async {
    final result = await _adListRepository.updateAdlist(
      adlist.address,
      adlist.type,
      groups: adlist.groups,
      comment: adlist.comment,
      enabled: adlist.enabled,
    );
    switch (result) {
      case Success():
        final updated = result.getOrNull();
        // Replace in-place and remove from the other list (handles type changes).
        if (updated.type == ListType.allow) {
          _whitelistAdlists = [
            for (final a in _whitelistAdlists)
              if (a.id == updated.id) updated else a,
          ];
          _blacklistAdlists = _blacklistAdlists
              .where((a) => a.id != updated.id)
              .toList();
        } else {
          _blacklistAdlists = [
            for (final a in _blacklistAdlists)
              if (a.id == updated.id) updated else a,
          ];
          _whitelistAdlists = _whitelistAdlists
              .where((a) => a.id != updated.id)
              .toList();
        }
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
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
      _whitelistAdlists = _whitelistAdlists
          .where((a) => a.id != adlist.id)
          .toList();
      _filteredWhitelistAdlists = _filteredWhitelistAdlists
          .where((a) => a.id != adlist.id)
          .toList();
    } else {
      _blacklistAdlists = _blacklistAdlists
          .where((a) => a.id != adlist.id)
          .toList();
      _filteredBlacklistAdlists = _filteredBlacklistAdlists
          .where((a) => a.id != adlist.id)
          .toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    loadAdlists.removeListener(notifyListeners);
    loadAdlists.isRunning.removeListener(notifyListeners);
    loadAdlists.errors.removeListener(notifyListeners);
    deleteAdlist.removeListener(notifyListeners);
    deleteAdlist.errors.removeListener(notifyListeners);
    addAdlist.removeListener(notifyListeners);
    addAdlist.errors.removeListener(notifyListeners);
    updateAdlist.removeListener(notifyListeners);
    updateAdlist.errors.removeListener(notifyListeners);
    loadAdlists.dispose();
    deleteAdlist.dispose();
    addAdlist.dispose();
    updateAdlist.dispose();
    super.dispose();
  }
}
