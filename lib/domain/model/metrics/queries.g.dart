// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Logs _$LogsFromJson(Map<String, dynamic> json) => _Logs(
  logs: (json['logs'] as List<dynamic>)
      .map((e) => Log.fromJson(e as Map<String, dynamic>))
      .toList(),
  cursor: (json['cursor'] as num?)?.toInt(),
  recordsTotal: (json['recordsTotal'] as num?)?.toInt(),
  recordsFiltered: (json['recordsFiltered'] as num?)?.toInt(),
);

Map<String, dynamic> _$LogsToJson(_Logs instance) => <String, dynamic>{
  'logs': instance.logs.map((e) => e.toJson()).toList(),
  'cursor': instance.cursor,
  'recordsTotal': instance.recordsTotal,
  'recordsFiltered': instance.recordsFiltered,
};

_Log _$LogFromJson(Map<String, dynamic> json) => _Log(
  dateTime: DateTime.parse(json['dateTime'] as String),
  type: $enumDecode(_$DnsRecordTypeEnumMap, json['type']),
  url: json['url'] as String,
  device: json['device'] as String,
  replyTime: BigInt.parse(json['replyTime'] as String),
  status: $enumDecodeNullable(_$QueryStatusTypeEnumMap, json['status']),
  replyType: $enumDecodeNullable(_$ReplyTypeEnumMap, json['replyType']),
  id: (json['id'] as num?)?.toInt(),
  answeredBy: json['answeredBy'] as String?,
);

Map<String, dynamic> _$LogToJson(_Log instance) => <String, dynamic>{
  'dateTime': instance.dateTime.toIso8601String(),
  'type': _$DnsRecordTypeEnumMap[instance.type]!,
  'url': instance.url,
  'device': instance.device,
  'replyTime': instance.replyTime.toString(),
  'status': _$QueryStatusTypeEnumMap[instance.status],
  'replyType': _$ReplyTypeEnumMap[instance.replyType],
  'id': instance.id,
  'answeredBy': instance.answeredBy,
};

const _$DnsRecordTypeEnumMap = {
  DnsRecordType.none: 'none',
  DnsRecordType.a: 'a',
  DnsRecordType.aaaa: 'aaaa',
  DnsRecordType.any: 'any',
  DnsRecordType.srv: 'srv',
  DnsRecordType.soa: 'soa',
  DnsRecordType.ptr: 'ptr',
  DnsRecordType.txt: 'txt',
  DnsRecordType.naprt: 'naprt',
  DnsRecordType.mx: 'mx',
  DnsRecordType.ds: 'ds',
  DnsRecordType.rrsig: 'rrsig',
  DnsRecordType.dnskey: 'dnskey',
  DnsRecordType.ns: 'ns',
  DnsRecordType.svcb: 'svcb',
  DnsRecordType.https: 'https',
  DnsRecordType.na: 'na',
  DnsRecordType.cname: 'cname',
  DnsRecordType.other: 'other',
  DnsRecordType.empty: 'empty',
  DnsRecordType.unknown: 'unknown',
};

const _$QueryStatusTypeEnumMap = {
  QueryStatusType.gravity: 'gravity',
  QueryStatusType.forwarded: 'forwarded',
  QueryStatusType.cache: 'cache',
  QueryStatusType.regex: 'regex',
  QueryStatusType.denylist: 'denylist',
  QueryStatusType.gravityCname: 'gravityCname',
  QueryStatusType.regexCname: 'regexCname',
  QueryStatusType.denylistCname: 'denylistCname',
  QueryStatusType.externalBlockedIp: 'externalBlockedIp',
  QueryStatusType.externalBlockedNull: 'externalBlockedNull',
  QueryStatusType.externalBlockedNxra: 'externalBlockedNxra',
  QueryStatusType.externalBlockedEde15: 'externalBlockedEde15',
  QueryStatusType.retried: 'retried',
  QueryStatusType.retriedDnssec: 'retriedDnssec',
  QueryStatusType.inProgress: 'inProgress',
  QueryStatusType.dbBusy: 'dbBusy',
  QueryStatusType.specialDomain: 'specialDomain',
  QueryStatusType.cacheStale: 'cacheStale',
  QueryStatusType.unknown: 'unknown',
};

const _$ReplyTypeEnumMap = {
  ReplyType.na: 'na',
  ReplyType.nodata: 'nodata',
  ReplyType.nxdomain: 'nxdomain',
  ReplyType.cname: 'cname',
  ReplyType.ip: 'ip',
  ReplyType.domain: 'domain',
  ReplyType.rrname: 'rrname',
  ReplyType.servfail: 'servfail',
  ReplyType.refused: 'refused',
  ReplyType.notimp: 'notimp',
  ReplyType.upstreamError: 'upstreamError',
  ReplyType.dnssec: 'dnssec',
  ReplyType.none: 'none',
  ReplyType.blob: 'blob',
  ReplyType.unknown: 'unknown',
};
