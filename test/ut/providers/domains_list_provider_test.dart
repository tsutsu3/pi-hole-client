import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import './domains_list_provider_test.mocks.dart';

@GenerateMocks([ServersProvider])
void main() {
  group('DomainsListProvider', () {
    late DomainsListProvider provider;
    late MockServersProvider mockServersProvider;
    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
    );

    setUp(() {
      mockServersProvider = MockServersProvider();
      when(mockServersProvider.selectedApiGateway)
          .thenReturn(ApiGatewayV6(server));
      provider = DomainsListProvider(serversProvider: mockServersProvider);
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
    });

    test('setLoadingStatus updates loading status', () {
      provider.setLoadingStatus(LoadStatus.loaded);
      expect(provider.loadingStatus, LoadStatus.loaded);
    });

    // test('setWhitelistDomains updates whitelist domains', () {
    //   final domains = [Domain(id: 1, domain: 'example.com', type: 0)];
    //   provider.setWhitelistDomains(domains);
    //   expect(provider.whitelistDomains, domains);
    // });

    // test('setBlacklistDomains updates blacklist domains', () {
    //   final domains = [Domain(id: 1, domain: 'example.com', type: 1)];
    //   provider.setBlacklistDomains(domains);
    //   expect(provider.blacklistDomains, domains);
    // });

    test('setSelectedTab updates selected tab', () {
      provider.setSelectedTab(1);
      expect(provider.selectedTab, 1);
    });

    test('setSearchMode updates search mode', () {
      provider.setSearchMode(true);
      expect(provider.searchMode, true);
    });

    // test('onSearch filters domains based on search term', () {
    //   final whitelistDomains = [
    //     Domain(id: 1, domain: 'example.com', type: 0),
    //     Domain(id: 2, domain: 'test.com', type: 0),
    //   ];
    //   final blacklistDomains = [
    //     Domain(id: 3, domain: 'example.org', type: 1),
    //     Domain(id: 4, domain: 'test.org', type: 1),
    //   ];
    //   provider.setWhitelistDomains(whitelistDomains);
    //   provider.setBlacklistDomains(blacklistDomains);

    //   provider.onSearch('example');
    //   expect(provider.filteredWhitelistDomains.length, 1);
    //   expect(provider.filteredBlacklistDomains.length, 1);
    // });

    // test('removeDomainFromList removes domain from the list', () {
    //   final domain = Domain(id: 1, domain: 'example.com', type: 0);
    //   provider.setWhitelistDomains([domain]);
    //   provider.removeDomainFromList(domain);
    //   expect(provider.whitelistDomains, []);
    // });
  });
}
