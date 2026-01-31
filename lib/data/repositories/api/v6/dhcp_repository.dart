import 'package:pi_hole_client/data/mapper/v6/dhcp_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:result_dart/result_dart.dart';

class DhcpRepositoryV6 extends BaseV6SidRepository implements DhcpRepository {
  DhcpRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<DhcpLease>>> fetchDhcpLeases() async {
    return runWithResultRetry<List<DhcpLease>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getDhcpLeases(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteDhcpLeaseByIp(String ip) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteDhcpLeases(sid, ip: ip);
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }
}
