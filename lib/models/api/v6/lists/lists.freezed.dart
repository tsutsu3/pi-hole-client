// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lists {
  List<ListItem> get lists;
  double get took;
  Processed? get processed;

  /// Create a copy of Lists
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListsCopyWith<Lists> get copyWith =>
      _$ListsCopyWithImpl<Lists>(this as Lists, _$identity);

  /// Serializes this Lists to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Lists &&
            const DeepCollectionEquality().equals(other.lists, lists) &&
            (identical(other.took, took) || other.took == took) &&
            (identical(other.processed, processed) ||
                other.processed == processed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(lists), took, processed);

  @override
  String toString() {
    return 'Lists(lists: $lists, took: $took, processed: $processed)';
  }
}

/// @nodoc
abstract mixin class $ListsCopyWith<$Res> {
  factory $ListsCopyWith(Lists value, $Res Function(Lists) _then) =
      _$ListsCopyWithImpl;
  @useResult
  $Res call({List<ListItem> lists, double took, Processed? processed});

  $ProcessedCopyWith<$Res>? get processed;
}

/// @nodoc
class _$ListsCopyWithImpl<$Res> implements $ListsCopyWith<$Res> {
  _$ListsCopyWithImpl(this._self, this._then);

  final Lists _self;
  final $Res Function(Lists) _then;

