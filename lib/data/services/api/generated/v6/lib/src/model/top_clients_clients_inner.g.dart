// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_clients_clients_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TopClientsClientsInnerCWProxy {
  TopClientsClientsInner ip(String? ip);

  TopClientsClientsInner name(String? name);

  TopClientsClientsInner count(int? count);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopClientsClientsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopClientsClientsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  TopClientsClientsInner call({String? ip, String? name, int? count});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTopClientsClientsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTopClientsClientsInner.copyWith.fieldName(...)`
class _$TopClientsClientsInnerCWProxyImpl
    implements _$TopClientsClientsInnerCWProxy {
  const _$TopClientsClientsInnerCWProxyImpl(this._value);

  final TopClientsClientsInner _value;

  @override
  TopClientsClientsInner ip(String? ip) => this(ip: ip);

  @override
  TopClientsClientsInner name(String? name) => this(name: name);

  @override
  TopClientsClientsInner count(int? count) => this(count: count);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopClientsClientsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopClientsClientsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  TopClientsClientsInner call({
    Object? ip = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return TopClientsClientsInner(
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
    );
  }
}

extension $TopClientsClientsInnerCopyWith on TopClientsClientsInner {
  /// Returns a callable class that can be used as follows: `instanceOfTopClientsClientsInner.copyWith(...)` or like so:`instanceOfTopClientsClientsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TopClientsClientsInnerCWProxy get copyWith =>
      _$TopClientsClientsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopClientsClientsInner _$TopClientsClientsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TopClientsClientsInner', json, ($checkedConvert) {
  final val = TopClientsClientsInner(
    ip: $checkedConvert('ip', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$TopClientsClientsInnerToJson(
  TopClientsClientsInner instance,
) => <String, dynamic>{
  'ip': ?instance.ip,
  'name': ?instance.name,
  'count': ?instance.count,
};
