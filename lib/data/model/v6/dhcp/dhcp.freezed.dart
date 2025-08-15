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
mixin _$Dhcp {

 List<DhcpData> get leases; double get took;
/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DhcpCopyWith<Dhcp> get copyWith => _$DhcpCopyWithImpl<Dhcp>(this as Dhcp, _$identity);

  /// Serializes this Dhcp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dhcp&&const DeepCollectionEquality().equals(other.leases, leases)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(leases),took);

@override
String toString() {
  return 'Dhcp(leases: $leases, took: $took)';
}


}

/// @nodoc
abstract mixin class $DhcpCopyWith<$Res>  {
  factory $DhcpCopyWith(Dhcp value, $Res Function(Dhcp) _then) = _$DhcpCopyWithImpl;
@useResult
$Res call({
 List<DhcpData> leases, double took
});




}
/// @nodoc
class _$DhcpCopyWithImpl<$Res>
    implements $DhcpCopyWith<$Res> {
  _$DhcpCopyWithImpl(this._self, this._then);

  final Dhcp _self;
  final $Res Function(Dhcp) _then;

/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leases = null,Object? took = null,}) {
  return _then(_self.copyWith(
leases: null == leases ? _self.leases : leases // ignore: cast_nullable_to_non_nullable
as List<DhcpData>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Dhcp].
extension DhcpPatterns on Dhcp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dhcp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dhcp value)  $default,){
final _that = this;
switch (_that) {
case _Dhcp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dhcp value)?  $default,){
final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DhcpData> leases,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
return $default(_that.leases,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DhcpData> leases,  double took)  $default,) {final _that = this;
switch (_that) {
case _Dhcp():
return $default(_that.leases,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DhcpData> leases,  double took)?  $default,) {final _that = this;
switch (_that) {
case _Dhcp() when $default != null:
return $default(_that.leases,_that.took);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Dhcp implements Dhcp {
  const _Dhcp({required final  List<DhcpData> leases, required this.took}): _leases = leases;
  factory _Dhcp.fromJson(Map<String, dynamic> json) => _$DhcpFromJson(json);

 final  List<DhcpData> _leases;
@override List<DhcpData> get leases {
  if (_leases is EqualUnmodifiableListView) return _leases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leases);
}

@override final  double took;

/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DhcpCopyWith<_Dhcp> get copyWith => __$DhcpCopyWithImpl<_Dhcp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DhcpToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dhcp&&const DeepCollectionEquality().equals(other._leases, _leases)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_leases),took);

@override
String toString() {
  return 'Dhcp(leases: $leases, took: $took)';
}


}

