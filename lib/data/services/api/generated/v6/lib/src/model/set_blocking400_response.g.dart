// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_blocking400_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetBlocking400ResponseCWProxy {
  SetBlocking400Response took(num? took);

  SetBlocking400Response error(ItemMissingError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetBlocking400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetBlocking400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SetBlocking400Response call({num? took, ItemMissingError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetBlocking400Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetBlocking400Response.copyWith.fieldName(...)`
class _$SetBlocking400ResponseCWProxyImpl
    implements _$SetBlocking400ResponseCWProxy {
  const _$SetBlocking400ResponseCWProxyImpl(this._value);

  final SetBlocking400Response _value;

  @override
  SetBlocking400Response took(num? took) => this(took: took);

  @override
  SetBlocking400Response error(ItemMissingError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetBlocking400Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetBlocking400Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SetBlocking400Response call({
    Object? took = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SetBlocking400Response(
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ItemMissingError?,
    );
  }
}

extension $SetBlocking400ResponseCopyWith on SetBlocking400Response {
  /// Returns a callable class that can be used as follows: `instanceOfSetBlocking400Response.copyWith(...)` or like so:`instanceOfSetBlocking400Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetBlocking400ResponseCWProxy get copyWith =>
      _$SetBlocking400ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetBlocking400Response _$SetBlocking400ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetBlocking400Response', json, ($checkedConvert) {
  final val = SetBlocking400Response(
    took: $checkedConvert('took', (v) => v as num?),
    error: $checkedConvert(
      'error',
      (v) => v == null
          ? null
          : ItemMissingError.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SetBlocking400ResponseToJson(
  SetBlocking400Response instance,
) => <String, dynamic>{
  'took': ?instance.took,
  'error': ?instance.error?.toJson(),
};
