import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/network_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';
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
          auth: AuthRepositoryV6(client: client, creds: creds),
          dhcp: DhcpRepositoryV6(client: client, creds: creds),
          ftl: FtlRepositoryV6(client: client, creds: creds),
          network: NetworkRepositoryV6(client: client, creds: creds),
          serverAddress: server.address,
        );
      default:
        final client = PiholeV5ApiClient(url: server.address);
        return RepositoryBundle(
          auth: AuthRepositoryV5(client: client, creds: creds),
          dhcp: DhcpRepositoryV5(client: client, creds: creds),
          ftl: FtlRepositoryV5(client: client, creds: creds),
          network: NetworkRepositoryV5(client: client, creds: creds),
          serverAddress: server.address,
        );
    }
  }
}
