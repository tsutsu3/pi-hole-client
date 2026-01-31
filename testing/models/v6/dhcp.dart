import 'package:pi_hole_client/data/model/v6/dhcp/dhcp.dart' as srv;
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart' as repo;

const kSrvGetDhcpLeases = srv.Dhcp(
  leases: [
    srv.DhcpData(
      expires: 1675671991,
      name: 'raspberrypi',
      hwaddr: '00:00:00:00:00:00',
      ip: '192.168.2.111',
      clientid: '00:00:00:00:00:00',
    ),
  ],
  took: 0.003,
);

final kRepoFetchDhcpLeases = [
  repo.DhcpLease(
    expires: DateTime.fromMillisecondsSinceEpoch(1675671991 * 1000),
    name: 'raspberrypi',
    hwaddr: '00:00:00:00:00:00',
    ip: '192.168.2.111',
    clientid: '00:00:00:00:00:00',
  ),
];
