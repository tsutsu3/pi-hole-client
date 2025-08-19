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
    required int replyUnknown,
    required int replyNodata,
    required int replyNxdomain,
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
    required List<QueryTypeStat> queryTypes,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}

// ToDO: add int count
@freezed
sealed class QueryTypeStat with _$QueryTypeStat {
  const factory QueryTypeStat({
    required DnsRecordType type,
    required double percentage,
  }) = _QueryTypeStat;

  factory QueryTypeStat.fromJson(Map<String, dynamic> json) =>
      _$QueryTypeStatFromJson(json);
}
