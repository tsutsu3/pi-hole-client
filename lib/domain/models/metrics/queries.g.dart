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
  type: json['type'] as String,
  url: json['url'] as String,
  device: json['device'] as String,
  replyTime: BigInt.parse(json['replyTime'] as String),
  status: json['status'] as String?,
  replyType: json['replyType'] as String?,
  id: (json['id'] as num?)?.toInt(),
  answeredBy: json['answeredBy'] as String?,
);

Map<String, dynamic> _$LogToJson(_Log instance) => <String, dynamic>{
  'dateTime': instance.dateTime.toIso8601String(),
  'type': instance.type,
  'url': instance.url,
  'device': instance.device,
  'replyTime': instance.replyTime.toString(),
  'status': instance.status,
  'replyType': instance.replyType,
  'id': instance.id,
  'answeredBy': instance.answeredBy,
};
