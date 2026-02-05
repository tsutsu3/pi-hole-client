// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_maybe_array.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DomainMaybeArrayCWProxy {
  DomainMaybeArray domain(StringOrList? domain);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DomainMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DomainMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  DomainMaybeArray call({StringOrList? domain});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDomainMaybeArray.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDomainMaybeArray.copyWith.fieldName(...)`
class _$DomainMaybeArrayCWProxyImpl implements _$DomainMaybeArrayCWProxy {
  const _$DomainMaybeArrayCWProxyImpl(this._value);

  final DomainMaybeArray _value;

  @override
  DomainMaybeArray domain(StringOrList? domain) => this(domain: domain);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DomainMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DomainMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  DomainMaybeArray call({Object? domain = const $CopyWithPlaceholder()}) {
    return DomainMaybeArray(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as StringOrList?,
    );
  }
}

extension $DomainMaybeArrayCopyWith on DomainMaybeArray {
  /// Returns a callable class that can be used as follows: `instanceOfDomainMaybeArray.copyWith(...)` or like so:`instanceOfDomainMaybeArray.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DomainMaybeArrayCWProxy get copyWith => _$DomainMaybeArrayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainMaybeArray _$DomainMaybeArrayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DomainMaybeArray', json, ($checkedConvert) {
      final val = DomainMaybeArray(
        domain: $checkedConvert(
          'domain',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DomainMaybeArrayToJson(DomainMaybeArray instance) =>
    <String, dynamic>{'domain': ?instance.domain?.toJson()};
