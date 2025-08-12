import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/data/model/v6/lists/lists.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/subscriptions.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/subscriptions_list_provider.dart';

import './subscriptions_list_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, ApiGatewayV6])
void main() {
  group('SubscriptionsListProvider', () {
    late bool listenerCalled;
    late SubscriptionsListProvider provider;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;

    final subscriptions = [
      Subscription(
        address:
            'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
        type: 'block',
        groups: [0],
        enabled: true,
        id: 106,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
        dateModified: DateTime.fromMillisecondsSinceEpoch(1595279300 * 1000),
        dateUpdated: DateTime.fromMillisecondsSinceEpoch(0 * 1000),
        number: 134553,
        invalidDomains: 1,
        abpEntries: 0,
        status: ListsStatus.downloaded,
        comment: 'Migrated from /etc/pihole/adlists.list',
      ),
    ];
    const singleData = {
      'lists': [
        {
          'address':
              'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
          'comment': 'Migrated from /etc/pihole/adlists.list',
          'groups': [0],
          'enabled': true,
          'id': 106,
          'date_added': 1594670974,
          'date_modified': 1595279300,
          'type': 'block',
          'date_updated': 0,
          'number': 134553,
          'invalid_domains': 1,
          'abp_entries': 0,
          'status': 1,
        },
      ],
      'took': 0.012,
    };

    setUp(() {
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(mockApiGatewayV6.getSubscriptions()).thenAnswer(
        (_) async => SubscriptionsResponse(
          result: APiResponseType.success,
          data: SubscriptionsInfo.fromV6(Lists.fromJson(singleData)),
        ),
      );
      provider = SubscriptionsListProvider(
        serversProvider: mockServersProvider,
      );
      listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });
    });

    test('initial values are correct', () {
      expect(provider.loadingStatus, LoadStatus.loading);
      expect(provider.whitelistSubscriptions, []);
      expect(provider.blacklistSubscriptions, []);
      expect(provider.filteredWhitelistSubscriptions, []);
      expect(provider.filteredBlacklistSubscriptions, []);
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

    test('setWhitelistSubscriptions updates allow adlists', () {
      provider.setWhitelistSubscriptions(subscriptions);
      expect(provider.whitelistSubscriptions, subscriptions);
      expect(listenerCalled, true);
    });

    test('setBlacklistSubscriptions updates block adlists', () {
      provider.setBlacklistSubscriptions(subscriptions);
      expect(provider.blacklistSubscriptions, subscriptions);
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
      provider.setWhitelistSubscriptions(subscriptions);
      provider.setBlacklistSubscriptions(subscriptions);

      provider.onSearch('StevenBlack');
      expect(provider.filteredWhitelistSubscriptions.length, 1);
      expect(provider.filteredBlacklistSubscriptions.length, 1);
      expect(listenerCalled, true);
    });

    test('fetchSubscriptionsList fetches adlists', () async {
      await provider.fetchSubscriptionsList();
      expect(provider.loadingStatus, LoadStatus.loaded);
      expect(provider.whitelistSubscriptions, []);
      expect(
        provider.blacklistSubscriptions[0].toJson(),
        subscriptions[0].toJson(),
      );
      expect(listenerCalled, true);
    });

    test('removeSubscriptionFromList removes adlist from the list', () {
      provider.setBlacklistSubscriptions(subscriptions);

      provider.removeSubscriptionFromList(subscriptions[0]);
      expect(provider.blacklistSubscriptions, []);
      expect(listenerCalled, true);
    });
  });
}
