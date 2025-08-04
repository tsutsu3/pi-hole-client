// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoVersion {

 ComponentVersion get core; ComponentVersion get web; ComponentVersion get ftl; ComponentVersion get docker;
/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoVersionCopyWith<InfoVersion> get copyWith => _$InfoVersionCopyWithImpl<InfoVersion>(this as InfoVersion, _$identity);

  /// Serializes this InfoVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoVersion&&(identical(other.core, core) || other.core == core)&&(identical(other.web, web) || other.web == web)&&(identical(other.ftl, ftl) || other.ftl == ftl)&&(identical(other.docker, docker) || other.docker == docker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,core,web,ftl,docker);

@override
String toString() {
  return 'InfoVersion(core: $core, web: $web, ftl: $ftl, docker: $docker)';
}


}

/// @nodoc
abstract mixin class $InfoVersionCopyWith<$Res>  {
  factory $InfoVersionCopyWith(InfoVersion value, $Res Function(InfoVersion) _then) = _$InfoVersionCopyWithImpl;
@useResult
$Res call({
 ComponentVersion core, ComponentVersion web, ComponentVersion ftl, ComponentVersion docker
});


$ComponentVersionCopyWith<$Res> get core;$ComponentVersionCopyWith<$Res> get web;$ComponentVersionCopyWith<$Res> get ftl;$ComponentVersionCopyWith<$Res> get docker;

}
/// @nodoc
class _$InfoVersionCopyWithImpl<$Res>
    implements $InfoVersionCopyWith<$Res> {
  _$InfoVersionCopyWithImpl(this._self, this._then);

  final InfoVersion _self;
  final $Res Function(InfoVersion) _then;

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? core = null,Object? web = null,Object? ftl = null,Object? docker = null,}) {
  return _then(_self.copyWith(
core: null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as ComponentVersion,web: null == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as ComponentVersion,ftl: null == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as ComponentVersion,docker: null == docker ? _self.docker : docker // ignore: cast_nullable_to_non_nullable
as ComponentVersion,
  ));
}
/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get core {
  
  return $ComponentVersionCopyWith<$Res>(_self.core, (value) {
    return _then(_self.copyWith(core: value));
  });
}/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get web {
  
  return $ComponentVersionCopyWith<$Res>(_self.web, (value) {
    return _then(_self.copyWith(web: value));
  });
}/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get ftl {
  
  return $ComponentVersionCopyWith<$Res>(_self.ftl, (value) {
    return _then(_self.copyWith(ftl: value));
  });
}/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get docker {
  
  return $ComponentVersionCopyWith<$Res>(_self.docker, (value) {
    return _then(_self.copyWith(docker: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoVersion].
extension InfoVersionPatterns on InfoVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoVersion value)  $default,){
final _that = this;
switch (_that) {
case _InfoVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoVersion value)?  $default,){
final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ComponentVersion core,  ComponentVersion web,  ComponentVersion ftl,  ComponentVersion docker)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
return $default(_that.core,_that.web,_that.ftl,_that.docker);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ComponentVersion core,  ComponentVersion web,  ComponentVersion ftl,  ComponentVersion docker)  $default,) {final _that = this;
switch (_that) {
case _InfoVersion():
return $default(_that.core,_that.web,_that.ftl,_that.docker);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ComponentVersion core,  ComponentVersion web,  ComponentVersion ftl,  ComponentVersion docker)?  $default,) {final _that = this;
switch (_that) {
case _InfoVersion() when $default != null:
return $default(_that.core,_that.web,_that.ftl,_that.docker);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoVersion implements InfoVersion {
  const _InfoVersion({required this.core, required this.web, required this.ftl, required this.docker});
  factory _InfoVersion.fromJson(Map<String, dynamic> json) => _$InfoVersionFromJson(json);

@override final  ComponentVersion core;
@override final  ComponentVersion web;
@override final  ComponentVersion ftl;
@override final  ComponentVersion docker;

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoVersionCopyWith<_InfoVersion> get copyWith => __$InfoVersionCopyWithImpl<_InfoVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoVersion&&(identical(other.core, core) || other.core == core)&&(identical(other.web, web) || other.web == web)&&(identical(other.ftl, ftl) || other.ftl == ftl)&&(identical(other.docker, docker) || other.docker == docker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,core,web,ftl,docker);

@override
String toString() {
  return 'InfoVersion(core: $core, web: $web, ftl: $ftl, docker: $docker)';
}


}

/// @nodoc
abstract mixin class _$InfoVersionCopyWith<$Res> implements $InfoVersionCopyWith<$Res> {
  factory _$InfoVersionCopyWith(_InfoVersion value, $Res Function(_InfoVersion) _then) = __$InfoVersionCopyWithImpl;
@override @useResult
$Res call({
 ComponentVersion core, ComponentVersion web, ComponentVersion ftl, ComponentVersion docker
});


@override $ComponentVersionCopyWith<$Res> get core;@override $ComponentVersionCopyWith<$Res> get web;@override $ComponentVersionCopyWith<$Res> get ftl;@override $ComponentVersionCopyWith<$Res> get docker;

}
/// @nodoc
class __$InfoVersionCopyWithImpl<$Res>
    implements _$InfoVersionCopyWith<$Res> {
  __$InfoVersionCopyWithImpl(this._self, this._then);

  final _InfoVersion _self;
  final $Res Function(_InfoVersion) _then;

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? core = null,Object? web = null,Object? ftl = null,Object? docker = null,}) {
  return _then(_InfoVersion(
core: null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as ComponentVersion,web: null == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as ComponentVersion,ftl: null == ftl ? _self.ftl : ftl // ignore: cast_nullable_to_non_nullable
as ComponentVersion,docker: null == docker ? _self.docker : docker // ignore: cast_nullable_to_non_nullable
as ComponentVersion,
  ));
}

/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get core {
  
  return $ComponentVersionCopyWith<$Res>(_self.core, (value) {
    return _then(_self.copyWith(core: value));
  });
}/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get web {
  
  return $ComponentVersionCopyWith<$Res>(_self.web, (value) {
    return _then(_self.copyWith(web: value));
  });
}/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get ftl {
  
  return $ComponentVersionCopyWith<$Res>(_self.ftl, (value) {
    return _then(_self.copyWith(ftl: value));
  });
}/// Create a copy of InfoVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<$Res> get docker {
  
  return $ComponentVersionCopyWith<$Res>(_self.docker, (value) {
    return _then(_self.copyWith(docker: value));
  });
}
}


