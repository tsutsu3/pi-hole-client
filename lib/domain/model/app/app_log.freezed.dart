// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLog {

 String get type; DateTime get dateTime; String get message; String? get statusCode; String? get resBody;
/// Create a copy of AppLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLogCopyWith<AppLog> get copyWith => _$AppLogCopyWithImpl<AppLog>(this as AppLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLog&&(identical(other.type, type) || other.type == type)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.resBody, resBody) || other.resBody == resBody));
}


@override
int get hashCode => Object.hash(runtimeType,type,dateTime,message,statusCode,resBody);

@override
String toString() {
  return 'AppLog(type: $type, dateTime: $dateTime, message: $message, statusCode: $statusCode, resBody: $resBody)';
}


}

/// @nodoc
abstract mixin class $AppLogCopyWith<$Res>  {
  factory $AppLogCopyWith(AppLog value, $Res Function(AppLog) _then) = _$AppLogCopyWithImpl;
@useResult
$Res call({
 String type, DateTime dateTime, String message, String? statusCode, String? resBody
});




}
/// @nodoc
class _$AppLogCopyWithImpl<$Res>
    implements $AppLogCopyWith<$Res> {
  _$AppLogCopyWithImpl(this._self, this._then);

  final AppLog _self;
  final $Res Function(AppLog) _then;

/// Create a copy of AppLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? dateTime = null,Object? message = null,Object? statusCode = freezed,Object? resBody = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,resBody: freezed == resBody ? _self.resBody : resBody // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppLog].
extension AppLogPatterns on AppLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppLog value)  $default,){
final _that = this;
switch (_that) {
case _AppLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppLog value)?  $default,){
final _that = this;
switch (_that) {
case _AppLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  DateTime dateTime,  String message,  String? statusCode,  String? resBody)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppLog() when $default != null:
return $default(_that.type,_that.dateTime,_that.message,_that.statusCode,_that.resBody);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  DateTime dateTime,  String message,  String? statusCode,  String? resBody)  $default,) {final _that = this;
switch (_that) {
case _AppLog():
return $default(_that.type,_that.dateTime,_that.message,_that.statusCode,_that.resBody);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  DateTime dateTime,  String message,  String? statusCode,  String? resBody)?  $default,) {final _that = this;
switch (_that) {
case _AppLog() when $default != null:
return $default(_that.type,_that.dateTime,_that.message,_that.statusCode,_that.resBody);case _:
  return null;

}
}

}

/// @nodoc


class _AppLog implements AppLog {
  const _AppLog({required this.type, required this.dateTime, required this.message, this.statusCode, this.resBody});
  

@override final  String type;
@override final  DateTime dateTime;
@override final  String message;
@override final  String? statusCode;
@override final  String? resBody;

/// Create a copy of AppLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLogCopyWith<_AppLog> get copyWith => __$AppLogCopyWithImpl<_AppLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLog&&(identical(other.type, type) || other.type == type)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.resBody, resBody) || other.resBody == resBody));
}


@override
int get hashCode => Object.hash(runtimeType,type,dateTime,message,statusCode,resBody);

@override
String toString() {
  return 'AppLog(type: $type, dateTime: $dateTime, message: $message, statusCode: $statusCode, resBody: $resBody)';
}


}

/// @nodoc
abstract mixin class _$AppLogCopyWith<$Res> implements $AppLogCopyWith<$Res> {
  factory _$AppLogCopyWith(_AppLog value, $Res Function(_AppLog) _then) = __$AppLogCopyWithImpl;
@override @useResult
$Res call({
 String type, DateTime dateTime, String message, String? statusCode, String? resBody
});




}
/// @nodoc
class __$AppLogCopyWithImpl<$Res>
    implements _$AppLogCopyWith<$Res> {
  __$AppLogCopyWithImpl(this._self, this._then);

  final _AppLog _self;
  final $Res Function(_AppLog) _then;

/// Create a copy of AppLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? dateTime = null,Object? message = null,Object? statusCode = freezed,Object? resBody = freezed,}) {
  return _then(_AppLog(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,resBody: freezed == resBody ? _self.resBody : resBody // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
