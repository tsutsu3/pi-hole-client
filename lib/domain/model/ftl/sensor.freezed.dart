// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtlSensor {

 double get hotLimit; String get unit; double? get cpuTemp;
/// Create a copy of FtlSensor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtlSensorCopyWith<FtlSensor> get copyWith => _$FtlSensorCopyWithImpl<FtlSensor>(this as FtlSensor, _$identity);

  /// Serializes this FtlSensor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtlSensor&&(identical(other.hotLimit, hotLimit) || other.hotLimit == hotLimit)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotLimit,unit,cpuTemp);

@override
String toString() {
  return 'FtlSensor(hotLimit: $hotLimit, unit: $unit, cpuTemp: $cpuTemp)';
}


}

/// @nodoc
abstract mixin class $FtlSensorCopyWith<$Res>  {
  factory $FtlSensorCopyWith(FtlSensor value, $Res Function(FtlSensor) _then) = _$FtlSensorCopyWithImpl;
@useResult
$Res call({
 double hotLimit, String unit, double? cpuTemp
});




}
/// @nodoc
class _$FtlSensorCopyWithImpl<$Res>
    implements $FtlSensorCopyWith<$Res> {
  _$FtlSensorCopyWithImpl(this._self, this._then);

  final FtlSensor _self;
  final $Res Function(FtlSensor) _then;

/// Create a copy of FtlSensor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotLimit = null,Object? unit = null,Object? cpuTemp = freezed,}) {
  return _then(_self.copyWith(
hotLimit: null == hotLimit ? _self.hotLimit : hotLimit // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,cpuTemp: freezed == cpuTemp ? _self.cpuTemp : cpuTemp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FtlSensor].
extension FtlSensorPatterns on FtlSensor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtlSensor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtlSensor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtlSensor value)  $default,){
final _that = this;
switch (_that) {
case _FtlSensor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtlSensor value)?  $default,){
final _that = this;
switch (_that) {
case _FtlSensor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double hotLimit,  String unit,  double? cpuTemp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtlSensor() when $default != null:
return $default(_that.hotLimit,_that.unit,_that.cpuTemp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double hotLimit,  String unit,  double? cpuTemp)  $default,) {final _that = this;
switch (_that) {
case _FtlSensor():
return $default(_that.hotLimit,_that.unit,_that.cpuTemp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double hotLimit,  String unit,  double? cpuTemp)?  $default,) {final _that = this;
switch (_that) {
case _FtlSensor() when $default != null:
return $default(_that.hotLimit,_that.unit,_that.cpuTemp);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _FtlSensor implements FtlSensor {
  const _FtlSensor({required this.hotLimit, required this.unit, this.cpuTemp});
  factory _FtlSensor.fromJson(Map<String, dynamic> json) => _$FtlSensorFromJson(json);

@override final  double hotLimit;
@override final  String unit;
@override final  double? cpuTemp;

/// Create a copy of FtlSensor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtlSensorCopyWith<_FtlSensor> get copyWith => __$FtlSensorCopyWithImpl<_FtlSensor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtlSensorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtlSensor&&(identical(other.hotLimit, hotLimit) || other.hotLimit == hotLimit)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotLimit,unit,cpuTemp);

@override
String toString() {
  return 'FtlSensor(hotLimit: $hotLimit, unit: $unit, cpuTemp: $cpuTemp)';
}


}

/// @nodoc
abstract mixin class _$FtlSensorCopyWith<$Res> implements $FtlSensorCopyWith<$Res> {
  factory _$FtlSensorCopyWith(_FtlSensor value, $Res Function(_FtlSensor) _then) = __$FtlSensorCopyWithImpl;
@override @useResult
$Res call({
 double hotLimit, String unit, double? cpuTemp
});




}
/// @nodoc
class __$FtlSensorCopyWithImpl<$Res>
    implements _$FtlSensorCopyWith<$Res> {
  __$FtlSensorCopyWithImpl(this._self, this._then);

  final _FtlSensor _self;
  final $Res Function(_FtlSensor) _then;

/// Create a copy of FtlSensor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotLimit = null,Object? unit = null,Object? cpuTemp = freezed,}) {
  return _then(_FtlSensor(
hotLimit: null == hotLimit ? _self.hotLimit : hotLimit // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,cpuTemp: freezed == cpuTemp ? _self.cpuTemp : cpuTemp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
