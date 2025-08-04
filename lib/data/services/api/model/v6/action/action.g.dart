// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Action _$ActionFromJson(Map<String, dynamic> json) => _Action(
  status: json['status'] as String,
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$ActionToJson(_Action instance) => <String, dynamic>{
  'status': instance.status,
  'took': instance.took,
};
