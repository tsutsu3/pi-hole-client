// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upstreams.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DestinationStat {

 String get destination; double get percentage;// v6-only field
 int? get count;
/// Create a copy of DestinationStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DestinationStatCopyWith<DestinationStat> get copyWith => _$DestinationStatCopyWithImpl<DestinationStat>(this as DestinationStat, _$identity);

  /// Serializes this DestinationStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DestinationStat&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destination,percentage,count);

@override
String toString() {
  return 'DestinationStat(destination: $destination, percentage: $percentage, count: $count)';
}


}

/// @nodoc
abstract mixin class $DestinationStatCopyWith<$Res>  {
  factory $DestinationStatCopyWith(DestinationStat value, $Res Function(DestinationStat) _then) = _$DestinationStatCopyWithImpl;
@useResult
$Res call({
 String destination, double percentage, int? count
});




}
/// @nodoc
class _$DestinationStatCopyWithImpl<$Res>
    implements $DestinationStatCopyWith<$Res> {
  _$DestinationStatCopyWithImpl(this._self, this._then);

  final DestinationStat _self;
  final $Res Function(DestinationStat) _then;

/// Create a copy of DestinationStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destination = null,Object? percentage = null,Object? count = freezed,}) {
  return _then(_self.copyWith(
destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DestinationStat].
extension DestinationStatPatterns on DestinationStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DestinationStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DestinationStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DestinationStat value)  $default,){
final _that = this;
switch (_that) {
case _DestinationStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DestinationStat value)?  $default,){
final _that = this;
switch (_that) {
case _DestinationStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String destination,  double percentage,  int? count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DestinationStat() when $default != null:
return $default(_that.destination,_that.percentage,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String destination,  double percentage,  int? count)  $default,) {final _that = this;
switch (_that) {
case _DestinationStat():
return $default(_that.destination,_that.percentage,_that.count);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String destination,  double percentage,  int? count)?  $default,) {final _that = this;
switch (_that) {
case _DestinationStat() when $default != null:
return $default(_that.destination,_that.percentage,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DestinationStat implements DestinationStat {
  const _DestinationStat({required this.destination, required this.percentage, this.count});
  factory _DestinationStat.fromJson(Map<String, dynamic> json) => _$DestinationStatFromJson(json);

@override final  String destination;
@override final  double percentage;
// v6-only field
@override final  int? count;

/// Create a copy of DestinationStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DestinationStatCopyWith<_DestinationStat> get copyWith => __$DestinationStatCopyWithImpl<_DestinationStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DestinationStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DestinationStat&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destination,percentage,count);

@override
String toString() {
  return 'DestinationStat(destination: $destination, percentage: $percentage, count: $count)';
}


}

/// @nodoc
abstract mixin class _$DestinationStatCopyWith<$Res> implements $DestinationStatCopyWith<$Res> {
  factory _$DestinationStatCopyWith(_DestinationStat value, $Res Function(_DestinationStat) _then) = __$DestinationStatCopyWithImpl;
@override @useResult
$Res call({
 String destination, double percentage, int? count
});




}
/// @nodoc
class __$DestinationStatCopyWithImpl<$Res>
    implements _$DestinationStatCopyWith<$Res> {
  __$DestinationStatCopyWithImpl(this._self, this._then);

  final _DestinationStat _self;
  final $Res Function(_DestinationStat) _then;

/// Create a copy of DestinationStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destination = null,Object? percentage = null,Object? count = freezed,}) {
  return _then(_DestinationStat(
destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
