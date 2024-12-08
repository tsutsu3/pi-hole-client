// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsSummaryImpl _$$StatsSummaryImplFromJson(Map<String, dynamic> json) =>
    _$StatsSummaryImpl(
      queries: Queries.fromJson(json['queries'] as Map<String, dynamic>),
      clients: Clients.fromJson(json['clients'] as Map<String, dynamic>),
      gravity: Gravity.fromJson(json['gravity'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatsSummaryImplToJson(_$StatsSummaryImpl instance) =>
    <String, dynamic>{
      'queries': instance.queries,
      'clients': instance.clients,
      'gravity': instance.gravity,
      'took': instance.took,
    };

_$QueriesImpl _$$QueriesImplFromJson(Map<String, dynamic> json) =>
    _$QueriesImpl(
      total: (json['total'] as num).toInt(),
      blocked: (json['blocked'] as num).toInt(),
      percentBlocked: (json['percent_blocked'] as num).toDouble(),
      uniqueDomains: (json['unique_domains'] as num).toInt(),
      forwarded: (json['forwarded'] as num).toInt(),
      cached: (json['cached'] as num).toInt(),
      types: Types.fromJson(json['types'] as Map<String, dynamic>),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      replies: Replies.fromJson(json['replies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QueriesImplToJson(_$QueriesImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'blocked': instance.blocked,
      'percent_blocked': instance.percentBlocked,
      'unique_domains': instance.uniqueDomains,
      'forwarded': instance.forwarded,
      'cached': instance.cached,
      'types': instance.types,
      'status': instance.status,
      'replies': instance.replies,
    };

_$TypesImpl _$$TypesImplFromJson(Map<String, dynamic> json) => _$TypesImpl(
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

Map<String, dynamic> _$$TypesImplToJson(_$TypesImpl instance) =>
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

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
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

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
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

_$RepliesImpl _$$RepliesImplFromJson(Map<String, dynamic> json) =>
    _$RepliesImpl(
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

Map<String, dynamic> _$$RepliesImplToJson(_$RepliesImpl instance) =>
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

_$ClientsImpl _$$ClientsImplFromJson(Map<String, dynamic> json) =>
    _$ClientsImpl(
      active: (json['active'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientsImplToJson(_$ClientsImpl instance) =>
    <String, dynamic>{
      'active': instance.active,
      'total': instance.total,
    };

_$GravityImpl _$$GravityImplFromJson(Map<String, dynamic> json) =>
    _$GravityImpl(
      domainsBeingBlocked: (json['domains_being_blocked'] as num).toInt(),
      lastUpdate: (json['last_update'] as num).toInt(),
    );

Map<String, dynamic> _$$GravityImplToJson(_$GravityImpl instance) =>
    <String, dynamic>{
      'domains_being_blocked': instance.domainsBeingBlocked,
      'last_update': instance.lastUpdate,
    };

_$StatsTopDomainsImpl _$$StatsTopDomainsImplFromJson(
        Map<String, dynamic> json) =>
    _$StatsTopDomainsImpl(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQueries: (json['total_queries'] as num).toInt(),
      blockedQueries: (json['blocked_queries'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatsTopDomainsImplToJson(
        _$StatsTopDomainsImpl instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'total_queries': instance.totalQueries,
      'blocked_queries': instance.blockedQueries,
      'took': instance.took,
    };

_$DomainImpl _$$DomainImplFromJson(Map<String, dynamic> json) => _$DomainImpl(
      domain: json['domain'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$DomainImplToJson(_$DomainImpl instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'count': instance.count,
    };

_$StatsTopClientsImpl _$$StatsTopClientsImplFromJson(
        Map<String, dynamic> json) =>
    _$StatsTopClientsImpl(
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQueries: (json['total_queries'] as num).toInt(),
      blockedQueries: (json['blocked_queries'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatsTopClientsImplToJson(
        _$StatsTopClientsImpl instance) =>
    <String, dynamic>{
      'clients': instance.clients,
      'total_queries': instance.totalQueries,
      'blocked_queries': instance.blockedQueries,
      'took': instance.took,
    };

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      ip: json['ip'] as String,
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'name': instance.name,
      'count': instance.count,
    };

_$StatsUpstreamsImpl _$$StatsUpstreamsImplFromJson(Map<String, dynamic> json) =>
    _$StatsUpstreamsImpl(
      upstreams: (json['upstreams'] as List<dynamic>)
          .map((e) => Upstream.fromJson(e as Map<String, dynamic>))
          .toList(),
      forwardedQueries: (json['forwarded_queries'] as num).toInt(),
      totalQueries: (json['total_queries'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatsUpstreamsImplToJson(
        _$StatsUpstreamsImpl instance) =>
    <String, dynamic>{
      'upstreams': instance.upstreams,
      'forwarded_queries': instance.forwardedQueries,
      'total_queries': instance.totalQueries,
      'took': instance.took,
    };

_$UpstreamImpl _$$UpstreamImplFromJson(Map<String, dynamic> json) =>
    _$UpstreamImpl(
      ip: json['ip'] as String,
      name: json['name'] as String,
      port: (json['port'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      statistics:
          Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UpstreamImplToJson(_$UpstreamImpl instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'name': instance.name,
      'port': instance.port,
      'count': instance.count,
      'statistics': instance.statistics,
    };

_$StatisticsImpl _$$StatisticsImplFromJson(Map<String, dynamic> json) =>
    _$StatisticsImpl(
      response: (json['response'] as num).toDouble(),
      variance: (json['variance'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatisticsImplToJson(_$StatisticsImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'variance': instance.variance,
    };
