// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Queries {
  @ListOfListStringOrEmptyConverter()
  List<List<String>> get data;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueriesCopyWith<Queries> get copyWith =>
      _$QueriesCopyWithImpl<Queries>(this as Queries, _$identity);

  /// Serializes this Queries to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Queries &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Queries(data: $data)';
  }
}

/// @nodoc
abstract mixin class $QueriesCopyWith<$Res> {
  factory $QueriesCopyWith(Queries value, $Res Function(Queries) _then) =
      _$QueriesCopyWithImpl;
  @useResult
  $Res call({@ListOfListStringOrEmptyConverter() List<List<String>> data});
}

/// @nodoc
class _$QueriesCopyWithImpl<$Res> implements $QueriesCopyWith<$Res> {
  _$QueriesCopyWithImpl(this._self, this._then);

  final Queries _self;
  final $Res Function(Queries) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Queries].
extension QueriesPatterns on Queries {
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
    TResult Function(_Queries value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
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
    TResult Function(_Queries value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries():
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
    TResult? Function(_Queries value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
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
    TResult Function(
            @ListOfListStringOrEmptyConverter() List<List<String>> data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
        return $default(_that.data);
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
    TResult Function(
            @ListOfListStringOrEmptyConverter() List<List<String>> data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries():
        return $default(_that.data);
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
    TResult? Function(
            @ListOfListStringOrEmptyConverter() List<List<String>> data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Queries() when $default != null:
        return $default(_that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Queries implements Queries {
  const _Queries(
      {@ListOfListStringOrEmptyConverter()
      required final List<List<String>> data})
      : _data = data;
  factory _Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);

  final List<List<String>> _data;
  @override
  @ListOfListStringOrEmptyConverter()
  List<List<String>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueriesCopyWith<_Queries> get copyWith =>
      __$QueriesCopyWithImpl<_Queries>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueriesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Queries &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'Queries(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$QueriesCopyWith<$Res> implements $QueriesCopyWith<$Res> {
  factory _$QueriesCopyWith(_Queries value, $Res Function(_Queries) _then) =
      __$QueriesCopyWithImpl;
  @override
  @useResult
  $Res call({@ListOfListStringOrEmptyConverter() List<List<String>> data});
}

/// @nodoc
class __$QueriesCopyWithImpl<$Res> implements _$QueriesCopyWith<$Res> {
  __$QueriesCopyWithImpl(this._self, this._then);

  final _Queries _self;
  final $Res Function(_Queries) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_Queries(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

// dart format on
