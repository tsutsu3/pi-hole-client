// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemCWProxy {
  System system(SystemSystem? system);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `System(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// System(...).copyWith(id: 12, name: "My name")
  /// ````
  System call({SystemSystem? system});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystem.copyWith.fieldName(...)`
class _$SystemCWProxyImpl implements _$SystemCWProxy {
  const _$SystemCWProxyImpl(this._value);

  final System _value;

  @override
  System system(SystemSystem? system) => this(system: system);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `System(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// System(...).copyWith(id: 12, name: "My name")
  /// ````
  System call({Object? system = const $CopyWithPlaceholder()}) {
    return System(
      system: system == const $CopyWithPlaceholder()
          ? _value.system
          // ignore: cast_nullable_to_non_nullable
          : system as SystemSystem?,
    );
  }
}

extension $SystemCopyWith on System {
  /// Returns a callable class that can be used as follows: `instanceOfSystem.copyWith(...)` or like so:`instanceOfSystem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemCWProxy get copyWith => _$SystemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

System _$SystemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'System',
  json,
  ($checkedConvert) {
    final val = System(
      system: $checkedConvert(
        'system',
        (v) =>
            v == null ? null : SystemSystem.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$SystemToJson(System instance) => <String, dynamic>{
  'system': ?instance.system?.toJson(),
};
