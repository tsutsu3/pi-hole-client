import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
sealed class StatsSummary with _$StatsSummary {
  @JsonSerializable(explicitToJson: true)
  const factory StatsSummary({
    required StatsQueries queries,
    required StatsClients clients,
    required StatsGravity gravity,
    required double took,
  }) = _StatsSummary;

  factory StatsSummary.fromJson(Map<String, dynamic> json) =>
      _$StatsSummaryFromJson(json);
}

@freezed
sealed class StatsQueries with _$StatsQueries {
  @JsonSerializable(explicitToJson: true)
  const factory StatsQueries({
    required int total,
    required int blocked,
    @JsonKey(name: 'percent_blocked') required double percentBlocked,
    @JsonKey(name: 'unique_domains') required int uniqueDomains,
    required int forwarded,
    required int cached,
    required StatsTypes types,
    required StatsStatus status,
    required StatsReplies replies,
  }) = _StatsQueries;

  factory StatsQueries.fromJson(Map<String, dynamic> json) =>
      _$StatsQueriesFromJson(json);
}

@freezed
sealed class StatsTypes with _$StatsTypes {
  const factory StatsTypes({
    @JsonKey(name: 'A') required int a,
    @JsonKey(name: 'AAAA') required int aaaa,
    @JsonKey(name: 'ANY') required int any,
    @JsonKey(name: 'SRV') required int srv,
    @JsonKey(name: 'SOA') required int soa,
    @JsonKey(name: 'PTR') required int ptr,
    @JsonKey(name: 'TXT') required int txt,
    @JsonKey(name: 'NAPTR') required int naptr,
    @JsonKey(name: 'MX') required int mx,
    @JsonKey(name: 'DS') required int ds,
    @JsonKey(name: 'RRSIG') required int rrsig,
    @JsonKey(name: 'DNSKEY') required int dnskey,
    @JsonKey(name: 'NS') required int ns,
    @JsonKey(name: 'SVCB') required int svcb,
    @JsonKey(name: 'HTTPS') required int https,
    @JsonKey(name: 'OTHER') required int other,
  }) = _StatsTypes;

  factory StatsTypes.fromJson(Map<String, dynamic> json) =>
      _$StatsTypesFromJson(json);
}

@freezed
sealed class StatsStatus with _$StatsStatus {
  const factory StatsStatus({
    @JsonKey(name: 'UNKNOWN') required int unknown,
    @JsonKey(name: 'GRAVITY') required int gravity,
    @JsonKey(name: 'FORWARDED') required int forwarded,
    @JsonKey(name: 'CACHE') required int cache,
    @JsonKey(name: 'REGEX') required int regex,
    @JsonKey(name: 'DENYLIST') required int denylist,
    @JsonKey(name: 'EXTERNAL_BLOCKED_IP') required int externalBlockedIp,
    @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') required int externalBlockedNull,
    @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') required int externalBlockedNxra,
    @JsonKey(name: 'GRAVITY_CNAME') required int gravityCname,
    @JsonKey(name: 'REGEX_CNAME') required int regexCname,
    @JsonKey(name: 'DENYLIST_CNAME') required int denylistCname,
    @JsonKey(name: 'RETRIED') required int retried,
    @JsonKey(name: 'RETRIED_DNSSEC') required int retriedDnssec,
    @JsonKey(name: 'IN_PROGRESS') required int inProgress,
    @JsonKey(name: 'DBBUSY') required int dbbusy,
    @JsonKey(name: 'SPECIAL_DOMAIN') required int specialDomain,
    @JsonKey(name: 'CACHE_STALE') required int cacheStale,
  }) = _StatsStatus;

  factory StatsStatus.fromJson(Map<String, dynamic> json) =>
      _$StatsStatusFromJson(json);
}

