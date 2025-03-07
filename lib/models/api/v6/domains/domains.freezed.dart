// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Domains {
  List<Domain> get domains;
  double get took;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DomainsCopyWith<Domains> get copyWith =>
      _$DomainsCopyWithImpl<Domains>(this as Domains, _$identity);

  /// Serializes this Domains to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Domains &&
            const DeepCollectionEquality().equals(other.domains, domains) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(domains), took);

  @override
  String toString() {
    return 'Domains(domains: $domains, took: $took)';
  }
}

/// @nodoc
abstract mixin class $DomainsCopyWith<$Res> {
  factory $DomainsCopyWith(Domains value, $Res Function(Domains) _then) =
      _$DomainsCopyWithImpl;
  @useResult
  $Res call({List<Domain> domains, double took});
}

/// @nodoc
class _$DomainsCopyWithImpl<$Res> implements $DomainsCopyWith<$Res> {
  _$DomainsCopyWithImpl(this._self, this._then);

  final Domains _self;
  final $Res Function(Domains) _then;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      domains: null == domains
          ? _self.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Domains implements Domains {
  const _Domains({required final List<Domain> domains, required this.took})
      : _domains = domains;
  factory _Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);

  final List<Domain> _domains;
  @override
  List<Domain> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  final double took;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DomainsCopyWith<_Domains> get copyWith =>
      __$DomainsCopyWithImpl<_Domains>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DomainsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Domains &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_domains), took);

  @override
  String toString() {
    return 'Domains(domains: $domains, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$DomainsCopyWith<$Res> implements $DomainsCopyWith<$Res> {
  factory _$DomainsCopyWith(_Domains value, $Res Function(_Domains) _then) =
      __$DomainsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Domain> domains, double took});
}

/// @nodoc
class __$DomainsCopyWithImpl<$Res> implements _$DomainsCopyWith<$Res> {
  __$DomainsCopyWithImpl(this._self, this._then);

