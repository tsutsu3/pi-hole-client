// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dhcp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DhcpLease {

 DateTime get expires; String get name; String get hwaddr; String get ip; String get clientid;
/// Create a copy of DhcpLease
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DhcpLeaseCopyWith<DhcpLease> get copyWith => _$DhcpLeaseCopyWithImpl<DhcpLease>(this as DhcpLease, _$identity);

  /// Serializes this DhcpLease to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DhcpLease&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.name, name) || other.name == name)&&(identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.clientid, clientid) || other.clientid == clientid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expires,name,hwaddr,ip,clientid);

@override
String toString() {
  return 'DhcpLease(expires: $expires, name: $name, hwaddr: $hwaddr, ip: $ip, clientid: $clientid)';
}


}

/// @nodoc
abstract mixin class $DhcpLeaseCopyWith<$Res>  {
  factory $DhcpLeaseCopyWith(DhcpLease value, $Res Function(DhcpLease) _then) = _$DhcpLeaseCopyWithImpl;
@useResult
$Res call({
 DateTime expires, String name, String hwaddr, String ip, String clientid
});




}
/// @nodoc
class _$DhcpLeaseCopyWithImpl<$Res>
    implements $DhcpLeaseCopyWith<$Res> {
  _$DhcpLeaseCopyWithImpl(this._self, this._then);

  final DhcpLease _self;
  final $Res Function(DhcpLease) _then;

/// Create a copy of DhcpLease
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expires = null,Object? name = null,Object? hwaddr = null,Object? ip = null,Object? clientid = null,}) {
  return _then(_self.copyWith(
expires: null == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hwaddr: null == hwaddr ? _self.hwaddr : hwaddr // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,clientid: null == clientid ? _self.clientid : clientid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DhcpLease].
extension DhcpLeasePatterns on DhcpLease {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DhcpLease value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DhcpLease() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DhcpLease value)  $default,){
final _that = this;
switch (_that) {
case _DhcpLease():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DhcpLease value)?  $default,){
final _that = this;
switch (_that) {
case _DhcpLease() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime expires,  String name,  String hwaddr,  String ip,  String clientid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DhcpLease() when $default != null:
return $default(_that.expires,_that.name,_that.hwaddr,_that.ip,_that.clientid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime expires,  String name,  String hwaddr,  String ip,  String clientid)  $default,) {final _that = this;
switch (_that) {
case _DhcpLease():
return $default(_that.expires,_that.name,_that.hwaddr,_that.ip,_that.clientid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime expires,  String name,  String hwaddr,  String ip,  String clientid)?  $default,) {final _that = this;
switch (_that) {
case _DhcpLease() when $default != null:
return $default(_that.expires,_that.name,_that.hwaddr,_that.ip,_that.clientid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DhcpLease implements DhcpLease {
  const _DhcpLease({required this.expires, required this.name, required this.hwaddr, required this.ip, required this.clientid});
  factory _DhcpLease.fromJson(Map<String, dynamic> json) => _$DhcpLeaseFromJson(json);

@override final  DateTime expires;
@override final  String name;
@override final  String hwaddr;
@override final  String ip;
@override final  String clientid;

/// Create a copy of DhcpLease
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DhcpLeaseCopyWith<_DhcpLease> get copyWith => __$DhcpLeaseCopyWithImpl<_DhcpLease>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DhcpLeaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DhcpLease&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.name, name) || other.name == name)&&(identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.clientid, clientid) || other.clientid == clientid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expires,name,hwaddr,ip,clientid);

@override
String toString() {
  return 'DhcpLease(expires: $expires, name: $name, hwaddr: $hwaddr, ip: $ip, clientid: $clientid)';
}


}

/// @nodoc
abstract mixin class _$DhcpLeaseCopyWith<$Res> implements $DhcpLeaseCopyWith<$Res> {
  factory _$DhcpLeaseCopyWith(_DhcpLease value, $Res Function(_DhcpLease) _then) = __$DhcpLeaseCopyWithImpl;
@override @useResult
$Res call({
 DateTime expires, String name, String hwaddr, String ip, String clientid
});




}
/// @nodoc
class __$DhcpLeaseCopyWithImpl<$Res>
    implements _$DhcpLeaseCopyWith<$Res> {
  __$DhcpLeaseCopyWithImpl(this._self, this._then);

  final _DhcpLease _self;
  final $Res Function(_DhcpLease) _then;

/// Create a copy of DhcpLease
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expires = null,Object? name = null,Object? hwaddr = null,Object? ip = null,Object? clientid = null,}) {
  return _then(_DhcpLease(
expires: null == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hwaddr: null == hwaddr ? _self.hwaddr : hwaddr // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,clientid: null == clientid ? _self.clientid : clientid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
