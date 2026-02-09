// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtlMessage {

 int get id; DateTime get timestamp; String get message; String get url;
/// Create a copy of FtlMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlMessageCopyWith<FtlMessage> get copyWith => _$FtlMessageCopyWithImpl<FtlMessage>(this as FtlMessage, _$identity);

  /// Serializes this FtlMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.message, message) || other.message == message)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,message,url);

@override
String toString() {
  return 'FtlMessage(id: $id, timestamp: $timestamp, message: $message, url: $url)';
}


}

/// @nodoc
abstract mixin class $FtlMessageCopyWith<$Res>  {
  factory $FtlMessageCopyWith(FtlMessage value, $Res Function(FtlMessage) _then) = _$FtlMessageCopyWithImpl;
@useResult
$Res call({
 int id, DateTime timestamp, String message, String url
});




}
/// @nodoc
class _$FtlMessageCopyWithImpl<$Res>
    implements $FtlMessageCopyWith<$Res> {
  _$FtlMessageCopyWithImpl(this._self, this._then);

  final FtlMessage _self;
  final $Res Function(FtlMessage) _then;

/// Create a copy of FtlMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timestamp = null,Object? message = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FtlMessage].
extension FtlMessagePatterns on FtlMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlMessage value)  $default,){
final _that = this;
switch (_that) {
case _FtlMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlMessage value)?  $default,){
final _that = this;
switch (_that) {
case _FtlMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime timestamp,  String message,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlMessage() when $default != null:
return $default(_that.id,_that.timestamp,_that.message,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime timestamp,  String message,  String url)  $default,) {final _that = this;
switch (_that) {
case _FtlMessage():
return $default(_that.id,_that.timestamp,_that.message,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime timestamp,  String message,  String url)?  $default,) {final _that = this;
switch (_that) {
case _FtlMessage() when $default != null:
return $default(_that.id,_that.timestamp,_that.message,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtlMessage implements FtlMessage {
  const _FtlMessage({required this.id, required this.timestamp, required this.message, required this.url});
  factory _FtlMessage.fromJson(Map<String, dynamic> json) => _$FtlMessageFromJson(json);

@override final  int id;
@override final  DateTime timestamp;
@override final  String message;
@override final  String url;

/// Create a copy of FtlMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlMessageCopyWith<_FtlMessage> get copyWith => __$FtlMessageCopyWithImpl<_FtlMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.message, message) || other.message == message)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,message,url);

@override
String toString() {
  return 'FtlMessage(id: $id, timestamp: $timestamp, message: $message, url: $url)';
}


}

/// @nodoc
abstract mixin class _$FtlMessageCopyWith<$Res> implements $FtlMessageCopyWith<$Res> {
  factory _$FtlMessageCopyWith(_FtlMessage value, $Res Function(_FtlMessage) _then) = __$FtlMessageCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime timestamp, String message, String url
});




}
/// @nodoc
class __$FtlMessageCopyWithImpl<$Res>
    implements _$FtlMessageCopyWith<$Res> {
  __$FtlMessageCopyWithImpl(this._self, this._then);

  final _FtlMessage _self;
  final $Res Function(_FtlMessage) _then;

/// Create a copy of FtlMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? message = null,Object? url = null,}) {
  return _then(_FtlMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
