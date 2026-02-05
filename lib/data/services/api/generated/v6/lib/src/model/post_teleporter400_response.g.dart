// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_teleporter400_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostTeleporter400ResponseCWProxy {
  PostTeleporter400Response error(InvalidZipError? error);

  PostTeleporter400Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporter400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporter400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporter400Response call({InvalidZipError? error, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostTeleporter400Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostTeleporter400Response.copyWith.fieldName(...)`
class _$PostTeleporter400ResponseCWProxyImpl
    implements _$PostTeleporter400ResponseCWProxy {
  const _$PostTeleporter400ResponseCWProxyImpl(this._value);

  final PostTeleporter400Response _value;

  @override
  PostTeleporter400Response error(InvalidZipError? error) => this(error: error);

  @override
  PostTeleporter400Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporter400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporter400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporter400Response call({
    Object? error = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return PostTeleporter400Response(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as InvalidZipError?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $PostTeleporter400ResponseCopyWith on PostTeleporter400Response {
  /// Returns a callable class that can be used as follows: `instanceOfPostTeleporter400Response.copyWith(...)` or like so:`instanceOfPostTeleporter400Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostTeleporter400ResponseCWProxy get copyWith =>
      _$PostTeleporter400ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTeleporter400Response _$PostTeleporter400ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PostTeleporter400Response', json, ($checkedConvert) {
  final val = PostTeleporter400Response(
    error: $checkedConvert(
      'error',
      (v) => v == null
          ? null
          : InvalidZipError.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$PostTeleporter400ResponseToJson(
  PostTeleporter400Response instance,
) => <String, dynamic>{
  'error': ?instance.error?.toJson(),
  'took': ?instance.took,
};
