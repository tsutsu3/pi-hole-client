// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_auth429_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddAuth429ResponseCWProxy {
  AddAuth429Response error(TooManyRequestsError? error);

  AddAuth429Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddAuth429Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddAuth429Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAuth429Response call({TooManyRequestsError? error, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddAuth429Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddAuth429Response.copyWith.fieldName(...)`
class _$AddAuth429ResponseCWProxyImpl implements _$AddAuth429ResponseCWProxy {
  const _$AddAuth429ResponseCWProxyImpl(this._value);

  final AddAuth429Response _value;

  @override
  AddAuth429Response error(TooManyRequestsError? error) => this(error: error);

  @override
  AddAuth429Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddAuth429Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddAuth429Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAuth429Response call({
    Object? error = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return AddAuth429Response(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as TooManyRequestsError?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $AddAuth429ResponseCopyWith on AddAuth429Response {
  /// Returns a callable class that can be used as follows: `instanceOfAddAuth429Response.copyWith(...)` or like so:`instanceOfAddAuth429Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddAuth429ResponseCWProxy get copyWith =>
      _$AddAuth429ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAuth429Response _$AddAuth429ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddAuth429Response', json, ($checkedConvert) {
      final val = AddAuth429Response(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : TooManyRequestsError.fromJson(v as Map<String, dynamic>),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$AddAuth429ResponseToJson(AddAuth429Response instance) =>
    <String, dynamic>{
      'error': ?instance.error?.toJson(),
      'took': ?instance.took,
    };
