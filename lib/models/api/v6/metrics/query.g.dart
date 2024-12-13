// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueriesImpl _$$QueriesImplFromJson(Map<String, dynamic> json) =>
    _$QueriesImpl(
      queries: (json['queries'] as List<dynamic>)
          .map((e) => Query.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursor: (json['cursor'] as num).toInt(),
      recordsTotal: (json['recordsTotal'] as num).toInt(),
      recordsFiltered: (json['recordsFiltered'] as num).toInt(),
      draw: (json['draw'] as num).toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$QueriesImplToJson(_$QueriesImpl instance) =>
    <String, dynamic>{
      'queries': instance.queries,
      'cursor': instance.cursor,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'draw': instance.draw,
      'took': instance.took,
    };

_$QueryImpl _$$QueryImplFromJson(Map<String, dynamic> json) => _$QueryImpl(
      id: (json['id'] as num).toInt(),
      time: (json['time'] as num).toInt(),
      type: json['type'] as String,
      domain: json['domain'] as String,
      cname: json['cname'] as String?,
      status: json['status'] as String?,
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      dnssec: json['dnssec'] as String?,
      reply: Reply.fromJson(json['reply'] as Map<String, dynamic>),
      listId: (json['list_id'] as num?)?.toInt(),
      upstream: json['upstream'] as String?,
    );

Map<String, dynamic> _$$QueryImplToJson(_$QueryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'type': instance.type,
      'domain': instance.domain,
      'cname': instance.cname,
      'status': instance.status,
      'client': instance.client,
      'dnssec': instance.dnssec,
      'reply': instance.reply,
      'list_id': instance.listId,
      'upstream': instance.upstream,
    };

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      ip: json['ip'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'name': instance.name,
    };

_$ReplyImpl _$$ReplyImplFromJson(Map<String, dynamic> json) => _$ReplyImpl(
      type: json['type'] as String?,
      time: (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$$ReplyImplToJson(_$ReplyImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'time': instance.time,
    };
