// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'too_many_requests_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TooManyRequestsErrorCWProxy {
  TooManyRequestsError key(String? key);

  TooManyRequestsError message(String? message);

  TooManyRequestsError hint(String? hint);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TooManyRequestsError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TooManyRequestsError(...).copyWith(id: 12, name: "My name")
  /// ````
  TooManyRequestsError call({String? key, String? message, String? hint});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTooManyRequestsError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTooManyRequestsError.copyWith.fieldName(...)`
class _$TooManyRequestsErrorCWProxyImpl
    implements _$TooManyRequestsErrorCWProxy {
  const _$TooManyRequestsErrorCWProxyImpl(this._value);

  final TooManyRequestsError _value;

  @override
  TooManyRequestsError key(String? key) => this(key: key);

  @override
  TooManyRequestsError message(String? message) => this(message: message);

  @override
  TooManyRequestsError hint(String? hint) => this(hint: hint);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TooManyRequestsError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TooManyRequestsError(...).copyWith(id: 12, name: "My name")
  /// ````
  TooManyRequestsError call({
    Object? key = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? hint = const $CopyWithPlaceholder(),
  }) {
    return TooManyRequestsError(
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

extension $TooManyRequestsErrorCopyWith on TooManyRequestsError {
  /// Returns a callable class that can be used as follows: `instanceOfTooManyRequestsError.copyWith(...)` or like so:`instanceOfTooManyRequestsError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TooManyRequestsErrorCWProxy get copyWith =>
      _$TooManyRequestsErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TooManyRequestsError _$TooManyRequestsErrorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TooManyRequestsError', json, ($checkedConvert) {
  final val = TooManyRequestsError(
    key: $checkedConvert('key', (v) => v as String?),
    message: $checkedConvert('message', (v) => v as String?),
    hint: $checkedConvert('hint', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$TooManyRequestsErrorToJson(
  TooManyRequestsError instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'message': ?instance.message,
  'hint': ?instance.hint,
};