/// @nodoc
abstract mixin class _$DhcpCopyWith<$Res> implements $DhcpCopyWith<$Res> {
  factory _$DhcpCopyWith(_Dhcp value, $Res Function(_Dhcp) _then) = __$DhcpCopyWithImpl;
@override @useResult
$Res call({
 List<DhcpData> leases, double took
});




}
/// @nodoc
class __$DhcpCopyWithImpl<$Res>
    implements _$DhcpCopyWith<$Res> {
  __$DhcpCopyWithImpl(this._self, this._then);

  final _Dhcp _self;
  final $Res Function(_Dhcp) _then;

/// Create a copy of Dhcp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leases = null,Object? took = null,}) {
  return _then(_Dhcp(
leases: null == leases ? _self._leases : leases // ignore: cast_nullable_to_non_nullable
as List<DhcpData>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DhcpData {

 int get expires; String get name; String get hwaddr; String get ip; String get clientid;
/// Create a copy of DhcpData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DhcpDataCopyWith<DhcpData> get copyWith => _$DhcpDataCopyWithImpl<DhcpData>(this as DhcpData, _$identity);

  /// Serializes this DhcpData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DhcpData&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.name, name) || other.name == name)&&(identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.clientid, clientid) || other.clientid == clientid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expires,name,hwaddr,ip,clientid);

@override
String toString() {
  return 'DhcpData(expires: $expires, name: $name, hwaddr: $hwaddr, ip: $ip, clientid: $clientid)';
}


}

/// @nodoc
abstract mixin class $DhcpDataCopyWith<$Res>  {
  factory $DhcpDataCopyWith(DhcpData value, $Res Function(DhcpData) _then) = _$DhcpDataCopyWithImpl;
@useResult
$Res call({
 int expires, String name, String hwaddr, String ip, String clientid
});




}
/// @nodoc
class _$DhcpDataCopyWithImpl<$Res>
    implements $DhcpDataCopyWith<$Res> {
  _$DhcpDataCopyWithImpl(this._self, this._then);

  final DhcpData _self;
  final $Res Function(DhcpData) _then;

/// Create a copy of DhcpData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expires = null,Object? name = null,Object? hwaddr = null,Object? ip = null,Object? clientid = null,}) {
  return _then(_self.copyWith(
expires: null == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hwaddr: null == hwaddr ? _self.hwaddr : hwaddr // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,clientid: null == clientid ? _self.clientid : clientid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DhcpData].
extension DhcpDataPatterns on DhcpData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DhcpData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DhcpData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DhcpData value)  $default,){
final _that = this;
switch (_that) {
case _DhcpData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DhcpData value)?  $default,){
final _that = this;
switch (_that) {
case _DhcpData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int expires,  String name,  String hwaddr,  String ip,  String clientid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DhcpData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int expires,  String name,  String hwaddr,  String ip,  String clientid)  $default,) {final _that = this;
switch (_that) {
case _DhcpData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int expires,  String name,  String hwaddr,  String ip,  String clientid)?  $default,) {final _that = this;
switch (_that) {
case _DhcpData() when $default != null:
return $default(_that.expires,_that.name,_that.hwaddr,_that.ip,_that.clientid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DhcpData implements DhcpData {
  const _DhcpData({required this.expires, required this.name, required this.hwaddr, required this.ip, required this.clientid});
  factory _DhcpData.fromJson(Map<String, dynamic> json) => _$DhcpDataFromJson(json);

@override final  int expires;
@override final  String name;
@override final  String hwaddr;
@override final  String ip;
@override final  String clientid;

/// Create a copy of DhcpData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DhcpDataCopyWith<_DhcpData> get copyWith => __$DhcpDataCopyWithImpl<_DhcpData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DhcpDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DhcpData&&(identical(other.expires, expires) || other.expires == expires)&&(identical(other.name, name) || other.name == name)&&(identical(other.hwaddr, hwaddr) || other.hwaddr == hwaddr)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.clientid, clientid) || other.clientid == clientid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expires,name,hwaddr,ip,clientid);

@override
String toString() {
  return 'DhcpData(expires: $expires, name: $name, hwaddr: $hwaddr, ip: $ip, clientid: $clientid)';
}


}

/// @nodoc
abstract mixin class _$DhcpDataCopyWith<$Res> implements $DhcpDataCopyWith<$Res> {
  factory _$DhcpDataCopyWith(_DhcpData value, $Res Function(_DhcpData) _then) = __$DhcpDataCopyWithImpl;
@override @useResult
$Res call({
 int expires, String name, String hwaddr, String ip, String clientid
});




}
/// @nodoc
class __$DhcpDataCopyWithImpl<$Res>
    implements _$DhcpDataCopyWith<$Res> {
  __$DhcpDataCopyWithImpl(this._self, this._then);

  final _DhcpData _self;
  final $Res Function(_DhcpData) _then;

/// Create a copy of DhcpData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expires = null,Object? name = null,Object? hwaddr = null,Object? ip = null,Object? clientid = null,}) {
  return _then(_DhcpData(
expires: null == expires ? _self.expires : expires // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hwaddr: null == hwaddr ? _self.hwaddr : hwaddr // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,clientid: null == clientid ? _self.clientid : clientid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
