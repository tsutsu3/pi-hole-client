// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLog {

 String get type; DateTime get dateTime;/// A short summary, e.g. `Failed to connect`.
 String get message;/// The address of the server the log is about.
 String? get serverAddress;/// The error, e.g. the exception text.
 String? get details; String? get statusCode;
/// Create a copy of AppLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLogCopyWith<AppLog> get copyWith => _$AppLogCopyWithImpl<AppLog>(this as AppLog, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLog&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.dateTime, _this.dateTime) || other.dateTime == _this.dateTime)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.serverAddress, _this.serverAddress) || other.serverAddress == _this.serverAddress)&&(identical(other.details, _this.details) || other.details == _this.details)&&(identical(other.statusCode, _this.statusCode) || other.statusCode == _this.statusCode));
}


@override
int get hashCode {
  final _this = this as AppLog;
  return Object.hash(runtimeType,_this.type,_this.dateTime,_this.message,_this.serverAddress,_this.details,_this.statusCode);
}

@override
String toString() {
  final _this = this as AppLog;
  return 'AppLog(type: ${_this.type}, dateTime: ${_this.dateTime}, message: ${_this.message}, serverAddress: ${_this.serverAddress}, details: ${_this.details}, statusCode: ${_this.statusCode})';
}


}

/// @nodoc
abstract mixin class $AppLogCopyWith<$Res>  {
  factory $AppLogCopyWith(AppLog value, $Res Function(AppLog) _then) = _$AppLogCopyWithImpl;
@useResult
$Res call({
 String type, DateTime dateTime, String message, String? serverAddress, String? details, String? statusCode
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? dateTime = null,Object? message = null,Object? serverAddress = freezed,Object? details = freezed,Object? statusCode = freezed,}) {
  return _then(AppLog(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,serverAddress: freezed == serverAddress ? _self.serverAddress : serverAddress // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  DateTime dateTime,  String message,  String? serverAddress,  String? details,  String? statusCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppLog() when $default != null:
return $default(_that.type,_that.dateTime,_that.message,_that.serverAddress,_that.details,_that.statusCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  DateTime dateTime,  String message,  String? serverAddress,  String? details,  String? statusCode)  $default,) {final _that = this;
switch (_that) {
case _AppLog():
return $default(_that.type,_that.dateTime,_that.message,_that.serverAddress,_that.details,_that.statusCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  DateTime dateTime,  String message,  String? serverAddress,  String? details,  String? statusCode)?  $default,) {final _that = this;
switch (_that) {
case _AppLog() when $default != null:
return $default(_that.type,_that.dateTime,_that.message,_that.serverAddress,_that.details,_that.statusCode);case _:
  return null;

}
}

}

/// @nodoc


class _AppLog implements AppLog {
  const _AppLog({required this.type, required this.dateTime, required this.message, this.serverAddress, this.details, this.statusCode});
  

@override final  String type;
@override final  DateTime dateTime;
/// A short summary, e.g. `Failed to connect`.
@override final  String message;
/// The address of the server the log is about.
@override final  String? serverAddress;
/// The error, e.g. the exception text.
@override final  String? details;
@override final  String? statusCode;

/// Create a copy of AppLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLogCopyWith<_AppLog> get copyWith => __$AppLogCopyWithImpl<_AppLog>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLog&&(identical(other.type, type) || other.type == type)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.message, message) || other.message == message)&&(identical(other.serverAddress, serverAddress) || other.serverAddress == serverAddress)&&(identical(other.details, details) || other.details == details)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,dateTime,message,serverAddress,details,statusCode);
}

@override
String toString() {
    return 'AppLog(type: $type, dateTime: $dateTime, message: $message, serverAddress: $serverAddress, details: $details, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class _$AppLogCopyWith<$Res> implements $AppLogCopyWith<$Res> {
  factory _$AppLogCopyWith(_AppLog value, $Res Function(_AppLog) _then) = __$AppLogCopyWithImpl;
@override @useResult
$Res call({
 String type, DateTime dateTime, String message, String? serverAddress, String? details, String? statusCode
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? dateTime = null,Object? message = null,Object? serverAddress = freezed,Object? details = freezed,Object? statusCode = freezed,}) {
  return _then(_AppLog(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,serverAddress: freezed == serverAddress ? _self.serverAddress : serverAddress // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
