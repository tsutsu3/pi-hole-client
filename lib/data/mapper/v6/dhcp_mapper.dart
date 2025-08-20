import 'package:pi_hole_client/data/model/v6/dhcp/dhcp.dart' as s;
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart' as d;

extension DhcpMapper on s.Dhcp {
  List<d.DhcpLease> toDomain() {
    return leases.map((lease) {
      return d.DhcpLease(
        expires: DateTime.fromMillisecondsSinceEpoch(lease.expires * 1000),
        name: lease.name,
        hwaddr: lease.hwaddr,
        ip: lease.ip,
        clientid: lease.clientid,
      );
    }).toList();
  }
}
