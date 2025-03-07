import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
sealed class StatsSummary with _$StatsSummary {
  const factory StatsSummary({
    required Queries queries,
    required Clients clients,
    required Gravity gravity,
    required double took,
  }) = _StatsSummary;

  factory StatsSummary.fromJson(Map<String, dynamic> json) =>
      _$StatsSummaryFromJson(json);
}

@freezed
sealed class Queries with _$Queries {
  const factory Queries({
    required int total,
    required int blocked,
    @JsonKey(name: 'percent_blocked') required double percentBlocked,
    @JsonKey(name: 'unique_domains') required int uniqueDomains,
    required int forwarded,
    required int cached,
    required Types types,
    required Status status,
    required Replies replies,
  }) = _Queries;

  factory Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);
}

@freezed
sealed class Types with _$Types {
  const factory Types({
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
  }) = _Types;

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}

@freezed
sealed class Status with _$Status {
  const factory Status({
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
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
sealed class Replies with _$Replies {
  const factory Replies({
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
  }) = _Replies;

  factory Replies.fromJson(Map<String, dynamic> json) =>
      _$RepliesFromJson(json);
}

@freezed
sealed class Clients with _$Clients {
  const factory Clients({
    required int active,
    required int total,
  }) = _Clients;

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@freezed
sealed class Gravity with _$Gravity {
  const factory Gravity({
    @JsonKey(name: 'domains_being_blocked') required int domainsBeingBlocked,
    @JsonKey(name: 'last_update') required int lastUpdate,
  }) = _Gravity;

  factory Gravity.fromJson(Map<String, dynamic> json) =>
      _$GravityFromJson(json);
}

//api/stats/top_tomains
@freezed
sealed class StatsTopDomains with _$StatsTopDomains {
  const factory StatsTopDomains({
    required List<Domain> domains,
    @JsonKey(name: 'total_queries') required int totalQueries,
    @JsonKey(name: 'blocked_queries') required int blockedQueries,
    required double took,
  }) = _StatsTopDomains;

  factory StatsTopDomains.fromJson(Map<String, dynamic> json) =>
      _$StatsTopDomainsFromJson(json);
}

@freezed
sealed class Domain with _$Domain {
  const factory Domain({
    required String domain,
    required int count,
  }) = _Domain;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}

// api/stats/top_clients
@freezed
sealed class StatsTopClients with _$StatsTopClients {
  const factory StatsTopClients({
    required List<Client> clients,
    @JsonKey(name: 'total_queries') required int totalQueries,
    @JsonKey(name: 'blocked_queries') required int blockedQueries,
    required double took,
  }) = _StatsTopClients;

  factory StatsTopClients.fromJson(Map<String, dynamic> json) =>
      _$StatsTopClientsFromJson(json);
}

@freezed
sealed class Client with _$Client {
  const factory Client({
    required String ip,
    required String name,
    required int count,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

// api/stats/StatsUpstreams
@freezed
sealed class StatsUpstreams with _$StatsUpstreams {
  const factory StatsUpstreams({
    required List<Upstream> upstreams,
    @JsonKey(name: 'forwarded_queries') required int forwardedQueries,
    @JsonKey(name: 'total_queries') required int totalQueries,
    required double took,
  }) = _StatsUpstreams;

  factory StatsUpstreams.fromJson(Map<String, dynamic> json) =>
      _$StatsUpstreamsFromJson(json);
}

@freezed
sealed class Upstream with _$Upstream {
  const factory Upstream({
    required String ip,
    required String name,
    required int port,
    required int count,
    required Statistics statistics,
  }) = _Upstream;

  factory Upstream.fromJson(Map<String, dynamic> json) =>
      _$UpstreamFromJson(json);
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
