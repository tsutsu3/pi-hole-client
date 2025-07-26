import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/model/v6/groups/groups.dart'
    show Groups;
import 'package:pi_hole_client/data/services/api/shared/models/gateways.dart';
import 'package:pi_hole_client/data/services/api/shared/models/groups.dart';
import 'package:pi_hole_client/data/services/api/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

import './groups_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, ApiGatewayV6])
void main() {
  group('GroupsProvider', () {
    late bool listenerCalled;
    late GroupsProvider provider;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;

    final groups = [
      Group(
        name: 'Default',
        id: 0,
        enabled: true,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
        dateModified: DateTime.fromMillisecondsSinceEpoch(1611157897 * 1000),
        comment: 'The default group',
      ),
    ];
    const singleData = {
      'groups': [
        {
          'name': 'Default',
          'comment': 'The default group',
          'enabled': true,
          'id': 0,
          'date_added': 1594670974,
          'date_modified': 1611157897,
        },
      ],
      'took': 0.003,
    };

    setUp(() {
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(mockApiGatewayV6.getGroups()).thenAnswer(
        (_) async => GroupsResponse(
          result: APiResponseType.success,
          data: GroupsInfo.fromV6(Groups.fromJson(singleData)),
        ),
      );
      provider = GroupsProvider(serversProvider: mockServersProvider);
      listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });
    });

    test('initial values are correct', () {
      expect(provider.loadingStatus, LoadStatus.loading);
      expect(provider.groups, []);
      expect(provider.groupItems, {});
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
      expect(listenerCalled, false);
    });

    test('loadGroups success', () async {
      await provider.loadGroups();
      expect(provider.loadingStatus, LoadStatus.loaded);
      expect(provider.groups.length, 1);
      expect(provider.groups[0].toJson(), groups[0].toJson());
      expect(listenerCalled, true);
    });

    test('loadGroups falied', () async {
      when(mockApiGatewayV6.getGroups()).thenAnswer(
        (_) async => GroupsResponse(
          result: APiResponseType.error,
          message: 'Error',
        ),
      );
      await provider.loadGroups();
      expect(provider.loadingStatus, LoadStatus.error);
      expect(provider.groups, []);
      expect(listenerCalled, true);
    });
  });
}
