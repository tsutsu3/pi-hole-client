// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSession {
  int get id;
  @JsonKey(name: 'current_session')
  bool get currentSession;
  bool get valid;
  Tls get tls;
  bool get app;
  bool get cli;
  @JsonKey(name: 'login_at')
  int get loginAt;
  @JsonKey(name: 'last_active')
  int get lastActive;
  @JsonKey(name: 'valid_until')
  int get validUntil;
  @JsonKey(name: 'remote_addr')
  String get remoteAddr;
  @JsonKey(name: 'user_agent')
  String? get userAgent;
  @JsonKey(name: 'x_forwarded_for')
  String? get xForwardedFor;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthSessionCopyWith<AuthSession> get copyWith =>
      _$AuthSessionCopyWithImpl<AuthSession>(this as AuthSession, _$identity);

  /// Serializes this AuthSession to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSession &&
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

  @override
  String toString() {
    return 'AuthSession(id: $id, currentSession: $currentSession, valid: $valid, tls: $tls, app: $app, cli: $cli, loginAt: $loginAt, lastActive: $lastActive, validUntil: $validUntil, remoteAddr: $remoteAddr, userAgent: $userAgent, xForwardedFor: $xForwardedFor)';
  }
}

/// @nodoc
abstract mixin class $AuthSessionCopyWith<$Res> {
  factory $AuthSessionCopyWith(
          AuthSession value, $Res Function(AuthSession) _then) =
      _$AuthSessionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'current_session') bool currentSession,
      bool valid,
      Tls tls,
      bool app,
      bool cli,
      @JsonKey(name: 'login_at') int loginAt,
      @JsonKey(name: 'last_active') int lastActive,
      @JsonKey(name: 'valid_until') int validUntil,
      @JsonKey(name: 'remote_addr') String remoteAddr,
      @JsonKey(name: 'user_agent') String? userAgent,
      @JsonKey(name: 'x_forwarded_for') String? xForwardedFor});

  $TlsCopyWith<$Res> get tls;
}

/// @nodoc
class _$AuthSessionCopyWithImpl<$Res> implements $AuthSessionCopyWith<$Res> {
  _$AuthSessionCopyWithImpl(this._self, this._then);

  final AuthSession _self;
  final $Res Function(AuthSession) _then;

