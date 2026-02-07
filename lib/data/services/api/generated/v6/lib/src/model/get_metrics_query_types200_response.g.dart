// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_query_types200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsQueryTypes200ResponseCWProxy {
  GetMetricsQueryTypes200Response types(QueryTypesTypes? types);

  GetMetricsQueryTypes200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsQueryTypes200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsQueryTypes200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsQueryTypes200Response call({QueryTypesTypes? types, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsQueryTypes200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsQueryTypes200Response.copyWith.fieldName(...)`
class _$GetMetricsQueryTypes200ResponseCWProxyImpl
    implements _$GetMetricsQueryTypes200ResponseCWProxy {
  const _$GetMetricsQueryTypes200ResponseCWProxyImpl(this._value);

  final GetMetricsQueryTypes200Response _value;

  @override
  GetMetricsQueryTypes200Response types(QueryTypesTypes? types) =>
      this(types: types);

  @override
  GetMetricsQueryTypes200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsQueryTypes200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsQueryTypes200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsQueryTypes200Response call({
    Object? types = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsQueryTypes200Response(
      types: types == const $CopyWithPlaceholder()
          ? _value.types
          // ignore: cast_nullable_to_non_nullable
          : types as QueryTypesTypes?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsQueryTypes200ResponseCopyWith
    on GetMetricsQueryTypes200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsQueryTypes200Response.copyWith(...)` or like so:`instanceOfGetMetricsQueryTypes200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsQueryTypes200ResponseCWProxy get copyWith =>
      _$GetMetricsQueryTypes200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsQueryTypes200Response _$GetMetricsQueryTypes200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMetricsQueryTypes200Response', json, ($checkedConvert) {
  final val = GetMetricsQueryTypes200Response(
    types: $checkedConvert(
      'types',
      (v) => v == null
          ? null
          : QueryTypesTypes.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetMetricsQueryTypes200ResponseToJson(
  GetMetricsQueryTypes200Response instance,
) => <String, dynamic>{
  'types': ?instance.types?.toJson(),
  'took': ?instance.took,
};
