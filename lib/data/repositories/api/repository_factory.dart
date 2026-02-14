import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/api/v5/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/config_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/network_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/config_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/network_repository.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';

class RepositoryBundleFactory {
  static RepositoryBundle create({
    required Server server,
    required SecureStorageService storage,
  }) {
    final creds = SessionCredentialService(storage, server.address);

    switch (server.apiVersion) {
      case 'v6':
        final client = PiholeV6ApiClient(url: server.address);
        return RepositoryBundle(
          actions: ActionsRepositoryV6(client: client, creds: creds),
          auth: AuthRepositoryV6(client: client, creds: creds),
          config: ConfigRepositoryV6(client: client, creds: creds),
          dhcp: DhcpRepositoryV6(client: client, creds: creds),
          dns: DnsRepositoryV6(client: client, creds: creds),
          domain: DomainRepositoryV6(client: client, creds: creds),
          ftl: FtlRepositoryV6(client: client, creds: creds),
          localDns: LocalDnsRepositoryV6(client: client, creds: creds),
          network: NetworkRepositoryV6(client: client, creds: creds),
          serverAddress: server.address,
        );
      default:
        final client = PiholeV5ApiClient(url: server.address);
        return RepositoryBundle(
          actions: ActionsRepositoryV5(client: client, creds: creds),
          auth: AuthRepositoryV5(client: client, creds: creds),
          config: ConfigRepositoryV5(client: client, creds: creds),
          dhcp: DhcpRepositoryV5(client: client, creds: creds),
          dns: DnsRepositoryV5(client: client, creds: creds),
          domain: DomainRepositoryV5(client: client, creds: creds),
          ftl: FtlRepositoryV5(client: client, creds: creds),
          localDns: LocalDnsRepositoryV5(client: client, creds: creds),
          network: NetworkRepositoryV5(client: client, creds: creds),
          serverAddress: server.address,
        );
    }
  }
}
