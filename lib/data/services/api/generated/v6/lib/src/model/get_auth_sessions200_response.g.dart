// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_auth_sessions200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetAuthSessions200ResponseCWProxy {
  GetAuthSessions200Response sessions(
    List<SessionsListSessionsInner>? sessions,
  );

  GetAuthSessions200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetAuthSessions200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetAuthSessions200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetAuthSessions200Response call({
    List<SessionsListSessionsInner>? sessions,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetAuthSessions200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetAuthSessions200Response.copyWith.fieldName(...)`
class _$GetAuthSessions200ResponseCWProxyImpl
    implements _$GetAuthSessions200ResponseCWProxy {
  const _$GetAuthSessions200ResponseCWProxyImpl(this._value);

  final GetAuthSessions200Response _value;

  @override
  GetAuthSessions200Response sessions(
    List<SessionsListSessionsInner>? sessions,
  ) => this(sessions: sessions);

  @override
  GetAuthSessions200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetAuthSessions200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetAuthSessions200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetAuthSessions200Response call({
    Object? sessions = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetAuthSessions200Response(
      sessions: sessions == const $CopyWithPlaceholder()
          ? _value.sessions
          // ignore: cast_nullable_to_non_nullable
          : sessions as List<SessionsListSessionsInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetAuthSessions200ResponseCopyWith on GetAuthSessions200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetAuthSessions200Response.copyWith(...)` or like so:`instanceOfGetAuthSessions200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetAuthSessions200ResponseCWProxy get copyWith =>
      _$GetAuthSessions200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAuthSessions200Response _$GetAuthSessions200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetAuthSessions200Response', json, ($checkedConvert) {
  final val = GetAuthSessions200Response(
    sessions: $checkedConvert(
      'sessions',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                SessionsListSessionsInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetAuthSessions200ResponseToJson(
  GetAuthSessions200Response instance,
) => <String, dynamic>{
  'sessions': ?instance.sessions?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
