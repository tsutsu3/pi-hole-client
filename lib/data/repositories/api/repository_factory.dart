import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/api/v5/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/client_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/config_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/group_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/network_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/realtime_status_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/client_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/config_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/group_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/network_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/realtime_status_repository.dart'
    as v6;
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';

class RepositoryBundleFactory {
  static RepositoryBundle create({
    required Server server,
    required SecureStorageService storage,
  }) {
    final creds = SessionCredentialService(storage, server.address);

    switch (server.apiVersion) {
      case SupportedApiVersions.v6:
        final client = PiholeV6ApiClient(url: server.address);
        final sessionCache = V6SessionCache(creds: creds, client: client);

        return RepositoryBundle(
          actions: ActionsRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          adlist: AdlistRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          auth: AuthRepositoryV6(client: client, sessionCache: sessionCache),
          client: ClientRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          config: ConfigRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          dhcp: DhcpRepositoryV6(client: client, sessionCache: sessionCache),
          dns: DnsRepositoryV6(client: client, sessionCache: sessionCache),
          domain: DomainRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          ftl: FtlRepositoryV6(client: client, sessionCache: sessionCache),
          group: GroupRepositoryV6(client: client, sessionCache: sessionCache),
          localDns: LocalDnsRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          metrics: MetricsRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          network: NetworkRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          realtimeStatus: v6.RealtimeStatusRepositoryV6(
            client: client,
            sessionCache: sessionCache,
          ),
          serverAddress: server.address,
          apiVersion: server.apiVersion,
        );
      default:
        final client = PiholeV5ApiClient(url: server.address);
        return RepositoryBundle(
          actions: ActionsRepositoryV5(client: client, creds: creds),
          adlist: AdlistRepositoryV5(client: client, creds: creds),
          auth: AuthRepositoryV5(client: client, creds: creds),
          client: ClientRepositoryV5(client: client, creds: creds),
          config: ConfigRepositoryV5(client: client, creds: creds),
          dhcp: DhcpRepositoryV5(client: client, creds: creds),
          dns: DnsRepositoryV5(client: client, creds: creds),
          domain: DomainRepositoryV5(client: client, creds: creds),
          ftl: FtlRepositoryV5(client: client, creds: creds),
          group: GroupRepositoryV5(client: client, creds: creds),
          localDns: LocalDnsRepositoryV5(client: client, creds: creds),
          metrics: MetricsRepositoryV5(client: client, creds: creds),
          network: NetworkRepositoryV5(client: client, creds: creds),
          realtimeStatus: RealTimeStatusRepositoryV5(
            client: client,
            creds: creds,
          ),
          serverAddress: server.address,
          apiVersion: server.apiVersion,
        );
    }
  }
}
