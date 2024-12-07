// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Blocking _$BlockingFromJson(Map<String, dynamic> json) {
  return _Blocking.fromJson(json);
}

/// @nodoc
mixin _$Blocking {
  String get blocking => throw _privateConstructorUsedError;
  int? get timer => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this Blocking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Blocking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockingCopyWith<Blocking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockingCopyWith<$Res> {
  factory $BlockingCopyWith(Blocking value, $Res Function(Blocking) then) =
      _$BlockingCopyWithImpl<$Res, Blocking>;
  @useResult
  $Res call({String blocking, int? timer, double took});
}

/// @nodoc
class _$BlockingCopyWithImpl<$Res, $Val extends Blocking>
    implements $BlockingCopyWith<$Res> {
  _$BlockingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Blocking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocking = null,
    Object? timer = freezed,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      blocking: null == blocking
          ? _value.blocking
          : blocking // ignore: cast_nullable_to_non_nullable
              as String,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int?,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockingImplCopyWith<$Res>
    implements $BlockingCopyWith<$Res> {
  factory _$$BlockingImplCopyWith(
          _$BlockingImpl value, $Res Function(_$BlockingImpl) then) =
      __$$BlockingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String blocking, int? timer, double took});
}

/// @nodoc
class __$$BlockingImplCopyWithImpl<$Res>
    extends _$BlockingCopyWithImpl<$Res, _$BlockingImpl>
    implements _$$BlockingImplCopyWith<$Res> {
  __$$BlockingImplCopyWithImpl(
      _$BlockingImpl _value, $Res Function(_$BlockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Blocking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocking = null,
    Object? timer = freezed,
    Object? took = null,
  }) {
    return _then(_$BlockingImpl(
      blocking: null == blocking
          ? _value.blocking
          : blocking // ignore: cast_nullable_to_non_nullable
              as String,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int?,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockingImpl implements _Blocking {
  _$BlockingImpl(
      {required this.blocking, required this.timer, required this.took});

  factory _$BlockingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockingImplFromJson(json);

  @override
  final String blocking;
  @override
  final int? timer;
  @override
  final double took;

  @override
  String toString() {
    return 'Blocking(blocking: $blocking, timer: $timer, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockingImpl &&
            (identical(other.blocking, blocking) ||
                other.blocking == blocking) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, blocking, timer, took);

  /// Create a copy of Blocking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockingImplCopyWith<_$BlockingImpl> get copyWith =>
      __$$BlockingImplCopyWithImpl<_$BlockingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockingImplToJson(
      this,
    );
  }
}

abstract class _Blocking implements Blocking {
  factory _Blocking(
      {required final String blocking,
      required final int? timer,
      required final double took}) = _$BlockingImpl;

  factory _Blocking.fromJson(Map<String, dynamic> json) =
      _$BlockingImpl.fromJson;

  @override
  String get blocking;
  @override
  int? get timer;
  @override
  double get took;

  /// Create a copy of Blocking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockingImplCopyWith<_$BlockingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