@freezed
sealed class StatsReplies with _$StatsReplies {
  const factory StatsReplies({
    @JsonKey(name: 'UNKNOWN') required int unknown,
    @JsonKey(name: 'NODATA') required int nodata,
    @JsonKey(name: 'NXDOMAIN') required int nxdomain,
    @JsonKey(name: 'CNAME') required int cname,
    @JsonKey(name: 'IP') required int ip,
    @JsonKey(name: 'DOMAIN') required int domain,
    @JsonKey(name: 'RRNAME') required int rrname,
    @JsonKey(name: 'SERVFAIL') required int servfail,
    @JsonKey(name: 'REFUSED') required int refused,
    @JsonKey(name: 'NOTIMP') required int notimp,
    @JsonKey(name: 'OTHER') required int other,
    @JsonKey(name: 'DNSSEC') required int dnssec,
    @JsonKey(name: 'NONE') required int none,
    @JsonKey(name: 'BLOB') required int blob,
  }) = _StatsReplies;

  factory StatsReplies.fromJson(Map<String, dynamic> json) =>
      _$StatsRepliesFromJson(json);
}

@freezed
sealed class StatsClients with _$StatsClients {
  const factory StatsClients({required int active, required int total}) =
      _StatsClients;

  factory StatsClients.fromJson(Map<String, dynamic> json) =>
      _$StatsClientsFromJson(json);
}

@freezed
sealed class StatsGravity with _$StatsGravity {
  const factory StatsGravity({
    @JsonKey(name: 'domains_being_blocked') required int domainsBeingBlocked,
    @JsonKey(name: 'last_update') required int lastUpdate,
  }) = _StatsGravity;

  factory StatsGravity.fromJson(Map<String, dynamic> json) =>
      _$StatsGravityFromJson(json);
}

//api/stats/top_tomains
@freezed
sealed class StatsTopDomains with _$StatsTopDomains {
  @JsonSerializable(explicitToJson: true)
  const factory StatsTopDomains({
    required List<StatsDomain> domains,
    @JsonKey(name: 'total_queries') required int totalQueries,
    @JsonKey(name: 'blocked_queries') required int blockedQueries,
    required double took,
  }) = _StatsTopDomains;

  factory StatsTopDomains.fromJson(Map<String, dynamic> json) =>
      _$StatsTopDomainsFromJson(json);
}

@freezed
sealed class StatsDomain with _$StatsDomain {
  const factory StatsDomain({required String domain, required int count}) =
      _StatsDomain;

  factory StatsDomain.fromJson(Map<String, dynamic> json) =>
      _$StatsDomainFromJson(json);
}

// api/stats/top_clients
@freezed
sealed class StatsTopClients with _$StatsTopClients {
  @JsonSerializable(explicitToJson: true)
  const factory StatsTopClients({
    required List<StatsClient> clients,
    @JsonKey(name: 'total_queries') required int totalQueries,
    @JsonKey(name: 'blocked_queries') required int blockedQueries,
    required double took,
  }) = _StatsTopClients;

  factory StatsTopClients.fromJson(Map<String, dynamic> json) =>
      _$StatsTopClientsFromJson(json);
}

@freezed
sealed class StatsClient with _$StatsClient {
  const factory StatsClient({
    required String ip,
    required String name,
    required int count,
  }) = _StatsClient;

  factory StatsClient.fromJson(Map<String, dynamic> json) =>
      _$StatsClientFromJson(json);
}

// api/stats/StatsUpstreams
@freezed
sealed class StatsUpstreams with _$StatsUpstreams {
  @JsonSerializable(explicitToJson: true)
  const factory StatsUpstreams({
    required List<StatsUpstream> upstreams,
    @JsonKey(name: 'forwarded_queries') required int forwardedQueries,
    @JsonKey(name: 'total_queries') required int totalQueries,
    required double took,
  }) = _StatsUpstreams;

  factory StatsUpstreams.fromJson(Map<String, dynamic> json) =>
      _$StatsUpstreamsFromJson(json);
}

@freezed
sealed class StatsUpstream with _$StatsUpstream {
  @JsonSerializable(explicitToJson: true)
  const factory StatsUpstream({
    required String ip,
    required String name,
    required int port,
    required int count,
    required Statistics statistics,
  }) = _StatsUpstream;

  factory StatsUpstream.fromJson(Map<String, dynamic> json) =>
      _$StatsUpstreamFromJson(json);
}

@freezed
sealed class Statistics with _$Statistics {
  const factory Statistics({
    required double response,
    required double variance,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}
