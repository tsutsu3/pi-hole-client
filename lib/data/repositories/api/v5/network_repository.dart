import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:result_dart/result_dart.dart';

class NetworkRepositoryV5 extends BaseV5TokenRepository
    implements NetworkRepository {
  NetworkRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) {
    // "Use" the parameters to suppress Lint
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
  Future<Result<Gateways>> fetchGateways({bool? isDetailed}) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