  /// Create a copy of AuthSession
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currentSession: null == currentSession
          ? _self.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      tls: null == tls
          ? _self.tls
          : tls // ignore: cast_nullable_to_non_nullable
              as Tls,
      app: null == app
          ? _self.app
          : app // ignore: cast_nullable_to_non_nullable
              as bool,
      cli: null == cli
          ? _self.cli
          : cli // ignore: cast_nullable_to_non_nullable
              as bool,
      loginAt: null == loginAt
          ? _self.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastActive: null == lastActive
          ? _self.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as int,
      validUntil: null == validUntil
          ? _self.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as int,
      remoteAddr: null == remoteAddr
          ? _self.remoteAddr
          : remoteAddr // ignore: cast_nullable_to_non_nullable
              as String,
      userAgent: freezed == userAgent
          ? _self.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String?,
      xForwardedFor: freezed == xForwardedFor
          ? _self.xForwardedFor
          : xForwardedFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TlsCopyWith<$Res> get tls {
    return $TlsCopyWith<$Res>(_self.tls, (value) {
      return _then(_self.copyWith(tls: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AuthSession].
extension AuthSessionPatterns on AuthSession {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthSession value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSession() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthSession value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSession():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthSession value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSession() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'current_session') bool currentSession,
            bool valid,
            Tls tls,
            bool app,
            bool cli,
            @JsonKey(name: 'login_at') int loginAt,
            @JsonKey(name: 'last_active') int lastActive,
            @JsonKey(name: 'valid_until') int validUntil,
            @JsonKey(name: 'remote_addr') String remoteAddr,
            @JsonKey(name: 'user_agent') String? userAgent,
            @JsonKey(name: 'x_forwarded_for') String? xForwardedFor)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthSession() when $default != null:
        return $default(
            _that.id,
            _that.currentSession,
            _that.valid,
            _that.tls,
            _that.app,
            _that.cli,
            _that.loginAt,
            _that.lastActive,
            _that.validUntil,
            _that.remoteAddr,
            _that.userAgent,
            _that.xForwardedFor);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'current_session') bool currentSession,
            bool valid,
            Tls tls,
            bool app,
            bool cli,
            @JsonKey(name: 'login_at') int loginAt,
            @JsonKey(name: 'last_active') int lastActive,
            @JsonKey(name: 'valid_until') int validUntil,
            @JsonKey(name: 'remote_addr') String remoteAddr,
            @JsonKey(name: 'user_agent') String? userAgent,
            @JsonKey(name: 'x_forwarded_for') String? xForwardedFor)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSession():
        return $default(
            _that.id,
            _that.currentSession,
            _that.valid,
            _that.tls,
            _that.app,
            _that.cli,
            _that.loginAt,
            _that.lastActive,
            _that.validUntil,
            _that.remoteAddr,
            _that.userAgent,
            _that.xForwardedFor);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            @JsonKey(name: 'current_session') bool currentSession,
            bool valid,
            Tls tls,
            bool app,
            bool cli,
            @JsonKey(name: 'login_at') int loginAt,
            @JsonKey(name: 'last_active') int lastActive,
            @JsonKey(name: 'valid_until') int validUntil,
            @JsonKey(name: 'remote_addr') String remoteAddr,
            @JsonKey(name: 'user_agent') String? userAgent,
            @JsonKey(name: 'x_forwarded_for') String? xForwardedFor)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthSession() when $default != null:
        return $default(
            _that.id,
            _that.currentSession,
            _that.valid,
            _that.tls,
            _that.app,
            _that.cli,
            _that.loginAt,
            _that.lastActive,
            _that.validUntil,
            _that.remoteAddr,
            _that.userAgent,
            _that.xForwardedFor);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AuthSession implements AuthSession {
  const _AuthSession(
      {required this.id,
      @JsonKey(name: 'current_session') required this.currentSession,
      required this.valid,
      required this.tls,
      required this.app,
      required this.cli,
      @JsonKey(name: 'login_at') required this.loginAt,
      @JsonKey(name: 'last_active') required this.lastActive,
      @JsonKey(name: 'valid_until') required this.validUntil,
      @JsonKey(name: 'remote_addr') required this.remoteAddr,
      @JsonKey(name: 'user_agent') this.userAgent,
      @JsonKey(name: 'x_forwarded_for') this.xForwardedFor});
  factory _AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'current_session')
  final bool currentSession;
  @override
  final bool valid;
  @override
  final Tls tls;
  @override
  final bool app;
  @override
  final bool cli;
  @override
  @JsonKey(name: 'login_at')
  final int loginAt;
  @override
  @JsonKey(name: 'last_active')
  final int lastActive;
  @override
  @JsonKey(name: 'valid_until')
  final int validUntil;
  @override
  @JsonKey(name: 'remote_addr')
  final String remoteAddr;
  @override
  @JsonKey(name: 'user_agent')
  final String? userAgent;
  @override
  @JsonKey(name: 'x_forwarded_for')
  final String? xForwardedFor;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSessionCopyWith<_AuthSession> get copyWith =>
      __$AuthSessionCopyWithImpl<_AuthSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthSessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSession &&
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

  @override
  String toString() {
    return 'AuthSession(id: $id, currentSession: $currentSession, valid: $valid, tls: $tls, app: $app, cli: $cli, loginAt: $loginAt, lastActive: $lastActive, validUntil: $validUntil, remoteAddr: $remoteAddr, userAgent: $userAgent, xForwardedFor: $xForwardedFor)';
  }
}

/// @nodoc
abstract mixin class _$AuthSessionCopyWith<$Res>
    implements $AuthSessionCopyWith<$Res> {
  factory _$AuthSessionCopyWith(
          _AuthSession value, $Res Function(_AuthSession) _then) =
      __$AuthSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'current_session') bool currentSession,
      bool valid,
      Tls tls,
      bool app,
      bool cli,
      @JsonKey(name: 'login_at') int loginAt,
      @JsonKey(name: 'last_active') int lastActive,
      @JsonKey(name: 'valid_until') int validUntil,
      @JsonKey(name: 'remote_addr') String remoteAddr,
      @JsonKey(name: 'user_agent') String? userAgent,
      @JsonKey(name: 'x_forwarded_for') String? xForwardedFor});

  @override
  $TlsCopyWith<$Res> get tls;
}

