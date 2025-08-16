// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upstreams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DestinationStat _$DestinationStatFromJson(Map<String, dynamic> json) =>
    _DestinationStat(
      destination: json['destination'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$DestinationStatToJson(_DestinationStat instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'percentage': instance.percentage,
    };
