// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_recent_blocked200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsRecentBlocked200ResponseCWProxy {
  GetMetricsRecentBlocked200Response blocked(List<String>? blocked);

  GetMetricsRecentBlocked200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsRecentBlocked200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsRecentBlocked200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsRecentBlocked200Response call({List<String>? blocked, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsRecentBlocked200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsRecentBlocked200Response.copyWith.fieldName(...)`
class _$GetMetricsRecentBlocked200ResponseCWProxyImpl
    implements _$GetMetricsRecentBlocked200ResponseCWProxy {
  const _$GetMetricsRecentBlocked200ResponseCWProxyImpl(this._value);

  final GetMetricsRecentBlocked200Response _value;

  @override
  GetMetricsRecentBlocked200Response blocked(List<String>? blocked) =>
      this(blocked: blocked);

  @override
  GetMetricsRecentBlocked200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsRecentBlocked200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsRecentBlocked200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsRecentBlocked200Response call({
    Object? blocked = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsRecentBlocked200Response(
      blocked: blocked == const $CopyWithPlaceholder()
          ? _value.blocked
          // ignore: cast_nullable_to_non_nullable
          : blocked as List<String>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsRecentBlocked200ResponseCopyWith
    on GetMetricsRecentBlocked200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsRecentBlocked200Response.copyWith(...)` or like so:`instanceOfGetMetricsRecentBlocked200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsRecentBlocked200ResponseCWProxy get copyWith =>
      _$GetMetricsRecentBlocked200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsRecentBlocked200Response _$GetMetricsRecentBlocked200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMetricsRecentBlocked200Response', json, (
  $checkedConvert,
) {
  final val = GetMetricsRecentBlocked200Response(
    blocked: $checkedConvert(
      'blocked',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetMetricsRecentBlocked200ResponseToJson(
  GetMetricsRecentBlocked200Response instance,
) => <String, dynamic>{'blocked': ?instance.blocked, 'took': ?instance.took};
