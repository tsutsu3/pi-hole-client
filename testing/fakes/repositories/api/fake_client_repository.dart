import 'package:pi_hole_client/data/repositories/api/interfaces/client_repository.dart';
import 'package:pi_hole_client/domain/model/client/pihole_client.dart';
import 'package:result_dart/result_dart.dart';

class FakeClientRepository implements ClientRepository {
  bool shouldFail = false;

  final _now = DateTime(2025, 1, 1);

  @override
  Future<Result<List<PiholeClient>>> fetchClients() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchClients failure'));
    }
    return Success([
      PiholeClient(
        id: 1,
        client: '192.168.1.100',
        name: 'desktop',
        comment: 'Main desktop',
        groups: [0],
        dateAdded: _now,
        dateModified: _now,
      ),
      PiholeClient(
        id: 2,
        client: 'ab:cd:ef:01:23:45',
        name: 'laptop',
        groups: [0, 5],
        dateAdded: _now,
        dateModified: _now,
      ),
    ]);
  }

  @override
  Future<Result<PiholeClient>> addClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force addClient failure'));
    }
    return Success(
      PiholeClient(
        id: 10,
        client: client,
        comment: comment,
        groups: groups ?? [0],
        dateAdded: _now,
        dateModified: _now,
      ),
    );
  }

  @override
  Future<Result<PiholeClient>> updateClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force updateClient failure'));
    }
    return Success(
      PiholeClient(
        id: 1,
        client: client,
        comment: comment,
        groups: groups ?? [0],
        dateAdded: _now,
        dateModified: _now,
      ),
    );
  }

  @override
  Future<Result<Unit>> deleteClient(String client) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteClient failure'));
    }
    return const Success(unit);
  }
}
