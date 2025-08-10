// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Summary _$SummaryFromJson(Map<String, dynamic> json) => _Summary(
  domainsBeingBlocked: (json['domainsBeingBlocked'] as num).toInt(),
  dnsQueriesToday: (json['dnsQueriesToday'] as num).toInt(),
  adsBlockedToday: (json['adsBlockedToday'] as num).toInt(),
  adsPercentageToday: (json['adsPercentageToday'] as num).toDouble(),
  uniqueDomains: (json['uniqueDomains'] as num).toInt(),
  queriesForwarded: (json['queriesForwarded'] as num).toInt(),
  queriesCached: (json['queriesCached'] as num).toInt(),
  clientsEverSeen: (json['clientsEverSeen'] as num).toInt(),
  uniqueClients: (json['uniqueClients'] as num).toInt(),
  dnsQueriesAllTypes: (json['dnsQueriesAllTypes'] as num).toInt(),
  replyUnknown: (json['replyUnknown'] as num).toInt(),
  replyNodata: (json['replyNodata'] as num).toInt(),
  replyNxdomain: (json['replyNxdomain'] as num).toInt(),
  replyCname: (json['replyCname'] as num).toInt(),
  replyIp: (json['replyIp'] as num).toInt(),
  replyDomain: (json['replyDomain'] as num).toInt(),
  replyRrname: (json['replyRrname'] as num).toInt(),
  replyServfail: (json['replyServfail'] as num).toInt(),
  replyRefused: (json['replyRefused'] as num).toInt(),
  replyNotimp: (json['replyNotimp'] as num).toInt(),
  replyOther: (json['replyOther'] as num).toInt(),
  replyDnssec: (json['replyDnssec'] as num).toInt(),
  replyNone: (json['replyNone'] as num).toInt(),
  replyBlob: (json['replyBlob'] as num).toInt(),
  dnsQueriesAllReplies: (json['dnsQueriesAllReplies'] as num).toInt(),
  queryTypes: (json['queryTypes'] as List<dynamic>)
      .map((e) => QueryTypeStat.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SummaryToJson(_Summary instance) => <String, dynamic>{
  'domainsBeingBlocked': instance.domainsBeingBlocked,
  'dnsQueriesToday': instance.dnsQueriesToday,
  'adsBlockedToday': instance.adsBlockedToday,
  'adsPercentageToday': instance.adsPercentageToday,
  'uniqueDomains': instance.uniqueDomains,
  'queriesForwarded': instance.queriesForwarded,
  'queriesCached': instance.queriesCached,
  'clientsEverSeen': instance.clientsEverSeen,
  'uniqueClients': instance.uniqueClients,
  'dnsQueriesAllTypes': instance.dnsQueriesAllTypes,
  'replyUnknown': instance.replyUnknown,
  'replyNodata': instance.replyNodata,
  'replyNxdomain': instance.replyNxdomain,
  'replyCname': instance.replyCname,
  'replyIp': instance.replyIp,
  'replyDomain': instance.replyDomain,
  'replyRrname': instance.replyRrname,
  'replyServfail': instance.replyServfail,
  'replyRefused': instance.replyRefused,
  'replyNotimp': instance.replyNotimp,
  'replyOther': instance.replyOther,
  'replyDnssec': instance.replyDnssec,
  'replyNone': instance.replyNone,
  'replyBlob': instance.replyBlob,
  'dnsQueriesAllReplies': instance.dnsQueriesAllReplies,
  'queryTypes': instance.queryTypes.map((e) => e.toJson()).toList(),
};

_QueryTypeStat _$QueryTypeStatFromJson(Map<String, dynamic> json) =>
    _QueryTypeStat(
      type: json['type'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$QueryTypeStatToJson(_QueryTypeStat instance) =>
    <String, dynamic>{'type': instance.type, 'percentage': instance.percentage};
