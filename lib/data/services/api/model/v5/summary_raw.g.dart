// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_raw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummaryRaw _$SummaryRawFromJson(Map<String, dynamic> json) => _SummaryRaw(
      domainsBeingBlocked: (json['domains_being_blocked'] as num).toInt(),
      dnsQueriesToday: (json['dns_queries_today'] as num).toInt(),
      adsBlockedToday: (json['ads_blocked_today'] as num).toInt(),
      adsPercentageToday: (json['ads_percentage_today'] as num).toDouble(),
      uniqueDomains: (json['unique_domains'] as num).toInt(),
      queriesForwarded: (json['queries_forwarded'] as num).toInt(),
      queriesCached: (json['queries_cached'] as num).toInt(),
      clientsEverSeen: (json['clients_ever_seen'] as num).toInt(),
      uniqueClients: (json['unique_clients'] as num).toInt(),
      dnsQueriesAllTypes: (json['dns_queries_all_types'] as num).toInt(),
      replyUnknown: (json['reply_UNKNOWN'] as num).toInt(),
      replyNodata: (json['reply_NODATA'] as num).toInt(),
      replyNxDomain: (json['reply_NXDOMAIN'] as num).toInt(),
      replyCname: (json['reply_CNAME'] as num).toInt(),
      replyIp: (json['reply_IP'] as num).toInt(),
      replyDomain: (json['reply_DOMAIN'] as num).toInt(),
      replyRrname: (json['reply_RRNAME'] as num).toInt(),
      replyServfail: (json['reply_SERVFAIL'] as num).toInt(),
      replyRefused: (json['reply_REFUSED'] as num).toInt(),
      replyNotimp: (json['reply_NOTIMP'] as num).toInt(),
      replyOther: (json['reply_OTHER'] as num).toInt(),
      replyDnssec: (json['reply_DNSSEC'] as num).toInt(),
      replyNone: (json['reply_NONE'] as num).toInt(),
      replyBlob: (json['reply_BLOB'] as num).toInt(),
      dnsQueriesAllReplies: (json['dns_queries_all_replies'] as num).toInt(),
      privacyLevel: (json['privacy_level'] as num).toInt(),
      status: json['status'] as String,
      gravityLastUpdated: GravityLastUpdated.fromJson(
          json['gravity_last_updated'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummaryRawToJson(_SummaryRaw instance) =>
    <String, dynamic>{
      'domains_being_blocked': instance.domainsBeingBlocked,
      'dns_queries_today': instance.dnsQueriesToday,
      'ads_blocked_today': instance.adsBlockedToday,
      'ads_percentage_today': instance.adsPercentageToday,
      'unique_domains': instance.uniqueDomains,
      'queries_forwarded': instance.queriesForwarded,
      'queries_cached': instance.queriesCached,
      'clients_ever_seen': instance.clientsEverSeen,
      'unique_clients': instance.uniqueClients,
      'dns_queries_all_types': instance.dnsQueriesAllTypes,
      'reply_UNKNOWN': instance.replyUnknown,
      'reply_NODATA': instance.replyNodata,
      'reply_NXDOMAIN': instance.replyNxDomain,
      'reply_CNAME': instance.replyCname,
      'reply_IP': instance.replyIp,
      'reply_DOMAIN': instance.replyDomain,
      'reply_RRNAME': instance.replyRrname,
      'reply_SERVFAIL': instance.replyServfail,
      'reply_REFUSED': instance.replyRefused,
      'reply_NOTIMP': instance.replyNotimp,
      'reply_OTHER': instance.replyOther,
      'reply_DNSSEC': instance.replyDnssec,
      'reply_NONE': instance.replyNone,
      'reply_BLOB': instance.replyBlob,
      'dns_queries_all_replies': instance.dnsQueriesAllReplies,
      'privacy_level': instance.privacyLevel,
      'status': instance.status,
      'gravity_last_updated': instance.gravityLastUpdated.toJson(),
    };

_GravityLastUpdated _$GravityLastUpdatedFromJson(Map<String, dynamic> json) =>
    _GravityLastUpdated(
      fileExists: json['file_exists'] as bool,
      absolute: (json['absolute'] as num).toInt(),
      relative: GravityRelativeTime.fromJson(
          json['relative'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GravityLastUpdatedToJson(_GravityLastUpdated instance) =>
    <String, dynamic>{
      'file_exists': instance.fileExists,
      'absolute': instance.absolute,
      'relative': instance.relative.toJson(),
    };

_GravityRelativeTime _$GravityRelativeTimeFromJson(Map<String, dynamic> json) =>
    _GravityRelativeTime(
      days: (json['days'] as num).toInt(),
      hours: (json['hours'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
    );

Map<String, dynamic> _$GravityRelativeTimeToJson(
        _GravityRelativeTime instance) =>
    <String, dynamic>{
      'days': instance.days,
      'hours': instance.hours,
      'minutes': instance.minutes,
    };
