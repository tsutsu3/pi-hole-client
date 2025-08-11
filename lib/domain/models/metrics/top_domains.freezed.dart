// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_domains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryStat {

 String get domain; int get count;
/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryStatCopyWith<QueryStat> get copyWith => _$QueryStatCopyWithImpl<QueryStat>(this as QueryStat, _$identity);

  /// Serializes this QueryStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryStat&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,count);

@override
String toString() {
  return 'QueryStat(domain: $domain, count: $count)';
}


}

/// @nodoc
abstract mixin class $QueryStatCopyWith<$Res>  {
  factory $QueryStatCopyWith(QueryStat value, $Res Function(QueryStat) _then) = _$QueryStatCopyWithImpl;
@useResult
$Res call({
 String domain, int count
});




}
/// @nodoc
class _$QueryStatCopyWithImpl<$Res>
    implements $QueryStatCopyWith<$Res> {
  _$QueryStatCopyWithImpl(this._self, this._then);

  final QueryStat _self;
  final $Res Function(QueryStat) _then;

/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domain = null,Object? count = null,}) {
  return _then(_self.copyWith(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QueryStat].
extension QueryStatPatterns on QueryStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueryStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueryStat value)  $default,){
final _that = this;
switch (_that) {
case _QueryStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueryStat value)?  $default,){
final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domain,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
return $default(_that.domain,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domain,  int count)  $default,) {final _that = this;
switch (_that) {
case _QueryStat():
return $default(_that.domain,_that.count);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domain,  int count)?  $default,) {final _that = this;
switch (_that) {
case _QueryStat() when $default != null:
return $default(_that.domain,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueryStat implements QueryStat {
  const _QueryStat({required this.domain, required this.count});
  factory _QueryStat.fromJson(Map<String, dynamic> json) => _$QueryStatFromJson(json);

@override final  String domain;
@override final  int count;

/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryStatCopyWith<_QueryStat> get copyWith => __$QueryStatCopyWithImpl<_QueryStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueryStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryStat&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domain,count);

@override
String toString() {
  return 'QueryStat(domain: $domain, count: $count)';
}


}

/// @nodoc
abstract mixin class _$QueryStatCopyWith<$Res> implements $QueryStatCopyWith<$Res> {
  factory _$QueryStatCopyWith(_QueryStat value, $Res Function(_QueryStat) _then) = __$QueryStatCopyWithImpl;
@override @useResult
$Res call({
 String domain, int count
});




}
/// @nodoc
class __$QueryStatCopyWithImpl<$Res>
    implements _$QueryStatCopyWith<$Res> {
  __$QueryStatCopyWithImpl(this._self, this._then);

  final _QueryStat _self;
  final $Res Function(_QueryStat) _then;

/// Create a copy of QueryStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domain = null,Object? count = null,}) {
  return _then(_QueryStat(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
