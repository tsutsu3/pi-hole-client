import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/group_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:result_dart/result_dart.dart';

class GroupsViewModel extends ChangeNotifier {
  GroupsViewModel({required GroupRepository groupRepository})
    : _groupRepository = groupRepository {
    loadGroups = Command.createAsyncNoParam<void>(
      _loadGroups,
      initialValue: null,
    );
    addGroup = Command.createAsyncNoResult(_addGroup);
    updateGroup = Command.createAsyncNoResult(_updateGroup);
    deleteGroup = Command.createAsyncNoResult<Group>(_deleteGroup);

    loadGroups.addListener(notifyListeners);
    loadGroups.isRunning.addListener(notifyListeners);
    loadGroups.errors.addListener(notifyListeners);
    addGroup.addListener(notifyListeners);
    addGroup.errors.addListener(notifyListeners);
    updateGroup.addListener(notifyListeners);
    updateGroup.errors.addListener(notifyListeners);
    deleteGroup.addListener(notifyListeners);
    deleteGroup.errors.addListener(notifyListeners);
  }

  final GroupRepository _groupRepository;

  // --- Commands ---
  late final Command<void, void> loadGroups;
  late final Command<({String name, String? comment, bool? enabled}), void>
  addGroup;
  late final Command<({String name, String? comment, bool? enabled}), void>
  updateGroup;
  late final Command<Group, void> deleteGroup;

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

  // --- Command implementations ---
  Future<void> _loadGroups() async {
    final result = await _groupRepository.fetchGroups();
    switch (result) {
      case Success():
        _groups = result.getOrNull();
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _addGroup(
    ({String name, String? comment, bool? enabled}) params,
  ) async {
    final result = await _groupRepository.addGroup(
      params.name,
      comment: params.comment,
      enabled: params.enabled,
    );
    switch (result) {
      case Success():
        _groups = [..._groups, result.getOrNull()];
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _updateGroup(
    ({String name, String? comment, bool? enabled}) params,
  ) async {
    final result = await _groupRepository.updateGroup(
      params.name,
      comment: params.comment,
      enabled: params.enabled,
    );
    switch (result) {
      case Success():
        final updated = result.getOrNull();
        _groups = _groups
            .map((g) => g.id == updated.id ? updated : g)
            .toList();
        _applyFilters();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _deleteGroup(Group group) async {
    final result = await _groupRepository.deleteGroup(group.name);
    switch (result) {
      case Success():
        _groups = _groups.where((g) => g.id != group.id).toList();
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
    _filteredGroups = _groups.where((group) {
      if (term.isEmpty) return true;
      return group.name.toLowerCase().contains(term) ||
          (group.comment ?? '').toLowerCase().contains(term);
    }).toList();
  }

  @override
  void dispose() {
    loadGroups.removeListener(notifyListeners);
    loadGroups.isRunning.removeListener(notifyListeners);
    loadGroups.errors.removeListener(notifyListeners);
    addGroup.removeListener(notifyListeners);
    addGroup.errors.removeListener(notifyListeners);
    updateGroup.removeListener(notifyListeners);
    updateGroup.errors.removeListener(notifyListeners);
    deleteGroup.removeListener(notifyListeners);
    deleteGroup.errors.removeListener(notifyListeners);
    loadGroups.dispose();
    addGroup.dispose();
    updateGroup.dispose();
    deleteGroup.dispose();
    super.dispose();
  }
}