  /// Create a copy of Lists
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lists = null,
    Object? took = null,
    Object? processed = freezed,
  }) {
    return _then(_self.copyWith(
      lists: null == lists
          ? _self.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<ListItem>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
      processed: freezed == processed
          ? _self.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed?,
    ));
  }

  /// Create a copy of Lists
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProcessedCopyWith<$Res>? get processed {
    if (_self.processed == null) {
      return null;
    }

    return $ProcessedCopyWith<$Res>(_self.processed!, (value) {
      return _then(_self.copyWith(processed: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Lists].
extension ListsPatterns on Lists {
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
    TResult Function(_Lists value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Lists() when $default != null:
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
    TResult Function(_Lists value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lists():
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
    TResult? Function(_Lists value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lists() when $default != null:
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
    TResult Function(List<ListItem> lists, double took, Processed? processed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Lists() when $default != null:
        return $default(_that.lists, _that.took, _that.processed);
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
    TResult Function(List<ListItem> lists, double took, Processed? processed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lists():
        return $default(_that.lists, _that.took, _that.processed);
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
    TResult? Function(List<ListItem> lists, double took, Processed? processed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lists() when $default != null:
        return $default(_that.lists, _that.took, _that.processed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Lists implements Lists {
  const _Lists(
      {required final List<ListItem> lists, required this.took, this.processed})
      : _lists = lists;
  factory _Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);

  final List<ListItem> _lists;
  @override
  List<ListItem> get lists {
    if (_lists is EqualUnmodifiableListView) return _lists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lists);
  }

  @override
  final double took;
  @override
  final Processed? processed;

  /// Create a copy of Lists
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListsCopyWith<_Lists> get copyWith =>
      __$ListsCopyWithImpl<_Lists>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Lists &&
            const DeepCollectionEquality().equals(other._lists, _lists) &&
            (identical(other.took, took) || other.took == took) &&
            (identical(other.processed, processed) ||
                other.processed == processed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_lists), took, processed);

  @override
  String toString() {
    return 'Lists(lists: $lists, took: $took, processed: $processed)';
  }
}

/// @nodoc
abstract mixin class _$ListsCopyWith<$Res> implements $ListsCopyWith<$Res> {
  factory _$ListsCopyWith(_Lists value, $Res Function(_Lists) _then) =
      __$ListsCopyWithImpl;
  @override
  @useResult
  $Res call({List<ListItem> lists, double took, Processed? processed});

  @override
  $ProcessedCopyWith<$Res>? get processed;
}

/// @nodoc
class __$ListsCopyWithImpl<$Res> implements _$ListsCopyWith<$Res> {
  __$ListsCopyWithImpl(this._self, this._then);

  final _Lists _self;
  final $Res Function(_Lists) _then;

  /// Create a copy of Lists
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lists = null,
    Object? took = null,
    Object? processed = freezed,
  }) {
    return _then(_Lists(
      lists: null == lists
          ? _self._lists
          : lists // ignore: cast_nullable_to_non_nullable
              as List<ListItem>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
      processed: freezed == processed
          ? _self.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed?,
    ));
  }

  /// Create a copy of Lists
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProcessedCopyWith<$Res>? get processed {
    if (_self.processed == null) {
      return null;
    }

    return $ProcessedCopyWith<$Res>(_self.processed!, (value) {
      return _then(_self.copyWith(processed: value));
    });
  }
}

/// @nodoc
mixin _$ListItem {
  String get address;
  String get type;
  List<int> get groups;
  bool get enabled;
  int get id;
  @JsonKey(name: 'date_added')
  int get dateAdded;
  @JsonKey(name: 'date_modified')
  int get dateModified;
  @JsonKey(name: 'date_updated')
  int get dateUpdated;
  int get number;
  @JsonKey(name: 'invalid_domains')
  int get invalidDomains;
  @JsonKey(name: 'abp_entries')
  int get abpEntries;
  int get status;
  String? get comment;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListItemCopyWith<ListItem> get copyWith =>
      _$ListItemCopyWithImpl<ListItem>(this as ListItem, _$identity);

  /// Serializes this ListItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListItem &&
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
    return 'ListItem(address: $address, type: $type, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, dateUpdated: $dateUpdated, number: $number, invalidDomains: $invalidDomains, abpEntries: $abpEntries, status: $status, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $ListItemCopyWith<$Res> {
  factory $ListItemCopyWith(ListItem value, $Res Function(ListItem) _then) =
      _$ListItemCopyWithImpl;
  @useResult
  $Res call(
      {String address,
      String type,
      List<int> groups,
      bool enabled,
      int id,
      @JsonKey(name: 'date_added') int dateAdded,
      @JsonKey(name: 'date_modified') int dateModified,
      @JsonKey(name: 'date_updated') int dateUpdated,
      int number,
      @JsonKey(name: 'invalid_domains') int invalidDomains,
      @JsonKey(name: 'abp_entries') int abpEntries,
      int status,
      String? comment});
}

/// @nodoc
class _$ListItemCopyWithImpl<$Res> implements $ListItemCopyWith<$Res> {
  _$ListItemCopyWithImpl(this._self, this._then);

  final ListItem _self;
  final $Res Function(ListItem) _then;

  /// Create a copy of ListItem
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
              as int,
      dateModified: null == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      dateUpdated: null == dateUpdated
          ? _self.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as int,
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
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListItem].
extension ListItemPatterns on ListItem {
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
    TResult Function(_ListItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
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
    TResult Function(_ListItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem():
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
    TResult? Function(_ListItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
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
            @JsonKey(name: 'date_added') int dateAdded,
            @JsonKey(name: 'date_modified') int dateModified,
            @JsonKey(name: 'date_updated') int dateUpdated,
            int number,
            @JsonKey(name: 'invalid_domains') int invalidDomains,
            @JsonKey(name: 'abp_entries') int abpEntries,
            int status,
            String? comment)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
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
            @JsonKey(name: 'date_added') int dateAdded,
            @JsonKey(name: 'date_modified') int dateModified,
            @JsonKey(name: 'date_updated') int dateUpdated,
            int number,
            @JsonKey(name: 'invalid_domains') int invalidDomains,
            @JsonKey(name: 'abp_entries') int abpEntries,
            int status,
            String? comment)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem():
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
            @JsonKey(name: 'date_added') int dateAdded,
            @JsonKey(name: 'date_modified') int dateModified,
            @JsonKey(name: 'date_updated') int dateUpdated,
            int number,
            @JsonKey(name: 'invalid_domains') int invalidDomains,
            @JsonKey(name: 'abp_entries') int abpEntries,
            int status,
            String? comment)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
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
class _ListItem implements ListItem {
  const _ListItem(
      {required this.address,
      required this.type,
      required final List<int> groups,
      required this.enabled,
      required this.id,
      @JsonKey(name: 'date_added') required this.dateAdded,
      @JsonKey(name: 'date_modified') required this.dateModified,
      @JsonKey(name: 'date_updated') required this.dateUpdated,
      required this.number,
      @JsonKey(name: 'invalid_domains') required this.invalidDomains,
      @JsonKey(name: 'abp_entries') required this.abpEntries,
      required this.status,
      this.comment})
      : _groups = groups;
  factory _ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);

  @override
  final String address;
  @override
  final String type;
  final List<int> _groups;
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
  @JsonKey(name: 'date_added')
  final int dateAdded;
  @override
  @JsonKey(name: 'date_modified')
  final int dateModified;
  @override
  @JsonKey(name: 'date_updated')
  final int dateUpdated;
  @override
  final int number;
  @override
  @JsonKey(name: 'invalid_domains')
  final int invalidDomains;
  @override
  @JsonKey(name: 'abp_entries')
  final int abpEntries;
  @override
  final int status;
  @override
  final String? comment;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListItemCopyWith<_ListItem> get copyWith =>
      __$ListItemCopyWithImpl<_ListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListItem &&
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
    return 'ListItem(address: $address, type: $type, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified, dateUpdated: $dateUpdated, number: $number, invalidDomains: $invalidDomains, abpEntries: $abpEntries, status: $status, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$ListItemCopyWith<$Res>
    implements $ListItemCopyWith<$Res> {
  factory _$ListItemCopyWith(_ListItem value, $Res Function(_ListItem) _then) =
      __$ListItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String address,
      String type,
      List<int> groups,
      bool enabled,
      int id,
      @JsonKey(name: 'date_added') int dateAdded,
      @JsonKey(name: 'date_modified') int dateModified,
      @JsonKey(name: 'date_updated') int dateUpdated,
      int number,
      @JsonKey(name: 'invalid_domains') int invalidDomains,
      @JsonKey(name: 'abp_entries') int abpEntries,
      int status,
      String? comment});
}

/// @nodoc
class __$ListItemCopyWithImpl<$Res> implements _$ListItemCopyWith<$Res> {
  __$ListItemCopyWithImpl(this._self, this._then);

  final _ListItem _self;
  final $Res Function(_ListItem) _then;

  /// Create a copy of ListItem
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
    return _then(_ListItem(
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
              as int,
      dateModified: null == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      dateUpdated: null == dateUpdated
          ? _self.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as int,
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
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Processed {
  List<SuccessItem> get success;
  List<ErrorItem> get errors;

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcessedCopyWith<Processed> get copyWith =>
      _$ProcessedCopyWithImpl<Processed>(this as Processed, _$identity);

  /// Serializes this Processed to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Processed &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(errors));

  @override
  String toString() {
    return 'Processed(success: $success, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $ProcessedCopyWith<$Res> {
  factory $ProcessedCopyWith(Processed value, $Res Function(Processed) _then) =
      _$ProcessedCopyWithImpl;
  @useResult
  $Res call({List<SuccessItem> success, List<ErrorItem> errors});
}

/// @nodoc
class _$ProcessedCopyWithImpl<$Res> implements $ProcessedCopyWith<$Res> {
  _$ProcessedCopyWithImpl(this._self, this._then);

  final Processed _self;
  final $Res Function(Processed) _then;

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? errors = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as List<SuccessItem>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorItem>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Processed].
extension ProcessedPatterns on Processed {
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
    TResult Function(_Processed value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Processed() when $default != null:
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
    TResult Function(_Processed value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Processed():
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
    TResult? Function(_Processed value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Processed() when $default != null:
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
    TResult Function(List<SuccessItem> success, List<ErrorItem> errors)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Processed() when $default != null:
        return $default(_that.success, _that.errors);
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
    TResult Function(List<SuccessItem> success, List<ErrorItem> errors)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Processed():
        return $default(_that.success, _that.errors);
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
    TResult? Function(List<SuccessItem> success, List<ErrorItem> errors)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Processed() when $default != null:
        return $default(_that.success, _that.errors);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Processed implements Processed {
  const _Processed(
      {required final List<SuccessItem> success,
      required final List<ErrorItem> errors})
      : _success = success,
        _errors = errors;
  factory _Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);

  final List<SuccessItem> _success;
  @override
  List<SuccessItem> get success {
    if (_success is EqualUnmodifiableListView) return _success;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_success);
  }

  final List<ErrorItem> _errors;
  @override
  List<ErrorItem> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcessedCopyWith<_Processed> get copyWith =>
      __$ProcessedCopyWithImpl<_Processed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProcessedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Processed &&
            const DeepCollectionEquality().equals(other._success, _success) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_success),
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'Processed(success: $success, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$ProcessedCopyWith<$Res>
    implements $ProcessedCopyWith<$Res> {
  factory _$ProcessedCopyWith(
          _Processed value, $Res Function(_Processed) _then) =
      __$ProcessedCopyWithImpl;
  @override
  @useResult
  $Res call({List<SuccessItem> success, List<ErrorItem> errors});
}

/// @nodoc
class __$ProcessedCopyWithImpl<$Res> implements _$ProcessedCopyWith<$Res> {
  __$ProcessedCopyWithImpl(this._self, this._then);

  final _Processed _self;
  final $Res Function(_Processed) _then;

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? errors = null,
  }) {
    return _then(_Processed(
      success: null == success
          ? _self._success
          : success // ignore: cast_nullable_to_non_nullable
              as List<SuccessItem>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorItem>,
    ));
  }
}

/// @nodoc
mixin _$SuccessItem {
  String get item;

  /// Create a copy of SuccessItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessItemCopyWith<SuccessItem> get copyWith =>
      _$SuccessItemCopyWithImpl<SuccessItem>(this as SuccessItem, _$identity);

  /// Serializes this SuccessItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessItem &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'SuccessItem(item: $item)';
  }
}

/// @nodoc
abstract mixin class $SuccessItemCopyWith<$Res> {
  factory $SuccessItemCopyWith(
          SuccessItem value, $Res Function(SuccessItem) _then) =
      _$SuccessItemCopyWithImpl;
  @useResult
  $Res call({String item});
}

/// @nodoc
class _$SuccessItemCopyWithImpl<$Res> implements $SuccessItemCopyWith<$Res> {
  _$SuccessItemCopyWithImpl(this._self, this._then);

  final SuccessItem _self;
  final $Res Function(SuccessItem) _then;

  /// Create a copy of SuccessItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SuccessItem].
extension SuccessItemPatterns on SuccessItem {
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
    TResult Function(_SuccessItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SuccessItem() when $default != null:
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
    TResult Function(_SuccessItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuccessItem():
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
    TResult? Function(_SuccessItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuccessItem() when $default != null:
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
    TResult Function(String item)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SuccessItem() when $default != null:
        return $default(_that.item);
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
    TResult Function(String item) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuccessItem():
        return $default(_that.item);
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
    TResult? Function(String item)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuccessItem() when $default != null:
        return $default(_that.item);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SuccessItem implements SuccessItem {
  const _SuccessItem({required this.item});
  factory _SuccessItem.fromJson(Map<String, dynamic> json) =>
      _$SuccessItemFromJson(json);

  @override
  final String item;

  /// Create a copy of SuccessItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessItemCopyWith<_SuccessItem> get copyWith =>
      __$SuccessItemCopyWithImpl<_SuccessItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuccessItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuccessItem &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'SuccessItem(item: $item)';
  }
}

/// @nodoc
abstract mixin class _$SuccessItemCopyWith<$Res>
    implements $SuccessItemCopyWith<$Res> {
  factory _$SuccessItemCopyWith(
          _SuccessItem value, $Res Function(_SuccessItem) _then) =
      __$SuccessItemCopyWithImpl;
  @override
  @useResult
  $Res call({String item});
}

/// @nodoc
class __$SuccessItemCopyWithImpl<$Res> implements _$SuccessItemCopyWith<$Res> {
  __$SuccessItemCopyWithImpl(this._self, this._then);

  final _SuccessItem _self;
  final $Res Function(_SuccessItem) _then;

  /// Create a copy of SuccessItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(_SuccessItem(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ErrorItem {
  String get item;
  String get error;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorItemCopyWith<ErrorItem> get copyWith =>
      _$ErrorItemCopyWithImpl<ErrorItem>(this as ErrorItem, _$identity);

  /// Serializes this ErrorItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, error);

  @override
  String toString() {
    return 'ErrorItem(item: $item, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorItemCopyWith<$Res> {
  factory $ErrorItemCopyWith(ErrorItem value, $Res Function(ErrorItem) _then) =
      _$ErrorItemCopyWithImpl;
  @useResult
  $Res call({String item, String error});
}

/// @nodoc
class _$ErrorItemCopyWithImpl<$Res> implements $ErrorItemCopyWith<$Res> {
  _$ErrorItemCopyWithImpl(this._self, this._then);

  final ErrorItem _self;
  final $Res Function(ErrorItem) _then;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? error = null,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ErrorItem].
extension ErrorItemPatterns on ErrorItem {
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
    TResult Function(_ErrorItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorItem() when $default != null:
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
    TResult Function(_ErrorItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorItem():
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
    TResult? Function(_ErrorItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorItem() when $default != null:
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
    TResult Function(String item, String error)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ErrorItem() when $default != null:
        return $default(_that.item, _that.error);
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
    TResult Function(String item, String error) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorItem():
        return $default(_that.item, _that.error);
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
    TResult? Function(String item, String error)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ErrorItem() when $default != null:
        return $default(_that.item, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ErrorItem implements ErrorItem {
  const _ErrorItem({required this.item, required this.error});
  factory _ErrorItem.fromJson(Map<String, dynamic> json) =>
      _$ErrorItemFromJson(json);

  @override
  final String item;
  @override
  final String error;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorItemCopyWith<_ErrorItem> get copyWith =>
      __$ErrorItemCopyWithImpl<_ErrorItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ErrorItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, error);

  @override
  String toString() {
    return 'ErrorItem(item: $item, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorItemCopyWith<$Res>
    implements $ErrorItemCopyWith<$Res> {
  factory _$ErrorItemCopyWith(
          _ErrorItem value, $Res Function(_ErrorItem) _then) =
      __$ErrorItemCopyWithImpl;
  @override
  @useResult
  $Res call({String item, String error});
}

/// @nodoc
class __$ErrorItemCopyWithImpl<$Res> implements _$ErrorItemCopyWith<$Res> {
  __$ErrorItemCopyWithImpl(this._self, this._then);

  final _ErrorItem _self;
  final $Res Function(_ErrorItem) _then;

  /// Create a copy of ErrorItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? error = null,
  }) {
    return _then(_ErrorItem(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
