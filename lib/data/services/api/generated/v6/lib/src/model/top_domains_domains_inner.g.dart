// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_domains_domains_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TopDomainsDomainsInnerCWProxy {
  TopDomainsDomainsInner domain(String? domain);

  TopDomainsDomainsInner count(int? count);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopDomainsDomainsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopDomainsDomainsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  TopDomainsDomainsInner call({String? domain, int? count});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTopDomainsDomainsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTopDomainsDomainsInner.copyWith.fieldName(...)`
class _$TopDomainsDomainsInnerCWProxyImpl
    implements _$TopDomainsDomainsInnerCWProxy {
  const _$TopDomainsDomainsInnerCWProxyImpl(this._value);

  final TopDomainsDomainsInner _value;

  @override
  TopDomainsDomainsInner domain(String? domain) => this(domain: domain);

  @override
  TopDomainsDomainsInner count(int? count) => this(count: count);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopDomainsDomainsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopDomainsDomainsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  TopDomainsDomainsInner call({
    Object? domain = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return TopDomainsDomainsInner(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
    );
  }
}

extension $TopDomainsDomainsInnerCopyWith on TopDomainsDomainsInner {
  /// Returns a callable class that can be used as follows: `instanceOfTopDomainsDomainsInner.copyWith(...)` or like so:`instanceOfTopDomainsDomainsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TopDomainsDomainsInnerCWProxy get copyWith =>
      _$TopDomainsDomainsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopDomainsDomainsInner _$TopDomainsDomainsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TopDomainsDomainsInner', json, ($checkedConvert) {
  final val = TopDomainsDomainsInner(
    domain: $checkedConvert('domain', (v) => v as String?),
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$TopDomainsDomainsInnerToJson(
  TopDomainsDomainsInner instance,
) => <String, dynamic>{'domain': ?instance.domain, 'count': ?instance.count};
