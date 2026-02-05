// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upstreams_upstreams_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpstreamsUpstreamsInnerCWProxy {
  UpstreamsUpstreamsInner ip(String? ip);

  UpstreamsUpstreamsInner name(String? name);

  UpstreamsUpstreamsInner port(int? port);

  UpstreamsUpstreamsInner count(int? count);

  UpstreamsUpstreamsInner statistics(
    UpstreamsUpstreamsInnerStatistics? statistics,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpstreamsUpstreamsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpstreamsUpstreamsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  UpstreamsUpstreamsInner call({
    String? ip,
    String? name,
    int? port,
    int? count,
    UpstreamsUpstreamsInnerStatistics? statistics,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpstreamsUpstreamsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpstreamsUpstreamsInner.copyWith.fieldName(...)`
class _$UpstreamsUpstreamsInnerCWProxyImpl
    implements _$UpstreamsUpstreamsInnerCWProxy {
  const _$UpstreamsUpstreamsInnerCWProxyImpl(this._value);

  final UpstreamsUpstreamsInner _value;

  @override
  UpstreamsUpstreamsInner ip(String? ip) => this(ip: ip);

  @override
  UpstreamsUpstreamsInner name(String? name) => this(name: name);

  @override
  UpstreamsUpstreamsInner port(int? port) => this(port: port);

  @override
  UpstreamsUpstreamsInner count(int? count) => this(count: count);

  @override
  UpstreamsUpstreamsInner statistics(
    UpstreamsUpstreamsInnerStatistics? statistics,
  ) => this(statistics: statistics);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpstreamsUpstreamsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpstreamsUpstreamsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  UpstreamsUpstreamsInner call({
    Object? ip = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? port = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? statistics = const $CopyWithPlaceholder(),
  }) {
    return UpstreamsUpstreamsInner(
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      port: port == const $CopyWithPlaceholder()
          ? _value.port
          // ignore: cast_nullable_to_non_nullable
          : port as int?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      statistics: statistics == const $CopyWithPlaceholder()
          ? _value.statistics
          // ignore: cast_nullable_to_non_nullable
          : statistics as UpstreamsUpstreamsInnerStatistics?,
    );
  }
}

extension $UpstreamsUpstreamsInnerCopyWith on UpstreamsUpstreamsInner {
  /// Returns a callable class that can be used as follows: `instanceOfUpstreamsUpstreamsInner.copyWith(...)` or like so:`instanceOfUpstreamsUpstreamsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpstreamsUpstreamsInnerCWProxy get copyWith =>
      _$UpstreamsUpstreamsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpstreamsUpstreamsInner _$UpstreamsUpstreamsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpstreamsUpstreamsInner', json, ($checkedConvert) {
  final val = UpstreamsUpstreamsInner(
    ip: $checkedConvert('ip', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    port: $checkedConvert('port', (v) => (v as num?)?.toInt()),
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
    statistics: $checkedConvert(
      'statistics',
      (v) => v == null
          ? null
          : UpstreamsUpstreamsInnerStatistics.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$UpstreamsUpstreamsInnerToJson(
  UpstreamsUpstreamsInner instance,
) => <String, dynamic>{
  'ip': ?instance.ip,
  'name': ?instance.name,
  'port': ?instance.port,
  'count': ?instance.count,
  'statistics': ?instance.statistics?.toJson(),
};
