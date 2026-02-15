import 'package:pi_hole_client/data/model/v6/clients/clients.dart' as s;
import 'package:pi_hole_client/domain/model/client/pihole_client.dart' as d;

extension ClientsMapper on s.Clients {
  List<d.PiholeClient> toDomain() {
    return clients.map((client) {
      return d.PiholeClient(
        id: client.id,
        client: client.client,
        name: client.name,
        comment: client.comment,
        groups: client.groups,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(client.dateAdded * 1000),
        dateModified:
            DateTime.fromMillisecondsSinceEpoch(client.dateModified * 1000),
      );
    }).toList();
  }

  d.PiholeClient toSingleDomain() {
    if (clients.length != 1) {
      throw Exception(
        'Expected exactly one client, but got ${clients.length}',
      );
    }
    return toDomain().first;
  }
}
