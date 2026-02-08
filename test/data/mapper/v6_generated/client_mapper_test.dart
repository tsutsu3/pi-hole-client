import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6_generated/client_mapper.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

void main() {
  group('ClientsGetClientsInnerMapper', () {
    test('maps all fields correctly', () {
      final inner = ClientsGetClientsInner(
        id: 3,
        client: '192.168.1.100',
        name: 'my-laptop',
        groups: [0, 2],
        dateAdded: 1700000000,
        dateModified: 1700001000,
        comment: 'Personal laptop',
      );

      final piholeClient = inner.toDomain();

      expect(piholeClient.id, 3);
      expect(piholeClient.client, '192.168.1.100');
      expect(piholeClient.name, 'my-laptop');
      expect(piholeClient.groups, [0, 2]);
      expect(piholeClient.enabled, true);
      expect(
        piholeClient.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        piholeClient.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
      expect(piholeClient.comment, 'Personal laptop');
    });

    test('maps MAC address client', () {
      final inner = ClientsGetClientsInner(
        client: 'AA:BB:CC:DD:EE:FF',
        name: 'printer',
      );

      final piholeClient = inner.toDomain();

      expect(piholeClient.client, 'AA:BB:CC:DD:EE:FF');
      expect(piholeClient.name, 'printer');
    });

    test('uses defaults for null fields', () {
      final inner = ClientsGetClientsInner();

      final piholeClient = inner.toDomain();

      expect(piholeClient.id, 0);
      expect(piholeClient.client, '');
      expect(piholeClient.name, isNull);
      expect(piholeClient.groups, [0]);
      expect(piholeClient.enabled, true);
      expect(piholeClient.comment, isNull);
      expect(piholeClient.dateAdded, DateTime.fromMillisecondsSinceEpoch(0));
      expect(
        piholeClient.dateModified,
        DateTime.fromMillisecondsSinceEpoch(0),
      );
    });
  });

  group('GetClients200ResponseMapper', () {
    test('toDomainList maps all entries', () {
      final response = GetClients200Response(
        clients: [
          ClientsGetClientsInner(id: 1, client: '10.0.0.1'),
          ClientsGetClientsInner(id: 2, client: '10.0.0.2'),
          ClientsGetClientsInner(id: 3, client: '10.0.0.3'),
        ],
      );

      final list = response.toDomainList();

      expect(list.length, 3);
      expect(list[0].client, '10.0.0.1');
      expect(list[1].client, '10.0.0.2');
      expect(list[2].client, '10.0.0.3');
    });

    test('toDomainList returns empty list when clients is null', () {
      final response = GetClients200Response();

      final list = response.toDomainList();

      expect(list, isEmpty);
    });
  });
}