/// @nodoc
mixin _$ComponentVersion {

 VersionDetail get local; VersionDetail get remote; bool? get canUpdate;
/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComponentVersionCopyWith<ComponentVersion> get copyWith => _$ComponentVersionCopyWithImpl<ComponentVersion>(this as ComponentVersion, _$identity);

  /// Serializes this ComponentVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComponentVersion&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.canUpdate, canUpdate) || other.canUpdate == canUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote,canUpdate);

@override
String toString() {
  return 'ComponentVersion(local: $local, remote: $remote, canUpdate: $canUpdate)';
}


}

/// @nodoc
abstract mixin class $ComponentVersionCopyWith<$Res>  {
  factory $ComponentVersionCopyWith(ComponentVersion value, $Res Function(ComponentVersion) _then) = _$ComponentVersionCopyWithImpl;
@useResult
$Res call({
 VersionDetail local, VersionDetail remote, bool? canUpdate
});


$VersionDetailCopyWith<$Res> get local;$VersionDetailCopyWith<$Res> get remote;

}
/// @nodoc
class _$ComponentVersionCopyWithImpl<$Res>
    implements $ComponentVersionCopyWith<$Res> {
  _$ComponentVersionCopyWithImpl(this._self, this._then);

  final ComponentVersion _self;
  final $Res Function(ComponentVersion) _then;

/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? local = null,Object? remote = null,Object? canUpdate = freezed,}) {
  return _then(_self.copyWith(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as VersionDetail,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as VersionDetail,canUpdate: freezed == canUpdate ? _self.canUpdate : canUpdate // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDetailCopyWith<$Res> get local {
  
  return $VersionDetailCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDetailCopyWith<$Res> get remote {
  
  return $VersionDetailCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComponentVersion].
extension ComponentVersionPatterns on ComponentVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComponentVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComponentVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComponentVersion value)  $default,){
final _that = this;
switch (_that) {
case _ComponentVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComponentVersion value)?  $default,){
final _that = this;
switch (_that) {
case _ComponentVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VersionDetail local,  VersionDetail remote,  bool? canUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComponentVersion() when $default != null:
return $default(_that.local,_that.remote,_that.canUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VersionDetail local,  VersionDetail remote,  bool? canUpdate)  $default,) {final _that = this;
switch (_that) {
case _ComponentVersion():
return $default(_that.local,_that.remote,_that.canUpdate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VersionDetail local,  VersionDetail remote,  bool? canUpdate)?  $default,) {final _that = this;
switch (_that) {
case _ComponentVersion() when $default != null:
return $default(_that.local,_that.remote,_that.canUpdate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ComponentVersion implements ComponentVersion {
  const _ComponentVersion({required this.local, required this.remote, this.canUpdate});
  factory _ComponentVersion.fromJson(Map<String, dynamic> json) => _$ComponentVersionFromJson(json);

@override final  VersionDetail local;
@override final  VersionDetail remote;
@override final  bool? canUpdate;

/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComponentVersionCopyWith<_ComponentVersion> get copyWith => __$ComponentVersionCopyWithImpl<_ComponentVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComponentVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComponentVersion&&(identical(other.local, local) || other.local == local)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.canUpdate, canUpdate) || other.canUpdate == canUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,local,remote,canUpdate);

@override
String toString() {
  return 'ComponentVersion(local: $local, remote: $remote, canUpdate: $canUpdate)';
}


}

/// @nodoc
abstract mixin class _$ComponentVersionCopyWith<$Res> implements $ComponentVersionCopyWith<$Res> {
  factory _$ComponentVersionCopyWith(_ComponentVersion value, $Res Function(_ComponentVersion) _then) = __$ComponentVersionCopyWithImpl;
@override @useResult
$Res call({
 VersionDetail local, VersionDetail remote, bool? canUpdate
});


@override $VersionDetailCopyWith<$Res> get local;@override $VersionDetailCopyWith<$Res> get remote;

}
/// @nodoc
class __$ComponentVersionCopyWithImpl<$Res>
    implements _$ComponentVersionCopyWith<$Res> {
  __$ComponentVersionCopyWithImpl(this._self, this._then);

  final _ComponentVersion _self;
  final $Res Function(_ComponentVersion) _then;

/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? local = null,Object? remote = null,Object? canUpdate = freezed,}) {
  return _then(_ComponentVersion(
local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as VersionDetail,remote: null == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as VersionDetail,canUpdate: freezed == canUpdate ? _self.canUpdate : canUpdate // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDetailCopyWith<$Res> get local {
  
  return $VersionDetailCopyWith<$Res>(_self.local, (value) {
    return _then(_self.copyWith(local: value));
  });
}/// Create a copy of ComponentVersion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionDetailCopyWith<$Res> get remote {
  
  return $VersionDetailCopyWith<$Res>(_self.remote, (value) {
    return _then(_self.copyWith(remote: value));
  });
}
}


/// @nodoc
mixin _$VersionDetail {

 String get version; String? get branch; String? get hash; String? get date;
/// Create a copy of VersionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionDetailCopyWith<VersionDetail> get copyWith => _$VersionDetailCopyWithImpl<VersionDetail>(this as VersionDetail, _$identity);

  /// Serializes this VersionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionDetail&&(identical(other.version, version) || other.version == version)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,branch,hash,date);

@override
String toString() {
  return 'VersionDetail(version: $version, branch: $branch, hash: $hash, date: $date)';
}


}

/// @nodoc
abstract mixin class $VersionDetailCopyWith<$Res>  {
  factory $VersionDetailCopyWith(VersionDetail value, $Res Function(VersionDetail) _then) = _$VersionDetailCopyWithImpl;
@useResult
$Res call({
 String version, String? branch, String? hash, String? date
});




}
/// @nodoc
class _$VersionDetailCopyWithImpl<$Res>
    implements $VersionDetailCopyWith<$Res> {
  _$VersionDetailCopyWithImpl(this._self, this._then);

  final VersionDetail _self;
  final $Res Function(VersionDetail) _then;

/// Create a copy of VersionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? branch = freezed,Object? hash = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VersionDetail].
extension VersionDetailPatterns on VersionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersionDetail value)  $default,){
final _that = this;
switch (_that) {
case _VersionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _VersionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  String? branch,  String? hash,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VersionDetail() when $default != null:
return $default(_that.version,_that.branch,_that.hash,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  String? branch,  String? hash,  String? date)  $default,) {final _that = this;
switch (_that) {
case _VersionDetail():
return $default(_that.version,_that.branch,_that.hash,_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  String? branch,  String? hash,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _VersionDetail() when $default != null:
return $default(_that.version,_that.branch,_that.hash,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VersionDetail implements VersionDetail {
  const _VersionDetail({required this.version, this.branch, this.hash, this.date});
  factory _VersionDetail.fromJson(Map<String, dynamic> json) => _$VersionDetailFromJson(json);

@override final  String version;
@override final  String? branch;
@override final  String? hash;
@override final  String? date;

/// Create a copy of VersionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionDetailCopyWith<_VersionDetail> get copyWith => __$VersionDetailCopyWithImpl<_VersionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionDetail&&(identical(other.version, version) || other.version == version)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,branch,hash,date);

@override
String toString() {
  return 'VersionDetail(version: $version, branch: $branch, hash: $hash, date: $date)';
}


}

/// @nodoc
abstract mixin class _$VersionDetailCopyWith<$Res> implements $VersionDetailCopyWith<$Res> {
  factory _$VersionDetailCopyWith(_VersionDetail value, $Res Function(_VersionDetail) _then) = __$VersionDetailCopyWithImpl;
@override @useResult
$Res call({
 String version, String? branch, String? hash, String? date
});




}
/// @nodoc
class __$VersionDetailCopyWithImpl<$Res>
    implements _$VersionDetailCopyWith<$Res> {
  __$VersionDetailCopyWithImpl(this._self, this._then);

  final _VersionDetail _self;
  final $Res Function(_VersionDetail) _then;

/// Create a copy of VersionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? branch = freezed,Object? hash = freezed,Object? date = freezed,}) {
  return _then(_VersionDetail(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
