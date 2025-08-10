// ignore: one_member_abstracts
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/overtime_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

/// v6 implementation of [OverTimeRepository].
///
/// In Pi-hole API v6, over-time query data is not available,
/// and there are no plans to support this feature in the future.
/// Unlike v5, which provides endpoints like:
/// `/api.php?overTimeData10mins`, `/overTimeDataClients`, and `/getClientNames`,
/// v6 does not expose similar metrics or aggregation endpoints.
///
/// If over-time insights are required in v6, they must be assembled manually
/// at the domain (use case) layer using multiple API calls such as:
/// - [MetricsRepository.fetchHistory]
/// - [MetricsRepository.fetchHistoryClient]
///
/// This implementation always returns [NotSupportedException].
class OverTimeRepositoryV6 implements OverTimeRepository {
  OverTimeRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    sid.hashCode;
    client.hashCode;
  }

  @override
  Future<Result<OverTime>> fetchOverTime() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV6Message)),
    );
  }
}
