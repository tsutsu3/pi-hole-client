// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_routes_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoutesRoutesInnerCWProxy {
  RoutesRoutesInner gateway(String? gateway);

  RoutesRoutesInner family(RoutesRoutesInnerFamilyEnum? family);

  RoutesRoutesInner table(int? table);

  RoutesRoutesInner protocol(String? protocol);

  RoutesRoutesInner scope(String? scope);

  RoutesRoutesInner type(String? type);

  RoutesRoutesInner flags(List<String>? flags);

  RoutesRoutesInner oif(String? oif);

  RoutesRoutesInner iif(String? iif);

  RoutesRoutesInner dst(String? dst);

  RoutesRoutesInner src(String? src);

  RoutesRoutesInner prefsrc(String? prefsrc);

  RoutesRoutesInner priority(int? priority);

  RoutesRoutesInner pref(int? pref);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoutesRoutesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoutesRoutesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  RoutesRoutesInner call({
    String? gateway,
    RoutesRoutesInnerFamilyEnum? family,
    int? table,
    String? protocol,
    String? scope,
    String? type,
    List<String>? flags,
    String? oif,
    String? iif,
    String? dst,
    String? src,
    String? prefsrc,
    int? priority,
    int? pref,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoutesRoutesInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoutesRoutesInner.copyWith.fieldName(...)`
class _$RoutesRoutesInnerCWProxyImpl implements _$RoutesRoutesInnerCWProxy {
  const _$RoutesRoutesInnerCWProxyImpl(this._value);

  final RoutesRoutesInner _value;

  @override
  RoutesRoutesInner gateway(String? gateway) => this(gateway: gateway);

  @override
  RoutesRoutesInner family(RoutesRoutesInnerFamilyEnum? family) =>
      this(family: family);

  @override
  RoutesRoutesInner table(int? table) => this(table: table);

  @override
  RoutesRoutesInner protocol(String? protocol) => this(protocol: protocol);

  @override
  RoutesRoutesInner scope(String? scope) => this(scope: scope);

  @override
  RoutesRoutesInner type(String? type) => this(type: type);

  @override
  RoutesRoutesInner flags(List<String>? flags) => this(flags: flags);

  @override
  RoutesRoutesInner oif(String? oif) => this(oif: oif);

  @override
  RoutesRoutesInner iif(String? iif) => this(iif: iif);

  @override
  RoutesRoutesInner dst(String? dst) => this(dst: dst);

  @override
  RoutesRoutesInner src(String? src) => this(src: src);

  @override
  RoutesRoutesInner prefsrc(String? prefsrc) => this(prefsrc: prefsrc);

  @override
  RoutesRoutesInner priority(int? priority) => this(priority: priority);

  @override
  RoutesRoutesInner pref(int? pref) => this(pref: pref);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoutesRoutesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoutesRoutesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  RoutesRoutesInner call({
    Object? gateway = const $CopyWithPlaceholder(),
    Object? family = const $CopyWithPlaceholder(),
    Object? table = const $CopyWithPlaceholder(),
    Object? protocol = const $CopyWithPlaceholder(),
    Object? scope = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? flags = const $CopyWithPlaceholder(),
    Object? oif = const $CopyWithPlaceholder(),
    Object? iif = const $CopyWithPlaceholder(),
    Object? dst = const $CopyWithPlaceholder(),
    Object? src = const $CopyWithPlaceholder(),
    Object? prefsrc = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? pref = const $CopyWithPlaceholder(),
  }) {
    return RoutesRoutesInner(
      gateway: gateway == const $CopyWithPlaceholder()
          ? _value.gateway
          // ignore: cast_nullable_to_non_nullable
          : gateway as String?,
      family: family == const $CopyWithPlaceholder()
          ? _value.family
          // ignore: cast_nullable_to_non_nullable
          : family as RoutesRoutesInnerFamilyEnum?,
      table: table == const $CopyWithPlaceholder()
          ? _value.table
          // ignore: cast_nullable_to_non_nullable
          : table as int?,
      protocol: protocol == const $CopyWithPlaceholder()
          ? _value.protocol
          // ignore: cast_nullable_to_non_nullable
          : protocol as String?,
      scope: scope == const $CopyWithPlaceholder()
          ? _value.scope
          // ignore: cast_nullable_to_non_nullable
          : scope as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      flags: flags == const $CopyWithPlaceholder()
          ? _value.flags
          // ignore: cast_nullable_to_non_nullable
          : flags as List<String>?,
      oif: oif == const $CopyWithPlaceholder()
          ? _value.oif
          // ignore: cast_nullable_to_non_nullable
          : oif as String?,
      iif: iif == const $CopyWithPlaceholder()
          ? _value.iif
          // ignore: cast_nullable_to_non_nullable
          : iif as String?,
      dst: dst == const $CopyWithPlaceholder()
          ? _value.dst
          // ignore: cast_nullable_to_non_nullable
          : dst as String?,
      src: src == const $CopyWithPlaceholder()
          ? _value.src
          // ignore: cast_nullable_to_non_nullable
          : src as String?,
      prefsrc: prefsrc == const $CopyWithPlaceholder()
          ? _value.prefsrc
          // ignore: cast_nullable_to_non_nullable
          : prefsrc as String?,
      priority: priority == const $CopyWithPlaceholder()
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as int?,
      pref: pref == const $CopyWithPlaceholder()
          ? _value.pref
          // ignore: cast_nullable_to_non_nullable
          : pref as int?,
    );
  }
}

extension $RoutesRoutesInnerCopyWith on RoutesRoutesInner {
  /// Returns a callable class that can be used as follows: `instanceOfRoutesRoutesInner.copyWith(...)` or like so:`instanceOfRoutesRoutesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoutesRoutesInnerCWProxy get copyWith =>
      _$RoutesRoutesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutesRoutesInner _$RoutesRoutesInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RoutesRoutesInner', json, ($checkedConvert) {
      final val = RoutesRoutesInner(
        gateway: $checkedConvert('gateway', (v) => v as String?),
        family: $checkedConvert(
          'family',
          (v) => $enumDecodeNullable(_$RoutesRoutesInnerFamilyEnumEnumMap, v),
        ),
        table: $checkedConvert('table', (v) => (v as num?)?.toInt()),
        protocol: $checkedConvert('protocol', (v) => v as String?),
        scope: $checkedConvert('scope', (v) => v as String?),
        type: $checkedConvert('type', (v) => v as String?),
        flags: $checkedConvert(
          'flags',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        oif: $checkedConvert('oif', (v) => v as String?),
        iif: $checkedConvert('iif', (v) => v as String?),
        dst: $checkedConvert('dst', (v) => v as String?),
        src: $checkedConvert('src', (v) => v as String?),
        prefsrc: $checkedConvert('prefsrc', (v) => v as String?),
        priority: $checkedConvert('priority', (v) => (v as num?)?.toInt()),
        pref: $checkedConvert('pref', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$RoutesRoutesInnerToJson(RoutesRoutesInner instance) =>
    <String, dynamic>{
      'gateway': ?instance.gateway,
      'family': ?_$RoutesRoutesInnerFamilyEnumEnumMap[instance.family],
      'table': ?instance.table,
      'protocol': ?instance.protocol,
      'scope': ?instance.scope,
      'type': ?instance.type,
      'flags': ?instance.flags,
      'oif': ?instance.oif,
      'iif': ?instance.iif,
      'dst': ?instance.dst,
      'src': ?instance.src,
      'prefsrc': ?instance.prefsrc,
      'priority': ?instance.priority,
      'pref': ?instance.pref,
    };

const _$RoutesRoutesInnerFamilyEnumEnumMap = {
  RoutesRoutesInnerFamilyEnum.inet: 'inet',
  RoutesRoutesInnerFamilyEnum.inet6: 'inet6',
  RoutesRoutesInnerFamilyEnum.link: 'link',
  RoutesRoutesInnerFamilyEnum.mpls: 'mpls',
  RoutesRoutesInnerFamilyEnum.bridge: 'bridge',
  RoutesRoutesInnerFamilyEnum.questionMarkQuestionMarkQuestionMark: '???',
};
