import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/network.dart';
import 'package:result_dart/result_dart.dart';

class NetworkRepositoryV5 implements NetworkRepository {
  NetworkRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    token.hashCode;
    client.hashCode;
  }

  @override
  Future<Result<List<Device>>> fetchDevices({
    int? maxDevices = 999,
    int? maxAddresses = 25,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteDevice(int deviceId) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Gateways>> fetchGateways({
    bool? isDetailed,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
