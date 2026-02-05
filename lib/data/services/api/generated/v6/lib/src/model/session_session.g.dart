// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionSessionCWProxy {
  SessionSession valid(bool valid);

  SessionSession totp(bool totp);

  SessionSession sid(String? sid);

  SessionSession csrf(String? csrf);

  SessionSession validity(int validity);

  SessionSession message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionSession(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionSession call({
    bool valid,
    bool totp,
    String? sid,
    String? csrf,
    int validity,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSessionSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSessionSession.copyWith.fieldName(...)`
class _$SessionSessionCWProxyImpl implements _$SessionSessionCWProxy {
  const _$SessionSessionCWProxyImpl(this._value);

  final SessionSession _value;

  @override
  SessionSession valid(bool valid) => this(valid: valid);

  @override
  SessionSession totp(bool totp) => this(totp: totp);

  @override
  SessionSession sid(String? sid) => this(sid: sid);

  @override
  SessionSession csrf(String? csrf) => this(csrf: csrf);

  @override
  SessionSession validity(int validity) => this(validity: validity);

  @override
  SessionSession message(String? message) => this(message: message);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionSession(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionSession call({
    Object? valid = const $CopyWithPlaceholder(),
    Object? totp = const $CopyWithPlaceholder(),
    Object? sid = const $CopyWithPlaceholder(),
    Object? csrf = const $CopyWithPlaceholder(),
    Object? validity = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return SessionSession(
      valid: valid == const $CopyWithPlaceholder()
          ? _value.valid
          // ignore: cast_nullable_to_non_nullable
          : valid as bool,
      totp: totp == const $CopyWithPlaceholder()
          ? _value.totp
          // ignore: cast_nullable_to_non_nullable
          : totp as bool,
      sid: sid == const $CopyWithPlaceholder()
          ? _value.sid
          // ignore: cast_nullable_to_non_nullable
          : sid as String?,
      csrf: csrf == const $CopyWithPlaceholder()
          ? _value.csrf
          // ignore: cast_nullable_to_non_nullable
          : csrf as String?,
      validity: validity == const $CopyWithPlaceholder()
          ? _value.validity
          // ignore: cast_nullable_to_non_nullable
          : validity as int,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $SessionSessionCopyWith on SessionSession {
  /// Returns a callable class that can be used as follows: `instanceOfSessionSession.copyWith(...)` or like so:`instanceOfSessionSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionSessionCWProxy get copyWith => _$SessionSessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionSession _$SessionSessionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SessionSession', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['valid', 'totp', 'sid', 'validity', 'message'],
      );
      final val = SessionSession(
        valid: $checkedConvert('valid', (v) => v as bool),
        totp: $checkedConvert('totp', (v) => v as bool),
        sid: $checkedConvert('sid', (v) => v as String?),
        csrf: $checkedConvert('csrf', (v) => v as String?),
        validity: $checkedConvert('validity', (v) => (v as num).toInt()),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SessionSessionToJson(SessionSession instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'totp': instance.totp,
      'sid': instance.sid,
      'csrf': ?instance.csrf,
      'validity': instance.validity,
      'message': instance.message,
    };
