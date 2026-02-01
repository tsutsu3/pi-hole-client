import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models_old/domain.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/viewmodel/domains_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

import './domains_list_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, ApiGatewayV6])
void main() {
  group('DomainsListProvider', () {
    late bool listenerCalled;
    late DomainsListProvider provider;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;

    final domains = [
      Domain(
        id: 1,
        type: 0,
        domain: 'example.com',
        enabled: 1,
        dateAdded: DateTime.now(),
        dateModified: DateTime.now(),
        comment: null,
        groups: [0],
      ),
    ];

    setUp(() {
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(mockApiGatewayV6.getDomainLists()).thenAnswer(
        (_) async => GetDomainLists(
          result: APiResponseType.success,
          data: DomainListResult(
            whitelist: domains,
            whitelistRegex: [],
            blacklist: domains,
            blacklistRegex: [],
          ),
        ),
      );
      provider = DomainsListProvider(serversProvider: mockServersProvider);
      listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });
    });

    test('initial values are correct', () {
      expect(provider.loadingStatus, LoadStatus.loading);
      expect(provider.whitelistDomains, []);
      expect(provider.blacklistDomains, []);
      expect(provider.filteredWhitelistDomains, []);
      expect(provider.filteredBlacklistDomains, []);
      expect(provider.selectedTab, null);
      expect(provider.searchTerm, '');
      expect(provider.searchMode, false);
      expect(provider.groupFilter, null);
      expect(listenerCalled, false);
    });

    test('update updates serversProvider', () {
      final newProvider = MockServersProvider();
      provider.update(newProvider);
      expect(provider.serversProvider, newProvider);
      expect(listenerCalled, false);
    });

    test('setLoadingStatus updates loading status', () {
      provider.setLoadingStatus(LoadStatus.loaded);
      expect(provider.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('setWhitelistDomains updates whitelist domains', () {
      provider.setWhitelistDomains(domains);
      expect(provider.whitelistDomains, domains);
      expect(listenerCalled, true);
    });

    test('setBlacklistDomains updates blacklist domains', () {
      provider.setBlacklistDomains(domains);
      expect(provider.blacklistDomains, domains);
      expect(listenerCalled, true);
    });

    test('setSelectedTab updates selected tab', () {
      provider.setSelectedTab(1);
      expect(provider.selectedTab, 1);
      expect(listenerCalled, false);
    });

    test('setSearchMode updates search mode', () {
      provider.setSearchMode(true);
      expect(provider.searchMode, true);
      expect(listenerCalled, true);
    });

    test('onSearch filters domains based on search term', () {
      provider.setWhitelistDomains(domains);
      provider.setBlacklistDomains(domains);

      provider.onSearch('example');
      expect(provider.filteredWhitelistDomains.length, 1);
      expect(provider.filteredBlacklistDomains.length, 1);
      expect(listenerCalled, true);
    });

    test('fetchDomainsList fetches domains list', () async {
      provider.setWhitelistDomains(domains);
      provider.setBlacklistDomains(domains);

      await provider.fetchDomainsList();
      expect(provider.whitelistDomains, domains);
      expect(provider.blacklistDomains, domains);
      expect(listenerCalled, true);
    });

    test('removeDomainFromList removes domain from the list', () {
      provider.setWhitelistDomains(domains);

      provider.removeDomainFromList(domains[0]);
      expect(provider.whitelistDomains, []);
      expect(listenerCalled, true);
    });

    group('Group Filter', () {
      final domainsWithGroups = [
        Domain(
          id: 1,
          type: 0,
          domain: 'example1.com',
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: null,
          groups: [1, 2],
        ),
        Domain(
          id: 2,
          type: 0,
          domain: 'example2.com',
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: null,
          groups: [2, 3],
        ),
        Domain(
          id: 3,
          type: 0,
          domain: 'example3.com',
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: null,
          groups: [1],
        ),
      ];

      final blacklistDomainsWithGroups = [
        Domain(
          id: 4,
          type: 1,
          domain: 'blocked1.com',
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: null,
          groups: [1],
        ),
        Domain(
          id: 5,
          type: 1,
          domain: 'blocked2.com',
          enabled: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          comment: null,
          groups: [2],
        ),
      ];

      test('setGroupFilter updates groupFilter and filters domains', () {
        provider.setWhitelistDomains(domainsWithGroups);
        provider.setBlacklistDomains(blacklistDomainsWithGroups);
        listenerCalled = false;

        provider.setGroupFilter(1);

        expect(provider.groupFilter, 1);
        expect(provider.filteredWhitelistDomains.length, 2);
        expect(provider.filteredBlacklistDomains.length, 1);
        expect(listenerCalled, true);
      });

      test('setGroupFilter with group 2 filters correctly', () {
        provider.setWhitelistDomains(domainsWithGroups);
        provider.setBlacklistDomains(blacklistDomainsWithGroups);

        provider.setGroupFilter(2);

        expect(provider.groupFilter, 2);
        expect(provider.filteredWhitelistDomains.length, 2);
        expect(provider.filteredBlacklistDomains.length, 1);
      });

      test('clearGroupFilter clears the filter', () {
        provider.setWhitelistDomains(domainsWithGroups);
        provider.setBlacklistDomains(blacklistDomainsWithGroups);
        provider.setGroupFilter(1);
        listenerCalled = false;

        provider.clearGroupFilter();

        expect(provider.groupFilter, null);
        expect(provider.filteredWhitelistDomains.length, 3);
        expect(provider.filteredBlacklistDomains.length, 2);
        expect(listenerCalled, true);
      });

      test('group filter and search filter combine correctly', () {
        provider.setWhitelistDomains(domainsWithGroups);
        provider.setBlacklistDomains(blacklistDomainsWithGroups);

        provider.setGroupFilter(1);
        provider.onSearch('example1');

        expect(provider.filteredWhitelistDomains.length, 1);
        expect(provider.filteredWhitelistDomains[0].domain, 'example1.com');
      });

      test('setGroupFilter with non-existent group returns empty list', () {
        provider.setWhitelistDomains(domainsWithGroups);
        provider.setBlacklistDomains(blacklistDomainsWithGroups);

        provider.setGroupFilter(999);

        expect(provider.filteredWhitelistDomains.length, 0);
        expect(provider.filteredBlacklistDomains.length, 0);
      });
    });
  });
}
