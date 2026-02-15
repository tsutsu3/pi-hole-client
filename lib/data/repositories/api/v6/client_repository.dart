import 'package:pi_hole_client/data/mapper/v6/client_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/client_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/client/pihole_client.dart';
import 'package:result_dart/result_dart.dart';

class ClientRepositoryV6 extends BaseV6SidRepository
    implements ClientRepository {
  ClientRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<PiholeClient>>> fetchClients() async {
    return runWithResultRetry<List<PiholeClient>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getClients(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<PiholeClient>> addClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  }) async {
    return runWithResultRetry<PiholeClient>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postClients(
          sid,
          client: client,
          comment: comment,
          groups: groups,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<PiholeClient>> updateClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  }) async {
    return runWithResultRetry<PiholeClient>(
      action: () async {
        final sid = await getSid();
        final result = await _client.putClients(
          sid,
          client: client,
          comment: comment,
          groups: groups,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteClient(String client) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        return _client.deleteClients(sid, client: client);
      },
      onRetry: (_) => clearSid(),
    );
  }
}
