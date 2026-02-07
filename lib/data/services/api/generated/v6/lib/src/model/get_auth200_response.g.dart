// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_auth200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetAuth200ResponseCWProxy {
  GetAuth200Response session(SessionSession session);

  GetAuth200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetAuth200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetAuth200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetAuth200Response call({SessionSession session, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetAuth200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetAuth200Response.copyWith.fieldName(...)`
class _$GetAuth200ResponseCWProxyImpl implements _$GetAuth200ResponseCWProxy {
  const _$GetAuth200ResponseCWProxyImpl(this._value);

  final GetAuth200Response _value;

  @override
  GetAuth200Response session(SessionSession session) => this(session: session);

  @override
  GetAuth200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetAuth200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetAuth200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetAuth200Response call({
    Object? session = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetAuth200Response(
      session: session == const $CopyWithPlaceholder()
          ? _value.session
          // ignore: cast_nullable_to_non_nullable
          : session as SessionSession,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetAuth200ResponseCopyWith on GetAuth200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetAuth200Response.copyWith(...)` or like so:`instanceOfGetAuth200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetAuth200ResponseCWProxy get copyWith =>
      _$GetAuth200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAuth200Response _$GetAuth200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GetAuth200Response', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['session']);
      final val = GetAuth200Response(
        session: $checkedConvert(
          'session',
          (v) => SessionSession.fromJson(v as Map<String, dynamic>),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GetAuth200ResponseToJson(GetAuth200Response instance) =>
    <String, dynamic>{
      'session': instance.session.toJson(),
      'took': ?instance.took,
    };
