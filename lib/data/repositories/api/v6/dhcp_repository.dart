import 'package:pi_hole_client/data/mapper/v6/dhcp_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/dhcp/dhcp.dart';
import 'package:result_dart/result_dart.dart';

class DhcpRepositoryV6 implements DhcpRepository {
  DhcpRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<DhcpLease>>> fetchDhcpLeases() async {
    return runWithResultRetry<List<DhcpLease>>(
      action: () async {
        final result = await _client.getDhcpLeases(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Unit>> deleteDhcpLeaseByIp(String ip) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result = await _client.deleteDhcpLeases(_sid, ip: ip);
        return Success(result.getOrThrow());
      },
    );
  }
}
