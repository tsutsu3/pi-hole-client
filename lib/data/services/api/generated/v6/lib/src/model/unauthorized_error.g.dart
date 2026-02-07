// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unauthorized_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnauthorizedErrorCWProxy {
  UnauthorizedError key(String? key);

  UnauthorizedError message(String? message);

  UnauthorizedError hint(String? hint);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnauthorizedError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnauthorizedError(...).copyWith(id: 12, name: "My name")
  /// ````
  UnauthorizedError call({String? key, String? message, String? hint});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnauthorizedError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnauthorizedError.copyWith.fieldName(...)`
class _$UnauthorizedErrorCWProxyImpl implements _$UnauthorizedErrorCWProxy {
  const _$UnauthorizedErrorCWProxyImpl(this._value);

  final UnauthorizedError _value;

  @override
  UnauthorizedError key(String? key) => this(key: key);

  @override
  UnauthorizedError message(String? message) => this(message: message);

  @override
  UnauthorizedError hint(String? hint) => this(hint: hint);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnauthorizedError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnauthorizedError(...).copyWith(id: 12, name: "My name")
  /// ````
  UnauthorizedError call({
    Object? key = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? hint = const $CopyWithPlaceholder(),
  }) {
    return UnauthorizedError(
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

extension $UnauthorizedErrorCopyWith on UnauthorizedError {
  /// Returns a callable class that can be used as follows: `instanceOfUnauthorizedError.copyWith(...)` or like so:`instanceOfUnauthorizedError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnauthorizedErrorCWProxy get copyWith =>
      _$UnauthorizedErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnauthorizedError _$UnauthorizedErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UnauthorizedError', json, ($checkedConvert) {
      final val = UnauthorizedError(
        key: $checkedConvert('key', (v) => v as String?),
        message: $checkedConvert('message', (v) => v as String?),
        hint: $checkedConvert('hint', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UnauthorizedErrorToJson(UnauthorizedError instance) =>
    <String, dynamic>{
      'key': ?instance.key,
      'message': ?instance.message,
      'hint': ?instance.hint,
    };
