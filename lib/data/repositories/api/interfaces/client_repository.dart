import 'package:pi_hole_client/domain/model/client/pihole_client.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ClientRepository {
  Future<Result<List<PiholeClient>>> fetchClients();

  Future<Result<PiholeClient>> addClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  });

  Future<Result<PiholeClient>> updateClient(
    String client, {
    String? comment,
    List<int>? groups = const [0],
  });

  Future<Result<Unit>> deleteClient(String client);
}
