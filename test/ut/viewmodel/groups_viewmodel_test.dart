import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';

import '../../../testing/fakes/repositories/api/fake_group_repository.dart';

void main() {
  group('GroupsViewModel', () {
    late bool listenerCalled;
    late GroupsViewModel viewModel;
    late FakeGroupRepository fakeGroupRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeGroupRepository = FakeGroupRepository();
      viewModel = GroupsViewModel();
      viewModel.update(fakeGroupRepository);
      listenerCalled = false;
      viewModel.addListener(() {
        listenerCalled = true;
      });
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('initial values are correct', () {
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(viewModel.groups, []);
      expect(viewModel.filteredGroups, []);
      expect(viewModel.searchTerm, '');
      expect(viewModel.searchMode, false);
      expect(viewModel.groupItems, {});
      expect(listenerCalled, false);
    });

    test('setSearchMode updates search mode', () {
      viewModel.setSearchMode(true);
      expect(viewModel.searchMode, true);
      expect(listenerCalled, true);
    });

    test('loadGroups fetches groups', () async {
      await viewModel.loadGroups.runAsync();
      expect(viewModel.groups.length, 2);
      expect(viewModel.filteredGroups.length, 2);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('loadGroups sets error on failure', () async {
      fakeGroupRepository.shouldFail = true;
      try {
        await viewModel.loadGroups.runAsync();
      } catch (_) {}
      expect(viewModel.loadingStatus, LoadStatus.error);
    });

    test('groupItems returns correct map', () async {
      await viewModel.loadGroups.runAsync();
      expect(viewModel.groupItems, {0: 'Default', 5: 'test'});
    });

    test('onSearch filters groups based on search term', () async {
      await viewModel.loadGroups.runAsync();
      listenerCalled = false;

      viewModel.onSearch('default');
      expect(viewModel.filteredGroups.length, 1);
      expect(viewModel.filteredGroups.first.name, 'Default');
      expect(listenerCalled, true);
    });

    test('onSearch matches comment', () async {
      await viewModel.loadGroups.runAsync();
      listenerCalled = false;

      viewModel.onSearch('default group');
      expect(viewModel.filteredGroups.length, 1);
      expect(viewModel.filteredGroups.first.id, 0);
      expect(listenerCalled, true);
    });

    test('onSearch is case-insensitive', () async {
      await viewModel.loadGroups.runAsync();
      listenerCalled = false;

      viewModel.onSearch('TEST');
      expect(viewModel.filteredGroups.length, 1);
      expect(listenerCalled, true);
    });

    test('deleteGroup removes group from the list', () async {
      await viewModel.loadGroups.runAsync();
      final group = viewModel.groups.last;
      listenerCalled = false;

      await viewModel.deleteGroup.runAsync(group);
      expect(viewModel.groups.where((g) => g.id == group.id), isEmpty);
      expect(listenerCalled, true);
    });

    test('addGroup reloads groups after adding', () async {
      await viewModel.loadGroups.runAsync();

      await viewModel.addGroup.runAsync((
        name: 'new-group',
        comment: 'new comment',
        enabled: true,
      ));

      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    test('updateGroup reloads groups after updating', () async {
      await viewModel.loadGroups.runAsync();

      await viewModel.updateGroup.runAsync((
        name: 'test',
        comment: 'updated comment',
        enabled: false,
      ));

      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    test('deleteGroup sets error on failure', () async {
      await viewModel.loadGroups.runAsync();
      final group = viewModel.groups.last;

      fakeGroupRepository.shouldFail = true;
      try {
        await viewModel.deleteGroup.runAsync(group);
      } catch (_) {}

      expect(viewModel.deleteGroup.errors.value, isNotNull);
    });
  });
}
