// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groups.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Groups {
  List<Group> get groups;
  int get took;
  Processed? get processed;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupsCopyWith<Groups> get copyWith =>
      _$GroupsCopyWithImpl<Groups>(this as Groups, _$identity);

  /// Serializes this Groups to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Groups &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(other.took, took) || other.took == took) &&
            (identical(other.processed, processed) ||
                other.processed == processed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(groups), took, processed);

  @override
  String toString() {
    return 'Groups(groups: $groups, took: $took, processed: $processed)';
  }
}

/// @nodoc
abstract mixin class $GroupsCopyWith<$Res> {
  factory $GroupsCopyWith(Groups value, $Res Function(Groups) _then) =
      _$GroupsCopyWithImpl;
  @useResult
  $Res call({List<Group> groups, int took, Processed? processed});

  $ProcessedCopyWith<$Res>? get processed;
}

/// @nodoc
class _$GroupsCopyWithImpl<$Res> implements $GroupsCopyWith<$Res> {
  _$GroupsCopyWithImpl(this._self, this._then);

  final Groups _self;
  final $Res Function(Groups) _then;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? took = null,
    Object? processed = freezed,
  }) {
    return _then(_self.copyWith(
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
      processed: freezed == processed
          ? _self.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed?,
    ));
  }

  /// Create a copy of Groups
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
@JsonSerializable()
class _Groups implements Groups {
  const _Groups(
      {required final List<Group> groups, required this.took, this.processed})
      : _groups = groups;
  factory _Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);

  final List<Group> _groups;
  @override
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final int took;
  @override
  final Processed? processed;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupsCopyWith<_Groups> get copyWith =>
      __$GroupsCopyWithImpl<_Groups>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Groups &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.took, took) || other.took == took) &&
            (identical(other.processed, processed) ||
                other.processed == processed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_groups), took, processed);

  @override
  String toString() {
    return 'Groups(groups: $groups, took: $took, processed: $processed)';
  }
}

/// @nodoc
abstract mixin class _$GroupsCopyWith<$Res> implements $GroupsCopyWith<$Res> {
  factory _$GroupsCopyWith(_Groups value, $Res Function(_Groups) _then) =
      __$GroupsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Group> groups, int took, Processed? processed});

  @override
  $ProcessedCopyWith<$Res>? get processed;
}

/// @nodoc
class __$GroupsCopyWithImpl<$Res> implements _$GroupsCopyWith<$Res> {
  __$GroupsCopyWithImpl(this._self, this._then);

  final _Groups _self;
  final $Res Function(_Groups) _then;

  /// Create a copy of Groups
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groups = null,
    Object? took = null,
    Object? processed = freezed,
  }) {
    return _then(_Groups(
      groups: null == groups
          ? _self._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as int,
      processed: freezed == processed
          ? _self.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed?,
    ));
  }

  /// Create a copy of Groups
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
mixin _$Group {
  String get name;
  int get id;
  bool get enabled;
  @JsonKey(name: 'date_added')
  int get dateAdded;
  @JsonKey(name: 'date_modified')
  int get dateModified;
  String? get comment;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupCopyWith<Group> get copyWith =>
      _$GroupCopyWithImpl<Group>(this as Group, _$identity);

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Group &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, id, enabled, dateAdded, dateModified, comment);

  @override
  String toString() {
    return 'Group(name: $name, id: $id, enabled: $enabled, dateAdded: $dateAdded, dateModified: $dateModified, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) =
      _$GroupCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      int id,
      bool enabled,
      @JsonKey(name: 'date_added') int dateAdded,
      @JsonKey(name: 'date_modified') int dateModified,
      String? comment});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? enabled = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? comment = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dateAdded: null == dateAdded
          ? _self.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Group implements Group {
  const _Group(
      {required this.name,
      required this.id,
      required this.enabled,
      @JsonKey(name: 'date_added') required this.dateAdded,
      @JsonKey(name: 'date_modified') required this.dateModified,
      this.comment});
  factory _Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final bool enabled;
  @override
  @JsonKey(name: 'date_added')
  final int dateAdded;
  @override
  @JsonKey(name: 'date_modified')
  final int dateModified;
  @override
  final String? comment;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupCopyWith<_Group> get copyWith =>
      __$GroupCopyWithImpl<_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Group &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, id, enabled, dateAdded, dateModified, comment);

  @override
  String toString() {
    return 'Group(name: $name, id: $id, enabled: $enabled, dateAdded: $dateAdded, dateModified: $dateModified, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) _then) =
      __$GroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      int id,
      bool enabled,
      @JsonKey(name: 'date_added') int dateAdded,
      @JsonKey(name: 'date_modified') int dateModified,
      String? comment});
}

/// @nodoc
class __$GroupCopyWithImpl<$Res> implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(this._self, this._then);

  final _Group _self;
  final $Res Function(_Group) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? enabled = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? comment = freezed,
  }) {
    return _then(_Group(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dateAdded: null == dateAdded
          ? _self.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
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
  List<ProcessedSuccess> get success;
  List<ProcessedError> get errors;

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
  $Res call({List<ProcessedSuccess> success, List<ProcessedError> errors});
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
              as List<ProcessedSuccess>,
      errors: null == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ProcessedError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Processed implements Processed {
  const _Processed(
      {required final List<ProcessedSuccess> success,
      required final List<ProcessedError> errors})
      : _success = success,
        _errors = errors;
  factory _Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);

  final List<ProcessedSuccess> _success;
  @override
  List<ProcessedSuccess> get success {
    if (_success is EqualUnmodifiableListView) return _success;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_success);
  }

  final List<ProcessedError> _errors;
  @override
  List<ProcessedError> get errors {
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
  $Res call({List<ProcessedSuccess> success, List<ProcessedError> errors});
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
              as List<ProcessedSuccess>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ProcessedError>,
    ));
  }
}

