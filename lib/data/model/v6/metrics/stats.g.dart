// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatsSummary _$StatsSummaryFromJson(Map<String, dynamic> json) =>
    _StatsSummary(
      queries: StatsQueries.fromJson(json['queries'] as Map<String, dynamic>),
      clients: StatsClients.fromJson(json['clients'] as Map<String, dynamic>),
      gravity: StatsGravity.fromJson(json['gravity'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$StatsSummaryToJson(_StatsSummary instance) =>
    <String, dynamic>{
      'queries': instance.queries.toJson(),
      'clients': instance.clients.toJson(),
      'gravity': instance.gravity.toJson(),
      'took': instance.took,
    };

_StatsQueries _$StatsQueriesFromJson(Map<String, dynamic> json) =>
    _StatsQueries(
      total: (json['total'] as num).toInt(),
      blocked: (json['blocked'] as num).toInt(),
      percentBlocked: (json['percent_blocked'] as num).toDouble(),
      uniqueDomains: (json['unique_domains'] as num).toInt(),
      forwarded: (json['forwarded'] as num).toInt(),
      cached: (json['cached'] as num).toInt(),
      types: StatsTypes.fromJson(json['types'] as Map<String, dynamic>),
      status: StatsStatus.fromJson(json['status'] as Map<String, dynamic>),
      replies: StatsReplies.fromJson(json['replies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsQueriesToJson(_StatsQueries instance) =>
    <String, dynamic>{
      'total': instance.total,
      'blocked': instance.blocked,
      'percent_blocked': instance.percentBlocked,
      'unique_domains': instance.uniqueDomains,
      'forwarded': instance.forwarded,
      'cached': instance.cached,
      'types': instance.types.toJson(),
      'status': instance.status.toJson(),
      'replies': instance.replies.toJson(),
    };

_StatsTypes _$StatsTypesFromJson(Map<String, dynamic> json) => _StatsTypes(
  a: (json['A'] as num).toInt(),
  aaaa: (json['AAAA'] as num).toInt(),
  any: (json['ANY'] as num).toInt(),
  srv: (json['SRV'] as num).toInt(),
  soa: (json['SOA'] as num).toInt(),
  ptr: (json['PTR'] as num).toInt(),
  txt: (json['TXT'] as num).toInt(),
  naptr: (json['NAPTR'] as num).toInt(),
  mx: (json['MX'] as num).toInt(),
  ds: (json['DS'] as num).toInt(),
  rrsig: (json['RRSIG'] as num).toInt(),
  dnskey: (json['DNSKEY'] as num).toInt(),
  ns: (json['NS'] as num).toInt(),
  svcb: (json['SVCB'] as num).toInt(),
  https: (json['HTTPS'] as num).toInt(),
  other: (json['OTHER'] as num).toInt(),
);

Map<String, dynamic> _$StatsTypesToJson(_StatsTypes instance) =>
    <String, dynamic>{
      'A': instance.a,
      'AAAA': instance.aaaa,
      'ANY': instance.any,
      'SRV': instance.srv,
      'SOA': instance.soa,
      'PTR': instance.ptr,
      'TXT': instance.txt,
      'NAPTR': instance.naptr,
      'MX': instance.mx,
      'DS': instance.ds,
      'RRSIG': instance.rrsig,
      'DNSKEY': instance.dnskey,
      'NS': instance.ns,
      'SVCB': instance.svcb,
      'HTTPS': instance.https,
      'OTHER': instance.other,
    };

_StatsStatus _$StatsStatusFromJson(Map<String, dynamic> json) => _StatsStatus(
  unknown: (json['UNKNOWN'] as num).toInt(),
  gravity: (json['GRAVITY'] as num).toInt(),
  forwarded: (json['FORWARDED'] as num).toInt(),
  cache: (json['CACHE'] as num).toInt(),
  regex: (json['REGEX'] as num).toInt(),
  denylist: (json['DENYLIST'] as num).toInt(),
  externalBlockedIp: (json['EXTERNAL_BLOCKED_IP'] as num).toInt(),
  externalBlockedNull: (json['EXTERNAL_BLOCKED_NULL'] as num).toInt(),
  externalBlockedNxra: (json['EXTERNAL_BLOCKED_NXRA'] as num).toInt(),
  gravityCname: (json['GRAVITY_CNAME'] as num).toInt(),
  regexCname: (json['REGEX_CNAME'] as num).toInt(),
  denylistCname: (json['DENYLIST_CNAME'] as num).toInt(),
  retried: (json['RETRIED'] as num).toInt(),
  retriedDnssec: (json['RETRIED_DNSSEC'] as num).toInt(),
  inProgress: (json['IN_PROGRESS'] as num).toInt(),
  dbbusy: (json['DBBUSY'] as num).toInt(),
  specialDomain: (json['SPECIAL_DOMAIN'] as num).toInt(),
  cacheStale: (json['CACHE_STALE'] as num).toInt(),
);

Map<String, dynamic> _$StatsStatusToJson(_StatsStatus instance) =>
    <String, dynamic>{
      'UNKNOWN': instance.unknown,
      'GRAVITY': instance.gravity,
      'FORWARDED': instance.forwarded,
      'CACHE': instance.cache,
      'REGEX': instance.regex,
      'DENYLIST': instance.denylist,
      'EXTERNAL_BLOCKED_IP': instance.externalBlockedIp,
      'EXTERNAL_BLOCKED_NULL': instance.externalBlockedNull,
      'EXTERNAL_BLOCKED_NXRA': instance.externalBlockedNxra,
      'GRAVITY_CNAME': instance.gravityCname,
      'REGEX_CNAME': instance.regexCname,
      'DENYLIST_CNAME': instance.denylistCname,
      'RETRIED': instance.retried,
      'RETRIED_DNSSEC': instance.retriedDnssec,
      'IN_PROGRESS': instance.inProgress,
      'DBBUSY': instance.dbbusy,
      'SPECIAL_DOMAIN': instance.specialDomain,
      'CACHE_STALE': instance.cacheStale,
    };

_StatsReplies _$StatsRepliesFromJson(Map<String, dynamic> json) =>
    _StatsReplies(
      unknown: (json['UNKNOWN'] as num).toInt(),
      nodata: (json['NODATA'] as num).toInt(),
      nxdomain: (json['NXDOMAIN'] as num).toInt(),
      cname: (json['CNAME'] as num).toInt(),
      ip: (json['IP'] as num).toInt(),
      domain: (json['DOMAIN'] as num).toInt(),
      rrname: (json['RRNAME'] as num).toInt(),
      servfail: (json['SERVFAIL'] as num).toInt(),
      refused: (json['REFUSED'] as num).toInt(),
      notimp: (json['NOTIMP'] as num).toInt(),
      other: (json['OTHER'] as num).toInt(),
      dnssec: (json['DNSSEC'] as num).toInt(),
      none: (json['NONE'] as num).toInt(),
      blob: (json['BLOB'] as num).toInt(),
    );

Map<String, dynamic> _$StatsRepliesToJson(_StatsReplies instance) =>
    <String, dynamic>{
      'UNKNOWN': instance.unknown,
      'NODATA': instance.nodata,
      'NXDOMAIN': instance.nxdomain,
      'CNAME': instance.cname,
      'IP': instance.ip,
      'DOMAIN': instance.domain,
      'RRNAME': instance.rrname,
      'SERVFAIL': instance.servfail,
      'REFUSED': instance.refused,
      'NOTIMP': instance.notimp,
      'OTHER': instance.other,
      'DNSSEC': instance.dnssec,
      'NONE': instance.none,
      'BLOB': instance.blob,
    };

_StatsClients _$StatsClientsFromJson(Map<String, dynamic> json) =>
    _StatsClients(
      active: (json['active'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$StatsClientsToJson(_StatsClients instance) =>
    <String, dynamic>{'active': instance.active, 'total': instance.total};

_StatsGravity _$StatsGravityFromJson(Map<String, dynamic> json) =>
    _StatsGravity(
      domainsBeingBlocked: (json['domains_being_blocked'] as num).toInt(),
      lastUpdate: (json['last_update'] as num).toInt(),
    );

Map<String, dynamic> _$StatsGravityToJson(_StatsGravity instance) =>
    <String, dynamic>{
      'domains_being_blocked': instance.domainsBeingBlocked,
      'last_update': instance.lastUpdate,
    };

_StatsTopDomains _$StatsTopDomainsFromJson(Map<String, dynamic> json) =>
    _StatsTopDomains(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => StatsDomain.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQueries: (json['total_queries'] as num).toInt(),
      blockedQueries: (json['blocked_queries'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$StatsTopDomainsToJson(_StatsTopDomains instance) =>
    <String, dynamic>{
      'domains': instance.domains.map((e) => e.toJson()).toList(),
      'total_queries': instance.totalQueries,
      'blocked_queries': instance.blockedQueries,
      'took': instance.took,
    };

_StatsDomain _$StatsDomainFromJson(Map<String, dynamic> json) => _StatsDomain(
  domain: json['domain'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$StatsDomainToJson(_StatsDomain instance) =>
    <String, dynamic>{'domain': instance.domain, 'count': instance.count};

_StatsTopClients _$StatsTopClientsFromJson(Map<String, dynamic> json) =>
    _StatsTopClients(
      clients: (json['clients'] as List<dynamic>)
          .map((e) => StatsClient.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQueries: (json['total_queries'] as num).toInt(),
      blockedQueries: (json['blocked_queries'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$StatsTopClientsToJson(_StatsTopClients instance) =>
    <String, dynamic>{
      'clients': instance.clients.map((e) => e.toJson()).toList(),
      'total_queries': instance.totalQueries,
      'blocked_queries': instance.blockedQueries,
      'took': instance.took,
    };

_StatsClient _$StatsClientFromJson(Map<String, dynamic> json) => _StatsClient(
  ip: json['ip'] as String,
  name: json['name'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$StatsClientToJson(_StatsClient instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'name': instance.name,
      'count': instance.count,
    };

_StatsUpstreams _$StatsUpstreamsFromJson(Map<String, dynamic> json) =>
    _StatsUpstreams(
      upstreams: (json['upstreams'] as List<dynamic>)
          .map((e) => StatsUpstream.fromJson(e as Map<String, dynamic>))
          .toList(),
      forwardedQueries: (json['forwarded_queries'] as num).toInt(),
      totalQueries: (json['total_queries'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$StatsUpstreamsToJson(_StatsUpstreams instance) =>
    <String, dynamic>{
      'upstreams': instance.upstreams.map((e) => e.toJson()).toList(),
      'forwarded_queries': instance.forwardedQueries,
      'total_queries': instance.totalQueries,
      'took': instance.took,
    };

_StatsUpstream _$StatsUpstreamFromJson(Map<String, dynamic> json) =>
    _StatsUpstream(
      ip: json['ip'] as String,
      name: json['name'] as String,
      port: (json['port'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      statistics: Statistics.fromJson(
        json['statistics'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$StatsUpstreamToJson(_StatsUpstream instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'name': instance.name,
      'port': instance.port,
      'count': instance.count,
      'statistics': instance.statistics.toJson(),
    };

_Statistics _$StatisticsFromJson(Map<String, dynamic> json) => _Statistics(
  response: (json['response'] as num).toDouble(),
  variance: (json['variance'] as num).toDouble(),
);

Map<String, dynamic> _$StatisticsToJson(_Statistics instance) =>
    <String, dynamic>{
      'response': instance.response,
      'variance': instance.variance,
    };
