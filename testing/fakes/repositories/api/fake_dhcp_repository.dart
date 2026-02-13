import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/dhcp.dart';

class FakeDhcpRepository implements DhcpRepository {
  bool shouldFail = false;
  int fetchDhcpLeasesCallCount = 0;

  @override
  Future<Result<List<DhcpLease>>> fetchDhcpLeases() async {
    fetchDhcpLeasesCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force fetchDhcpLeases failure'));
    }
    return Success(kRepoFetchDhcpLeases);
  }

  @override
  Future<Result<Unit>> deleteDhcpLeaseByIp(String ip) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteDhcpLeaseByIp failure'));
    }
    return const Success(unit);
  }
}
