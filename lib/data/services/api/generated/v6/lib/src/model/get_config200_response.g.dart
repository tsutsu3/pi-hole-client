// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_config200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetConfig200ResponseCWProxy {
  GetConfig200Response config(ConfigConfig? config);

  GetConfig200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetConfig200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetConfig200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetConfig200Response call({ConfigConfig? config, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetConfig200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetConfig200Response.copyWith.fieldName(...)`
class _$GetConfig200ResponseCWProxyImpl
    implements _$GetConfig200ResponseCWProxy {
  const _$GetConfig200ResponseCWProxyImpl(this._value);

  final GetConfig200Response _value;

  @override
  GetConfig200Response config(ConfigConfig? config) => this(config: config);

  @override
  GetConfig200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetConfig200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetConfig200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetConfig200Response call({
    Object? config = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetConfig200Response(
      config: config == const $CopyWithPlaceholder()
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as ConfigConfig?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetConfig200ResponseCopyWith on GetConfig200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetConfig200Response.copyWith(...)` or like so:`instanceOfGetConfig200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetConfig200ResponseCWProxy get copyWith =>
      _$GetConfig200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConfig200Response _$GetConfig200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetConfig200Response', json, ($checkedConvert) {
  final val = GetConfig200Response(
    config: $checkedConvert(
      'config',
      (v) =>
          v == null ? null : ConfigConfig.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetConfig200ResponseToJson(
  GetConfig200Response instance,
) => <String, dynamic>{
  'config': ?instance.config?.toJson(),
  'took': ?instance.took,
};
