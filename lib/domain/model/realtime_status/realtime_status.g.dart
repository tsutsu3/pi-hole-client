// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RealtimeStatus _$RealtimeStatusFromJson(
  Map<String, dynamic> json,
) => _RealtimeStatus(
  summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
  status: $enumDecode(_$DnsBlockingStatusEnumMap, json['status']),
  topDomains: TopDomains.fromJson(json['topDomains'] as Map<String, dynamic>),
  topClients: TopClients.fromJson(json['topClients'] as Map<String, dynamic>),
  forwardDestinations: (json['forwardDestinations'] as List<dynamic>)
      .map((e) => DestinationStat.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RealtimeStatusToJson(_RealtimeStatus instance) =>
    <String, dynamic>{
      'summary': instance.summary.toJson(),
      'status': _$DnsBlockingStatusEnumMap[instance.status]!,
      'topDomains': instance.topDomains.toJson(),
      'topClients': instance.topClients.toJson(),
      'forwardDestinations': instance.forwardDestinations
          .map((e) => e.toJson())
          .toList(),
    };

const _$DnsBlockingStatusEnumMap = {
  DnsBlockingStatus.enabled: 'enabled',
  DnsBlockingStatus.disabled: 'disabled',
  DnsBlockingStatus.failed: 'failed',
  DnsBlockingStatus.unknown: 'unknown',
};
