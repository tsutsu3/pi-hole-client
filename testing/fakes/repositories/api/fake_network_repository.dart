import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/network.dart';

class FakeNetworkRepository implements NetworkRepository {
  bool shouldFail = false;
  int fetchDevicesCallCount = 0;

  @override
  Future<Result<List<Device>>> fetchDevices({
    int? maxDevices = 999,
    int? maxAddresses = 25,
  }) async {
    fetchDevicesCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force fetchDevices failure'));
    }
    return Success(kRepoFetchDevices);
  }

  @override
  Future<Result<Unit>> deleteDevice(int deviceId) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteDevice failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<Gateways>> fetchGateways({bool? isDetailed}) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchGateways failure'));
    }
    return const Success(kRepoFetchGateways);
  }
}
