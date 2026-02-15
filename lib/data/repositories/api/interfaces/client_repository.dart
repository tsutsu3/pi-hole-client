import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ClientRepository {
  Future<Result<List<ManagedClient>>> fetchClients();

  Future<Result<ManagedClient>> addClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  });

  Future<Result<ManagedClient>> updateClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  });

  Future<Result<Unit>> deleteClient(String client);
}
