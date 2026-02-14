import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';

import '../../../testing/fakes/repositories/api/fake_adlist_repository.dart';

void main() {
  group('AdlistsViewModel', () {
    late bool listenerCalled;
    late AdlistsViewModel viewModel;
    late FakeAdlistRepository fakeAdlistRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeAdlistRepository = FakeAdlistRepository();
      viewModel = AdlistsViewModel();
      viewModel.update(fakeAdlistRepository);
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
      expect(viewModel.whitelistAdlists, []);
      expect(viewModel.blacklistAdlists, []);
      expect(viewModel.filteredWhitelistAdlists, []);
      expect(viewModel.filteredBlacklistAdlists, []);
      expect(viewModel.selectedTab, null);
      expect(viewModel.searchTerm, '');
      expect(viewModel.searchMode, false);
      expect(viewModel.groupFilter, null);
      expect(listenerCalled, false);
    });

    test('setSelectedTab updates selected tab', () {
      viewModel.setSelectedTab(1);
      expect(viewModel.selectedTab, 1);
      expect(listenerCalled, false);
    });

    test('setSearchMode updates search mode', () {
      viewModel.setSearchMode(true);
      expect(viewModel.searchMode, true);
      expect(listenerCalled, true);
    });

    test('loadAdlists fetches adlists', () async {
      await viewModel.loadAdlists.runAsync();
      // FakeAdlistRepository returns 1 allow + 2 block
      expect(viewModel.whitelistAdlists.length, 1);
      expect(viewModel.blacklistAdlists.length, 2);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('loadAdlists sets error on failure', () async {
      fakeAdlistRepository.shouldFail = true;
      try {
        await viewModel.loadAdlists.runAsync();
      } catch (_) {}
      expect(viewModel.loadingStatus, LoadStatus.error);
    });

    test('onSearch filters adlists based on search term', () async {
      await viewModel.loadAdlists.runAsync();
      listenerCalled = false;

      viewModel.onSearch('another');
      expect(viewModel.filteredWhitelistAdlists.length, 0);
      expect(viewModel.filteredBlacklistAdlists.length, 1);
      expect(
        viewModel.filteredBlacklistAdlists.first.address,
        'https://another-blocklist.example.com/hosts',
      );
      expect(listenerCalled, true);
    });

    test('onSearch is case-insensitive', () async {
      await viewModel.loadAdlists.runAsync();
      listenerCalled = false;

      viewModel.onSearch('BLOCKLIST');
      expect(viewModel.filteredWhitelistAdlists.length, 0);
      expect(viewModel.filteredBlacklistAdlists.length, 2);
      expect(listenerCalled, true);
    });

    test('deleteAdlist removes adlist from the list', () async {
      await viewModel.loadAdlists.runAsync();
      final adlist = viewModel.blacklistAdlists.first;
      listenerCalled = false;

      await viewModel.deleteAdlist.runAsync(adlist);
      expect(
        viewModel.blacklistAdlists.where((a) => a.id == adlist.id),
        isEmpty,
      );
      expect(listenerCalled, true);
    });

    test('addAdlist reloads adlists after adding', () async {
      await viewModel.loadAdlists.runAsync();
      final initialCount = viewModel.whitelistAdlists.length;

      await viewModel.addAdlist.runAsync((
        address: 'https://new.example.com/hosts',
        type: ListType.allow,
        groups: [0],
        comment: 'new list',
        enabled: true,
      ));

      // After add, loadAdlists is called internally so list is refreshed
      expect(viewModel.whitelistAdlists.length, initialCount);
    });

    test('updateAdlist reloads adlists after updating', () async {
      await viewModel.loadAdlists.runAsync();
      final adlist = viewModel.blacklistAdlists.first;

      await viewModel.updateAdlist.runAsync(
        adlist.copyWith(comment: 'updated comment'),
      );

      // After update, loadAdlists is called internally so list is refreshed
      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    test('deleteAdlist sets error on failure', () async {
      await viewModel.loadAdlists.runAsync();
      final adlist = viewModel.blacklistAdlists.first;

      fakeAdlistRepository.shouldFail = true;
      try {
        await viewModel.deleteAdlist.runAsync(adlist);
      } catch (_) {}

      // deleteAdlist failure should throw
      expect(viewModel.deleteAdlist.errors.value, isNotNull);
    });

    group('Group Filter', () {
      test('setGroupFilter updates groupFilter and filters adlists', () async {
        await viewModel.loadAdlists.runAsync();
        listenerCalled = false;

        viewModel.setGroupFilter(0);
        expect(viewModel.groupFilter, 0);
        expect(listenerCalled, true);
      });

      test('clearGroupFilter clears the filter', () async {
        await viewModel.loadAdlists.runAsync();
        viewModel.setGroupFilter(1);
        listenerCalled = false;

        viewModel.clearGroupFilter();

        expect(viewModel.groupFilter, null);
        expect(listenerCalled, true);
      });

      test('group filter and search filter combine correctly', () async {
        await viewModel.loadAdlists.runAsync();

        viewModel.setGroupFilter(0);
        viewModel.onSearch('blocklist');

        // All blocklists have group 0, "blocklist" matches 2
        expect(viewModel.filteredBlacklistAdlists.length, 2);
      });

      test('setGroupFilter with non-existent group returns empty list',
          () async {
        await viewModel.loadAdlists.runAsync();

        viewModel.setGroupFilter(999);

        expect(viewModel.filteredWhitelistAdlists.length, 0);
        expect(viewModel.filteredBlacklistAdlists.length, 0);
      });

      test('group filter by group 1 filters correctly', () async {
        await viewModel.loadAdlists.runAsync();

        // Only the 3rd adlist (id=3) has groups [0, 1]
        viewModel.setGroupFilter(1);
        expect(viewModel.filteredWhitelistAdlists.length, 0);
        expect(viewModel.filteredBlacklistAdlists.length, 1);
        expect(viewModel.filteredBlacklistAdlists.first.id, 3);
      });
    });
  });
}
