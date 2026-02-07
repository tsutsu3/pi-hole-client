// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_get.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelGetCWProxy {
  ModelGet domains(List<GetDomainsInner>? domains);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelGet(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelGet call({List<GetDomainsInner>? domains});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelGet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelGet.copyWith.fieldName(...)`
class _$ModelGetCWProxyImpl implements _$ModelGetCWProxy {
  const _$ModelGetCWProxyImpl(this._value);

  final ModelGet _value;

  @override
  ModelGet domains(List<GetDomainsInner>? domains) => this(domains: domains);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelGet(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelGet call({Object? domains = const $CopyWithPlaceholder()}) {
    return ModelGet(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as List<GetDomainsInner>?,
    );
  }
}

extension $ModelGetCopyWith on ModelGet {
  /// Returns a callable class that can be used as follows: `instanceOfModelGet.copyWith(...)` or like so:`instanceOfModelGet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelGetCWProxy get copyWith => _$ModelGetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelGet _$ModelGetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ModelGet', json, ($checkedConvert) {
      final val = ModelGet(
        domains: $checkedConvert(
          'domains',
          (v) => (v as List<dynamic>?)
              ?.map((e) => GetDomainsInner.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ModelGetToJson(ModelGet instance) => <String, dynamic>{
  'domains': ?instance.domains?.map((e) => e.toJson()).toList(),
};
