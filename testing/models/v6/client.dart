import 'package:pi_hole_client/data/model/v6/clients/clients.dart' as srv;
import 'package:pi_hole_client/domain/model/client/pihole_client.dart';

const kSrvGetClients = srv.Clients(
  clients: [
    srv.Client(
      id: 1,
      client: '192.168.1.100',
      name: 'desktop',
      comment: 'Main desktop',
      groups: [0],
      dateAdded: 1594670974,
      dateModified: 1611157897,
    ),
    srv.Client(
      id: 2,
      client: 'ab:cd:ef:01:23:45',
      name: 'laptop',
      groups: [0, 5],
      dateAdded: 1604871899,
      dateModified: 1604871899,
    ),
  ],
  took: 0.003,
);

const kSrvPostClients = srv.Clients(
  clients: [
    srv.Client(
      id: 10,
      client: '10.0.0.1',
      groups: [0],
      dateAdded: 1604871899,
      dateModified: 1604871899,
    ),
  ],
  took: 0.003,
);

const kSrvPutClients = srv.Clients(
  clients: [
    srv.Client(
      id: 1,
      client: '192.168.1.100',
      comment: 'updated',
      groups: [0, 5],
      dateAdded: 1594670974,
      dateModified: 1604871899,
    ),
  ],
  took: 0.003,
);

final kRepoFetchClients = [
  PiholeClient(
    id: 1,
    client: '192.168.1.100',
    name: 'desktop',
    comment: 'Main desktop',
    groups: [0],
    dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(1611157897 * 1000),
  ),
  PiholeClient(
    id: 2,
    client: 'ab:cd:ef:01:23:45',
    name: 'laptop',
    groups: [0, 5],
    dateAdded: DateTime.fromMillisecondsSinceEpoch(1604871899 * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(1604871899 * 1000),
  ),
];
