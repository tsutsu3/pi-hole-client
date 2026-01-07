import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

import './clients_list_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, ApiGatewayV6])
void main() {
  group('ClientsListProvider', () {
    late ClientsListProvider provider;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;

    setUp(() {
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      provider = ClientsListProvider(serversProvider: mockServersProvider);
    });

    test('fetchClients sets loaded and populates lists', () async {
      final client = ClientItem(
        client: '192.168.1.2',
        name: 'device',
        groups: const [0],
        id: 1,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(mockApiGatewayV6.getClients()).thenAnswer(
        (_) async => ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo(clients: [client]),
        ),
      );

      await provider.fetchClients();

      expect(provider.loadingStatus, LoadStatus.loaded);
      expect(provider.clients, hasLength(1));
      expect(provider.filteredClients, hasLength(1));
    });

    test('fetchClients sets error when request fails', () async {
      when(
        mockApiGatewayV6.getClients(),
      ).thenAnswer((_) async => ClientsResponse(result: APiResponseType.error));

      await provider.fetchClients();

      expect(provider.loadingStatus, LoadStatus.error);
      expect(provider.clients, isEmpty);
    });

    test('onSearch matches mac and group names', () async {
      final client = ClientItem(
        client: '192.168.1.2',
        name: 'device',
        groups: const [1],
        id: 2,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(mockApiGatewayV6.getClients()).thenAnswer(
        (_) async => ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo(clients: [client]),
        ),
      );

      await provider.fetchClients();
      provider.updateMacLookup({'192.168.1.2': 'aa:bb:cc:dd:ee:ff'});
      provider.updateGroupLookup({1: 'Office'});

      provider.onSearch('aa:bb');
      expect(provider.filteredClients, hasLength(1));

      provider.onSearch('office');
      expect(provider.filteredClients, hasLength(1));
    });

    test('updateMacLookup re-filters when search term is set', () async {
      final client = ClientItem(
        client: '192.168.1.2',
        groups: const [0],
        id: 3,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(mockApiGatewayV6.getClients()).thenAnswer(
        (_) async => ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo(clients: [client]),
        ),
      );

      await provider.fetchClients();

      provider.onSearch('aa:bb');
      expect(provider.filteredClients, isEmpty);

      provider.updateMacLookup({'192.168.1.2': 'aa:bb'});
      expect(provider.filteredClients, hasLength(1));
    });

    test('removeClientFromList removes item from lists', () async {
      final clientA = ClientItem(
        client: '192.168.1.2',
        groups: const [0],
        id: 1,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );
      final clientB = ClientItem(
        client: '192.168.1.3',
        groups: const [0],
        id: 2,
        dateAdded: DateTime(2024, 1, 2),
        dateModified: DateTime(2024, 1, 2),
      );

      when(mockApiGatewayV6.getClients()).thenAnswer(
        (_) async => ClientsResponse(
          result: APiResponseType.success,
          data: ClientsInfo(clients: [clientA, clientB]),
        ),
      );

      await provider.fetchClients();
      provider.removeClientFromList(clientA);

      expect(provider.clients, hasLength(1));
      expect(provider.clients.first.id, clientB.id);
    });
  });
}
