// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlCWProxy {
  FtlFtl database(FtlFtlDatabase? database);

  FtlFtl privacyLevel(int? privacyLevel);

  FtlFtl queryFrequency(num? queryFrequency);

  FtlFtl clients(FtlFtlClients? clients);

  FtlFtl pid(int? pid);

  FtlFtl uptime(num? uptime);

  FtlFtl percentMem(num? percentMem);

  FtlFtl percentCpu(num? percentCpu);

  FtlFtl allowDestructive(bool? allowDestructive);

  FtlFtl dnsmasq(FtlFtlDnsmasq? dnsmasq);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtl(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtl call({
    FtlFtlDatabase? database,
    int? privacyLevel,
    num? queryFrequency,
    FtlFtlClients? clients,
    int? pid,
    num? uptime,
    num? percentMem,
    num? percentCpu,
    bool? allowDestructive,
    FtlFtlDnsmasq? dnsmasq,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtl.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtl.copyWith.fieldName(...)`
class _$FtlFtlCWProxyImpl implements _$FtlFtlCWProxy {
  const _$FtlFtlCWProxyImpl(this._value);

  final FtlFtl _value;

  @override
  FtlFtl database(FtlFtlDatabase? database) => this(database: database);

  @override
  FtlFtl privacyLevel(int? privacyLevel) => this(privacyLevel: privacyLevel);

  @override
  FtlFtl queryFrequency(num? queryFrequency) =>
      this(queryFrequency: queryFrequency);

  @override
  FtlFtl clients(FtlFtlClients? clients) => this(clients: clients);

  @override
  FtlFtl pid(int? pid) => this(pid: pid);

  @override
  FtlFtl uptime(num? uptime) => this(uptime: uptime);

  @override
  FtlFtl percentMem(num? percentMem) => this(percentMem: percentMem);

  @override
  FtlFtl percentCpu(num? percentCpu) => this(percentCpu: percentCpu);

  @override
  FtlFtl allowDestructive(bool? allowDestructive) =>
      this(allowDestructive: allowDestructive);

  @override
  FtlFtl dnsmasq(FtlFtlDnsmasq? dnsmasq) => this(dnsmasq: dnsmasq);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtl(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtl call({
    Object? database = const $CopyWithPlaceholder(),
    Object? privacyLevel = const $CopyWithPlaceholder(),
    Object? queryFrequency = const $CopyWithPlaceholder(),
    Object? clients = const $CopyWithPlaceholder(),
    Object? pid = const $CopyWithPlaceholder(),
    Object? uptime = const $CopyWithPlaceholder(),
    Object? percentMem = const $CopyWithPlaceholder(),
    Object? percentCpu = const $CopyWithPlaceholder(),
    Object? allowDestructive = const $CopyWithPlaceholder(),
    Object? dnsmasq = const $CopyWithPlaceholder(),
  }) {
    return FtlFtl(
      database: database == const $CopyWithPlaceholder()
          ? _value.database
          // ignore: cast_nullable_to_non_nullable
          : database as FtlFtlDatabase?,
      privacyLevel: privacyLevel == const $CopyWithPlaceholder()
          ? _value.privacyLevel
          // ignore: cast_nullable_to_non_nullable
          : privacyLevel as int?,
      queryFrequency: queryFrequency == const $CopyWithPlaceholder()
          ? _value.queryFrequency
          // ignore: cast_nullable_to_non_nullable
          : queryFrequency as num?,
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as FtlFtlClients?,
      pid: pid == const $CopyWithPlaceholder()
          ? _value.pid
          // ignore: cast_nullable_to_non_nullable
          : pid as int?,
      uptime: uptime == const $CopyWithPlaceholder()
          ? _value.uptime
          // ignore: cast_nullable_to_non_nullable
          : uptime as num?,
      percentMem: percentMem == const $CopyWithPlaceholder()
          ? _value.percentMem
          // ignore: cast_nullable_to_non_nullable
          : percentMem as num?,
      percentCpu: percentCpu == const $CopyWithPlaceholder()
          ? _value.percentCpu
          // ignore: cast_nullable_to_non_nullable
          : percentCpu as num?,
      allowDestructive: allowDestructive == const $CopyWithPlaceholder()
          ? _value.allowDestructive
          // ignore: cast_nullable_to_non_nullable
          : allowDestructive as bool?,
      dnsmasq: dnsmasq == const $CopyWithPlaceholder()
          ? _value.dnsmasq
          // ignore: cast_nullable_to_non_nullable
          : dnsmasq as FtlFtlDnsmasq?,
    );
  }
}

extension $FtlFtlCopyWith on FtlFtl {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtl.copyWith(...)` or like so:`instanceOfFtlFtl.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlCWProxy get copyWith => _$FtlFtlCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtl _$FtlFtlFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FtlFtl',
  json,
  ($checkedConvert) {
    final val = FtlFtl(
      database: $checkedConvert(
        'database',
        (v) => v == null
            ? null
            : FtlFtlDatabase.fromJson(v as Map<String, dynamic>),
      ),
      privacyLevel: $checkedConvert(
        'privacy_level',
        (v) => (v as num?)?.toInt(),
      ),
      queryFrequency: $checkedConvert('query_frequency', (v) => v as num?),
      clients: $checkedConvert(
        'clients',
        (v) => v == null
            ? null
            : FtlFtlClients.fromJson(v as Map<String, dynamic>),
      ),
      pid: $checkedConvert('pid', (v) => (v as num?)?.toInt()),
      uptime: $checkedConvert('uptime', (v) => v as num?),
      percentMem: $checkedConvert('%mem', (v) => v as num?),
      percentCpu: $checkedConvert('%cpu', (v) => v as num?),
      allowDestructive: $checkedConvert('allow_destructive', (v) => v as bool?),
      dnsmasq: $checkedConvert(
        'dnsmasq',
        (v) => v == null
            ? null
            : FtlFtlDnsmasq.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'privacyLevel': 'privacy_level',
    'queryFrequency': 'query_frequency',
    'percentMem': '%mem',
    'percentCpu': '%cpu',
    'allowDestructive': 'allow_destructive',
  },
);

Map<String, dynamic> _$FtlFtlToJson(FtlFtl instance) => <String, dynamic>{
  'database': ?instance.database?.toJson(),
  'privacy_level': ?instance.privacyLevel,
  'query_frequency': ?instance.queryFrequency,
  'clients': ?instance.clients?.toJson(),
  'pid': ?instance.pid,
  'uptime': ?instance.uptime,
  '%mem': ?instance.percentMem,
  '%cpu': ?instance.percentCpu,
  'allow_destructive': ?instance.allowDestructive,
  'dnsmasq': ?instance.dnsmasq?.toJson(),
};
