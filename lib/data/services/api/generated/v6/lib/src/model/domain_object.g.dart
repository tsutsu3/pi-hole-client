// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_object.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DomainObjectCWProxy {
  DomainObject domain(String? domain);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DomainObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DomainObject(...).copyWith(id: 12, name: "My name")
  /// ````
  DomainObject call({String? domain});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDomainObject.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDomainObject.copyWith.fieldName(...)`
class _$DomainObjectCWProxyImpl implements _$DomainObjectCWProxy {
  const _$DomainObjectCWProxyImpl(this._value);

  final DomainObject _value;

  @override
  DomainObject domain(String? domain) => this(domain: domain);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DomainObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DomainObject(...).copyWith(id: 12, name: "My name")
  /// ````
  DomainObject call({Object? domain = const $CopyWithPlaceholder()}) {
    return DomainObject(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
    );
  }
}

extension $DomainObjectCopyWith on DomainObject {
  /// Returns a callable class that can be used as follows: `instanceOfDomainObject.copyWith(...)` or like so:`instanceOfDomainObject.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DomainObjectCWProxy get copyWith => _$DomainObjectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainObject _$DomainObjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DomainObject', json, ($checkedConvert) {
      final val = DomainObject(
        domain: $checkedConvert('domain', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DomainObjectToJson(DomainObject instance) =>
    <String, dynamic>{'domain': ?instance.domain};
