// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_restartdns200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionRestartdns200ResponseCWProxy {
  ActionRestartdns200Response status(String? status);

  ActionRestartdns200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionRestartdns200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionRestartdns200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionRestartdns200Response call({String? status, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionRestartdns200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionRestartdns200Response.copyWith.fieldName(...)`
class _$ActionRestartdns200ResponseCWProxyImpl
    implements _$ActionRestartdns200ResponseCWProxy {
  const _$ActionRestartdns200ResponseCWProxyImpl(this._value);

  final ActionRestartdns200Response _value;

  @override
  ActionRestartdns200Response status(String? status) => this(status: status);

  @override
  ActionRestartdns200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionRestartdns200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionRestartdns200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionRestartdns200Response call({
    Object? status = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ActionRestartdns200Response(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ActionRestartdns200ResponseCopyWith on ActionRestartdns200Response {
  /// Returns a callable class that can be used as follows: `instanceOfActionRestartdns200Response.copyWith(...)` or like so:`instanceOfActionRestartdns200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionRestartdns200ResponseCWProxy get copyWith =>
      _$ActionRestartdns200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionRestartdns200Response _$ActionRestartdns200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ActionRestartdns200Response', json, ($checkedConvert) {
  final val = ActionRestartdns200Response(
    status: $checkedConvert('status', (v) => v as String?),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ActionRestartdns200ResponseToJson(
  ActionRestartdns200Response instance,
) => <String, dynamic>{'status': ?instance.status, 'took': ?instance.took};
