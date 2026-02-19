// ignore_for_file: one_member_abstracts
import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

/// v6 implementation of [RealtimeStatusRepository].
///
/// In Pi-hole API v5, realtime status could be fetched in a single request using:
/// `/admin/api.php?summaryRaw&topItems&getForwardDestinations&getQuerySources&topClientsBlocked&getQueryTypes`.
///
/// However, in v6, this functionality has been **split across multiple endpoints**.
/// A unified "realtime status" API is no longer available, and no single endpoint
/// returns the full picture.
///
/// This implementation intentionally returns a [NotSupportedException].
/// Use cases (e.g. [RealtimeStatusUseCaseV6]) should handle v6 compatibility
/// by orchestrating the required API calls via [MetricsRepository] and
/// [DnsRepository].
class RealtimeStatusRepositoryV6 extends BaseV6SidRepository
    implements RealtimeStatusRepository {
  RealtimeStatusRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) {
    // "Use" the parameters to suppress Lint
    client.hashCode;
  }

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV6Message)),
    );
  }
}
