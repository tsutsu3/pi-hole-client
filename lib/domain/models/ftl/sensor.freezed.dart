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
mixin _$InfoSensor {
  double get hotLimit;
  String get unit;
  double? get cpuTemp;

  /// Create a copy of InfoSensor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoSensorCopyWith<InfoSensor> get copyWith =>
      _$InfoSensorCopyWithImpl<InfoSensor>(this as InfoSensor, _$identity);

  /// Serializes this InfoSensor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoSensor &&
            (identical(other.hotLimit, hotLimit) ||
                other.hotLimit == hotLimit) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hotLimit, unit, cpuTemp);

  @override
  String toString() {
    return 'InfoSensor(hotLimit: $hotLimit, unit: $unit, cpuTemp: $cpuTemp)';
  }
}

/// @nodoc
abstract mixin class $InfoSensorCopyWith<$Res> {
  factory $InfoSensorCopyWith(
          InfoSensor value, $Res Function(InfoSensor) _then) =
      _$InfoSensorCopyWithImpl;
  @useResult
  $Res call({double hotLimit, String unit, double? cpuTemp});
}

/// @nodoc
class _$InfoSensorCopyWithImpl<$Res> implements $InfoSensorCopyWith<$Res> {
  _$InfoSensorCopyWithImpl(this._self, this._then);

  final InfoSensor _self;
  final $Res Function(InfoSensor) _then;

  /// Create a copy of InfoSensor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotLimit = null,
    Object? unit = null,
    Object? cpuTemp = freezed,
  }) {
    return _then(_self.copyWith(
      hotLimit: null == hotLimit
          ? _self.hotLimit
          : hotLimit // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      cpuTemp: freezed == cpuTemp
          ? _self.cpuTemp
          : cpuTemp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InfoSensor].
extension InfoSensorPatterns on InfoSensor {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InfoSensor value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoSensor() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InfoSensor value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSensor():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InfoSensor value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSensor() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double hotLimit, String unit, double? cpuTemp)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoSensor() when $default != null:
        return $default(_that.hotLimit, _that.unit, _that.cpuTemp);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double hotLimit, String unit, double? cpuTemp) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSensor():
        return $default(_that.hotLimit, _that.unit, _that.cpuTemp);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double hotLimit, String unit, double? cpuTemp)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSensor() when $default != null:
        return $default(_that.hotLimit, _that.unit, _that.cpuTemp);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoSensor implements InfoSensor {
  const _InfoSensor({required this.hotLimit, required this.unit, this.cpuTemp});
  factory _InfoSensor.fromJson(Map<String, dynamic> json) =>
      _$InfoSensorFromJson(json);

  @override
  final double hotLimit;
  @override
  final String unit;
  @override
  final double? cpuTemp;

  /// Create a copy of InfoSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoSensorCopyWith<_InfoSensor> get copyWith =>
      __$InfoSensorCopyWithImpl<_InfoSensor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoSensorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoSensor &&
            (identical(other.hotLimit, hotLimit) ||
                other.hotLimit == hotLimit) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.cpuTemp, cpuTemp) || other.cpuTemp == cpuTemp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hotLimit, unit, cpuTemp);

  @override
  String toString() {
    return 'InfoSensor(hotLimit: $hotLimit, unit: $unit, cpuTemp: $cpuTemp)';
  }
}

/// @nodoc
abstract mixin class _$InfoSensorCopyWith<$Res>
    implements $InfoSensorCopyWith<$Res> {
  factory _$InfoSensorCopyWith(
          _InfoSensor value, $Res Function(_InfoSensor) _then) =
      __$InfoSensorCopyWithImpl;
  @override
  @useResult
  $Res call({double hotLimit, String unit, double? cpuTemp});
}

/// @nodoc
class __$InfoSensorCopyWithImpl<$Res> implements _$InfoSensorCopyWith<$Res> {
  __$InfoSensorCopyWithImpl(this._self, this._then);

  final _InfoSensor _self;
  final $Res Function(_InfoSensor) _then;

  /// Create a copy of InfoSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hotLimit = null,
    Object? unit = null,
    Object? cpuTemp = freezed,
  }) {
    return _then(_InfoSensor(
      hotLimit: null == hotLimit
          ? _self.hotLimit
          : hotLimit // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      cpuTemp: freezed == cpuTemp
          ? _self.cpuTemp
          : cpuTemp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
