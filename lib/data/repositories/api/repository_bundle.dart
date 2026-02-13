import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';

class RepositoryBundle {
  const RepositoryBundle({
    required this.auth,
    required this.dhcp,
    required this.ftl,
    required this.network,
    required this.serverAddress,
  });

  final AuthRepository auth;
  final DhcpRepository dhcp;
  final FtlRepository ftl;
  final NetworkRepository network;
  final String serverAddress;
}
