import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/shared/models/domain.dart';
import 'package:pi_hole_client/data/services/api/shared/models/gateways.dart';
import 'package:pi_hole_client/data/services/api/v6/api_gateway_v6.dart';
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
  });
}
