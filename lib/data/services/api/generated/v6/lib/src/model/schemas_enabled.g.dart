// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_enabled.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasEnabledCWProxy {
  SchemasEnabled enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasEnabled(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasEnabled(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasEnabled call({bool? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasEnabled.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasEnabled.copyWith.fieldName(...)`
class _$SchemasEnabledCWProxyImpl implements _$SchemasEnabledCWProxy {
  const _$SchemasEnabledCWProxyImpl(this._value);

  final SchemasEnabled _value;

  @override
  SchemasEnabled enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasEnabled(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasEnabled(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasEnabled call({Object? enabled = const $CopyWithPlaceholder()}) {
    return SchemasEnabled(
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $SchemasEnabledCopyWith on SchemasEnabled {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasEnabled.copyWith(...)` or like so:`instanceOfSchemasEnabled.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasEnabledCWProxy get copyWith => _$SchemasEnabledCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasEnabled _$SchemasEnabledFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SchemasEnabled', json, ($checkedConvert) {
      final val = SchemasEnabled(
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$SchemasEnabledToJson(SchemasEnabled instance) =>
    <String, dynamic>{'enabled': ?instance.enabled};
