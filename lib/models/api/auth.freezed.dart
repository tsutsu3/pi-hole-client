// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthStatusResponse _$AuthStatusResponseFromJson(Map<String, dynamic> json) {
  return _AuthStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthStatusResponse {
  /// Information about the session status.
  SessionStatus get sessionstatus => throw _privateConstructorUsedError;

  /// Time taken for the authentication request in milliseconds.
  int get took => throw _privateConstructorUsedError;

  /// Serializes this AuthStatusResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStatusResponseCopyWith<AuthStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusResponseCopyWith<$Res> {
  factory $AuthStatusResponseCopyWith(
          AuthStatusResponse value, $Res Function(AuthStatusResponse) then) =
      _$AuthStatusResponseCopyWithImpl<$Res, AuthStatusResponse>;
  @useResult
  $Res call({SessionStatus sessionstatus, int took});

  $SessionStatusCopyWith<$Res> get sessionstatus;
}

/// @nodoc
class _$AuthStatusResponseCopyWithImpl<$Res, $Val extends AuthStatusResponse>
    implements $AuthStatusResponseCopyWith<$Res> {
  _$AuthStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionstatus = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      sessionstatus: null == sessionstatus
          ? _value.sessionstatus
          : sessionstatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AuthStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionStatusCopyWith<$Res> get sessionstatus {
    return $SessionStatusCopyWith<$Res>(_value.sessionstatus, (value) {
      return _then(_value.copyWith(sessionstatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStatusResponseImplCopyWith<$Res>
    implements $AuthStatusResponseCopyWith<$Res> {
  factory _$$AuthStatusResponseImplCopyWith(_$AuthStatusResponseImpl value,
          $Res Function(_$AuthStatusResponseImpl) then) =
      __$$AuthStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SessionStatus sessionstatus, int took});

  @override
  $SessionStatusCopyWith<$Res> get sessionstatus;
}

/// @nodoc
class __$$AuthStatusResponseImplCopyWithImpl<$Res>
    extends _$AuthStatusResponseCopyWithImpl<$Res, _$AuthStatusResponseImpl>
    implements _$$AuthStatusResponseImplCopyWith<$Res> {
  __$$AuthStatusResponseImplCopyWithImpl(_$AuthStatusResponseImpl _value,
      $Res Function(_$AuthStatusResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionstatus = null,
    Object? took = null,
  }) {
    return _then(_$AuthStatusResponseImpl(
      sessionstatus: null == sessionstatus
          ? _value.sessionstatus
          : sessionstatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthStatusResponseImpl implements _AuthStatusResponse {
  const _$AuthStatusResponseImpl(
      {required this.sessionstatus, required this.took});

  factory _$AuthStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthStatusResponseImplFromJson(json);

  /// Information about the session status.
  @override
  final SessionStatus sessionstatus;

  /// Time taken for the authentication request in milliseconds.
  @override
  final int took;

  @override
  String toString() {
    return 'AuthStatusResponse(sessionstatus: $sessionstatus, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusResponseImpl &&
            (identical(other.sessionstatus, sessionstatus) ||
                other.sessionstatus == sessionstatus) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionstatus, took);

  /// Create a copy of AuthStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStatusResponseImplCopyWith<_$AuthStatusResponseImpl> get copyWith =>
      __$$AuthStatusResponseImplCopyWithImpl<_$AuthStatusResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthStatusResponse implements AuthStatusResponse {
  const factory _AuthStatusResponse(
      {required final SessionStatus sessionstatus,
      required final int took}) = _$AuthStatusResponseImpl;

  factory _AuthStatusResponse.fromJson(Map<String, dynamic> json) =
      _$AuthStatusResponseImpl.fromJson;

  /// Information about the session status.
  @override
  SessionStatus get sessionstatus;

  /// Time taken for the authentication request in milliseconds.
  @override
  int get took;

  /// Create a copy of AuthStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStatusResponseImplCopyWith<_$AuthStatusResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionStatus _$SessionStatusFromJson(Map<String, dynamic> json) {
  return _SessionStatus.fromJson(json);
}

/// @nodoc
mixin _$SessionStatus {
  /// Indicates if the session is valid (client is authenticated).
  bool get valid => throw _privateConstructorUsedError;

  /// Indicates if two-factor authentication (TOTP) is enabled.
  bool get totp => throw _privateConstructorUsedError;

  /// The session ID.
  String? get sid => throw _privateConstructorUsedError;

  /// The CSRF token.
  String? get csrf => throw _privateConstructorUsedError;

  /// Remaining lifetime of the session in seconds, unless refreshed.
  int get validity => throw _privateConstructorUsedError;

  /// Human-readable message describing the session status.
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SessionStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionStatusCopyWith<SessionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStatusCopyWith<$Res> {
  factory $SessionStatusCopyWith(
          SessionStatus value, $Res Function(SessionStatus) then) =
      _$SessionStatusCopyWithImpl<$Res, SessionStatus>;
  @useResult
  $Res call(
      {bool valid,
      bool totp,
      String? sid,
      String? csrf,
      int validity,
      String? message});
}

/// @nodoc
class _$SessionStatusCopyWithImpl<$Res, $Val extends SessionStatus>
    implements $SessionStatusCopyWith<$Res> {
  _$SessionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? totp = null,
    Object? sid = freezed,
    Object? csrf = freezed,
    Object? validity = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      totp: null == totp
          ? _value.totp
          : totp // ignore: cast_nullable_to_non_nullable
              as bool,
      sid: freezed == sid
          ? _value.sid
          : sid // ignore: cast_nullable_to_non_nullable
              as String?,
      csrf: freezed == csrf
          ? _value.csrf
          : csrf // ignore: cast_nullable_to_non_nullable
              as String?,
      validity: null == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionStatusImplCopyWith<$Res>
    implements $SessionStatusCopyWith<$Res> {
  factory _$$SessionStatusImplCopyWith(
          _$SessionStatusImpl value, $Res Function(_$SessionStatusImpl) then) =
      __$$SessionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool valid,
      bool totp,
      String? sid,
      String? csrf,
      int validity,
      String? message});
}

/// @nodoc
class __$$SessionStatusImplCopyWithImpl<$Res>
    extends _$SessionStatusCopyWithImpl<$Res, _$SessionStatusImpl>
    implements _$$SessionStatusImplCopyWith<$Res> {
  __$$SessionStatusImplCopyWithImpl(
      _$SessionStatusImpl _value, $Res Function(_$SessionStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? totp = null,
    Object? sid = freezed,
    Object? csrf = freezed,
    Object? validity = null,
    Object? message = freezed,
  }) {
    return _then(_$SessionStatusImpl(
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      totp: null == totp
          ? _value.totp
          : totp // ignore: cast_nullable_to_non_nullable
              as bool,
      sid: freezed == sid
          ? _value.sid
          : sid // ignore: cast_nullable_to_non_nullable
              as String?,
      csrf: freezed == csrf
          ? _value.csrf
          : csrf // ignore: cast_nullable_to_non_nullable
              as String?,
      validity: null == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionStatusImpl implements _SessionStatus {
  const _$SessionStatusImpl(
      {required this.valid,
      required this.totp,
      this.sid,
      this.csrf,
      required this.validity,
      this.message});

  factory _$SessionStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionStatusImplFromJson(json);

  /// Indicates if the session is valid (client is authenticated).
  @override
  final bool valid;

  /// Indicates if two-factor authentication (TOTP) is enabled.
  @override
  final bool totp;

  /// The session ID.
  @override
  final String? sid;

  /// The CSRF token.
  @override
  final String? csrf;

  /// Remaining lifetime of the session in seconds, unless refreshed.
  @override
  final int validity;

  /// Human-readable message describing the session status.
  @override
  final String? message;

  @override
  String toString() {
    return 'SessionStatus(valid: $valid, totp: $totp, sid: $sid, csrf: $csrf, validity: $validity, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStatusImpl &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.totp, totp) || other.totp == totp) &&
            (identical(other.sid, sid) || other.sid == sid) &&
            (identical(other.csrf, csrf) || other.csrf == csrf) &&
            (identical(other.validity, validity) ||
                other.validity == validity) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, valid, totp, sid, csrf, validity, message);

  /// Create a copy of SessionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStatusImplCopyWith<_$SessionStatusImpl> get copyWith =>
      __$$SessionStatusImplCopyWithImpl<_$SessionStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionStatusImplToJson(
      this,
    );
  }
}

abstract class _SessionStatus implements SessionStatus {
  const factory _SessionStatus(
      {required final bool valid,
      required final bool totp,
      final String? sid,
      final String? csrf,
      required final int validity,
      final String? message}) = _$SessionStatusImpl;

  factory _SessionStatus.fromJson(Map<String, dynamic> json) =
      _$SessionStatusImpl.fromJson;

  /// Indicates if the session is valid (client is authenticated).
  @override
  bool get valid;

  /// Indicates if two-factor authentication (TOTP) is enabled.
  @override
  bool get totp;

  /// The session ID.
  @override
  String? get sid;

  /// The CSRF token.
  @override
  String? get csrf;

  /// Remaining lifetime of the session in seconds, unless refreshed.
  @override
  int get validity;

  /// Human-readable message describing the session status.
  @override
  String? get message;

  /// Create a copy of SessionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStatusImplCopyWith<_$SessionStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Password _$PasswordFromJson(Map<String, dynamic> json) {
  return _Password.fromJson(json);
}

/// @nodoc
mixin _$Password {
  /// The password string.
  String get password => throw _privateConstructorUsedError;

  /// Serializes this Password to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordCopyWith<Password> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordCopyWith<$Res> {
  factory $PasswordCopyWith(Password value, $Res Function(Password) then) =
      _$PasswordCopyWithImpl<$Res, Password>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$PasswordCopyWithImpl<$Res, $Val extends Password>
    implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordImplCopyWith<$Res>
    implements $PasswordCopyWith<$Res> {
  factory _$$PasswordImplCopyWith(
          _$PasswordImpl value, $Res Function(_$PasswordImpl) then) =
      __$$PasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordImplCopyWithImpl<$Res>
    extends _$PasswordCopyWithImpl<$Res, _$PasswordImpl>
    implements _$$PasswordImplCopyWith<$Res> {
  __$$PasswordImplCopyWithImpl(
      _$PasswordImpl _value, $Res Function(_$PasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordImpl implements _Password {
  const _$PasswordImpl({required this.password});

  factory _$PasswordImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordImplFromJson(json);

  /// The password string.
  @override
  final String password;

  @override
  String toString() {
    return 'Password(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordImplCopyWith<_$PasswordImpl> get copyWith =>
      __$$PasswordImplCopyWithImpl<_$PasswordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordImplToJson(
      this,
    );
  }
}

abstract class _Password implements Password {
  const factory _Password({required final String password}) = _$PasswordImpl;

  factory _Password.fromJson(Map<String, dynamic> json) =
      _$PasswordImpl.fromJson;

  /// The password string.
  @override
  String get password;

  /// Create a copy of Password
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordImplCopyWith<_$PasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppPasswordResponse _$AppPasswordResponseFromJson(Map<String, dynamic> json) {
  return _AppPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$AppPasswordResponse {
  /// Information about the application password.
  App get app => throw _privateConstructorUsedError;

  /// Time taken to process the request in milliseconds.
  int get took => throw _privateConstructorUsedError;

  /// Serializes this AppPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppPasswordResponseCopyWith<AppPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPasswordResponseCopyWith<$Res> {
  factory $AppPasswordResponseCopyWith(
          AppPasswordResponse value, $Res Function(AppPasswordResponse) then) =
      _$AppPasswordResponseCopyWithImpl<$Res, AppPasswordResponse>;
  @useResult
  $Res call({App app, int took});

  $AppCopyWith<$Res> get app;
}

/// @nodoc
class _$AppPasswordResponseCopyWithImpl<$Res, $Val extends AppPasswordResponse>
    implements $AppPasswordResponseCopyWith<$Res> {
  _$AppPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? app = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as App,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AppPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppCopyWith<$Res> get app {
    return $AppCopyWith<$Res>(_value.app, (value) {
      return _then(_value.copyWith(app: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppPasswordResponseImplCopyWith<$Res>
    implements $AppPasswordResponseCopyWith<$Res> {
  factory _$$AppPasswordResponseImplCopyWith(_$AppPasswordResponseImpl value,
          $Res Function(_$AppPasswordResponseImpl) then) =
      __$$AppPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({App app, int took});

  @override
  $AppCopyWith<$Res> get app;
}

/// @nodoc
class __$$AppPasswordResponseImplCopyWithImpl<$Res>
    extends _$AppPasswordResponseCopyWithImpl<$Res, _$AppPasswordResponseImpl>
    implements _$$AppPasswordResponseImplCopyWith<$Res> {
  __$$AppPasswordResponseImplCopyWithImpl(_$AppPasswordResponseImpl _value,
      $Res Function(_$AppPasswordResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? app = null,
    Object? took = null,
  }) {
    return _then(_$AppPasswordResponseImpl(
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as App,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPasswordResponseImpl implements _AppPasswordResponse {
  const _$AppPasswordResponseImpl({required this.app, required this.took});

  factory _$AppPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPasswordResponseImplFromJson(json);

  /// Information about the application password.
  @override
  final App app;

  /// Time taken to process the request in milliseconds.
  @override
  final int took;

  @override
  String toString() {
    return 'AppPasswordResponse(app: $app, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPasswordResponseImpl &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, app, took);

  /// Create a copy of AppPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPasswordResponseImplCopyWith<_$AppPasswordResponseImpl> get copyWith =>
      __$$AppPasswordResponseImplCopyWithImpl<_$AppPasswordResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _AppPasswordResponse implements AppPasswordResponse {
  const factory _AppPasswordResponse(
      {required final App app,
      required final int took}) = _$AppPasswordResponseImpl;

  factory _AppPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$AppPasswordResponseImpl.fromJson;

  /// Information about the application password.
  @override
  App get app;

  /// Time taken to process the request in milliseconds.
  @override
  int get took;

  /// Create a copy of AppPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppPasswordResponseImplCopyWith<_$AppPasswordResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

App _$AppFromJson(Map<String, dynamic> json) {
  return _App.fromJson(json);
}

/// @nodoc
mixin _$App {
  /// The application password.
  String get password => throw _privateConstructorUsedError;

  /// The hash of the application password.
  String get hash => throw _privateConstructorUsedError;

  /// Serializes this App to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of App
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppCopyWith<App> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppCopyWith<$Res> {
  factory $AppCopyWith(App value, $Res Function(App) then) =
      _$AppCopyWithImpl<$Res, App>;
  @useResult
  $Res call({String password, String hash});
}

/// @nodoc
class _$AppCopyWithImpl<$Res, $Val extends App> implements $AppCopyWith<$Res> {
  _$AppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of App
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppImplCopyWith<$Res> implements $AppCopyWith<$Res> {
  factory _$$AppImplCopyWith(_$AppImpl value, $Res Function(_$AppImpl) then) =
      __$$AppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, String hash});
}

/// @nodoc
class __$$AppImplCopyWithImpl<$Res> extends _$AppCopyWithImpl<$Res, _$AppImpl>
    implements _$$AppImplCopyWith<$Res> {
  __$$AppImplCopyWithImpl(_$AppImpl _value, $Res Function(_$AppImpl) _then)
      : super(_value, _then);

  /// Create a copy of App
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? hash = null,
  }) {
    return _then(_$AppImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppImpl implements _App {
  const _$AppImpl({required this.password, required this.hash});

  factory _$AppImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppImplFromJson(json);

  /// The application password.
  @override
  final String password;

  /// The hash of the application password.
  @override
  final String hash;

  @override
  String toString() {
    return 'App(password: $password, hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, password, hash);

  /// Create a copy of App
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppImplCopyWith<_$AppImpl> get copyWith =>
      __$$AppImplCopyWithImpl<_$AppImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppImplToJson(
      this,
    );
  }
}

abstract class _App implements App {
  const factory _App(
      {required final String password, required final String hash}) = _$AppImpl;

  factory _App.fromJson(Map<String, dynamic> json) = _$AppImpl.fromJson;

  /// The application password.
  @override
  String get password;

  /// The hash of the application password.
  @override
  String get hash;

  /// Create a copy of App
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppImplCopyWith<_$AppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionListResponse _$SessionListResponseFromJson(Map<String, dynamic> json) {
  return _SessionListResponse.fromJson(json);
}

/// @nodoc
mixin _$SessionListResponse {
  /// A list of active sessions.
  List<Session> get sessions => throw _privateConstructorUsedError;

  /// Time taken to process the request in seconds.
  int get took => throw _privateConstructorUsedError;

  /// Serializes this SessionListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionListResponseCopyWith<SessionListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionListResponseCopyWith<$Res> {
  factory $SessionListResponseCopyWith(
          SessionListResponse value, $Res Function(SessionListResponse) then) =
      _$SessionListResponseCopyWithImpl<$Res, SessionListResponse>;
  @useResult
  $Res call({List<Session> sessions, int took});
}

/// @nodoc
class _$SessionListResponseCopyWithImpl<$Res, $Val extends SessionListResponse>
    implements $SessionListResponseCopyWith<$Res> {
  _$SessionListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      sessions: null == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionListResponseImplCopyWith<$Res>
    implements $SessionListResponseCopyWith<$Res> {
  factory _$$SessionListResponseImplCopyWith(_$SessionListResponseImpl value,
          $Res Function(_$SessionListResponseImpl) then) =
      __$$SessionListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Session> sessions, int took});
}

/// @nodoc
class __$$SessionListResponseImplCopyWithImpl<$Res>
    extends _$SessionListResponseCopyWithImpl<$Res, _$SessionListResponseImpl>
    implements _$$SessionListResponseImplCopyWith<$Res> {
  __$$SessionListResponseImplCopyWithImpl(_$SessionListResponseImpl _value,
      $Res Function(_$SessionListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? took = null,
  }) {
    return _then(_$SessionListResponseImpl(
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionListResponseImpl implements _SessionListResponse {
  const _$SessionListResponseImpl(
      {required final List<Session> sessions, required this.took})
      : _sessions = sessions;

  factory _$SessionListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionListResponseImplFromJson(json);

  /// A list of active sessions.
  final List<Session> _sessions;

  /// A list of active sessions.
  @override
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  /// Time taken to process the request in seconds.
  @override
  final int took;

  @override
  String toString() {
    return 'SessionListResponse(sessions: $sessions, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionListResponseImpl &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_sessions), took);

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionListResponseImplCopyWith<_$SessionListResponseImpl> get copyWith =>
      __$$SessionListResponseImplCopyWithImpl<_$SessionListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionListResponseImplToJson(
      this,
    );
  }
}

abstract class _SessionListResponse implements SessionListResponse {
  const factory _SessionListResponse(
      {required final List<Session> sessions,
      required final int took}) = _$SessionListResponseImpl;

  factory _SessionListResponse.fromJson(Map<String, dynamic> json) =
      _$SessionListResponseImpl.fromJson;

  /// A list of active sessions.
  @override
  List<Session> get sessions;

  /// Time taken to process the request in seconds.
  @override
  int get took;

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionListResponseImplCopyWith<_$SessionListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  /// Unique identifier for the session.
  int get id => throw _privateConstructorUsedError;

  /// Indicates if this is the current session.
  bool get currentSession => throw _privateConstructorUsedError;

  /// Indicates if the session is valid (may become invalid due to timeout).
  bool get valid => throw _privateConstructorUsedError;

  /// TLS encryption details for the session.
  Tls get tls => throw _privateConstructorUsedError;

  /// Indicates if this session was initiated using an application password.
  bool get app => throw _privateConstructorUsedError;

  /// Indicates if this session was initiated using the CLI.
  bool get cli => throw _privateConstructorUsedError;

  /// Timestamp of login, in seconds since epoch.
  int get loginAt => throw _privateConstructorUsedError;

  /// Timestamp of last activity, in seconds since epoch.
  int get lastActive => throw _privateConstructorUsedError;

  /// Timestamp of session expiration, in seconds since epoch.
  int get validUntil => throw _privateConstructorUsedError;

  /// Client's IP address that initiated the session.
  String get remoteAddr => throw _privateConstructorUsedError;

  /// Client's user agent (optional).
  String? get userAgent => throw _privateConstructorUsedError;

  /// Client's IP address if behind a proxy (optional).
  String? get xForwardedFor => throw _privateConstructorUsedError;

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {int id,
      bool currentSession,
      bool valid,
      Tls tls,
      bool app,
      bool cli,
      int loginAt,
      int lastActive,
      int validUntil,
      String remoteAddr,
      String? userAgent,
      String? xForwardedFor});

  $TlsCopyWith<$Res> get tls;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentSession = null,
    Object? valid = null,
    Object? tls = null,
    Object? app = null,
    Object? cli = null,
    Object? loginAt = null,
    Object? lastActive = null,
    Object? validUntil = null,
    Object? remoteAddr = null,
    Object? userAgent = freezed,
    Object? xForwardedFor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      tls: null == tls
          ? _value.tls
          : tls // ignore: cast_nullable_to_non_nullable
              as Tls,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as bool,
      cli: null == cli
          ? _value.cli
          : cli // ignore: cast_nullable_to_non_nullable
              as bool,
      loginAt: null == loginAt
          ? _value.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastActive: null == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as int,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as int,
      remoteAddr: null == remoteAddr
          ? _value.remoteAddr
          : remoteAddr // ignore: cast_nullable_to_non_nullable
              as String,
      userAgent: freezed == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String?,
      xForwardedFor: freezed == xForwardedFor
          ? _value.xForwardedFor
          : xForwardedFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TlsCopyWith<$Res> get tls {
    return $TlsCopyWith<$Res>(_value.tls, (value) {
      return _then(_value.copyWith(tls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool currentSession,
      bool valid,
      Tls tls,
      bool app,
      bool cli,
      int loginAt,
      int lastActive,
      int validUntil,
      String remoteAddr,
      String? userAgent,
      String? xForwardedFor});

  @override
  $TlsCopyWith<$Res> get tls;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentSession = null,
    Object? valid = null,
    Object? tls = null,
    Object? app = null,
    Object? cli = null,
    Object? loginAt = null,
    Object? lastActive = null,
    Object? validUntil = null,
    Object? remoteAddr = null,
    Object? userAgent = freezed,
    Object? xForwardedFor = freezed,
  }) {
    return _then(_$SessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      tls: null == tls
          ? _value.tls
          : tls // ignore: cast_nullable_to_non_nullable
              as Tls,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as bool,
      cli: null == cli
          ? _value.cli
          : cli // ignore: cast_nullable_to_non_nullable
              as bool,
      loginAt: null == loginAt
          ? _value.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastActive: null == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as int,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as int,
      remoteAddr: null == remoteAddr
          ? _value.remoteAddr
          : remoteAddr // ignore: cast_nullable_to_non_nullable
              as String,
      userAgent: freezed == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String?,
      xForwardedFor: freezed == xForwardedFor
          ? _value.xForwardedFor
          : xForwardedFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.id,
      required this.currentSession,
      required this.valid,
      required this.tls,
      required this.app,
      required this.cli,
      required this.loginAt,
      required this.lastActive,
      required this.validUntil,
      required this.remoteAddr,
      this.userAgent,
      this.xForwardedFor});

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  /// Unique identifier for the session.
  @override
  final int id;

  /// Indicates if this is the current session.
  @override
  final bool currentSession;

  /// Indicates if the session is valid (may become invalid due to timeout).
  @override
  final bool valid;

  /// TLS encryption details for the session.
  @override
  final Tls tls;

  /// Indicates if this session was initiated using an application password.
  @override
  final bool app;

  /// Indicates if this session was initiated using the CLI.
  @override
  final bool cli;

  /// Timestamp of login, in seconds since epoch.
  @override
  final int loginAt;

  /// Timestamp of last activity, in seconds since epoch.
  @override
  final int lastActive;

  /// Timestamp of session expiration, in seconds since epoch.
  @override
  final int validUntil;

  /// Client's IP address that initiated the session.
  @override
  final String remoteAddr;

  /// Client's user agent (optional).
  @override
  final String? userAgent;

  /// Client's IP address if behind a proxy (optional).
  @override
  final String? xForwardedFor;

  @override
  String toString() {
    return 'Session(id: $id, currentSession: $currentSession, valid: $valid, tls: $tls, app: $app, cli: $cli, loginAt: $loginAt, lastActive: $lastActive, validUntil: $validUntil, remoteAddr: $remoteAddr, userAgent: $userAgent, xForwardedFor: $xForwardedFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentSession, currentSession) ||
                other.currentSession == currentSession) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.tls, tls) || other.tls == tls) &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.cli, cli) || other.cli == cli) &&
            (identical(other.loginAt, loginAt) || other.loginAt == loginAt) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.remoteAddr, remoteAddr) ||
                other.remoteAddr == remoteAddr) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            (identical(other.xForwardedFor, xForwardedFor) ||
                other.xForwardedFor == xForwardedFor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      currentSession,
      valid,
      tls,
      app,
      cli,
      loginAt,
      lastActive,
      validUntil,
      remoteAddr,
      userAgent,
      xForwardedFor);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {required final int id,
      required final bool currentSession,
      required final bool valid,
      required final Tls tls,
      required final bool app,
      required final bool cli,
      required final int loginAt,
      required final int lastActive,
      required final int validUntil,
      required final String remoteAddr,
      final String? userAgent,
      final String? xForwardedFor}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  /// Unique identifier for the session.
  @override
  int get id;

  /// Indicates if this is the current session.
  @override
  bool get currentSession;

  /// Indicates if the session is valid (may become invalid due to timeout).
  @override
  bool get valid;

  /// TLS encryption details for the session.
  @override
  Tls get tls;

  /// Indicates if this session was initiated using an application password.
  @override
  bool get app;

  /// Indicates if this session was initiated using the CLI.
  @override
  bool get cli;

  /// Timestamp of login, in seconds since epoch.
  @override
  int get loginAt;

  /// Timestamp of last activity, in seconds since epoch.
  @override
  int get lastActive;

  /// Timestamp of session expiration, in seconds since epoch.
  @override
  int get validUntil;

  /// Client's IP address that initiated the session.
  @override
  String get remoteAddr;

  /// Client's user agent (optional).
  @override
  String? get userAgent;

  /// Client's IP address if behind a proxy (optional).
  @override
  String? get xForwardedFor;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tls _$TlsFromJson(Map<String, dynamic> json) {
  return _Tls.fromJson(json);
}

/// @nodoc
mixin _$Tls {
  /// Indicates if TLS was used during login for this session.
  bool get login => throw _privateConstructorUsedError;

  /// Indicates if TLS is partially used in this session.
  bool get mixed => throw _privateConstructorUsedError;

  /// Serializes this Tls to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TlsCopyWith<Tls> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TlsCopyWith<$Res> {
  factory $TlsCopyWith(Tls value, $Res Function(Tls) then) =
      _$TlsCopyWithImpl<$Res, Tls>;
  @useResult
  $Res call({bool login, bool mixed});
}

/// @nodoc
class _$TlsCopyWithImpl<$Res, $Val extends Tls> implements $TlsCopyWith<$Res> {
  _$TlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? mixed = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as bool,
      mixed: null == mixed
          ? _value.mixed
          : mixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TlsImplCopyWith<$Res> implements $TlsCopyWith<$Res> {
  factory _$$TlsImplCopyWith(_$TlsImpl value, $Res Function(_$TlsImpl) then) =
      __$$TlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool login, bool mixed});
}

/// @nodoc
class __$$TlsImplCopyWithImpl<$Res> extends _$TlsCopyWithImpl<$Res, _$TlsImpl>
    implements _$$TlsImplCopyWith<$Res> {
  __$$TlsImplCopyWithImpl(_$TlsImpl _value, $Res Function(_$TlsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? mixed = null,
  }) {
    return _then(_$TlsImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as bool,
      mixed: null == mixed
          ? _value.mixed
          : mixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TlsImpl implements _Tls {
  const _$TlsImpl({required this.login, required this.mixed});

  factory _$TlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TlsImplFromJson(json);

  /// Indicates if TLS was used during login for this session.
  @override
  final bool login;

  /// Indicates if TLS is partially used in this session.
  @override
  final bool mixed;

  @override
  String toString() {
    return 'Tls(login: $login, mixed: $mixed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TlsImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.mixed, mixed) || other.mixed == mixed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, mixed);

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TlsImplCopyWith<_$TlsImpl> get copyWith =>
      __$$TlsImplCopyWithImpl<_$TlsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TlsImplToJson(
      this,
    );
  }
}

abstract class _Tls implements Tls {
  const factory _Tls({required final bool login, required final bool mixed}) =
      _$TlsImpl;

  factory _Tls.fromJson(Map<String, dynamic> json) = _$TlsImpl.fromJson;

  /// Indicates if TLS was used during login for this session.
  @override
  bool get login;

  /// Indicates if TLS is partially used in this session.
  @override
  bool get mixed;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TlsImplCopyWith<_$TlsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
