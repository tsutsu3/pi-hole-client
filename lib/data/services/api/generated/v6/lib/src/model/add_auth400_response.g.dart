// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_auth400_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddAuth400ResponseCWProxy {
  AddAuth400Response error(BadRequestError? error);

  AddAuth400Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddAuth400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddAuth400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAuth400Response call({BadRequestError? error, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddAuth400Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddAuth400Response.copyWith.fieldName(...)`
class _$AddAuth400ResponseCWProxyImpl implements _$AddAuth400ResponseCWProxy {
  const _$AddAuth400ResponseCWProxyImpl(this._value);

  final AddAuth400Response _value;

  @override
  AddAuth400Response error(BadRequestError? error) => this(error: error);

  @override
  AddAuth400Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddAuth400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddAuth400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AddAuth400Response call({
    Object? error = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return AddAuth400Response(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as BadRequestError?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $AddAuth400ResponseCopyWith on AddAuth400Response {
  /// Returns a callable class that can be used as follows: `instanceOfAddAuth400Response.copyWith(...)` or like so:`instanceOfAddAuth400Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddAuth400ResponseCWProxy get copyWith =>
      _$AddAuth400ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAuth400Response _$AddAuth400ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddAuth400Response', json, ($checkedConvert) {
      final val = AddAuth400Response(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : BadRequestError.fromJson(v as Map<String, dynamic>),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$AddAuth400ResponseToJson(AddAuth400Response instance) =>
    <String, dynamic>{
      'error': ?instance.error?.toJson(),
      'took': ?instance.took,
    };
