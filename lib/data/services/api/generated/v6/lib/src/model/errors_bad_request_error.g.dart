// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors_bad_request_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorsBadRequestErrorCWProxy {
  ErrorsBadRequestError key(String? key);

  ErrorsBadRequestError message(String? message);

  ErrorsBadRequestError hint(String? hint);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorsBadRequestError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorsBadRequestError(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorsBadRequestError call({String? key, String? message, String? hint});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfErrorsBadRequestError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfErrorsBadRequestError.copyWith.fieldName(...)`
class _$ErrorsBadRequestErrorCWProxyImpl
    implements _$ErrorsBadRequestErrorCWProxy {
  const _$ErrorsBadRequestErrorCWProxyImpl(this._value);

  final ErrorsBadRequestError _value;

  @override
  ErrorsBadRequestError key(String? key) => this(key: key);

  @override
  ErrorsBadRequestError message(String? message) => this(message: message);

  @override
  ErrorsBadRequestError hint(String? hint) => this(hint: hint);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorsBadRequestError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorsBadRequestError(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorsBadRequestError call({
    Object? key = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? hint = const $CopyWithPlaceholder(),
  }) {
    return ErrorsBadRequestError(
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

extension $ErrorsBadRequestErrorCopyWith on ErrorsBadRequestError {
  /// Returns a callable class that can be used as follows: `instanceOfErrorsBadRequestError.copyWith(...)` or like so:`instanceOfErrorsBadRequestError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorsBadRequestErrorCWProxy get copyWith =>
      _$ErrorsBadRequestErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorsBadRequestError _$ErrorsBadRequestErrorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ErrorsBadRequestError', json, ($checkedConvert) {
  final val = ErrorsBadRequestError(
    key: $checkedConvert('key', (v) => v as String?),
    message: $checkedConvert('message', (v) => v as String?),
    hint: $checkedConvert('hint', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ErrorsBadRequestErrorToJson(
  ErrorsBadRequestError instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'message': ?instance.message,
  'hint': ?instance.hint,
};
