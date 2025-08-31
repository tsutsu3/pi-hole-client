// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_dns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalDns {

 String get ip; String get name;
/// Create a copy of LocalDns
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalDnsCopyWith<LocalDns> get copyWith => _$LocalDnsCopyWithImpl<LocalDns>(this as LocalDns, _$identity);

  /// Serializes this LocalDns to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalDns&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,name);

@override
String toString() {
  return 'LocalDns(ip: $ip, name: $name)';
}


}

/// @nodoc
abstract mixin class $LocalDnsCopyWith<$Res>  {
  factory $LocalDnsCopyWith(LocalDns value, $Res Function(LocalDns) _then) = _$LocalDnsCopyWithImpl;
@useResult
$Res call({
 String ip, String name
});




}
/// @nodoc
class _$LocalDnsCopyWithImpl<$Res>
    implements $LocalDnsCopyWith<$Res> {
  _$LocalDnsCopyWithImpl(this._self, this._then);

  final LocalDns _self;
  final $Res Function(LocalDns) _then;

/// Create a copy of LocalDns
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ip = null,Object? name = null,}) {
  return _then(_self.copyWith(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalDns].
extension LocalDnsPatterns on LocalDns {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalDns value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalDns() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalDns value)  $default,){
final _that = this;
switch (_that) {
case _LocalDns():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalDns value)?  $default,){
final _that = this;
switch (_that) {
case _LocalDns() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ip,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalDns() when $default != null:
return $default(_that.ip,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ip,  String name)  $default,) {final _that = this;
switch (_that) {
case _LocalDns():
return $default(_that.ip,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ip,  String name)?  $default,) {final _that = this;
switch (_that) {
case _LocalDns() when $default != null:
return $default(_that.ip,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalDns implements LocalDns {
  const _LocalDns({required this.ip, required this.name});
  factory _LocalDns.fromJson(Map<String, dynamic> json) => _$LocalDnsFromJson(json);

@override final  String ip;
@override final  String name;

/// Create a copy of LocalDns
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalDnsCopyWith<_LocalDns> get copyWith => __$LocalDnsCopyWithImpl<_LocalDns>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalDnsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalDns&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,name);

@override
String toString() {
  return 'LocalDns(ip: $ip, name: $name)';
}


}

/// @nodoc
abstract mixin class _$LocalDnsCopyWith<$Res> implements $LocalDnsCopyWith<$Res> {
  factory _$LocalDnsCopyWith(_LocalDns value, $Res Function(_LocalDns) _then) = __$LocalDnsCopyWithImpl;
@override @useResult
$Res call({
 String ip, String name
});




}
/// @nodoc
class __$LocalDnsCopyWithImpl<$Res>
    implements _$LocalDnsCopyWith<$Res> {
  __$LocalDnsCopyWithImpl(this._self, this._then);

  final _LocalDns _self;
  final $Res Function(_LocalDns) _then;

/// Create a copy of LocalDns
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? name = null,}) {
  return _then(_LocalDns(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
