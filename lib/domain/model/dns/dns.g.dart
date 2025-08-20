// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Blocking _$BlockingFromJson(Map<String, dynamic> json) => _Blocking(
  status: $enumDecode(_$DnsBlockingStatusEnumMap, json['status']),
  timer: (json['timer'] as num?)?.toInt(),
);

Map<String, dynamic> _$BlockingToJson(_Blocking instance) => <String, dynamic>{
  'status': _$DnsBlockingStatusEnumMap[instance.status]!,
  'timer': instance.timer,
};

const _$DnsBlockingStatusEnumMap = {
  DnsBlockingStatus.enabled: 'enabled',
  DnsBlockingStatus.disabled: 'disabled',
  DnsBlockingStatus.failed: 'failed',
  DnsBlockingStatus.unknown: 'unknown',
};
