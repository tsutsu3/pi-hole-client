// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoSystem {
  int get uptime;
  double get ramUsage;
  double get cpuUsage;

  /// Create a copy of InfoSystem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoSystemCopyWith<InfoSystem> get copyWith =>
      _$InfoSystemCopyWithImpl<InfoSystem>(this as InfoSystem, _$identity);

  /// Serializes this InfoSystem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoSystem &&
            (identical(other.uptime, uptime) || other.uptime == uptime) &&
            (identical(other.ramUsage, ramUsage) ||
                other.ramUsage == ramUsage) &&
            (identical(other.cpuUsage, cpuUsage) ||
                other.cpuUsage == cpuUsage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uptime, ramUsage, cpuUsage);

  @override
  String toString() {
    return 'InfoSystem(uptime: $uptime, ramUsage: $ramUsage, cpuUsage: $cpuUsage)';
  }
}

/// @nodoc
abstract mixin class $InfoSystemCopyWith<$Res> {
  factory $InfoSystemCopyWith(
          InfoSystem value, $Res Function(InfoSystem) _then) =
      _$InfoSystemCopyWithImpl;
  @useResult
  $Res call({int uptime, double ramUsage, double cpuUsage});
}

/// @nodoc
class _$InfoSystemCopyWithImpl<$Res> implements $InfoSystemCopyWith<$Res> {
  _$InfoSystemCopyWithImpl(this._self, this._then);

  final InfoSystem _self;
  final $Res Function(InfoSystem) _then;

  /// Create a copy of InfoSystem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uptime = null,
    Object? ramUsage = null,
    Object? cpuUsage = null,
  }) {
    return _then(_self.copyWith(
      uptime: null == uptime
          ? _self.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      ramUsage: null == ramUsage
          ? _self.ramUsage
          : ramUsage // ignore: cast_nullable_to_non_nullable
              as double,
      cpuUsage: null == cpuUsage
          ? _self.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [InfoSystem].
extension InfoSystemPatterns on InfoSystem {
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
    TResult Function(_InfoSystem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoSystem() when $default != null:
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
    TResult Function(_InfoSystem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSystem():
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
    TResult? Function(_InfoSystem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSystem() when $default != null:
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
    TResult Function(int uptime, double ramUsage, double cpuUsage)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoSystem() when $default != null:
        return $default(_that.uptime, _that.ramUsage, _that.cpuUsage);
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
    TResult Function(int uptime, double ramUsage, double cpuUsage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSystem():
        return $default(_that.uptime, _that.ramUsage, _that.cpuUsage);
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
    TResult? Function(int uptime, double ramUsage, double cpuUsage)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoSystem() when $default != null:
        return $default(_that.uptime, _that.ramUsage, _that.cpuUsage);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoSystem implements InfoSystem {
  const _InfoSystem(
      {required this.uptime, required this.ramUsage, required this.cpuUsage});
  factory _InfoSystem.fromJson(Map<String, dynamic> json) =>
      _$InfoSystemFromJson(json);

  @override
  final int uptime;
  @override
  final double ramUsage;
  @override
  final double cpuUsage;

  /// Create a copy of InfoSystem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoSystemCopyWith<_InfoSystem> get copyWith =>
      __$InfoSystemCopyWithImpl<_InfoSystem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoSystemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoSystem &&
            (identical(other.uptime, uptime) || other.uptime == uptime) &&
            (identical(other.ramUsage, ramUsage) ||
                other.ramUsage == ramUsage) &&
            (identical(other.cpuUsage, cpuUsage) ||
                other.cpuUsage == cpuUsage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uptime, ramUsage, cpuUsage);

  @override
  String toString() {
    return 'InfoSystem(uptime: $uptime, ramUsage: $ramUsage, cpuUsage: $cpuUsage)';
  }
}

/// @nodoc
abstract mixin class _$InfoSystemCopyWith<$Res>
    implements $InfoSystemCopyWith<$Res> {
  factory _$InfoSystemCopyWith(
          _InfoSystem value, $Res Function(_InfoSystem) _then) =
      __$InfoSystemCopyWithImpl;
  @override
  @useResult
  $Res call({int uptime, double ramUsage, double cpuUsage});
}

/// @nodoc
class __$InfoSystemCopyWithImpl<$Res> implements _$InfoSystemCopyWith<$Res> {
  __$InfoSystemCopyWithImpl(this._self, this._then);

  final _InfoSystem _self;
  final $Res Function(_InfoSystem) _then;

  /// Create a copy of InfoSystem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uptime = null,
    Object? ramUsage = null,
    Object? cpuUsage = null,
  }) {
    return _then(_InfoSystem(
      uptime: null == uptime
          ? _self.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      ramUsage: null == ramUsage
          ? _self.ramUsage
          : ramUsage // ignore: cast_nullable_to_non_nullable
              as double,
      cpuUsage: null == cpuUsage
          ? _self.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
