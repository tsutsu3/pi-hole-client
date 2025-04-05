// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gravity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Gravity {
  List<GravityEntry> get entries;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GravityCopyWith<Gravity> get copyWith =>
      _$GravityCopyWithImpl<Gravity>(this as Gravity, _$identity);

  /// Serializes this Gravity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Gravity &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entries));

  @override
  String toString() {
    return 'Gravity(entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $GravityCopyWith<$Res> {
  factory $GravityCopyWith(Gravity value, $Res Function(Gravity) _then) =
      _$GravityCopyWithImpl;
  @useResult
  $Res call({List<GravityEntry> entries});
}

/// @nodoc
class _$GravityCopyWithImpl<$Res> implements $GravityCopyWith<$Res> {
  _$GravityCopyWithImpl(this._self, this._then);

  final Gravity _self;
  final $Res Function(Gravity) _then;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_self.copyWith(
      entries: null == entries
          ? _self.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<GravityEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Gravity implements Gravity {
  const _Gravity({final List<GravityEntry> entries = const []})
      : _entries = entries;
  factory _Gravity.fromJson(Map<String, dynamic> json) =>
      _$GravityFromJson(json);

  final List<GravityEntry> _entries;
  @override
  @JsonKey()
  List<GravityEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GravityCopyWith<_Gravity> get copyWith =>
      __$GravityCopyWithImpl<_Gravity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GravityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Gravity &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  @override
  String toString() {
    return 'Gravity(entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$GravityCopyWith<$Res> implements $GravityCopyWith<$Res> {
  factory _$GravityCopyWith(_Gravity value, $Res Function(_Gravity) _then) =
      __$GravityCopyWithImpl;
  @override
  @useResult
  $Res call({List<GravityEntry> entries});
}

/// @nodoc
class __$GravityCopyWithImpl<$Res> implements _$GravityCopyWith<$Res> {
  __$GravityCopyWithImpl(this._self, this._then);

  final _Gravity _self;
  final $Res Function(_Gravity) _then;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entries = null,
  }) {
    return _then(_Gravity(
      entries: null == entries
          ? _self._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<GravityEntry>,
    ));
  }
}

/// @nodoc
mixin _$GravityEntry {
  String get message;

  /// Create a copy of GravityEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GravityEntryCopyWith<GravityEntry> get copyWith =>
      _$GravityEntryCopyWithImpl<GravityEntry>(
          this as GravityEntry, _$identity);

  /// Serializes this GravityEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GravityEntry &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GravityEntry(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GravityEntryCopyWith<$Res> {
  factory $GravityEntryCopyWith(
          GravityEntry value, $Res Function(GravityEntry) _then) =
      _$GravityEntryCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GravityEntryCopyWithImpl<$Res> implements $GravityEntryCopyWith<$Res> {
  _$GravityEntryCopyWithImpl(this._self, this._then);

  final GravityEntry _self;
  final $Res Function(GravityEntry) _then;

  /// Create a copy of GravityEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GravityEntry implements GravityEntry {
  const _GravityEntry({required this.message});
  factory _GravityEntry.fromJson(Map<String, dynamic> json) =>
      _$GravityEntryFromJson(json);

  @override
  final String message;

  /// Create a copy of GravityEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GravityEntryCopyWith<_GravityEntry> get copyWith =>
      __$GravityEntryCopyWithImpl<_GravityEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GravityEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GravityEntry &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GravityEntry(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$GravityEntryCopyWith<$Res>
    implements $GravityEntryCopyWith<$Res> {
  factory _$GravityEntryCopyWith(
          _GravityEntry value, $Res Function(_GravityEntry) _then) =
      __$GravityEntryCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$GravityEntryCopyWithImpl<$Res>
    implements _$GravityEntryCopyWith<$Res> {
  __$GravityEntryCopyWithImpl(this._self, this._then);

  final _GravityEntry _self;
  final $Res Function(_GravityEntry) _then;

  /// Create a copy of GravityEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_GravityEntry(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
