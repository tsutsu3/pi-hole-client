import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
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

    group('Group Filter', () {
      final subscriptionsWithGroups = [
        Subscription(
          address: 'https://example.com/list1',
          type: 'allow',
          groups: [1, 2],
          enabled: true,
          id: 1,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          dateUpdated: DateTime.now(),
          number: 100,
          invalidDomains: 0,
          abpEntries: 0,
          status: ListsStatus.downloaded,
        ),
        Subscription(
          address: 'https://example.com/list2',
          type: 'allow',
          groups: [2, 3],
          enabled: true,
          id: 2,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          dateUpdated: DateTime.now(),
          number: 200,
          invalidDomains: 0,
          abpEntries: 0,
          status: ListsStatus.downloaded,
        ),
        Subscription(
          address: 'https://example.com/list3',
          type: 'allow',
          groups: [1],
          enabled: true,
          id: 3,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          dateUpdated: DateTime.now(),
          number: 300,
          invalidDomains: 0,
          abpEntries: 0,
          status: ListsStatus.downloaded,
        ),
      ];

      final blacklistSubscriptionsWithGroups = [
        Subscription(
          address: 'https://example.com/blocklist1',
          type: 'block',
          groups: [1],
          enabled: true,
          id: 4,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          dateUpdated: DateTime.now(),
          number: 400,
          invalidDomains: 0,
          abpEntries: 0,
          status: ListsStatus.downloaded,
        ),
        Subscription(
          address: 'https://example.com/blocklist2',
          type: 'block',
          groups: [2],
          enabled: true,
          id: 5,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
          dateUpdated: DateTime.now(),
          number: 500,
          invalidDomains: 0,
          abpEntries: 0,
          status: ListsStatus.downloaded,
        ),
      ];

      test('setGroupFilter updates groupFilter and filters subscriptions', () {
        provider.setWhitelistSubscriptions(subscriptionsWithGroups);
        provider.setBlacklistSubscriptions(blacklistSubscriptionsWithGroups);
        listenerCalled = false;

        provider.setGroupFilter(1);

        expect(provider.groupFilter, 1);
        expect(provider.filteredWhitelistSubscriptions.length, 2);
        expect(provider.filteredBlacklistSubscriptions.length, 1);
        expect(listenerCalled, true);
      });

      test('setGroupFilter with group 2 filters correctly', () {
        provider.setWhitelistSubscriptions(subscriptionsWithGroups);
        provider.setBlacklistSubscriptions(blacklistSubscriptionsWithGroups);

        provider.setGroupFilter(2);

        expect(provider.groupFilter, 2);
        expect(provider.filteredWhitelistSubscriptions.length, 2);
        expect(provider.filteredBlacklistSubscriptions.length, 1);
      });

      test('clearGroupFilter clears the filter', () {
        provider.setWhitelistSubscriptions(subscriptionsWithGroups);
        provider.setBlacklistSubscriptions(blacklistSubscriptionsWithGroups);
        provider.setGroupFilter(1);
        listenerCalled = false;

        provider.clearGroupFilter();

        expect(provider.groupFilter, null);
        expect(provider.filteredWhitelistSubscriptions.length, 3);
        expect(provider.filteredBlacklistSubscriptions.length, 2);
        expect(listenerCalled, true);
      });

      test('group filter and search filter combine correctly', () {
        provider.setWhitelistSubscriptions(subscriptionsWithGroups);
        provider.setBlacklistSubscriptions(blacklistSubscriptionsWithGroups);

        provider.setGroupFilter(1);
        provider.onSearch('list1');

        expect(provider.filteredWhitelistSubscriptions.length, 1);
        expect(
          provider.filteredWhitelistSubscriptions[0].address,
          'https://example.com/list1',
        );
      });

      test('setGroupFilter with non-existent group returns empty list', () {
        provider.setWhitelistSubscriptions(subscriptionsWithGroups);
        provider.setBlacklistSubscriptions(blacklistSubscriptionsWithGroups);

        provider.setGroupFilter(999);

        expect(provider.filteredWhitelistSubscriptions.length, 0);
        expect(provider.filteredBlacklistSubscriptions.length, 0);
      });
    });
  });
}
