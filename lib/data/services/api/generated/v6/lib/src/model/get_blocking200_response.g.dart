// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_blocking200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetBlocking200ResponseCWProxy {
  GetBlocking200Response blocking(GetBlocking200ResponseBlockingEnum? blocking);

  GetBlocking200Response timer(num? timer);

  GetBlocking200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetBlocking200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetBlocking200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetBlocking200Response call({
    GetBlocking200ResponseBlockingEnum? blocking,
    num? timer,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetBlocking200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetBlocking200Response.copyWith.fieldName(...)`
class _$GetBlocking200ResponseCWProxyImpl
    implements _$GetBlocking200ResponseCWProxy {
  const _$GetBlocking200ResponseCWProxyImpl(this._value);

  final GetBlocking200Response _value;

  @override
  GetBlocking200Response blocking(
    GetBlocking200ResponseBlockingEnum? blocking,
  ) => this(blocking: blocking);

  @override
  GetBlocking200Response timer(num? timer) => this(timer: timer);

  @override
  GetBlocking200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetBlocking200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetBlocking200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetBlocking200Response call({
    Object? blocking = const $CopyWithPlaceholder(),
    Object? timer = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetBlocking200Response(
      blocking: blocking == const $CopyWithPlaceholder()
          ? _value.blocking
          // ignore: cast_nullable_to_non_nullable
          : blocking as GetBlocking200ResponseBlockingEnum?,
      timer: timer == const $CopyWithPlaceholder()
          ? _value.timer
          // ignore: cast_nullable_to_non_nullable
          : timer as num?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetBlocking200ResponseCopyWith on GetBlocking200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetBlocking200Response.copyWith(...)` or like so:`instanceOfGetBlocking200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetBlocking200ResponseCWProxy get copyWith =>
      _$GetBlocking200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBlocking200Response _$GetBlocking200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetBlocking200Response', json, ($checkedConvert) {
  final val = GetBlocking200Response(
    blocking: $checkedConvert(
      'blocking',
      (v) =>
          $enumDecodeNullable(_$GetBlocking200ResponseBlockingEnumEnumMap, v),
    ),
    timer: $checkedConvert('timer', (v) => v as num?),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetBlocking200ResponseToJson(
  GetBlocking200Response instance,
) => <String, dynamic>{
  'blocking': ?_$GetBlocking200ResponseBlockingEnumEnumMap[instance.blocking],
  'timer': ?instance.timer,
  'took': ?instance.took,
};

const _$GetBlocking200ResponseBlockingEnumEnumMap = {
  GetBlocking200ResponseBlockingEnum.enabled: 'enabled',
  GetBlocking200ResponseBlockingEnum.disabled: 'disabled',
  GetBlocking200ResponseBlockingEnum.failed: 'failed',
  GetBlocking200ResponseBlockingEnum.unknown: 'unknown',
};
