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
mixin _$Password {

 String get password;
/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordCopyWith<Password> get copyWith => _$PasswordCopyWithImpl<Password>(this as Password, _$identity);

  /// Serializes this Password to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Password&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'Password(password: $password)';
}


}

/// @nodoc
abstract mixin class $PasswordCopyWith<$Res>  {
  factory $PasswordCopyWith(Password value, $Res Function(Password) _then) = _$PasswordCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$PasswordCopyWithImpl<$Res>
    implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._self, this._then);

  final Password _self;
  final $Res Function(Password) _then;

/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = null,}) {
  return _then(_self.copyWith(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Password].
extension PasswordPatterns on Password {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Password value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Password value)  $default,){
final _that = this;
switch (_that) {
case _Password():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Password value)?  $default,){
final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String password)  $default,) {final _that = this;
switch (_that) {
case _Password():
return $default(_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String password)?  $default,) {final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Password implements Password {
   _Password({required this.password});
  factory _Password.fromJson(Map<String, dynamic> json) => _$PasswordFromJson(json);

@override final  String password;

/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordCopyWith<_Password> get copyWith => __$PasswordCopyWithImpl<_Password>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Password&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'Password(password: $password)';
}


}

/// @nodoc
abstract mixin class _$PasswordCopyWith<$Res> implements $PasswordCopyWith<$Res> {
  factory _$PasswordCopyWith(_Password value, $Res Function(_Password) _then) = __$PasswordCopyWithImpl;
@override @useResult
$Res call({
 String password
});




}
/// @nodoc
class __$PasswordCopyWithImpl<$Res>
    implements _$PasswordCopyWith<$Res> {
  __$PasswordCopyWithImpl(this._self, this._then);

  final _Password _self;
  final $Res Function(_Password) _then;

/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_Password(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Session {

 SessionDetail get session; double get took;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.session, session) || other.session == session)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,took);

@override
String toString() {
  return 'Session(session: $session, took: $took)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 SessionDetail session, double took
});


$SessionDetailCopyWith<$Res> get session;

}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? took = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionDetail,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDetailCopyWith<$Res> get session {
  
  return $SessionDetailCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionDetail session,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.session,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionDetail session,  double took)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.session,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionDetail session,  double took)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.session,_that.took);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Session implements Session {
   _Session({required this.session, required this.took});
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  SessionDetail session;
@override final  double took;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.session, session) || other.session == session)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,took);

@override
String toString() {
  return 'Session(session: $session, took: $took)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 SessionDetail session, double took
});


@override $SessionDetailCopyWith<$Res> get session;

}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? took = null,}) {
  return _then(_Session(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionDetail,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDetailCopyWith<$Res> get session {
  
  return $SessionDetailCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// @nodoc
mixin _$SessionDetail {

 bool get valid; bool get totp; String get sid; String get csrf; int get validity; String get message;
/// Create a copy of SessionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDetailCopyWith<SessionDetail> get copyWith => _$SessionDetailCopyWithImpl<SessionDetail>(this as SessionDetail, _$identity);

  /// Serializes this SessionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDetail&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.totp, totp) || other.totp == totp)&&(identical(other.sid, sid) || other.sid == sid)&&(identical(other.csrf, csrf) || other.csrf == csrf)&&(identical(other.validity, validity) || other.validity == validity)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,totp,sid,csrf,validity,message);

@override
String toString() {
  return 'SessionDetail(valid: $valid, totp: $totp, sid: $sid, csrf: $csrf, validity: $validity, message: $message)';
}


}

/// @nodoc
abstract mixin class $SessionDetailCopyWith<$Res>  {
  factory $SessionDetailCopyWith(SessionDetail value, $Res Function(SessionDetail) _then) = _$SessionDetailCopyWithImpl;
@useResult
$Res call({
 bool valid, bool totp, String sid, String csrf, int validity, String message
});




}
/// @nodoc
class _$SessionDetailCopyWithImpl<$Res>
    implements $SessionDetailCopyWith<$Res> {
  _$SessionDetailCopyWithImpl(this._self, this._then);

  final SessionDetail _self;
  final $Res Function(SessionDetail) _then;

/// Create a copy of SessionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? totp = null,Object? sid = null,Object? csrf = null,Object? validity = null,Object? message = null,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,totp: null == totp ? _self.totp : totp // ignore: cast_nullable_to_non_nullable
as bool,sid: null == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as String,csrf: null == csrf ? _self.csrf : csrf // ignore: cast_nullable_to_non_nullable
as String,validity: null == validity ? _self.validity : validity // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionDetail].
extension SessionDetailPatterns on SessionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDetail() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDetail value)  $default,){
final _that = this;
switch (_that) {
case _SessionDetail():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDetail() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid,  bool totp,  String sid,  String csrf,  int validity,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDetail() when $default != null:
return $default(_that.valid,_that.totp,_that.sid,_that.csrf,_that.validity,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid,  bool totp,  String sid,  String csrf,  int validity,  String message)  $default,) {final _that = this;
switch (_that) {
case _SessionDetail():
return $default(_that.valid,_that.totp,_that.sid,_that.csrf,_that.validity,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid,  bool totp,  String sid,  String csrf,  int validity,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SessionDetail() when $default != null:
return $default(_that.valid,_that.totp,_that.sid,_that.csrf,_that.validity,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionDetail implements SessionDetail {
   _SessionDetail({required this.valid, required this.totp, required this.sid, required this.csrf, required this.validity, required this.message});
  factory _SessionDetail.fromJson(Map<String, dynamic> json) => _$SessionDetailFromJson(json);

@override final  bool valid;
@override final  bool totp;
@override final  String sid;
@override final  String csrf;
@override final  int validity;
@override final  String message;

/// Create a copy of SessionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDetailCopyWith<_SessionDetail> get copyWith => __$SessionDetailCopyWithImpl<_SessionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDetail&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.totp, totp) || other.totp == totp)&&(identical(other.sid, sid) || other.sid == sid)&&(identical(other.csrf, csrf) || other.csrf == csrf)&&(identical(other.validity, validity) || other.validity == validity)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,totp,sid,csrf,validity,message);

@override
String toString() {
  return 'SessionDetail(valid: $valid, totp: $totp, sid: $sid, csrf: $csrf, validity: $validity, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SessionDetailCopyWith<$Res> implements $SessionDetailCopyWith<$Res> {
  factory _$SessionDetailCopyWith(_SessionDetail value, $Res Function(_SessionDetail) _then) = __$SessionDetailCopyWithImpl;
@override @useResult
$Res call({
 bool valid, bool totp, String sid, String csrf, int validity, String message
});




}
/// @nodoc
class __$SessionDetailCopyWithImpl<$Res>
    implements _$SessionDetailCopyWith<$Res> {
  __$SessionDetailCopyWithImpl(this._self, this._then);

  final _SessionDetail _self;
  final $Res Function(_SessionDetail) _then;

/// Create a copy of SessionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? totp = null,Object? sid = null,Object? csrf = null,Object? validity = null,Object? message = null,}) {
  return _then(_SessionDetail(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,totp: null == totp ? _self.totp : totp // ignore: cast_nullable_to_non_nullable
as bool,sid: null == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as String,csrf: null == csrf ? _self.csrf : csrf // ignore: cast_nullable_to_non_nullable
as String,validity: null == validity ? _self.validity : validity // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
