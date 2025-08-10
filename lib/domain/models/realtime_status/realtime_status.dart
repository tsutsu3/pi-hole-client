import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/models/metrics/summary.dart';
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart';

part 'realtime_status.freezed.dart';
part 'realtime_status.g.dart';

@freezed
sealed class RealtimeStatus with _$RealtimeStatus {
  @JsonSerializable(explicitToJson: true)
  factory RealtimeStatus({
    required int domainsBeingBlocked,
    required int dnsQueriesToday,
    required int adsBlockedToday,
    required double adsPercentageToday,
    required int uniqueDomains,
    required int queriesForwarded,
    required int queriesCached,
    required int clientsEverSeen,
    required int uniqueClients,
    required int dnsQueriesAllTypes,
    required int replyUnknown,
    required int replyNodata,
    required int replyNxDomain,
    required int replyCname,
    required int replyIp,
    required int replyDomain,
    required int replyRrname,
    required int replyServfail,
    required int replyRefused,
    required int replyNotimp,
    required int replyOther,
    required int replyDnssec,
    required int replyNone,
    required int replyBlob,
    required int dnsQueriesAllReplies,
    required int privacyLevel,
    required String status,
    required List<QueryStat> topQueries,
    required List<QueryStat> topAds,
    required List<SourceStat> topSources,
    required List<SourceStat> topSourcesBlocked,
    required List<DestinationStat> forwardDestinations,
    required List<QueryTypeStat> queryTypes,
  }) = _RealtimeStatus;

  factory RealtimeStatus.fromJson(Map<String, dynamic> json) =>
      _$RealtimeStatusFromJson(json);
}
