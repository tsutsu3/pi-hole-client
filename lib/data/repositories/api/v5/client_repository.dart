import 'package:pi_hole_client/data/repositories/api/interfaces/client_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:result_dart/result_dart.dart';

class ClientRepositoryV5 extends BaseV5TokenRepository
    implements ClientRepository {
  ClientRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) {
    client.hashCode;
  }

  @override
  Future<Result<List<ManagedClient>>> fetchClients() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<ManagedClient>> addClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  }) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<ManagedClient>> updateClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  }) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteClient(String client) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
