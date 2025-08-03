import 'package:pi_hole_client/domain/models/dhcp/dhcp.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class DhcpRepository {
  /// Fetches DHCP leases.
  Future<Result<List<DhcpLease>>> fetchDhcpLeases();

  /// Deletes a specific DHCP lease by IP address.
  Future<Result<Unit>> deleteDhcpLeaseByIp(String ip);
}
