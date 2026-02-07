// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enabled.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EnabledCWProxy {
  Enabled enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Enabled(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Enabled(...).copyWith(id: 12, name: "My name")
  /// ````
  Enabled call({bool? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEnabled.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEnabled.copyWith.fieldName(...)`
class _$EnabledCWProxyImpl implements _$EnabledCWProxy {
  const _$EnabledCWProxyImpl(this._value);

  final Enabled _value;

  @override
  Enabled enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Enabled(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Enabled(...).copyWith(id: 12, name: "My name")
  /// ````
  Enabled call({Object? enabled = const $CopyWithPlaceholder()}) {
    return Enabled(
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $EnabledCopyWith on Enabled {
  /// Returns a callable class that can be used as follows: `instanceOfEnabled.copyWith(...)` or like so:`instanceOfEnabled.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EnabledCWProxy get copyWith => _$EnabledCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enabled _$EnabledFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Enabled', json, ($checkedConvert) {
      final val = Enabled(
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$EnabledToJson(Enabled instance) => <String, dynamic>{
  'enabled': ?instance.enabled,
};
