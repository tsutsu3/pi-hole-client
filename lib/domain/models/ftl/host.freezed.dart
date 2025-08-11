// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoHost {

 String get domainName; String get arch; String get hostName; String get release; String get sysName; String get version; String? get model;
/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoHostCopyWith<InfoHost> get copyWith => _$InfoHostCopyWithImpl<InfoHost>(this as InfoHost, _$identity);

  /// Serializes this InfoHost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoHost&&(identical(other.domainName, domainName) || other.domainName == domainName)&&(identical(other.arch, arch) || other.arch == arch)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.release, release) || other.release == release)&&(identical(other.sysName, sysName) || other.sysName == sysName)&&(identical(other.version, version) || other.version == version)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domainName,arch,hostName,release,sysName,version,model);

@override
String toString() {
  return 'InfoHost(domainName: $domainName, arch: $arch, hostName: $hostName, release: $release, sysName: $sysName, version: $version, model: $model)';
}


}

/// @nodoc
abstract mixin class $InfoHostCopyWith<$Res>  {
  factory $InfoHostCopyWith(InfoHost value, $Res Function(InfoHost) _then) = _$InfoHostCopyWithImpl;
@useResult
$Res call({
 String domainName, String arch, String hostName, String release, String sysName, String version, String? model
});




}
/// @nodoc
class _$InfoHostCopyWithImpl<$Res>
    implements $InfoHostCopyWith<$Res> {
  _$InfoHostCopyWithImpl(this._self, this._then);

  final InfoHost _self;
  final $Res Function(InfoHost) _then;

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainName = null,Object? arch = null,Object? hostName = null,Object? release = null,Object? sysName = null,Object? version = null,Object? model = freezed,}) {
  return _then(_self.copyWith(
domainName: null == domainName ? _self.domainName : domainName // ignore: cast_nullable_to_non_nullable
as String,arch: null == arch ? _self.arch : arch // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as String,sysName: null == sysName ? _self.sysName : sysName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InfoHost].
extension InfoHostPatterns on InfoHost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoHost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoHost value)  $default,){
final _that = this;
switch (_that) {
case _InfoHost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoHost value)?  $default,){
final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domainName,  String arch,  String hostName,  String release,  String sysName,  String version,  String? model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
return $default(_that.domainName,_that.arch,_that.hostName,_that.release,_that.sysName,_that.version,_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domainName,  String arch,  String hostName,  String release,  String sysName,  String version,  String? model)  $default,) {final _that = this;
switch (_that) {
case _InfoHost():
return $default(_that.domainName,_that.arch,_that.hostName,_that.release,_that.sysName,_that.version,_that.model);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domainName,  String arch,  String hostName,  String release,  String sysName,  String version,  String? model)?  $default,) {final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
return $default(_that.domainName,_that.arch,_that.hostName,_that.release,_that.sysName,_that.version,_that.model);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoHost implements InfoHost {
  const _InfoHost({required this.domainName, required this.arch, required this.hostName, required this.release, required this.sysName, required this.version, this.model});
  factory _InfoHost.fromJson(Map<String, dynamic> json) => _$InfoHostFromJson(json);

@override final  String domainName;
@override final  String arch;
@override final  String hostName;
@override final  String release;
@override final  String sysName;
@override final  String version;
@override final  String? model;

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoHostCopyWith<_InfoHost> get copyWith => __$InfoHostCopyWithImpl<_InfoHost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoHostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoHost&&(identical(other.domainName, domainName) || other.domainName == domainName)&&(identical(other.arch, arch) || other.arch == arch)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.release, release) || other.release == release)&&(identical(other.sysName, sysName) || other.sysName == sysName)&&(identical(other.version, version) || other.version == version)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domainName,arch,hostName,release,sysName,version,model);

@override
String toString() {
  return 'InfoHost(domainName: $domainName, arch: $arch, hostName: $hostName, release: $release, sysName: $sysName, version: $version, model: $model)';
}


}

/// @nodoc
abstract mixin class _$InfoHostCopyWith<$Res> implements $InfoHostCopyWith<$Res> {
  factory _$InfoHostCopyWith(_InfoHost value, $Res Function(_InfoHost) _then) = __$InfoHostCopyWithImpl;
@override @useResult
$Res call({
 String domainName, String arch, String hostName, String release, String sysName, String version, String? model
});




}
/// @nodoc
class __$InfoHostCopyWithImpl<$Res>
    implements _$InfoHostCopyWith<$Res> {
  __$InfoHostCopyWithImpl(this._self, this._then);

  final _InfoHost _self;
  final $Res Function(_InfoHost) _then;

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainName = null,Object? arch = null,Object? hostName = null,Object? release = null,Object? sysName = null,Object? version = null,Object? model = freezed,}) {
  return _then(_InfoHost(
domainName: null == domainName ? _self.domainName : domainName // ignore: cast_nullable_to_non_nullable
as String,arch: null == arch ? _self.arch : arch // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as String,sysName: null == sysName ? _self.sysName : sysName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
