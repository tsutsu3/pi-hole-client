// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoClient {
  String get addr;

  /// Create a copy of InfoClient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoClientCopyWith<InfoClient> get copyWith =>
      _$InfoClientCopyWithImpl<InfoClient>(this as InfoClient, _$identity);

  /// Serializes this InfoClient to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoClient &&
            (identical(other.addr, addr) || other.addr == addr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addr);

  @override
  String toString() {
    return 'InfoClient(addr: $addr)';
  }
}

/// @nodoc
abstract mixin class $InfoClientCopyWith<$Res> {
  factory $InfoClientCopyWith(
          InfoClient value, $Res Function(InfoClient) _then) =
      _$InfoClientCopyWithImpl;
  @useResult
  $Res call({String addr});
}

/// @nodoc
class _$InfoClientCopyWithImpl<$Res> implements $InfoClientCopyWith<$Res> {
  _$InfoClientCopyWithImpl(this._self, this._then);

  final InfoClient _self;
  final $Res Function(InfoClient) _then;

  /// Create a copy of InfoClient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = null,
  }) {
    return _then(_self.copyWith(
      addr: null == addr
          ? _self.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InfoClient].
extension InfoClientPatterns on InfoClient {
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
    TResult Function(_InfoClient value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoClient() when $default != null:
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
    TResult Function(_InfoClient value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoClient():
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
    TResult? Function(_InfoClient value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoClient() when $default != null:
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
    TResult Function(String addr)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoClient() when $default != null:
        return $default(_that.addr);
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
    TResult Function(String addr) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoClient():
        return $default(_that.addr);
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
    TResult? Function(String addr)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoClient() when $default != null:
        return $default(_that.addr);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InfoClient implements InfoClient {
  const _InfoClient({required this.addr});
  factory _InfoClient.fromJson(Map<String, dynamic> json) =>
      _$InfoClientFromJson(json);

  @override
  final String addr;

  /// Create a copy of InfoClient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoClientCopyWith<_InfoClient> get copyWith =>
      __$InfoClientCopyWithImpl<_InfoClient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoClientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoClient &&
            (identical(other.addr, addr) || other.addr == addr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addr);

  @override
  String toString() {
    return 'InfoClient(addr: $addr)';
  }
}

/// @nodoc
abstract mixin class _$InfoClientCopyWith<$Res>
    implements $InfoClientCopyWith<$Res> {
  factory _$InfoClientCopyWith(
          _InfoClient value, $Res Function(_InfoClient) _then) =
      __$InfoClientCopyWithImpl;
  @override
  @useResult
  $Res call({String addr});
}

/// @nodoc
class __$InfoClientCopyWithImpl<$Res> implements _$InfoClientCopyWith<$Res> {
  __$InfoClientCopyWithImpl(this._self, this._then);

  final _InfoClient _self;
  final $Res Function(_InfoClient) _then;

  /// Create a copy of InfoClient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addr = null,
  }) {
    return _then(_InfoClient(
      addr: null == addr
          ? _self.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
