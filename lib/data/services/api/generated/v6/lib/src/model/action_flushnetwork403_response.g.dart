// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_flushnetwork403_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionFlushnetwork403ResponseCWProxy {
  ActionFlushnetwork403Response error(ForbiddenError? error);

  ActionFlushnetwork403Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionFlushnetwork403Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionFlushnetwork403Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionFlushnetwork403Response call({ForbiddenError? error, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionFlushnetwork403Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionFlushnetwork403Response.copyWith.fieldName(...)`
class _$ActionFlushnetwork403ResponseCWProxyImpl
    implements _$ActionFlushnetwork403ResponseCWProxy {
  const _$ActionFlushnetwork403ResponseCWProxyImpl(this._value);

  final ActionFlushnetwork403Response _value;

  @override
  ActionFlushnetwork403Response error(ForbiddenError? error) =>
      this(error: error);

  @override
  ActionFlushnetwork403Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionFlushnetwork403Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionFlushnetwork403Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionFlushnetwork403Response call({
    Object? error = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ActionFlushnetwork403Response(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ForbiddenError?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ActionFlushnetwork403ResponseCopyWith
    on ActionFlushnetwork403Response {
  /// Returns a callable class that can be used as follows: `instanceOfActionFlushnetwork403Response.copyWith(...)` or like so:`instanceOfActionFlushnetwork403Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionFlushnetwork403ResponseCWProxy get copyWith =>
      _$ActionFlushnetwork403ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionFlushnetwork403Response _$ActionFlushnetwork403ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ActionFlushnetwork403Response', json, ($checkedConvert) {
  final val = ActionFlushnetwork403Response(
    error: $checkedConvert(
      'error',
      (v) =>
          v == null ? null : ForbiddenError.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ActionFlushnetwork403ResponseToJson(
  ActionFlushnetwork403Response instance,
) => <String, dynamic>{
  'error': ?instance.error?.toJson(),
  'took': ?instance.took,
};
