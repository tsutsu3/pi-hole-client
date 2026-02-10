// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtlClient {

 String get addr;
/// Create a copy of FtlClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlClientCopyWith<FtlClient> get copyWith => _$FtlClientCopyWithImpl<FtlClient>(this as FtlClient, _$identity);

  /// Serializes this FtlClient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlClient&&(identical(other.addr, addr) || other.addr == addr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addr);

@override
String toString() {
  return 'FtlClient(addr: $addr)';
}


}

/// @nodoc
abstract mixin class $FtlClientCopyWith<$Res>  {
  factory $FtlClientCopyWith(FtlClient value, $Res Function(FtlClient) _then) = _$FtlClientCopyWithImpl;
@useResult
$Res call({
 String addr
});




}
/// @nodoc
class _$FtlClientCopyWithImpl<$Res>
    implements $FtlClientCopyWith<$Res> {
  _$FtlClientCopyWithImpl(this._self, this._then);

  final FtlClient _self;
  final $Res Function(FtlClient) _then;

/// Create a copy of FtlClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addr = null,}) {
  return _then(_self.copyWith(
addr: null == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FtlClient].
extension FtlClientPatterns on FtlClient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlClient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlClient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlClient value)  $default,){
final _that = this;
switch (_that) {
case _FtlClient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlClient value)?  $default,){
final _that = this;
switch (_that) {
case _FtlClient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String addr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlClient() when $default != null:
return $default(_that.addr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String addr)  $default,) {final _that = this;
switch (_that) {
case _FtlClient():
return $default(_that.addr);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String addr)?  $default,) {final _that = this;
switch (_that) {
case _FtlClient() when $default != null:
return $default(_that.addr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtlClient implements FtlClient {
  const _FtlClient({required this.addr});
  factory _FtlClient.fromJson(Map<String, dynamic> json) => _$FtlClientFromJson(json);

@override final  String addr;

/// Create a copy of FtlClient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlClientCopyWith<_FtlClient> get copyWith => __$FtlClientCopyWithImpl<_FtlClient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlClientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlClient&&(identical(other.addr, addr) || other.addr == addr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addr);

@override
String toString() {
  return 'FtlClient(addr: $addr)';
}


}

/// @nodoc
abstract mixin class _$FtlClientCopyWith<$Res> implements $FtlClientCopyWith<$Res> {
  factory _$FtlClientCopyWith(_FtlClient value, $Res Function(_FtlClient) _then) = __$FtlClientCopyWithImpl;
@override @useResult
$Res call({
 String addr
});




}
/// @nodoc
class __$FtlClientCopyWithImpl<$Res>
    implements _$FtlClientCopyWith<$Res> {
  __$FtlClientCopyWithImpl(this._self, this._then);

  final _FtlClient _self;
  final $Res Function(_FtlClient) _then;

/// Create a copy of FtlClient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addr = null,}) {
  return _then(_FtlClient(
addr: null == addr ? _self.addr : addr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
