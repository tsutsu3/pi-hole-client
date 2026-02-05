// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_activity_metrics200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetActivityMetrics200ResponseCWProxy {
  GetActivityMetrics200Response history(
    List<TotalHistoryHistoryInner>? history,
  );

  GetActivityMetrics200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetActivityMetrics200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetActivityMetrics200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetActivityMetrics200Response call({
    List<TotalHistoryHistoryInner>? history,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetActivityMetrics200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetActivityMetrics200Response.copyWith.fieldName(...)`
class _$GetActivityMetrics200ResponseCWProxyImpl
    implements _$GetActivityMetrics200ResponseCWProxy {
  const _$GetActivityMetrics200ResponseCWProxyImpl(this._value);

  final GetActivityMetrics200Response _value;

  @override
  GetActivityMetrics200Response history(
    List<TotalHistoryHistoryInner>? history,
  ) => this(history: history);

  @override
  GetActivityMetrics200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetActivityMetrics200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetActivityMetrics200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetActivityMetrics200Response call({
    Object? history = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetActivityMetrics200Response(
      history: history == const $CopyWithPlaceholder()
          ? _value.history
          // ignore: cast_nullable_to_non_nullable
          : history as List<TotalHistoryHistoryInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetActivityMetrics200ResponseCopyWith
    on GetActivityMetrics200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetActivityMetrics200Response.copyWith(...)` or like so:`instanceOfGetActivityMetrics200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetActivityMetrics200ResponseCWProxy get copyWith =>
      _$GetActivityMetrics200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActivityMetrics200Response _$GetActivityMetrics200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetActivityMetrics200Response', json, ($checkedConvert) {
  final val = GetActivityMetrics200Response(
    history: $checkedConvert(
      'history',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => TotalHistoryHistoryInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetActivityMetrics200ResponseToJson(
  GetActivityMetrics200Response instance,
) => <String, dynamic>{
  'history': ?instance.history?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