  final _Domains _self;
  final $Res Function(_Domains) _then;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domains = null,
    Object? took = null,
  }) {
    return _then(_Domains(
      domains: null == domains
          ? _self._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$AddDomains {
  List<Domain> get domains;
  Processed get processed;
  double get took;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddDomainsCopyWith<AddDomains> get copyWith =>
      _$AddDomainsCopyWithImpl<AddDomains>(this as AddDomains, _$identity);

  /// Serializes this AddDomains to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddDomains &&
            const DeepCollectionEquality().equals(other.domains, domains) &&
            (identical(other.processed, processed) ||
                other.processed == processed) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(domains), processed, took);

  @override
  String toString() {
    return 'AddDomains(domains: $domains, processed: $processed, took: $took)';
  }
}

/// @nodoc
abstract mixin class $AddDomainsCopyWith<$Res> {
  factory $AddDomainsCopyWith(
          AddDomains value, $Res Function(AddDomains) _then) =
      _$AddDomainsCopyWithImpl;
  @useResult
  $Res call({List<Domain> domains, Processed processed, double took});

  $ProcessedCopyWith<$Res> get processed;
}

/// @nodoc
class _$AddDomainsCopyWithImpl<$Res> implements $AddDomainsCopyWith<$Res> {
  _$AddDomainsCopyWithImpl(this._self, this._then);

  final AddDomains _self;
  final $Res Function(AddDomains) _then;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? processed = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      domains: null == domains
          ? _self.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      processed: null == processed
          ? _self.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProcessedCopyWith<$Res> get processed {
    return $ProcessedCopyWith<$Res>(_self.processed, (value) {
      return _then(_self.copyWith(processed: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AddDomains implements AddDomains {
  const _AddDomains(
      {required final List<Domain> domains,
      required this.processed,
      required this.took})
      : _domains = domains;
  factory _AddDomains.fromJson(Map<String, dynamic> json) =>
      _$AddDomainsFromJson(json);

  final List<Domain> _domains;
  @override
  List<Domain> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  final Processed processed;
  @override
  final double took;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddDomainsCopyWith<_AddDomains> get copyWith =>
      __$AddDomainsCopyWithImpl<_AddDomains>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddDomainsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddDomains &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.processed, processed) ||
                other.processed == processed) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_domains), processed, took);

  @override
  String toString() {
    return 'AddDomains(domains: $domains, processed: $processed, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$AddDomainsCopyWith<$Res>
    implements $AddDomainsCopyWith<$Res> {
  factory _$AddDomainsCopyWith(
          _AddDomains value, $Res Function(_AddDomains) _then) =
      __$AddDomainsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Domain> domains, Processed processed, double took});

  @override
  $ProcessedCopyWith<$Res> get processed;
}

/// @nodoc
class __$AddDomainsCopyWithImpl<$Res> implements _$AddDomainsCopyWith<$Res> {
  __$AddDomainsCopyWithImpl(this._self, this._then);

  final _AddDomains _self;
  final $Res Function(_AddDomains) _then;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domains = null,
    Object? processed = null,
    Object? took = null,
  }) {
    return _then(_AddDomains(
      domains: null == domains
          ? _self._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      processed: null == processed
          ? _self.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProcessedCopyWith<$Res> get processed {
    return $ProcessedCopyWith<$Res>(_self.processed, (value) {
      return _then(_self.copyWith(processed: value));
    });
  }
}

/// @nodoc
mixin _$Domain {
  String get domain; // Domain
  String get unicode; // Unicode domain
  String get type; // Domain type (allow | deny)
  String get kind; // Domain kind (exact | regex)
  String? get comment; // Optional user-provided comment
  List<int> get groups; // Array of group IDs
  bool get enabled; // Status of domain (default true)
  int get id; // Database ID
  @JsonKey(name: 'date_added')
  int get dateAdded;
  @JsonKey(name: 'date_modified')
  int get dateModified;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DomainCopyWith<Domain> get copyWith =>
      _$DomainCopyWithImpl<Domain>(this as Domain, _$identity);

  /// Serializes this Domain to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Domain &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.unicode, unicode) || other.unicode == unicode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      domain,
      unicode,
      type,
      kind,
      comment,
      const DeepCollectionEquality().hash(groups),
      enabled,
      id,
      dateAdded,
      dateModified);

  @override
  String toString() {
    return 'Domain(domain: $domain, unicode: $unicode, type: $type, kind: $kind, comment: $comment, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified)';
  }
}

/// @nodoc
abstract mixin class $DomainCopyWith<$Res> {
  factory $DomainCopyWith(Domain value, $Res Function(Domain) _then) =
      _$DomainCopyWithImpl;
  @useResult
  $Res call(
      {String domain,
      String unicode,
      String type,
      String kind,
      String? comment,
      List<int> groups,
      bool enabled,
      int id,
      @JsonKey(name: 'date_added') int dateAdded,
      @JsonKey(name: 'date_modified') int dateModified});
}

/// @nodoc
class _$DomainCopyWithImpl<$Res> implements $DomainCopyWith<$Res> {
  _$DomainCopyWithImpl(this._self, this._then);

  final Domain _self;
  final $Res Function(Domain) _then;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
    Object? unicode = null,
    Object? type = null,
    Object? kind = null,
    Object? comment = freezed,
    Object? groups = null,
    Object? enabled = null,
    Object? id = null,
    Object? dateAdded = null,
    Object? dateModified = null,
  }) {
    return _then(_self.copyWith(
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      unicode: null == unicode
          ? _self.unicode
          : unicode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Domain implements Domain {
  const _Domain(
      {required this.domain,
      required this.unicode,
      required this.type,
      required this.kind,
      required this.comment,
      required final List<int> groups,
      required this.enabled,
      required this.id,
      @JsonKey(name: 'date_added') required this.dateAdded,
      @JsonKey(name: 'date_modified') required this.dateModified})
      : _groups = groups;
  factory _Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);

  @override
  final String domain;
// Domain
  @override
  final String unicode;
// Unicode domain
  @override
  final String type;
// Domain type (allow | deny)
  @override
  final String kind;
// Domain kind (exact | regex)
  @override
  final String? comment;
// Optional user-provided comment
  final List<int> _groups;
// Optional user-provided comment
  @override
  List<int> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

// Array of group IDs
  @override
  final bool enabled;
// Status of domain (default true)
  @override
  final int id;
// Database ID
  @override
  @JsonKey(name: 'date_added')
  final int dateAdded;
  @override
  @JsonKey(name: 'date_modified')
  final int dateModified;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DomainCopyWith<_Domain> get copyWith =>
      __$DomainCopyWithImpl<_Domain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DomainToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Domain &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.unicode, unicode) || other.unicode == unicode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      domain,
      unicode,
      type,
      kind,
      comment,
      const DeepCollectionEquality().hash(_groups),
      enabled,
      id,
      dateAdded,
      dateModified);

  @override
  String toString() {
    return 'Domain(domain: $domain, unicode: $unicode, type: $type, kind: $kind, comment: $comment, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified)';
  }
}

/// @nodoc
abstract mixin class _$DomainCopyWith<$Res> implements $DomainCopyWith<$Res> {
  factory _$DomainCopyWith(_Domain value, $Res Function(_Domain) _then) =
      __$DomainCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String domain,
      String unicode,
      String type,
      String kind,
      String? comment,
      List<int> groups,
      bool enabled,
      int id,
      @JsonKey(name: 'date_added') int dateAdded,
      @JsonKey(name: 'date_modified') int dateModified});
}

/// @nodoc
class __$DomainCopyWithImpl<$Res> implements _$DomainCopyWith<$Res> {
  __$DomainCopyWithImpl(this._self, this._then);

  final _Domain _self;
  final $Res Function(_Domain) _then;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domain = null,
    Object? unicode = null,
    Object? type = null,
    Object? kind = null,
    Object? comment = freezed,
    Object? groups = null,
    Object? enabled = null,
    Object? id = null,
    Object? dateAdded = null,
    Object? dateModified = null,
  }) {
    return _then(_Domain(
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      unicode: null == unicode
          ? _self.unicode
          : unicode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
mixin _$Processed {
  List<ProcessedItem> get success;
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
  $Res call({List<ProcessedItem> success, List<ProcessedError> errors});
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
              as List<ProcessedItem>,
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
      {required final List<ProcessedItem> success,
      required final List<ProcessedError> errors})
      : _success = success,
        _errors = errors;
  factory _Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);

  final List<ProcessedItem> _success;
  @override
  List<ProcessedItem> get success {
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
  $Res call({List<ProcessedItem> success, List<ProcessedError> errors});
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
              as List<ProcessedItem>,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ProcessedError>,
    ));
  }
}

