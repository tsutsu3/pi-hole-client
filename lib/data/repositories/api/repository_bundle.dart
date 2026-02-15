import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/client_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/config_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/group_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';

class RepositoryBundle {
  const RepositoryBundle({
    required this.actions,
    required this.adlist,
    required this.auth,
    required this.client,
    required this.config,
    required this.dhcp,
    required this.dns,
    required this.domain,
    required this.ftl,
    required this.group,
    required this.localDns,
    required this.network,
    required this.serverAddress,
  });

  final ActionsRepository actions;
  final AdListRepository adlist;
  final AuthRepository auth;
  final ClientRepository client;
  final ConfigRepository config;
  final DhcpRepository dhcp;
  final DnsRepository dns;
  final DomainRepository domain;
  final FtlRepository ftl;
  final GroupRepository group;
  final LocalDnsRepository localDns;
  final NetworkRepository network;
  final String serverAddress;
}
