// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_client401_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddClient401ResponseCWProxy {
  AddClient401Response took(num? took);

  AddClient401Response error(UnauthorizedError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddClient401Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddClient401Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddClient401Response call({num? took, UnauthorizedError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddClient401Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddClient401Response.copyWith.fieldName(...)`
class _$AddClient401ResponseCWProxyImpl
    implements _$AddClient401ResponseCWProxy {
  const _$AddClient401ResponseCWProxyImpl(this._value);

  final AddClient401Response _value;

  @override
  AddClient401Response took(num? took) => this(took: took);

  @override
  AddClient401Response error(UnauthorizedError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddClient401Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddClient401Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddClient401Response call({
    Object? took = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return AddClient401Response(
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as UnauthorizedError?,
    );
  }
}

extension $AddClient401ResponseCopyWith on AddClient401Response {
  /// Returns a callable class that can be used as follows: `instanceOfAddClient401Response.copyWith(...)` or like so:`instanceOfAddClient401Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddClient401ResponseCWProxy get copyWith =>
      _$AddClient401ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddClient401Response _$AddClient401ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AddClient401Response', json, ($checkedConvert) {
  final val = AddClient401Response(
    took: $checkedConvert('took', (v) => v as num?),
    error: $checkedConvert(
      'error',
      (v) => v == null
          ? null
          : UnauthorizedError.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AddClient401ResponseToJson(
  AddClient401Response instance,
) => <String, dynamic>{
  'took': ?instance.took,
  'error': ?instance.error?.toJson(),
};
