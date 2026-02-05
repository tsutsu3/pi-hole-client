// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bad_request_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BadRequestErrorCWProxy {
  BadRequestError key(String? key);

  BadRequestError message(String? message);

  BadRequestError hint(String? hint);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BadRequestError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BadRequestError(...).copyWith(id: 12, name: "My name")
  /// ````
  BadRequestError call({String? key, String? message, String? hint});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBadRequestError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBadRequestError.copyWith.fieldName(...)`
class _$BadRequestErrorCWProxyImpl implements _$BadRequestErrorCWProxy {
  const _$BadRequestErrorCWProxyImpl(this._value);

  final BadRequestError _value;

  @override
  BadRequestError key(String? key) => this(key: key);

  @override
  BadRequestError message(String? message) => this(message: message);

  @override
  BadRequestError hint(String? hint) => this(hint: hint);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BadRequestError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BadRequestError(...).copyWith(id: 12, name: "My name")
  /// ````
  BadRequestError call({
    Object? key = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? hint = const $CopyWithPlaceholder(),
  }) {
    return BadRequestError(
      key: key == const $CopyWithPlaceholder()
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      hint: hint == const $CopyWithPlaceholder()
          ? _value.hint
          // ignore: cast_nullable_to_non_nullable
          : hint as String?,
    );
  }
}

extension $BadRequestErrorCopyWith on BadRequestError {
  /// Returns a callable class that can be used as follows: `instanceOfBadRequestError.copyWith(...)` or like so:`instanceOfBadRequestError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BadRequestErrorCWProxy get copyWith => _$BadRequestErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadRequestError _$BadRequestErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BadRequestError', json, ($checkedConvert) {
      final val = BadRequestError(
        key: $checkedConvert('key', (v) => v as String?),
        message: $checkedConvert('message', (v) => v as String?),
        hint: $checkedConvert('hint', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BadRequestErrorToJson(BadRequestError instance) =>
    <String, dynamic>{
      'key': ?instance.key,
      'message': ?instance.message,
      'hint': ?instance.hint,
    };
