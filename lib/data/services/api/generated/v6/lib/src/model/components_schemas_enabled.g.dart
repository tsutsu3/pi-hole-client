// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_enabled.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasEnabledCWProxy {
  ComponentsSchemasEnabled enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasEnabled(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasEnabled(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasEnabled call({bool? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasEnabled.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasEnabled.copyWith.fieldName(...)`
class _$ComponentsSchemasEnabledCWProxyImpl
    implements _$ComponentsSchemasEnabledCWProxy {
  const _$ComponentsSchemasEnabledCWProxyImpl(this._value);

  final ComponentsSchemasEnabled _value;

  @override
  ComponentsSchemasEnabled enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasEnabled(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasEnabled(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasEnabled call({
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasEnabled(
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $ComponentsSchemasEnabledCopyWith on ComponentsSchemasEnabled {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasEnabled.copyWith(...)` or like so:`instanceOfComponentsSchemasEnabled.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasEnabledCWProxy get copyWith =>
      _$ComponentsSchemasEnabledCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasEnabled _$ComponentsSchemasEnabledFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ComponentsSchemasEnabled', json, ($checkedConvert) {
  final val = ComponentsSchemasEnabled(
    enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
  );
  return val;
});

Map<String, dynamic> _$ComponentsSchemasEnabledToJson(
  ComponentsSchemasEnabled instance,
) => <String, dynamic>{'enabled': ?instance.enabled};
