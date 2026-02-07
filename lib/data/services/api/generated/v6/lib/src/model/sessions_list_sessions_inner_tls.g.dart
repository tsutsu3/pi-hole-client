// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_list_sessions_inner_tls.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionsListSessionsInnerTlsCWProxy {
  SessionsListSessionsInnerTls login(bool? login);

  SessionsListSessionsInnerTls mixed(bool? mixed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionsListSessionsInnerTls(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionsListSessionsInnerTls(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionsListSessionsInnerTls call({bool? login, bool? mixed});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSessionsListSessionsInnerTls.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSessionsListSessionsInnerTls.copyWith.fieldName(...)`
class _$SessionsListSessionsInnerTlsCWProxyImpl
    implements _$SessionsListSessionsInnerTlsCWProxy {
  const _$SessionsListSessionsInnerTlsCWProxyImpl(this._value);

  final SessionsListSessionsInnerTls _value;

  @override
  SessionsListSessionsInnerTls login(bool? login) => this(login: login);

  @override
  SessionsListSessionsInnerTls mixed(bool? mixed) => this(mixed: mixed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionsListSessionsInnerTls(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionsListSessionsInnerTls(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionsListSessionsInnerTls call({
    Object? login = const $CopyWithPlaceholder(),
    Object? mixed = const $CopyWithPlaceholder(),
  }) {
    return SessionsListSessionsInnerTls(
      login: login == const $CopyWithPlaceholder()
          ? _value.login
          // ignore: cast_nullable_to_non_nullable
          : login as bool?,
      mixed: mixed == const $CopyWithPlaceholder()
          ? _value.mixed
          // ignore: cast_nullable_to_non_nullable
          : mixed as bool?,
    );
  }
}

extension $SessionsListSessionsInnerTlsCopyWith
    on SessionsListSessionsInnerTls {
  /// Returns a callable class that can be used as follows: `instanceOfSessionsListSessionsInnerTls.copyWith(...)` or like so:`instanceOfSessionsListSessionsInnerTls.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionsListSessionsInnerTlsCWProxy get copyWith =>
      _$SessionsListSessionsInnerTlsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionsListSessionsInnerTls _$SessionsListSessionsInnerTlsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SessionsListSessionsInnerTls', json, ($checkedConvert) {
  final val = SessionsListSessionsInnerTls(
    login: $checkedConvert('login', (v) => v as bool?),
    mixed: $checkedConvert('mixed', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SessionsListSessionsInnerTlsToJson(
  SessionsListSessionsInnerTls instance,
) => <String, dynamic>{'login': ?instance.login, 'mixed': ?instance.mixed};