/// @nodoc
mixin _$ProcessedItem {
  String get item;

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProcessedItemCopyWith<ProcessedItem> get copyWith =>
      _$ProcessedItemCopyWithImpl<ProcessedItem>(
          this as ProcessedItem, _$identity);

  /// Serializes this ProcessedItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProcessedItem &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ProcessedItem(item: $item)';
  }
}

/// @nodoc
abstract mixin class $ProcessedItemCopyWith<$Res> {
  factory $ProcessedItemCopyWith(
          ProcessedItem value, $Res Function(ProcessedItem) _then) =
      _$ProcessedItemCopyWithImpl;
  @useResult
  $Res call({String item});
}

/// @nodoc
class _$ProcessedItemCopyWithImpl<$Res>
    implements $ProcessedItemCopyWith<$Res> {
  _$ProcessedItemCopyWithImpl(this._self, this._then);

  final ProcessedItem _self;
  final $Res Function(ProcessedItem) _then;

  /// Create a copy of ProcessedItem
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
class _ProcessedItem implements ProcessedItem {
  const _ProcessedItem({required this.item});
  factory _ProcessedItem.fromJson(Map<String, dynamic> json) =>
      _$ProcessedItemFromJson(json);

  @override
  final String item;

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcessedItemCopyWith<_ProcessedItem> get copyWith =>
      __$ProcessedItemCopyWithImpl<_ProcessedItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProcessedItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcessedItem &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ProcessedItem(item: $item)';
  }
}

/// @nodoc
abstract mixin class _$ProcessedItemCopyWith<$Res>
    implements $ProcessedItemCopyWith<$Res> {
  factory _$ProcessedItemCopyWith(
          _ProcessedItem value, $Res Function(_ProcessedItem) _then) =
      __$ProcessedItemCopyWithImpl;
  @override
  @useResult
  $Res call({String item});
}

/// @nodoc
class __$ProcessedItemCopyWithImpl<$Res>
    implements _$ProcessedItemCopyWith<$Res> {
  __$ProcessedItemCopyWithImpl(this._self, this._then);

  final _ProcessedItem _self;
  final $Res Function(_ProcessedItem) _then;

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(_ProcessedItem(
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
