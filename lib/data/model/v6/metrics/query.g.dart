// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Queries _$QueriesFromJson(Map<String, dynamic> json) => _Queries(
  queries: (json['queries'] as List<dynamic>)
      .map((e) => Query.fromJson(e as Map<String, dynamic>))
      .toList(),
  cursor: (json['cursor'] as num).toInt(),
  recordsTotal: (json['recordsTotal'] as num).toInt(),
  recordsFiltered: (json['recordsFiltered'] as num).toInt(),
  draw: (json['draw'] as num).toInt(),
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$QueriesToJson(_Queries instance) => <String, dynamic>{
  'queries': instance.queries.map((e) => e.toJson()).toList(),
  'cursor': instance.cursor,
  'recordsTotal': instance.recordsTotal,
  'recordsFiltered': instance.recordsFiltered,
  'draw': instance.draw,
  'took': instance.took,
};

_Query _$QueryFromJson(Map<String, dynamic> json) => _Query(
  id: (json['id'] as num).toInt(),
  time: (json['time'] as num).toDouble(),
  type: json['type'] as String,
  domain: json['domain'] as String,
  client: QueryClient.fromJson(json['client'] as Map<String, dynamic>),
  reply: Reply.fromJson(json['reply'] as Map<String, dynamic>),
  ede: Ede.fromJson(json['ede'] as Map<String, dynamic>),
  cname: json['cname'] as String?,
  status: json['status'] as String?,
  dnssec: json['dnssec'] as String?,
  listId: (json['list_id'] as num?)?.toInt(),
  upstream: json['upstream'] as String?,
);

Map<String, dynamic> _$QueryToJson(_Query instance) => <String, dynamic>{
  'id': instance.id,
  'time': instance.time,
  'type': instance.type,
  'domain': instance.domain,
  'client': instance.client.toJson(),
  'reply': instance.reply.toJson(),
  'ede': instance.ede.toJson(),
  'cname': instance.cname,
  'status': instance.status,
  'dnssec': instance.dnssec,
  'list_id': instance.listId,
  'upstream': instance.upstream,
};

_QueryClient _$QueryClientFromJson(Map<String, dynamic> json) =>
    _QueryClient(ip: json['ip'] as String, name: json['name'] as String?);

Map<String, dynamic> _$QueryClientToJson(_QueryClient instance) =>
    <String, dynamic>{'ip': instance.ip, 'name': instance.name};

_Reply _$ReplyFromJson(Map<String, dynamic> json) => _Reply(
  time: (json['time'] as num).toDouble(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$ReplyToJson(_Reply instance) => <String, dynamic>{
  'time': instance.time,
  'type': instance.type,
};

_Ede _$EdeFromJson(Map<String, dynamic> json) =>
    _Ede(code: (json['code'] as num).toInt(), text: json['text'] as String?);

Map<String, dynamic> _$EdeToJson(_Ede instance) => <String, dynamic>{
  'code': instance.code,
  'text': instance.text,
};
