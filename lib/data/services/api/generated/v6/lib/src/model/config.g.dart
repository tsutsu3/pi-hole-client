// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigCWProxy {
  Config config(ConfigConfig? config);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Config(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Config(...).copyWith(id: 12, name: "My name")
  /// ````
  Config call({ConfigConfig? config});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfig.copyWith.fieldName(...)`
class _$ConfigCWProxyImpl implements _$ConfigCWProxy {
  const _$ConfigCWProxyImpl(this._value);

  final Config _value;

  @override
  Config config(ConfigConfig? config) => this(config: config);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Config(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Config(...).copyWith(id: 12, name: "My name")
  /// ````
  Config call({Object? config = const $CopyWithPlaceholder()}) {
    return Config(
      config: config == const $CopyWithPlaceholder()
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as ConfigConfig?,
    );
  }
}

extension $ConfigCopyWith on Config {
  /// Returns a callable class that can be used as follows: `instanceOfConfig.copyWith(...)` or like so:`instanceOfConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigCWProxy get copyWith => _$ConfigCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Config',
  json,
  ($checkedConvert) {
    final val = Config(
      config: $checkedConvert(
        'config',
        (v) =>
            v == null ? null : ConfigConfig.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
  'config': ?instance.config?.toJson(),
};