/// @nodoc
mixin _$ProcessedSuccess {
  String get item;

  /// Create a copy of ProcessedSuccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcessedSuccessCopyWith<ProcessedSuccess> get copyWith =>
      _$ProcessedSuccessCopyWithImpl<ProcessedSuccess>(
          this as ProcessedSuccess, _$identity);

  /// Serializes this ProcessedSuccess to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcessedSuccess &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ProcessedSuccess(item: $item)';
  }
}

/// @nodoc
abstract mixin class $ProcessedSuccessCopyWith<$Res> {
  factory $ProcessedSuccessCopyWith(
          ProcessedSuccess value, $Res Function(ProcessedSuccess) _then) =
      _$ProcessedSuccessCopyWithImpl;
  @useResult
  $Res call({String item});
}

/// @nodoc
class _$ProcessedSuccessCopyWithImpl<$Res>
    implements $ProcessedSuccessCopyWith<$Res> {
  _$ProcessedSuccessCopyWithImpl(this._self, this._then);

  final ProcessedSuccess _self;
  final $Res Function(ProcessedSuccess) _then;

  /// Create a copy of ProcessedSuccess
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

/// @nodoc
@JsonSerializable()
class _ProcessedSuccess implements ProcessedSuccess {
  const _ProcessedSuccess({required this.item});
  factory _ProcessedSuccess.fromJson(Map<String, dynamic> json) =>
      _$ProcessedSuccessFromJson(json);

  @override
  final String item;

  /// Create a copy of ProcessedSuccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcessedSuccessCopyWith<_ProcessedSuccess> get copyWith =>
      __$ProcessedSuccessCopyWithImpl<_ProcessedSuccess>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProcessedSuccessToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcessedSuccess &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ProcessedSuccess(item: $item)';
  }
}

/// @nodoc
abstract mixin class _$ProcessedSuccessCopyWith<$Res>
    implements $ProcessedSuccessCopyWith<$Res> {
  factory _$ProcessedSuccessCopyWith(
          _ProcessedSuccess value, $Res Function(_ProcessedSuccess) _then) =
      __$ProcessedSuccessCopyWithImpl;
  @override
  @useResult
  $Res call({String item});
}

/// @nodoc
class __$ProcessedSuccessCopyWithImpl<$Res>
    implements _$ProcessedSuccessCopyWith<$Res> {
  __$ProcessedSuccessCopyWithImpl(this._self, this._then);

  final _ProcessedSuccess _self;
  final $Res Function(_ProcessedSuccess) _then;

  /// Create a copy of ProcessedSuccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(_ProcessedSuccess(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProcessedError {
  String get item;
  String get error;

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcessedErrorCopyWith<ProcessedError> get copyWith =>
      _$ProcessedErrorCopyWithImpl<ProcessedError>(
          this as ProcessedError, _$identity);

  /// Serializes this ProcessedError to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcessedError &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, error);

  @override
  String toString() {
    return 'ProcessedError(item: $item, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ProcessedErrorCopyWith<$Res> {
  factory $ProcessedErrorCopyWith(
          ProcessedError value, $Res Function(ProcessedError) _then) =
      _$ProcessedErrorCopyWithImpl;
  @useResult
  $Res call({String item, String error});
}

/// @nodoc
class _$ProcessedErrorCopyWithImpl<$Res>
    implements $ProcessedErrorCopyWith<$Res> {
  _$ProcessedErrorCopyWithImpl(this._self, this._then);

  final ProcessedError _self;
  final $Res Function(ProcessedError) _then;

  /// Create a copy of ProcessedError
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

/// @nodoc
@JsonSerializable()
class _ProcessedError implements ProcessedError {
  const _ProcessedError({required this.item, required this.error});
  factory _ProcessedError.fromJson(Map<String, dynamic> json) =>
      _$ProcessedErrorFromJson(json);

  @override
  final String item;
  @override
  final String error;

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcessedErrorCopyWith<_ProcessedError> get copyWith =>
      __$ProcessedErrorCopyWithImpl<_ProcessedError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProcessedErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcessedError &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, error);

  @override
  String toString() {
    return 'ProcessedError(item: $item, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ProcessedErrorCopyWith<$Res>
    implements $ProcessedErrorCopyWith<$Res> {
  factory _$ProcessedErrorCopyWith(
          _ProcessedError value, $Res Function(_ProcessedError) _then) =
      __$ProcessedErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String item, String error});
}

/// @nodoc
class __$ProcessedErrorCopyWithImpl<$Res>
    implements _$ProcessedErrorCopyWith<$Res> {
  __$ProcessedErrorCopyWithImpl(this._self, this._then);

  final _ProcessedError _self;
  final $Res Function(_ProcessedError) _then;

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? error = null,
  }) {
    return _then(_ProcessedError(
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
