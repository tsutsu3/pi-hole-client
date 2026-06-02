import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/fakes/repositories/api/fake_domain_repository.dart';

/// A [DomainRepository] whose [fetchAllDomains] result and timing can be
/// controlled per test: swap the returned dataset, gate the response on a
/// [Completer], force failures, and count how often it was hit.
class _ControllableDomainRepository implements DomainRepository {
  _ControllableDomainRepository(this._lists);

  DomainLists _lists;
  Completer<void>? gate;
  bool shouldFail = false;
  int fetchCount = 0;

  void setLists(DomainLists lists) => _lists = lists;

  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    fetchCount++;
    // Capture the dataset at call time: a response that resolves later must
    // reflect the data as it was when the query was issued, so a mutation that
    // lands during an in-flight fetch is not retroactively included.
    final snapshot = _lists;
    final gate = this.gate;
    if (gate != null) await gate.future;
    if (shouldFail) {
      return Failure(Exception('Force fetchAllDomains failure'));
    }
    return Success(snapshot);
  }

  @override
  Future<Result<Domain>> addDomain(
    DomainType type,
    DomainKind kind,
    String domain, {
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async {
    final added = Domain(
      id: _lists.allowExact.length + _lists.denyExact.length + 100,
      name: domain,
      punyCode: domain,
      type: type,
      kind: kind,
      comment: comment,
      groups: groups ?? const [0],
      enabled: enabled ?? true,
      dateAdded: _ts,
      dateModified: _ts,
    );
    return Success(added);
  }

  @override
  Future<Result<Domain>> updateDomain(
    DomainType type,
    DomainKind kind,
    String domain, {
    String? comment,
    List<int>? groups = const [0],
    bool? enabled = true,
  }) async => Failure(Exception('not used'));

  @override
  Future<Result<Unit>> deleteDomain(
    DomainType type,
    DomainKind kind,
    String domain,
  ) async => const Success(unit);
}

DateTime _ts = DateTime(2025, 1, 1);

/// Builds a [DomainLists] holding a single allow-exact domain named [allowName]
/// so tests can assert which server's dataset ended up in the view model.
///
/// [allowName] is optional: omit it when the dataset content is irrelevant and
/// only a distinct repository instance is needed (e.g. server-switch resets).
DomainLists _listsWith([String allowName = 'placeholder.com']) => DomainLists(
  allowExact: [
    Domain(
      id: 1,
      name: allowName,
      punyCode: allowName,
      type: DomainType.allow,
      kind: DomainKind.exact,
      comment: null,
      groups: const [0],
      enabled: true,
      dateAdded: _ts,
      dateModified: _ts,
    ),
  ],
  allowRegex: const [],
  denyExact: const [],
  denyRegex: const [],
);

void main() {
  group('DomainsViewModel', () {
    late bool listenerCalled;
    late DomainsViewModel viewModel;
    late FakeDomainRepository fakeDomainRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeDomainRepository = FakeDomainRepository();
      viewModel = DomainsViewModel(domainRepository: fakeDomainRepository);
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
      expect(viewModel.loadingStatus, LoadStatus.loading);
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
      expect(listenerCalled, true);
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

    test('addDomain appends domain locally', () async {
      await viewModel.loadDomains.runAsync();
      final initialCount = viewModel.whitelistDomains.length;

      await viewModel.addDomain.runAsync((
        type: DomainType.allow,
        kind: DomainKind.exact,
        domain: 'new.example.com',
      ));

      // Local state update — no re-fetch
      expect(viewModel.whitelistDomains.length, initialCount + 1);
      expect(viewModel.whitelistDomains.last.name, 'new.example.com');
    });

    test('updateDomain replaces domain locally', () async {
      await viewModel.loadDomains.runAsync();
      final domain = viewModel.whitelistDomains.first;

      await viewModel.updateDomain.runAsync(
        domain.copyWith(comment: 'updated comment'),
      );

      // Local state update — no re-fetch
      expect(viewModel.whitelistDomains.first.comment, 'updated comment');
    });

    test('addDomain appends to blacklist for deny type', () async {
      await viewModel.loadDomains.runAsync();
      final initialCount = viewModel.blacklistDomains.length;

      await viewModel.addDomain.runAsync((
        type: DomainType.deny,
        kind: DomainKind.exact,
        domain: 'evil.example.com',
      ));

      expect(viewModel.blacklistDomains.length, initialCount + 1);
      expect(viewModel.blacklistDomains.last.name, 'evil.example.com');
    });

    test('deleteDomain removes domain from blacklist', () async {
      await viewModel.loadDomains.runAsync();
      final domain = viewModel.blacklistDomains.first;
      listenerCalled = false;

      await viewModel.deleteDomain.runAsync(domain);
      expect(
        viewModel.blacklistDomains.where((d) => d.id == domain.id),
        isEmpty,
      );
      expect(listenerCalled, true);
    });

    test('setSelectedDomain stores domain and notifies', () async {
      await viewModel.loadDomains.runAsync();
      final domain = viewModel.whitelistDomains.first;
      listenerCalled = false;

      viewModel.setSelectedDomain(domain);

      expect(viewModel.selectedDomain, equals(domain));
      expect(listenerCalled, true);
    });

    test('setSelectedDomain(null) clears selection', () {
      viewModel.setSelectedDomain(null);
      expect(viewModel.selectedDomain, isNull);
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

      test(
        'setGroupFilter with non-existent group returns empty list',
        () async {
          await viewModel.loadDomains.runAsync();

          viewModel.setGroupFilter(999);

          expect(viewModel.filteredWhitelistDomains.length, 0);
          expect(viewModel.filteredBlacklistDomains.length, 0);
        },
      );
    });
  });

  group('DomainsViewModel - stale-while-revalidate', () {
    setUp(() => Command.globalExceptionHandler = (_, _) {});
    tearDown(() => Command.globalExceptionHandler = null);

    test(
      'keeps cached list visible and sets isRevalidating during a background reload',
      () async {
        final repo = _ControllableDomainRepository(_listsWith('cached.com'));
        final vm = DomainsViewModel(domainRepository: repo);
        addTearDown(vm.dispose);

        // First load populates the cache.
        await vm.loadDomains.runAsync();
        expect(vm.isRevalidating, isFalse);
        expect(vm.whitelistDomains.single.name, 'cached.com');
        expect(vm.loadingStatus, LoadStatus.loaded);

        // Gate the next fetch so the reload stays in flight.
        repo.setLists(_listsWith('fresh.com'));
        repo.gate = Completer<void>();
        final pending = vm.loadDomains.runAsync();
        await Future<void>.delayed(Duration.zero);

        // SWR: stale list stays visible, status stays loaded, bar is shown.
        expect(vm.isRevalidating, isTrue);
        expect(vm.loadingStatus, LoadStatus.loaded);
        expect(vm.whitelistDomains.single.name, 'cached.com');

        // Completing the reload swaps in the fresh data and clears the bar.
        repo.gate!.complete();
        await pending;
        expect(vm.isRevalidating, isFalse);
        expect(vm.loadingStatus, LoadStatus.loaded);
        expect(vm.whitelistDomains.single.name, 'fresh.com');
      },
    );

    test('failed background reload keeps the cached list', () async {
      final repo = _ControllableDomainRepository(_listsWith('cached.com'));
      final vm = DomainsViewModel(domainRepository: repo);
      addTearDown(vm.dispose);

      await vm.loadDomains.runAsync();
      expect(vm.whitelistDomains.single.name, 'cached.com');

      repo.shouldFail = true;
      try {
        await vm.loadDomains.runAsync();
      } catch (_) {}

      // Cache is preserved; no error screen because there is data to show.
      expect(vm.loadingStatus, LoadStatus.loaded);
      expect(vm.isRevalidating, isFalse);
      expect(vm.whitelistDomains.single.name, 'cached.com');
    });

    test(
      'a mutation during revalidation is not overwritten by the stale fetch',
      () async {
        final repo = _ControllableDomainRepository(_listsWith('cached.com'));
        final vm = DomainsViewModel(domainRepository: repo);
        addTearDown(vm.dispose);

        // First load populates the cache.
        await vm.loadDomains.runAsync();
        expect(vm.whitelistDomains.map((d) => d.name), ['cached.com']);

        // Start a revalidation and gate it so it stays in flight. Its snapshot
        // is captured now (just {cached.com}), before the upcoming add.
        repo.gate = Completer<void>();
        final pending = vm.loadDomains.runAsync();
        await Future<void>.delayed(Duration.zero);
        expect(vm.isRevalidating, isTrue);

        // While the revalidation is in flight, the user adds a domain; the
        // server confirms it and the local list updates optimistically.
        await vm.addDomain.runAsync((
          type: DomainType.allow,
          kind: DomainKind.exact,
          domain: 'added.com',
        ));
        expect(vm.whitelistDomains.map((d) => d.name), [
          'cached.com',
          'added.com',
        ]);

        // The in-flight fetch resolves with its pre-add snapshot. It must be
        // discarded, not applied over the user's confirmed addition.
        repo.gate!.complete();
        await pending;

        expect(vm.whitelistDomains.map((d) => d.name), [
          'cached.com',
          'added.com',
        ]);
        expect(vm.isRevalidating, isFalse);
        expect(vm.loadingStatus, LoadStatus.loaded);
        // Only the single gated fetch ran; the discard does not re-fetch.
        expect(repo.fetchCount, 2);
      },
    );
  });

  group('DomainsViewModel - server switch (update)', () {
    setUp(() => Command.globalExceptionHandler = (_, _) {});
    tearDown(() => Command.globalExceptionHandler = null);

    test('update() with a new repository resets cached state', () async {
      final repoA = _ControllableDomainRepository(_listsWith('a.com'));
      final vm = DomainsViewModel(domainRepository: repoA);
      addTearDown(vm.dispose);

      await vm.loadDomains.runAsync();
      expect(vm.whitelistDomains, isNotEmpty);
      expect(vm.loadingStatus, LoadStatus.loaded);

      // Change server
      vm.update(domainRepository: _ControllableDomainRepository(_listsWith()));

      expect(vm.whitelistDomains, isEmpty);
      expect(vm.blacklistDomains, isEmpty);
      expect(vm.filteredWhitelistDomains, isEmpty);
      expect(vm.filteredBlacklistDomains, isEmpty);
      expect(vm.loadingStatus, LoadStatus.loading);
      expect(vm.isRevalidating, isFalse);
    });

    test('update() with the same repository instance is a no-op', () async {
      final repo = _ControllableDomainRepository(_listsWith('a.com'));
      final vm = DomainsViewModel(domainRepository: repo);
      addTearDown(vm.dispose);

      await vm.loadDomains.runAsync();
      expect(vm.whitelistDomains, isNotEmpty);

      vm.update(domainRepository: repo);

      // No reset: the loaded list is preserved.
      expect(vm.whitelistDomains, isNotEmpty);
      expect(vm.loadingStatus, LoadStatus.loaded);
      expect(vm.whitelistDomains.single.name, 'a.com');
    });

    test(
      'discards an in-flight load from the previous server (epoch guard)',
      () async {
        final repoA = _ControllableDomainRepository(_listsWith('a.com'));
        repoA.gate = Completer<void>();
        final repoB = _ControllableDomainRepository(_listsWith('b.com'));
        final vm = DomainsViewModel(domainRepository: repoA);
        addTearDown(vm.dispose);

        // Start a load against server A that stays in flight.
        final pendingOld = vm.loadDomains.runAsync();
        await Future<void>.delayed(Duration.zero);
        expect(repoA.fetchCount, 1);

        // Switch to server B (screen inactive -> reset only, no eager reload).
        vm.update(domainRepository: repoB);
        expect(vm.whitelistDomains, isEmpty);

        // The delayed server-A response must be discarded, not applied.
        repoA.gate!.complete();
        await pendingOld;
        expect(vm.whitelistDomains, isEmpty);
        expect(vm.loadingStatus, LoadStatus.loading);

        // A fresh load now resolves against server B.
        await vm.loadDomains.runAsync();
        expect(vm.whitelistDomains.single.name, 'b.com');
      },
    );

    test('update() resets cached state but does not load on its own', () async {
      final repoA = _ControllableDomainRepository(_listsWith('a.com'));
      final repoB = _ControllableDomainRepository(_listsWith('b.com'));
      final vm = DomainsViewModel(domainRepository: repoA);
      addTearDown(vm.dispose);

      await vm.loadDomains.runAsync();
      expect(vm.whitelistDomains.single.name, 'a.com');

      // Switching servers clears the cache and marks loading, but the reload is
      // deferred to the next screen mount — update() itself never fetches.
      vm.update(domainRepository: repoB);
      await Future<void>.delayed(Duration.zero);

      expect(repoB.fetchCount, 0);
      expect(vm.whitelistDomains, isEmpty);
      expect(vm.loadingStatus, LoadStatus.loading);
    });
  });
}
