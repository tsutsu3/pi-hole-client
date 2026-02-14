import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';

import '../../../testing/fakes/repositories/api/fake_domain_repository.dart';

void main() {
  group('DomainsViewModel', () {
    late bool listenerCalled;
    late DomainsViewModel viewModel;
    late FakeDomainRepository fakeDomainRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeDomainRepository = FakeDomainRepository();
      viewModel = DomainsViewModel();
      viewModel.update(fakeDomainRepository);
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
      expect(viewModel.whitelistDomains, []);
      expect(viewModel.blacklistDomains, []);
      expect(viewModel.filteredWhitelistDomains, []);
      expect(viewModel.filteredBlacklistDomains, []);
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

    test('loadDomains fetches domains list', () async {
      await viewModel.loadDomains.runAsync();
      expect(viewModel.whitelistDomains.length, 2);
      expect(viewModel.blacklistDomains.length, 2);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('loadDomains sets error on failure', () async {
      fakeDomainRepository.shouldFail = true;
      try {
        await viewModel.loadDomains.runAsync();
      } catch (_) {}
      expect(viewModel.loadingStatus, LoadStatus.error);
    });

    test('onSearch filters domains based on search term', () async {
      await viewModel.loadDomains.runAsync();
      listenerCalled = false;

      viewModel.onSearch('blocked');
      expect(viewModel.filteredWhitelistDomains.length, 0);
      expect(viewModel.filteredBlacklistDomains.length, 1);
      expect(viewModel.filteredBlacklistDomains.first.name, 'blocked.com');
      expect(listenerCalled, true);
    });

    test('deleteDomain removes domain from the list', () async {
      await viewModel.loadDomains.runAsync();
      final domain = viewModel.whitelistDomains.first;
      listenerCalled = false;

      await viewModel.deleteDomain.runAsync(domain);
      expect(
        viewModel.whitelistDomains.where((d) => d.id == domain.id),
        isEmpty,
      );
      expect(listenerCalled, true);
    });

    test('addDomain reloads domains after adding', () async {
      await viewModel.loadDomains.runAsync();
      final initialCount = viewModel.whitelistDomains.length;

      await viewModel.addDomain.runAsync((
        type: DomainType.allow,
        kind: DomainKind.exact,
        domain: 'new.example.com',
      ));

      // After add, loadDomains is called internally so list is refreshed
      expect(viewModel.whitelistDomains.length, initialCount);
    });

    test('updateDomain reloads domains after updating', () async {
      await viewModel.loadDomains.runAsync();
      final domain = viewModel.whitelistDomains.first;

      await viewModel.updateDomain.runAsync(
        domain.copyWith(comment: 'updated comment'),
      );

      // After update, loadDomains is called internally so list is refreshed
      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    group('Group Filter', () {
      test('setGroupFilter updates groupFilter and filters domains', () async {
        await viewModel.loadDomains.runAsync();
        listenerCalled = false;

        viewModel.setGroupFilter(0);
        expect(viewModel.groupFilter, 0);
        expect(listenerCalled, true);
      });

      test('clearGroupFilter clears the filter', () async {
        await viewModel.loadDomains.runAsync();
        viewModel.setGroupFilter(1);
        listenerCalled = false;

        viewModel.clearGroupFilter();

        expect(viewModel.groupFilter, null);
        expect(listenerCalled, true);
      });

      test('group filter and search filter combine correctly', () async {
        await viewModel.loadDomains.runAsync();

        viewModel.setGroupFilter(0);
        viewModel.onSearch('example');

        // All fake domains have group 0 and contain 'example'
        expect(viewModel.filteredWhitelistDomains.length, 2);
      });

      test('setGroupFilter with non-existent group returns empty list',
          () async {
        await viewModel.loadDomains.runAsync();

        viewModel.setGroupFilter(999);

        expect(viewModel.filteredWhitelistDomains.length, 0);
        expect(viewModel.filteredBlacklistDomains.length, 0);
      });
    });
  });
}
