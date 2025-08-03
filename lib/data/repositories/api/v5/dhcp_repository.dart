import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/dhcp.dart';
import 'package:result_dart/result_dart.dart';

class DhcpRepositoryV5 implements DhcpRepository {
  DhcpRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    token.hashCode;
    client.hashCode;
  }

  @override
  Future<Result<List<DhcpLease>>> fetchDhcpLeases() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteDhcpLeaseByIp(String ip) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
