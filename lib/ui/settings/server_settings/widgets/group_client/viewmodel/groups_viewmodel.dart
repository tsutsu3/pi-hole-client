import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/group_repository.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';

class GroupsViewModel extends ChangeNotifier {
  GroupsViewModel();

  GroupRepository? _groupRepository;

  // --- Commands ---
  late final Command<void, void> loadGroups =
      Command.createAsyncNoParam<void>(_loadGroups, initialValue: null);
  late final Command<({String name, String? comment, bool? enabled}), void>
      addGroup = Command.createAsyncNoResult(_addGroup);
  late final Command<({String name, String? comment, bool? enabled}), void>
      updateGroup = Command.createAsyncNoResult(_updateGroup);
  late final Command<Group, void> deleteGroup =
      Command.createAsyncNoResult<Group>(_deleteGroup);

  // --- State ---
  List<Group> _groups = [];
  List<Group> _filteredGroups = [];
  String _searchTerm = '';
  bool _searchMode = false;

  // --- Getters ---
  List<Group> get groups => _groups;
  List<Group> get filteredGroups => _filteredGroups;
  String get searchTerm => _searchTerm;
  bool get searchMode => _searchMode;

  Map<int, String> get groupItems {
    return {for (final group in _groups) group.id: group.name};
  }

  LoadStatus get loadingStatus {
    if (loadGroups.isRunning.value) return LoadStatus.loading;
    if (loadGroups.errors.value != null) return LoadStatus.error;
    return LoadStatus.loaded;
  }

  // --- ProxyProvider update ---
  void update(GroupRepository? repository) {
    _groupRepository = repository;
  }

  // --- Command implementations ---
  Future<void> _loadGroups() async {
    final groups = (await _groupRepository!.fetchGroups()).getOrThrow();
    _groups = groups;
    _applyFilters();
    notifyListeners();
  }

  Future<void> _addGroup(
    ({String name, String? comment, bool? enabled}) params,
  ) async {
    final result = await _groupRepository!.addGroup(
      params.name,
      comment: params.comment,
      enabled: params.enabled,
    );
    result.getOrThrow();
    await loadGroups.runAsync();
  }

  Future<void> _updateGroup(
    ({String name, String? comment, bool? enabled}) params,
  ) async {
    final result = await _groupRepository!.updateGroup(
      params.name,
      comment: params.comment,
      enabled: params.enabled,
    );
    result.getOrThrow();
    await loadGroups.runAsync();
  }

  Future<void> _deleteGroup(Group group) async {
    final result = await _groupRepository!.deleteGroup(group.name);
    result.getOrThrow();
    _groups = _groups.where((g) => g.id != group.id).toList();
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
    _filteredGroups = _groups.where((group) {
      if (term.isEmpty) return true;
      return group.name.toLowerCase().contains(term) ||
          (group.comment ?? '').toLowerCase().contains(term);
    }).toList();
  }

  @override
  void dispose() {
    loadGroups.dispose();
    addGroup.dispose();
    updateGroup.dispose();
    deleteGroup.dispose();
    super.dispose();
  }
}
