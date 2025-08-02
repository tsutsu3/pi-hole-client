// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Adlist {
  String get address;
  String get type; //TODO: enum
  List<int> get groups;
  bool get enabled;
  int get id;
  DateTime get dateAdded;
  DateTime get dateModified;
  DateTime get dateUpdated;
  int get number;
  int get invalidDomains;
  int get abpEntries;
  ListsStatus get status;
  String? get comment;

  /// Create a copy of Adlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdlistCopyWith<Adlist> get copyWith =>
      _$AdlistCopyWithImpl<Adlist>(this as Adlist, _$identity);

  /// Serializes this Adlist to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Adlist &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.invalidDomains, invalidDomains) ||
                other.invalidDomains == invalidDomains) &&
            (identical(other.abpEntries, abpEntries) ||
                other.abpEntries == abpEntries) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      type,
      const DeepCollectionEquality().hash(groups),
      enabled,
      id,
      dateAdded,
      dateModified,
      dateUpdated,
      number,
      invalidDomains,
      abpEntries,
      status,
      comment);

  @override
  String toString() {
    return 'Adlist(address: $address, type: $type, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, dateUpdated: $dateUpdated, number: $number, invalidDomains: $invalidDomains, abpEntries: $abpEntries, status: $status, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $AdlistCopyWith<$Res> {
  factory $AdlistCopyWith(Adlist value, $Res Function(Adlist) _then) =
      _$AdlistCopyWithImpl;
  @useResult
  $Res call(
      {String address,
      String type,
      List<int> groups,
      bool enabled,
      int id,
      DateTime dateAdded,
      DateTime dateModified,
      DateTime dateUpdated,
      int number,
      int invalidDomains,
      int abpEntries,
      ListsStatus status,
      String? comment});
}

/// @nodoc
class _$AdlistCopyWithImpl<$Res> implements $AdlistCopyWith<$Res> {
  _$AdlistCopyWithImpl(this._self, this._then);

  final Adlist _self;
  final $Res Function(Adlist) _then;

  /// Create a copy of Adlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? type = null,
    Object? groups = null,
    Object? enabled = null,
    Object? id = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? dateUpdated = null,
    Object? number = null,
    Object? invalidDomains = null,
    Object? abpEntries = null,
    Object? status = null,
    Object? comment = freezed,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<int>,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: null == dateAdded
          ? _self.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateUpdated: null == dateUpdated
          ? _self.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      invalidDomains: null == invalidDomains
          ? _self.invalidDomains
          : invalidDomains // ignore: cast_nullable_to_non_nullable
              as int,
      abpEntries: null == abpEntries
          ? _self.abpEntries
          : abpEntries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListsStatus,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Adlist].
