// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Blocking _$BlockingFromJson(Map<String, dynamic> json) => _Blocking(
  blocking: json['blocking'] as String,
  timer: (json['timer'] as num?)?.toInt(),
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$BlockingToJson(_Blocking instance) => <String, dynamic>{
  'blocking': instance.blocking,
  'timer': instance.timer,
  'took': instance.took,
};
