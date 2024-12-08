// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockingImpl _$$BlockingImplFromJson(Map<String, dynamic> json) =>
    _$BlockingImpl(
      blocking: json['blocking'] as String,
      timer: (json['timer'] as num?)?.toInt(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$BlockingImplToJson(_$BlockingImpl instance) =>
    <String, dynamic>{
      'blocking': instance.blocking,
      'timer': instance.timer,
      'took': instance.took,
    };
