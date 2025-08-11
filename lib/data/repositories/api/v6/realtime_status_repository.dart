// ignore: one_member_abstracts
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/realtime_status/realtime_status.dart';
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
/// Instead, realtime status must be **composed manually at the domain (use case) level**
/// by aggregating responses from the following repositories:
///
/// - [MetricsRepository.fetchStatsSummary]
/// - [MetricsRepository.fetchStatsUpstreams]
/// - [MetricsRepository.fetchStatsTopDomainsBlocked]
/// - [MetricsRepository.fetchStatsTopDomainsAllowed]
/// - [MetricsRepository.fetchStatsTopClientsBlocked]
/// - [MetricsRepository.fetchStatsTopClientsAllowed]
/// - [DnsRepository.fetchBlockingStatus]
/// - [FtlRepository.getInfoFtl]
///
/// This implementation intentionally returns a [NotSupportedException].
/// Use cases should handle v6 compatibility by orchestrating the above API calls.
class RealtimeStatusRepositoryV6 implements RealtimeStatusRepository {
  RealtimeStatusRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    sid.hashCode;
    client.hashCode;
  }

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV6Message)),
    );
  }
}
