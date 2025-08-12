import 'package:pi_hole_client/data/model/v6/dhcp/dhcp.dart';

class DhcpsInfo {
  DhcpsInfo({required this.leases});

  factory DhcpsInfo.fromV6(Dhcp dhcp) {
    return DhcpsInfo(leases: dhcp.leases.map(DhcpInfo.fromV6).toList());
  }

  final List<DhcpInfo> leases;

  Map<String, dynamic> toJson() {
    return {'leases': leases.map((lease) => lease.toJson()).toList()};
  }
}

class DhcpInfo {
  DhcpInfo({
    required this.expires,
    required this.name,
    required this.hwaddr,
    required this.ip,
    required this.clientid,
  });

  factory DhcpInfo.fromV6(DhcpData dhcpData) {
    return DhcpInfo(
      expires: DateTime.fromMillisecondsSinceEpoch(dhcpData.expires * 1000),
      name: dhcpData.name,
      hwaddr: dhcpData.hwaddr,
      ip: dhcpData.ip,
      clientid: dhcpData.clientid,
    );
  }

  final DateTime expires;
  final String name;
  final String hwaddr;
  final String ip;
  final String clientid;

  Map<String, dynamic> toJson() {
    return {
      'expires': expires.toIso8601String(),
      'name': name,
      'hwaddr': hwaddr,
      'ip': ip,
      'clientid': clientid,
    };
  }
}
