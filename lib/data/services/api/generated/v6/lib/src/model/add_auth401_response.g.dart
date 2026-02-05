// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_auth401_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddAuth401ResponseCWProxy {
  AddAuth401Response error(UnauthorizedError? error);

  AddAuth401Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddAuth401Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddAuth401Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAuth401Response call({UnauthorizedError? error, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddAuth401Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddAuth401Response.copyWith.fieldName(...)`
class _$AddAuth401ResponseCWProxyImpl implements _$AddAuth401ResponseCWProxy {
  const _$AddAuth401ResponseCWProxyImpl(this._value);

  final AddAuth401Response _value;

  @override
  AddAuth401Response error(UnauthorizedError? error) => this(error: error);

  @override
  AddAuth401Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddAuth401Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddAuth401Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAuth401Response call({
    Object? error = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return AddAuth401Response(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as UnauthorizedError?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $AddAuth401ResponseCopyWith on AddAuth401Response {
  /// Returns a callable class that can be used as follows: `instanceOfAddAuth401Response.copyWith(...)` or like so:`instanceOfAddAuth401Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddAuth401ResponseCWProxy get copyWith =>
      _$AddAuth401ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAuth401Response _$AddAuth401ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddAuth401Response', json, ($checkedConvert) {
      final val = AddAuth401Response(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : UnauthorizedError.fromJson(v as Map<String, dynamic>),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$AddAuth401ResponseToJson(AddAuth401Response instance) =>
    <String, dynamic>{
      'error': ?instance.error?.toJson(),
      'took': ?instance.took,
    };
