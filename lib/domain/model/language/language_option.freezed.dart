// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LanguageOption {

 String get key; int get index; String get displayName;
/// Create a copy of LanguageOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageOptionCopyWith<LanguageOption> get copyWith => _$LanguageOptionCopyWithImpl<LanguageOption>(this as LanguageOption, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageOption&&(identical(other.key, key) || other.key == key)&&(identical(other.index, index) || other.index == index)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,key,index,displayName);

@override
String toString() {
  return 'LanguageOption(key: $key, index: $index, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $LanguageOptionCopyWith<$Res>  {
  factory $LanguageOptionCopyWith(LanguageOption value, $Res Function(LanguageOption) _then) = _$LanguageOptionCopyWithImpl;
@useResult
$Res call({
 String key, int index, String displayName
});




}
/// @nodoc
class _$LanguageOptionCopyWithImpl<$Res>
    implements $LanguageOptionCopyWith<$Res> {
  _$LanguageOptionCopyWithImpl(this._self, this._then);

  final LanguageOption _self;
  final $Res Function(LanguageOption) _then;

/// Create a copy of LanguageOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? index = null,Object? displayName = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageOption].
extension LanguageOptionPatterns on LanguageOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageOption value)  $default,){
final _that = this;
switch (_that) {
case _LanguageOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageOption value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  int index,  String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageOption() when $default != null:
return $default(_that.key,_that.index,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  int index,  String displayName)  $default,) {final _that = this;
switch (_that) {
case _LanguageOption():
return $default(_that.key,_that.index,_that.displayName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  int index,  String displayName)?  $default,) {final _that = this;
switch (_that) {
case _LanguageOption() when $default != null:
return $default(_that.key,_that.index,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc


class _LanguageOption implements LanguageOption {
  const _LanguageOption({required this.key, required this.index, required this.displayName});
  

@override final  String key;
@override final  int index;
@override final  String displayName;

/// Create a copy of LanguageOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageOptionCopyWith<_LanguageOption> get copyWith => __$LanguageOptionCopyWithImpl<_LanguageOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageOption&&(identical(other.key, key) || other.key == key)&&(identical(other.index, index) || other.index == index)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,key,index,displayName);

@override
String toString() {
  return 'LanguageOption(key: $key, index: $index, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$LanguageOptionCopyWith<$Res> implements $LanguageOptionCopyWith<$Res> {
  factory _$LanguageOptionCopyWith(_LanguageOption value, $Res Function(_LanguageOption) _then) = __$LanguageOptionCopyWithImpl;
@override @useResult
$Res call({
 String key, int index, String displayName
});




}
/// @nodoc
class __$LanguageOptionCopyWithImpl<$Res>
    implements _$LanguageOptionCopyWith<$Res> {
  __$LanguageOptionCopyWithImpl(this._self, this._then);

  final _LanguageOption _self;
  final $Res Function(_LanguageOption) _then;

/// Create a copy of LanguageOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? index = null,Object? displayName = null,}) {
  return _then(_LanguageOption(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
