import 'package:pi_hole_client/data/model/v6/ftl/host.dart';

class HostInfo {
  HostInfo({
    required this.domainName,
    required this.arch,
    required this.hostName,
    required this.release,
    required this.sysName,
    required this.version,
    required this.model,
  });

  factory HostInfo.fromV6(InfoHost host) {
    return HostInfo(
      domainName: host.host.uname.domainname,
      arch: host.host.uname.machine,
      hostName: host.host.uname.nodename,
      release: host.host.uname.release,
      sysName: host.host.uname.sysname,
      version: host.host.uname.version,
      model: host.host.model,
    );
  }

  final String domainName;
  final String arch;
  final String hostName;
  final String release;
  final String sysName;
  final String version;
  final String? model;

  Map<String, dynamic> toJson() => {
    'domainName': domainName,
    'arch': arch,
    'hostName': hostName,
    'release': release,
    'sysName': sysName,
    'version': version,
    'model': model,
  };
}
