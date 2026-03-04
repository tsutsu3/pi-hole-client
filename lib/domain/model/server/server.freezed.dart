// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Server {

 String get address; String get alias; String get apiVersion; bool get defaultServer; bool get allowSelfSignedCert; bool get ignoreCertificateErrors; String? get pinnedCertificateSha256;
/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerCopyWith<Server> get copyWith => _$ServerCopyWithImpl<Server>(this as Server, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Server&&(identical(other.address, address) || other.address == address)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.apiVersion, apiVersion) || other.apiVersion == apiVersion)&&(identical(other.defaultServer, defaultServer) || other.defaultServer == defaultServer)&&(identical(other.allowSelfSignedCert, allowSelfSignedCert) || other.allowSelfSignedCert == allowSelfSignedCert)&&(identical(other.ignoreCertificateErrors, ignoreCertificateErrors) || other.ignoreCertificateErrors == ignoreCertificateErrors)&&(identical(other.pinnedCertificateSha256, pinnedCertificateSha256) || other.pinnedCertificateSha256 == pinnedCertificateSha256));
}


@override
int get hashCode => Object.hash(runtimeType,address,alias,apiVersion,defaultServer,allowSelfSignedCert,ignoreCertificateErrors,pinnedCertificateSha256);

@override
String toString() {
  return 'Server(address: $address, alias: $alias, apiVersion: $apiVersion, defaultServer: $defaultServer, allowSelfSignedCert: $allowSelfSignedCert, ignoreCertificateErrors: $ignoreCertificateErrors, pinnedCertificateSha256: $pinnedCertificateSha256)';
}


}

/// @nodoc
abstract mixin class $ServerCopyWith<$Res>  {
  factory $ServerCopyWith(Server value, $Res Function(Server) _then) = _$ServerCopyWithImpl;
@useResult
$Res call({
 String address, String alias, String apiVersion, bool defaultServer, bool allowSelfSignedCert, bool ignoreCertificateErrors, String? pinnedCertificateSha256
});




}
/// @nodoc
class _$ServerCopyWithImpl<$Res>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._self, this._then);

  final Server _self;
  final $Res Function(Server) _then;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? alias = null,Object? apiVersion = null,Object? defaultServer = null,Object? allowSelfSignedCert = null,Object? ignoreCertificateErrors = null,Object? pinnedCertificateSha256 = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as String,defaultServer: null == defaultServer ? _self.defaultServer : defaultServer // ignore: cast_nullable_to_non_nullable
as bool,allowSelfSignedCert: null == allowSelfSignedCert ? _self.allowSelfSignedCert : allowSelfSignedCert // ignore: cast_nullable_to_non_nullable
as bool,ignoreCertificateErrors: null == ignoreCertificateErrors ? _self.ignoreCertificateErrors : ignoreCertificateErrors // ignore: cast_nullable_to_non_nullable
as bool,pinnedCertificateSha256: freezed == pinnedCertificateSha256 ? _self.pinnedCertificateSha256 : pinnedCertificateSha256 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Server].
extension ServerPatterns on Server {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Server value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Server() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Server value)  $default,){
final _that = this;
switch (_that) {
case _Server():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Server value)?  $default,){
final _that = this;
switch (_that) {
case _Server() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String alias,  String apiVersion,  bool defaultServer,  bool allowSelfSignedCert,  bool ignoreCertificateErrors,  String? pinnedCertificateSha256)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Server() when $default != null:
return $default(_that.address,_that.alias,_that.apiVersion,_that.defaultServer,_that.allowSelfSignedCert,_that.ignoreCertificateErrors,_that.pinnedCertificateSha256);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String alias,  String apiVersion,  bool defaultServer,  bool allowSelfSignedCert,  bool ignoreCertificateErrors,  String? pinnedCertificateSha256)  $default,) {final _that = this;
switch (_that) {
case _Server():
return $default(_that.address,_that.alias,_that.apiVersion,_that.defaultServer,_that.allowSelfSignedCert,_that.ignoreCertificateErrors,_that.pinnedCertificateSha256);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String alias,  String apiVersion,  bool defaultServer,  bool allowSelfSignedCert,  bool ignoreCertificateErrors,  String? pinnedCertificateSha256)?  $default,) {final _that = this;
switch (_that) {
case _Server() when $default != null:
return $default(_that.address,_that.alias,_that.apiVersion,_that.defaultServer,_that.allowSelfSignedCert,_that.ignoreCertificateErrors,_that.pinnedCertificateSha256);case _:
  return null;

}
}

}

/// @nodoc


class _Server implements Server {
  const _Server({required this.address, required this.alias, required this.apiVersion, this.defaultServer = false, this.allowSelfSignedCert = false, this.ignoreCertificateErrors = false, this.pinnedCertificateSha256});
  

@override final  String address;
@override final  String alias;
@override final  String apiVersion;
@override@JsonKey() final  bool defaultServer;
@override@JsonKey() final  bool allowSelfSignedCert;
@override@JsonKey() final  bool ignoreCertificateErrors;
@override final  String? pinnedCertificateSha256;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerCopyWith<_Server> get copyWith => __$ServerCopyWithImpl<_Server>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Server&&(identical(other.address, address) || other.address == address)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.apiVersion, apiVersion) || other.apiVersion == apiVersion)&&(identical(other.defaultServer, defaultServer) || other.defaultServer == defaultServer)&&(identical(other.allowSelfSignedCert, allowSelfSignedCert) || other.allowSelfSignedCert == allowSelfSignedCert)&&(identical(other.ignoreCertificateErrors, ignoreCertificateErrors) || other.ignoreCertificateErrors == ignoreCertificateErrors)&&(identical(other.pinnedCertificateSha256, pinnedCertificateSha256) || other.pinnedCertificateSha256 == pinnedCertificateSha256));
}


@override
int get hashCode => Object.hash(runtimeType,address,alias,apiVersion,defaultServer,allowSelfSignedCert,ignoreCertificateErrors,pinnedCertificateSha256);

@override
String toString() {
  return 'Server(address: $address, alias: $alias, apiVersion: $apiVersion, defaultServer: $defaultServer, allowSelfSignedCert: $allowSelfSignedCert, ignoreCertificateErrors: $ignoreCertificateErrors, pinnedCertificateSha256: $pinnedCertificateSha256)';
}


}

/// @nodoc
abstract mixin class _$ServerCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) _then) = __$ServerCopyWithImpl;
@override @useResult
$Res call({
 String address, String alias, String apiVersion, bool defaultServer, bool allowSelfSignedCert, bool ignoreCertificateErrors, String? pinnedCertificateSha256
});




}
/// @nodoc
class __$ServerCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(this._self, this._then);

  final _Server _self;
  final $Res Function(_Server) _then;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? alias = null,Object? apiVersion = null,Object? defaultServer = null,Object? allowSelfSignedCert = null,Object? ignoreCertificateErrors = null,Object? pinnedCertificateSha256 = freezed,}) {
  return _then(_Server(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as String,defaultServer: null == defaultServer ? _self.defaultServer : defaultServer // ignore: cast_nullable_to_non_nullable
as bool,allowSelfSignedCert: null == allowSelfSignedCert ? _self.allowSelfSignedCert : allowSelfSignedCert // ignore: cast_nullable_to_non_nullable
as bool,ignoreCertificateErrors: null == ignoreCertificateErrors ? _self.ignoreCertificateErrors : ignoreCertificateErrors // ignore: cast_nullable_to_non_nullable
as bool,pinnedCertificateSha256: freezed == pinnedCertificateSha256 ? _self.pinnedCertificateSha256 : pinnedCertificateSha256 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
