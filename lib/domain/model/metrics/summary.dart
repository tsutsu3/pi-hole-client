import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
sealed class Summary with _$Summary {
  @JsonSerializable(explicitToJson: true)
  factory Summary({
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
    required ReplyCounts replies,
    required List<QueryTypeStat> queryTypes,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}

@freezed
sealed class ReplyCounts with _$ReplyCounts {
  const factory ReplyCounts({
    required int unknown,
    required int nodata,
    required int nxDomain,
    required int cname,
    required int ip,
    required int domain,
    required int rrname,
    required int servfail,
    required int refused,
    required int notimp,
    required int other,
    required int dnssec,
    required int none,
    required int blob,
    required int total,
  }) = _ReplyCounts;

  factory ReplyCounts.fromJson(Map<String, dynamic> json) =>
      _$ReplyCountsFromJson(json);
}

@freezed
sealed class QueryTypeStat with _$QueryTypeStat {
  const factory QueryTypeStat({
    required DnsRecordType type,
    required double percentage,
    // v6-only field
    int? count,
  }) = _QueryTypeStat;

  factory QueryTypeStat.fromJson(Map<String, dynamic> json) =>
      _$QueryTypeStatFromJson(json);
}
