// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_domain400_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceDomain400ResponseCWProxy {
  ReplaceDomain400Response error(ErrorsBadRequestError? error);

  ReplaceDomain400Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceDomain400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceDomain400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceDomain400Response call({ErrorsBadRequestError? error, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceDomain400Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceDomain400Response.copyWith.fieldName(...)`
class _$ReplaceDomain400ResponseCWProxyImpl
    implements _$ReplaceDomain400ResponseCWProxy {
  const _$ReplaceDomain400ResponseCWProxyImpl(this._value);

  final ReplaceDomain400Response _value;

  @override
  ReplaceDomain400Response error(ErrorsBadRequestError? error) =>
      this(error: error);

  @override
  ReplaceDomain400Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceDomain400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceDomain400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceDomain400Response call({
    Object? error = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceDomain400Response(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ErrorsBadRequestError?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceDomain400ResponseCopyWith on ReplaceDomain400Response {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceDomain400Response.copyWith(...)` or like so:`instanceOfReplaceDomain400Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceDomain400ResponseCWProxy get copyWith =>
      _$ReplaceDomain400ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceDomain400Response _$ReplaceDomain400ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceDomain400Response', json, ($checkedConvert) {
  final val = ReplaceDomain400Response(
    error: $checkedConvert(
      'error',
      (v) => v == null
          ? null
          : ErrorsBadRequestError.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceDomain400ResponseToJson(
  ReplaceDomain400Response instance,
) => <String, dynamic>{
  'error': ?instance.error?.toJson(),
  'took': ?instance.took,
};
