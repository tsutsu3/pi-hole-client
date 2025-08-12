import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/model/v5/json_converter.dart';

part 'realtime_status.freezed.dart';
part 'realtime_status.g.dart';

@freezed
sealed class RealTimeStatus with _$RealTimeStatus {
  @JsonSerializable(explicitToJson: true)
  const factory RealTimeStatus({
    @JsonKey(name: 'domains_being_blocked') required int domainsBeingBlocked,
    @JsonKey(name: 'dns_queries_today') required int dnsQueriesToday,
    @JsonKey(name: 'ads_blocked_today') required int adsBlockedToday,
    @JsonKey(name: 'ads_percentage_today') required double adsPercentageToday,
    @JsonKey(name: 'unique_domains') required int uniqueDomains,
    @JsonKey(name: 'queries_forwarded') required int queriesForwarded,
    @JsonKey(name: 'queries_cached') required int queriesCached,
    @JsonKey(name: 'clients_ever_seen') required int clientsEverSeen,
    @JsonKey(name: 'unique_clients') required int uniqueClients,
    @JsonKey(name: 'dns_queries_all_types') required int dnsQueriesAllTypes,
    @JsonKey(name: 'reply_UNKNOWN') required int replyUnknown,
    @JsonKey(name: 'reply_NODATA') required int replyNodata,
    @JsonKey(name: 'reply_NXDOMAIN') required int replyNxDomain,
    @JsonKey(name: 'reply_CNAME') required int replyCname,
    @JsonKey(name: 'reply_IP') required int replyIp,
    @JsonKey(name: 'reply_DOMAIN') required int replyDomain,
    @JsonKey(name: 'reply_RRNAME') required int replyRrname,
    @JsonKey(name: 'reply_SERVFAIL') required int replyServfail,
    @JsonKey(name: 'reply_REFUSED') required int replyRefused,
    @JsonKey(name: 'reply_NOTIMP') required int replyNotimp,
    @JsonKey(name: 'reply_OTHER') required int replyOther,
    @JsonKey(name: 'reply_DNSSEC') required int replyDnssec,
    @JsonKey(name: 'reply_NONE') required int replyNone,
    @JsonKey(name: 'reply_BLOB') required int replyBlob,
    @JsonKey(name: 'dns_queries_all_replies') required int dnsQueriesAllReplies,
    @JsonKey(name: 'privacy_level') required int privacyLevel,
    required String status,
    @JsonKey(name: 'gravity_last_updated')
    required GravityLastUpdated gravityLastUpdated,
    @JsonKey(name: 'top_queries')
    @MapOrEmptyListConverter()
    required Map<String, int> topQueries,
    @JsonKey(name: 'top_ads')
    @MapOrEmptyListConverter()
    required Map<String, int> topAds,
    @JsonKey(name: 'top_sources')
    @MapOrEmptyListConverter()
    required Map<String, int> topSources,
    @JsonKey(name: 'top_sources_blocked')
    @MapOrEmptyListConverter()
    required Map<String, int> topSourcesBlocked,
    @JsonKey(name: 'forward_destinations')
    @MapOrEmptyListConverter()
    required Map<String, double> forwardDestinations,
    @JsonKey(name: 'querytypes') required QueryTypes queryTypes,
  }) = _RealTimeStatus;

  factory RealTimeStatus.fromJson(Map<String, dynamic> json) =>
      _$RealTimeStatusFromJson(json);
}

@freezed
sealed class GravityLastUpdated with _$GravityLastUpdated {
  @JsonSerializable(explicitToJson: true)
  const factory GravityLastUpdated({
    @JsonKey(name: 'file_exists') required bool fileExists,
    required int absolute,
    required GravityRelativeTime relative,
  }) = _GravityLastUpdated;

  factory GravityLastUpdated.fromJson(Map<String, dynamic> json) =>
      _$GravityLastUpdatedFromJson(json);
}

@freezed
sealed class GravityRelativeTime with _$GravityRelativeTime {
  const factory GravityRelativeTime({
    required int days,
    required int hours,
    required int minutes,
  }) = _GravityRelativeTime;

  factory GravityRelativeTime.fromJson(Map<String, dynamic> json) =>
      _$GravityRelativeTimeFromJson(json);
}

@freezed
sealed class QueryTypes with _$QueryTypes {
  const factory QueryTypes({
    @JsonKey(name: 'A (IPv4)') required double a,
    @JsonKey(name: 'AAAA (IPv6)') required double aaaa,
    @JsonKey(name: 'ANY') required double any,
    @JsonKey(name: 'SRV') required double srv,
    @JsonKey(name: 'SOA') required double soa,
    @JsonKey(name: 'PTR') required double ptr,
    @JsonKey(name: 'TXT') required double txt,
    @JsonKey(name: 'NAPTR') required double naptr,
    @JsonKey(name: 'MX') required double mx,
    @JsonKey(name: 'DS') required double ds,
    @JsonKey(name: 'RRSIG') required double rrsig,
    @JsonKey(name: 'DNSKEY') required double dnskey,
    @JsonKey(name: 'NS') required double ns,
    @JsonKey(name: 'OTHER') required double other,
    @JsonKey(name: 'SVCB') required double svcb,
    @JsonKey(name: 'HTTPS') required double https,
  }) = _QueryTypes;

  factory QueryTypes.fromJson(Map<String, dynamic> json) =>
      _$QueryTypesFromJson(json);
}
