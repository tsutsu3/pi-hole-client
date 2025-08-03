import 'package:pi_hole_client/data/mapper/v6/network_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/network/network.dart';
import 'package:result_dart/result_dart.dart';

class NetworkRepositoryV6 implements NetworkRepository {
  NetworkRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<Device>>> fetchDevices({
    int? maxDevices = 999,
    int? maxAddresses = 25,
  }) async {
    return runWithResultRetry<List<Device>>(
      action: () async {
        final result = await _client.getNetworkDevices(
          _sid,
          maxDevices: maxDevices,
          maxAddresses: maxAddresses,
        );
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Unit>> deleteDevice(int deviceId) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result =
            await _client.deleteNetworkDevices(_sid, deviceId: deviceId);
        return Success(result.getOrThrow());
      },
    );
  }

  @override
  Future<Result<Gateways>> fetchGateways({
    bool? isDetailed,
  }) async {
    return runWithResultRetry<Gateways>(
      action: () async {
        final result = await _client.getNetworkGateway(
          _sid,
          isDetailed: isDetailed,
        );
        return Success(result.getOrThrow().toDomain());
      },
    );
  }
}
