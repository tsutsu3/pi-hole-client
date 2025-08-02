import 'package:pi_hole_client/domain/models/network.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class NetworkRepository {
  /// Returns a list of discovered or known network devices.
  Future<Result<List<Device>>> fetchDevices({
    int? maxDevices = 999,
    int? maxAddresses = 25,
  });

  /// Removes a device from the network by its ID.
  Future<Result<Unit>> deleteDevice(int deviceId);

  /// Returns a list of available network gateways.
  Future<Result<Gateways>> fetchGateways({
    bool? isDetailed,
  });
}
