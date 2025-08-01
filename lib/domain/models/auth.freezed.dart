// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Auth {
  bool get valid;
  bool get totp;
  String get sid;
  String get csrf;
  int get validity;
  String get message;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthCopyWith<Auth> get copyWith =>
      _$AuthCopyWithImpl<Auth>(this as Auth, _$identity);

  /// Serializes this Auth to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Auth &&
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

  @override
  String toString() {
    return 'Auth(valid: $valid, totp: $totp, sid: $sid, csrf: $csrf, validity: $validity, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) _then) =
      _$AuthCopyWithImpl;
  @useResult
  $Res call(
      {bool valid,
      bool totp,
      String sid,
      String csrf,
      int validity,
      String message});
}

/// @nodoc
class _$AuthCopyWithImpl<$Res> implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._self, this._then);

  final Auth _self;
  final $Res Function(Auth) _then;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? totp = null,
    Object? sid = null,
    Object? csrf = null,
    Object? validity = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      totp: null == totp
          ? _self.totp
          : totp // ignore: cast_nullable_to_non_nullable
              as bool,
      sid: null == sid
          ? _self.sid
          : sid // ignore: cast_nullable_to_non_nullable
              as String,
      csrf: null == csrf
          ? _self.csrf
          : csrf // ignore: cast_nullable_to_non_nullable
              as String,
      validity: null == validity
          ? _self.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Auth].
extension AuthPatterns on Auth {
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
    TResult Function(_Auth value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
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
    TResult Function(_Auth value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth():
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
    TResult? Function(_Auth value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
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
    TResult Function(bool valid, bool totp, String sid, String csrf,
            int validity, String message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
        return $default(_that.valid, _that.totp, _that.sid, _that.csrf,
            _that.validity, _that.message);
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
    TResult Function(bool valid, bool totp, String sid, String csrf,
            int validity, String message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth():
        return $default(_that.valid, _that.totp, _that.sid, _that.csrf,
            _that.validity, _that.message);
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
    TResult? Function(bool valid, bool totp, String sid, String csrf,
            int validity, String message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
        return $default(_that.valid, _that.totp, _that.sid, _that.csrf,
            _that.validity, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Auth implements Auth {
  _Auth(
      {required this.valid,
      required this.totp,
      required this.sid,
      required this.csrf,
      required this.validity,
      required this.message});
  factory _Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  @override
  final bool valid;
  @override
  final bool totp;
  @override
  final String sid;
  @override
  final String csrf;
  @override
  final int validity;
  @override
  final String message;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthCopyWith<_Auth> get copyWith =>
      __$AuthCopyWithImpl<_Auth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Auth &&
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

  @override
  String toString() {
    return 'Auth(valid: $valid, totp: $totp, sid: $sid, csrf: $csrf, validity: $validity, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) _then) =
      __$AuthCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool valid,
      bool totp,
      String sid,
      String csrf,
      int validity,
      String message});
}

/// @nodoc
class __$AuthCopyWithImpl<$Res> implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(this._self, this._then);

  final _Auth _self;
  final $Res Function(_Auth) _then;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valid = null,
    Object? totp = null,
    Object? sid = null,
    Object? csrf = null,
    Object? validity = null,
    Object? message = null,
  }) {
    return _then(_Auth(
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      totp: null == totp
          ? _self.totp
          : totp // ignore: cast_nullable_to_non_nullable
              as bool,
      sid: null == sid
          ? _self.sid
          : sid // ignore: cast_nullable_to_non_nullable
              as String,
      csrf: null == csrf
          ? _self.csrf
          : csrf // ignore: cast_nullable_to_non_nullable
              as String,
      validity: null == validity
          ? _self.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
