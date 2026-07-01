// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_inspection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CertificateInspection {

/// SHA-256 fingerprint of the certificate DER bytes.
 String get sha256; String get subject; String get issuer; DateTime get startValidity; DateTime get endValidity;/// Whether the platform's trust store accepted the certificate.
 bool get trustedByPlatform;
/// Create a copy of CertificateInspection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateInspectionCopyWith<CertificateInspection> get copyWith => _$CertificateInspectionCopyWithImpl<CertificateInspection>(this as CertificateInspection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateInspection&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.startValidity, startValidity) || other.startValidity == startValidity)&&(identical(other.endValidity, endValidity) || other.endValidity == endValidity)&&(identical(other.trustedByPlatform, trustedByPlatform) || other.trustedByPlatform == trustedByPlatform));
}


@override
int get hashCode => Object.hash(runtimeType,sha256,subject,issuer,startValidity,endValidity,trustedByPlatform);

@override
String toString() {
  return 'CertificateInspection(sha256: $sha256, subject: $subject, issuer: $issuer, startValidity: $startValidity, endValidity: $endValidity, trustedByPlatform: $trustedByPlatform)';
}


}

/// @nodoc
abstract mixin class $CertificateInspectionCopyWith<$Res>  {
  factory $CertificateInspectionCopyWith(CertificateInspection value, $Res Function(CertificateInspection) _then) = _$CertificateInspectionCopyWithImpl;
@useResult
$Res call({
 String sha256, String subject, String issuer, DateTime startValidity, DateTime endValidity, bool trustedByPlatform
});




}
/// @nodoc
class _$CertificateInspectionCopyWithImpl<$Res>
    implements $CertificateInspectionCopyWith<$Res> {
  _$CertificateInspectionCopyWithImpl(this._self, this._then);

  final CertificateInspection _self;
  final $Res Function(CertificateInspection) _then;

/// Create a copy of CertificateInspection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sha256 = null,Object? subject = null,Object? issuer = null,Object? startValidity = null,Object? endValidity = null,Object? trustedByPlatform = null,}) {
  return _then(_self.copyWith(
sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,startValidity: null == startValidity ? _self.startValidity : startValidity // ignore: cast_nullable_to_non_nullable
as DateTime,endValidity: null == endValidity ? _self.endValidity : endValidity // ignore: cast_nullable_to_non_nullable
as DateTime,trustedByPlatform: null == trustedByPlatform ? _self.trustedByPlatform : trustedByPlatform // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificateInspection].
extension CertificateInspectionPatterns on CertificateInspection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CertificateInspection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificateInspection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CertificateInspection value)  $default,){
final _that = this;
switch (_that) {
case _CertificateInspection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CertificateInspection value)?  $default,){
final _that = this;
switch (_that) {
case _CertificateInspection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sha256,  String subject,  String issuer,  DateTime startValidity,  DateTime endValidity,  bool trustedByPlatform)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificateInspection() when $default != null:
return $default(_that.sha256,_that.subject,_that.issuer,_that.startValidity,_that.endValidity,_that.trustedByPlatform);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sha256,  String subject,  String issuer,  DateTime startValidity,  DateTime endValidity,  bool trustedByPlatform)  $default,) {final _that = this;
switch (_that) {
case _CertificateInspection():
return $default(_that.sha256,_that.subject,_that.issuer,_that.startValidity,_that.endValidity,_that.trustedByPlatform);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sha256,  String subject,  String issuer,  DateTime startValidity,  DateTime endValidity,  bool trustedByPlatform)?  $default,) {final _that = this;
switch (_that) {
case _CertificateInspection() when $default != null:
return $default(_that.sha256,_that.subject,_that.issuer,_that.startValidity,_that.endValidity,_that.trustedByPlatform);case _:
  return null;

}
}

}

/// @nodoc


class _CertificateInspection implements CertificateInspection {
  const _CertificateInspection({required this.sha256, required this.subject, required this.issuer, required this.startValidity, required this.endValidity, required this.trustedByPlatform});
  

/// SHA-256 fingerprint of the certificate DER bytes.
@override final  String sha256;
@override final  String subject;
@override final  String issuer;
@override final  DateTime startValidity;
@override final  DateTime endValidity;
/// Whether the platform's trust store accepted the certificate.
@override final  bool trustedByPlatform;

/// Create a copy of CertificateInspection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificateInspectionCopyWith<_CertificateInspection> get copyWith => __$CertificateInspectionCopyWithImpl<_CertificateInspection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificateInspection&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.startValidity, startValidity) || other.startValidity == startValidity)&&(identical(other.endValidity, endValidity) || other.endValidity == endValidity)&&(identical(other.trustedByPlatform, trustedByPlatform) || other.trustedByPlatform == trustedByPlatform));
}


@override
int get hashCode => Object.hash(runtimeType,sha256,subject,issuer,startValidity,endValidity,trustedByPlatform);

@override
String toString() {
  return 'CertificateInspection(sha256: $sha256, subject: $subject, issuer: $issuer, startValidity: $startValidity, endValidity: $endValidity, trustedByPlatform: $trustedByPlatform)';
}


}

/// @nodoc
abstract mixin class _$CertificateInspectionCopyWith<$Res> implements $CertificateInspectionCopyWith<$Res> {
  factory _$CertificateInspectionCopyWith(_CertificateInspection value, $Res Function(_CertificateInspection) _then) = __$CertificateInspectionCopyWithImpl;
@override @useResult
$Res call({
 String sha256, String subject, String issuer, DateTime startValidity, DateTime endValidity, bool trustedByPlatform
});




}
/// @nodoc
class __$CertificateInspectionCopyWithImpl<$Res>
    implements _$CertificateInspectionCopyWith<$Res> {
  __$CertificateInspectionCopyWithImpl(this._self, this._then);

  final _CertificateInspection _self;
  final $Res Function(_CertificateInspection) _then;

/// Create a copy of CertificateInspection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sha256 = null,Object? subject = null,Object? issuer = null,Object? startValidity = null,Object? endValidity = null,Object? trustedByPlatform = null,}) {
  return _then(_CertificateInspection(
sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,startValidity: null == startValidity ? _self.startValidity : startValidity // ignore: cast_nullable_to_non_nullable
as DateTime,endValidity: null == endValidity ? _self.endValidity : endValidity // ignore: cast_nullable_to_non_nullable
as DateTime,trustedByPlatform: null == trustedByPlatform ? _self.trustedByPlatform : trustedByPlatform // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