extension AdlistPatterns on Adlist {
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
    TResult Function(_Adlist value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Adlist() when $default != null:
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
    TResult Function(_Adlist value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Adlist():
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
    TResult? Function(_Adlist value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Adlist() when $default != null:
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
            String address,
            String type,
            List<int> groups,
            bool enabled,
            int id,
            DateTime dateAdded,
            DateTime dateModified,
            DateTime dateUpdated,
            int number,
            int invalidDomains,
            int abpEntries,
            ListsStatus status,
            String? comment)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Adlist() when $default != null:
        return $default(
            _that.address,
            _that.type,
            _that.groups,
            _that.enabled,
            _that.id,
            _that.dateAdded,
            _that.dateModified,
            _that.dateUpdated,
            _that.number,
            _that.invalidDomains,
            _that.abpEntries,
            _that.status,
            _that.comment);
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
            String address,
            String type,
            List<int> groups,
            bool enabled,
            int id,
            DateTime dateAdded,
            DateTime dateModified,
            DateTime dateUpdated,
            int number,
            int invalidDomains,
            int abpEntries,
            ListsStatus status,
            String? comment)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Adlist():
        return $default(
            _that.address,
            _that.type,
            _that.groups,
            _that.enabled,
            _that.id,
            _that.dateAdded,
            _that.dateModified,
            _that.dateUpdated,
            _that.number,
            _that.invalidDomains,
            _that.abpEntries,
            _that.status,
            _that.comment);
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
            String address,
            String type,
            List<int> groups,
            bool enabled,
            int id,
            DateTime dateAdded,
            DateTime dateModified,
            DateTime dateUpdated,
            int number,
            int invalidDomains,
            int abpEntries,
            ListsStatus status,
            String? comment)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Adlist() when $default != null:
        return $default(
            _that.address,
            _that.type,
            _that.groups,
            _that.enabled,
            _that.id,
            _that.dateAdded,
            _that.dateModified,
            _that.dateUpdated,
            _that.number,
            _that.invalidDomains,
            _that.abpEntries,
            _that.status,
            _that.comment);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Adlist implements Adlist {
  const _Adlist(
      {required this.address,
      required this.type,
      required final List<int> groups,
      required this.enabled,
      required this.id,
      required this.dateAdded,
      required this.dateModified,
      required this.dateUpdated,
      required this.number,
      required this.invalidDomains,
      required this.abpEntries,
      required this.status,
      this.comment})
      : _groups = groups;
  factory _Adlist.fromJson(Map<String, dynamic> json) => _$AdlistFromJson(json);

  @override
  final String address;
  @override
  final String type;
//TODO: enum
  final List<int> _groups;
//TODO: enum
  @override
  List<int> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final bool enabled;
  @override
  final int id;
  @override
  final DateTime dateAdded;
  @override
  final DateTime dateModified;
  @override
  final DateTime dateUpdated;
  @override
  final int number;
  @override
  final int invalidDomains;
  @override
  final int abpEntries;
  @override
  final ListsStatus status;
  @override
  final String? comment;

  /// Create a copy of Adlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdlistCopyWith<_Adlist> get copyWith =>
      __$AdlistCopyWithImpl<_Adlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdlistToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Adlist &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.dateUpdated, dateUpdated) ||
                other.dateUpdated == dateUpdated) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.invalidDomains, invalidDomains) ||
                other.invalidDomains == invalidDomains) &&
            (identical(other.abpEntries, abpEntries) ||
                other.abpEntries == abpEntries) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      type,
      const DeepCollectionEquality().hash(_groups),
      enabled,
      id,
      dateAdded,
      dateModified,
      dateUpdated,
      number,
      invalidDomains,
      abpEntries,
      status,
      comment);

  @override
  String toString() {
    return 'Adlist(address: $address, type: $type, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, dateUpdated: $dateUpdated, number: $number, invalidDomains: $invalidDomains, abpEntries: $abpEntries, status: $status, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$AdlistCopyWith<$Res> implements $AdlistCopyWith<$Res> {
  factory _$AdlistCopyWith(_Adlist value, $Res Function(_Adlist) _then) =
      __$AdlistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String address,
      String type,
      List<int> groups,
      bool enabled,
      int id,
      DateTime dateAdded,
      DateTime dateModified,
      DateTime dateUpdated,
      int number,
      int invalidDomains,
      int abpEntries,
      ListsStatus status,
      String? comment});
}

/// @nodoc
class __$AdlistCopyWithImpl<$Res> implements _$AdlistCopyWith<$Res> {
  __$AdlistCopyWithImpl(this._self, this._then);

  final _Adlist _self;
  final $Res Function(_Adlist) _then;

  /// Create a copy of Adlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? type = null,
    Object? groups = null,
    Object? enabled = null,
    Object? id = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? dateUpdated = null,
    Object? number = null,
    Object? invalidDomains = null,
    Object? abpEntries = null,
    Object? status = null,
    Object? comment = freezed,
  }) {
    return _then(_Adlist(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _self._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<int>,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: null == dateAdded
          ? _self.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateUpdated: null == dateUpdated
          ? _self.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      invalidDomains: null == invalidDomains
          ? _self.invalidDomains
          : invalidDomains // ignore: cast_nullable_to_non_nullable
              as int,
      abpEntries: null == abpEntries
          ? _self.abpEntries
          : abpEntries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListsStatus,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
