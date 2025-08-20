import 'package:pi_hole_client/data/mapper/v6/network_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:result_dart/result_dart.dart';

class NetworkRepositoryV6 extends BaseV6SidRepository
    implements NetworkRepository {
  NetworkRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<Device>>> fetchDevices({
    int? maxDevices = 999,
    int? maxAddresses = 25,
  }) async {
    return runWithResultRetry<List<Device>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getNetworkDevices(
          sid,
          maxDevices: maxDevices,
          maxAddresses: maxAddresses,
        );
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteDevice(int deviceId) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteNetworkDevices(
          sid,
          deviceId: deviceId,
        );
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Gateways>> fetchGateways({bool? isDetailed}) async {
    return runWithResultRetry<Gateways>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getNetworkGateway(
          sid,
          isDetailed: isDetailed,
        );
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }
}
