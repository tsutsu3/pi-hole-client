// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_client400_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddClient400ResponseCWProxy {
  AddClient400Response took(num? took);

  AddClient400Response error(ErrorsBadRequestError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddClient400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddClient400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddClient400Response call({num? took, ErrorsBadRequestError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddClient400Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddClient400Response.copyWith.fieldName(...)`
class _$AddClient400ResponseCWProxyImpl
    implements _$AddClient400ResponseCWProxy {
  const _$AddClient400ResponseCWProxyImpl(this._value);

  final AddClient400Response _value;

  @override
  AddClient400Response took(num? took) => this(took: took);

  @override
  AddClient400Response error(ErrorsBadRequestError? error) =>
      this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddClient400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddClient400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddClient400Response call({
    Object? took = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return AddClient400Response(
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ErrorsBadRequestError?,
    );
  }
}

extension $AddClient400ResponseCopyWith on AddClient400Response {
  /// Returns a callable class that can be used as follows: `instanceOfAddClient400Response.copyWith(...)` or like so:`instanceOfAddClient400Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddClient400ResponseCWProxy get copyWith =>
      _$AddClient400ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddClient400Response _$AddClient400ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AddClient400Response', json, ($checkedConvert) {
  final val = AddClient400Response(
    took: $checkedConvert('took', (v) => v as num?),
    error: $checkedConvert(
      'error',
      (v) => v == null
          ? null
          : ErrorsBadRequestError.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AddClient400ResponseToJson(
  AddClient400Response instance,
) => <String, dynamic>{
  'took': ?instance.took,
  'error': ?instance.error?.toJson(),
};
