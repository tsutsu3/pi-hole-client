import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/client_mapper.dart';
import 'package:pi_hole_client/data/model/v6/clients/clients.dart' as s;

const _clientData = s.Client(
  id: 10,
  client: '192.168.1.50',
  name: 'laptop',
  comment: 'my laptop',
  groups: [0, 2],
  dateAdded: 1700000000,
  dateModified: 1700001000,
);

void main() {
  group('ClientsMapper (v6)', () {
    test('maps all fields correctly', () {
      const source = s.Clients(clients: [_clientData], took: 0.001);
      final result = source.toDomain();

      expect(result.length, 1);
      final client = result[0];
      expect(client.id, 10);
      expect(client.client, '192.168.1.50');
      expect(client.name, 'laptop');
      expect(client.comment, 'my laptop');
      expect(client.groups, [0, 2]);
      expect(client.dateAdded, DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000));
      expect(client.dateModified, DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000));
    });

    test('maps multiple clients', () {
      const source = s.Clients(clients: [_clientData, _clientData], took: 0.001);
      expect(source.toDomain().length, 2);
    });

    test('returns empty list when clients is empty', () {
      const source = s.Clients(clients: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });

    test('toSingleDomain returns the one client', () {
      const source = s.Clients(clients: [_clientData], took: 0.001);
      expect(source.toSingleDomain().client, '192.168.1.50');
    });

    test('toSingleDomain throws when empty', () {
      const source = s.Clients(clients: [], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });

    test('toSingleDomain throws when multiple', () {
      const source = s.Clients(clients: [_clientData, _clientData], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });
  });
}
