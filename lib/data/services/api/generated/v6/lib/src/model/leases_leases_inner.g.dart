// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leases_leases_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LeasesLeasesInnerCWProxy {
  LeasesLeasesInner expires(int? expires);

  LeasesLeasesInner name(String? name);

  LeasesLeasesInner hwaddr(String? hwaddr);

  LeasesLeasesInner ip(String? ip);

  LeasesLeasesInner clientid(String? clientid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeasesLeasesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeasesLeasesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LeasesLeasesInner call({
    int? expires,
    String? name,
    String? hwaddr,
    String? ip,
    String? clientid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLeasesLeasesInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLeasesLeasesInner.copyWith.fieldName(...)`
class _$LeasesLeasesInnerCWProxyImpl implements _$LeasesLeasesInnerCWProxy {
  const _$LeasesLeasesInnerCWProxyImpl(this._value);

  final LeasesLeasesInner _value;

  @override
  LeasesLeasesInner expires(int? expires) => this(expires: expires);

  @override
  LeasesLeasesInner name(String? name) => this(name: name);

  @override
  LeasesLeasesInner hwaddr(String? hwaddr) => this(hwaddr: hwaddr);

  @override
  LeasesLeasesInner ip(String? ip) => this(ip: ip);

  @override
  LeasesLeasesInner clientid(String? clientid) => this(clientid: clientid);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LeasesLeasesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LeasesLeasesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LeasesLeasesInner call({
    Object? expires = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? hwaddr = const $CopyWithPlaceholder(),
    Object? ip = const $CopyWithPlaceholder(),
    Object? clientid = const $CopyWithPlaceholder(),
  }) {
    return LeasesLeasesInner(
      expires: expires == const $CopyWithPlaceholder()
          ? _value.expires
          // ignore: cast_nullable_to_non_nullable
          : expires as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      hwaddr: hwaddr == const $CopyWithPlaceholder()
          ? _value.hwaddr
          // ignore: cast_nullable_to_non_nullable
          : hwaddr as String?,
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      clientid: clientid == const $CopyWithPlaceholder()
          ? _value.clientid
          // ignore: cast_nullable_to_non_nullable
          : clientid as String?,
    );
  }
}

extension $LeasesLeasesInnerCopyWith on LeasesLeasesInner {
  /// Returns a callable class that can be used as follows: `instanceOfLeasesLeasesInner.copyWith(...)` or like so:`instanceOfLeasesLeasesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LeasesLeasesInnerCWProxy get copyWith =>
      _$LeasesLeasesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeasesLeasesInner _$LeasesLeasesInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LeasesLeasesInner', json, ($checkedConvert) {
      final val = LeasesLeasesInner(
        expires: $checkedConvert('expires', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        hwaddr: $checkedConvert('hwaddr', (v) => v as String?),
        ip: $checkedConvert('ip', (v) => v as String?),
        clientid: $checkedConvert('clientid', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LeasesLeasesInnerToJson(LeasesLeasesInner instance) =>
    <String, dynamic>{
      'expires': ?instance.expires,
      'name': ?instance.name,
      'hwaddr': ?instance.hwaddr,
      'ip': ?instance.ip,
      'clientid': ?instance.clientid,
    };