/// @nodoc
class __$AuthSessionCopyWithImpl<$Res> implements _$AuthSessionCopyWith<$Res> {
  __$AuthSessionCopyWithImpl(this._self, this._then);

  final _AuthSession _self;
  final $Res Function(_AuthSession) _then;

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AuthSession(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currentSession: null == currentSession
          ? _self.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      tls: null == tls
          ? _self.tls
          : tls // ignore: cast_nullable_to_non_nullable
              as Tls,
      app: null == app
          ? _self.app
          : app // ignore: cast_nullable_to_non_nullable
              as bool,
      cli: null == cli
          ? _self.cli
          : cli // ignore: cast_nullable_to_non_nullable
              as bool,
      loginAt: null == loginAt
          ? _self.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastActive: null == lastActive
          ? _self.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as int,
      validUntil: null == validUntil
          ? _self.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as int,
      remoteAddr: null == remoteAddr
          ? _self.remoteAddr
          : remoteAddr // ignore: cast_nullable_to_non_nullable
              as String,
      userAgent: freezed == userAgent
          ? _self.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String?,
      xForwardedFor: freezed == xForwardedFor
          ? _self.xForwardedFor
          : xForwardedFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AuthSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TlsCopyWith<$Res> get tls {
    return $TlsCopyWith<$Res>(_self.tls, (value) {
      return _then(_self.copyWith(tls: value));
    });
  }
}

/// @nodoc
mixin _$Tls {
  bool get login;
  bool get mixed;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TlsCopyWith<Tls> get copyWith =>
      _$TlsCopyWithImpl<Tls>(this as Tls, _$identity);

  /// Serializes this Tls to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tls &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.mixed, mixed) || other.mixed == mixed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, mixed);

  @override
  String toString() {
    return 'Tls(login: $login, mixed: $mixed)';
  }
}

/// @nodoc
abstract mixin class $TlsCopyWith<$Res> {
  factory $TlsCopyWith(Tls value, $Res Function(Tls) _then) = _$TlsCopyWithImpl;
  @useResult
  $Res call({bool login, bool mixed});
}

/// @nodoc
class _$TlsCopyWithImpl<$Res> implements $TlsCopyWith<$Res> {
  _$TlsCopyWithImpl(this._self, this._then);

  final Tls _self;
  final $Res Function(Tls) _then;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? mixed = null,
  }) {
    return _then(_self.copyWith(
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as bool,
      mixed: null == mixed
          ? _self.mixed
          : mixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Tls].
extension TlsPatterns on Tls {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Tls value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tls() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Tls value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tls():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Tls value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tls() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool login, bool mixed)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tls() when $default != null:
        return $default(_that.login, _that.mixed);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool login, bool mixed) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tls():
        return $default(_that.login, _that.mixed);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool login, bool mixed)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tls() when $default != null:
        return $default(_that.login, _that.mixed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Tls implements Tls {
  const _Tls({required this.login, required this.mixed});
  factory _Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);

  @override
  final bool login;
  @override
  final bool mixed;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TlsCopyWith<_Tls> get copyWith =>
      __$TlsCopyWithImpl<_Tls>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TlsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tls &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.mixed, mixed) || other.mixed == mixed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, mixed);

  @override
  String toString() {
    return 'Tls(login: $login, mixed: $mixed)';
  }
}

/// @nodoc
abstract mixin class _$TlsCopyWith<$Res> implements $TlsCopyWith<$Res> {
  factory _$TlsCopyWith(_Tls value, $Res Function(_Tls) _then) =
      __$TlsCopyWithImpl;
  @override
  @useResult
  $Res call({bool login, bool mixed});
}

/// @nodoc
class __$TlsCopyWithImpl<$Res> implements _$TlsCopyWith<$Res> {
  __$TlsCopyWithImpl(this._self, this._then);

  final _Tls _self;
  final $Res Function(_Tls) _then;

  /// Create a copy of Tls
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? login = null,
    Object? mixed = null,
  }) {
    return _then(_Tls(
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as bool,
      mixed: null == mixed
          ? _self.mixed
          : mixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
