// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ftl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoFtl {
  int get privacyLevel;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoFtlCopyWith<InfoFtl> get copyWith =>
      _$InfoFtlCopyWithImpl<InfoFtl>(this as InfoFtl, _$identity);

  /// Serializes this InfoFtl to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoFtl &&
            (identical(other.privacyLevel, privacyLevel) ||
                other.privacyLevel == privacyLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, privacyLevel);

  @override
  String toString() {
    return 'InfoFtl(privacyLevel: $privacyLevel)';
  }
}

/// @nodoc
abstract mixin class $InfoFtlCopyWith<$Res> {
  factory $InfoFtlCopyWith(InfoFtl value, $Res Function(InfoFtl) _then) =
      _$InfoFtlCopyWithImpl;
  @useResult
  $Res call({int privacyLevel});
}

/// @nodoc
class _$InfoFtlCopyWithImpl<$Res> implements $InfoFtlCopyWith<$Res> {
  _$InfoFtlCopyWithImpl(this._self, this._then);

  final InfoFtl _self;
  final $Res Function(InfoFtl) _then;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacyLevel = null,
  }) {
    return _then(_self.copyWith(
      privacyLevel: null == privacyLevel
          ? _self.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [InfoFtl].
extension InfoFtlPatterns on InfoFtl {
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
    TResult Function(_InfoFtl value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoFtl() when $default != null:
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
    TResult Function(_InfoFtl value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoFtl():
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
    TResult? Function(_InfoFtl value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoFtl() when $default != null:
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
    TResult Function(int privacyLevel)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoFtl() when $default != null:
        return $default(_that.privacyLevel);
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
    TResult Function(int privacyLevel) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoFtl():
        return $default(_that.privacyLevel);
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
    TResult? Function(int privacyLevel)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoFtl() when $default != null:
        return $default(_that.privacyLevel);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoFtl implements InfoFtl {
  const _InfoFtl({required this.privacyLevel});
  factory _InfoFtl.fromJson(Map<String, dynamic> json) =>
      _$InfoFtlFromJson(json);

  @override
  final int privacyLevel;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoFtlCopyWith<_InfoFtl> get copyWith =>
      __$InfoFtlCopyWithImpl<_InfoFtl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoFtlToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoFtl &&
            (identical(other.privacyLevel, privacyLevel) ||
                other.privacyLevel == privacyLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, privacyLevel);

  @override
  String toString() {
    return 'InfoFtl(privacyLevel: $privacyLevel)';
  }
}

/// @nodoc
abstract mixin class _$InfoFtlCopyWith<$Res> implements $InfoFtlCopyWith<$Res> {
  factory _$InfoFtlCopyWith(_InfoFtl value, $Res Function(_InfoFtl) _then) =
      __$InfoFtlCopyWithImpl;
  @override
  @useResult
  $Res call({int privacyLevel});
}

/// @nodoc
class __$InfoFtlCopyWithImpl<$Res> implements _$InfoFtlCopyWith<$Res> {
  __$InfoFtlCopyWithImpl(this._self, this._then);

  final _InfoFtl _self;
  final $Res Function(_InfoFtl) _then;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? privacyLevel = null,
  }) {
    return _then(_InfoFtl(
      privacyLevel: null == privacyLevel
          ? _self.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
