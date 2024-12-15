// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domains.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Domains _$DomainsFromJson(Map<String, dynamic> json) {
  return _Domains.fromJson(json);
}

/// @nodoc
mixin _$Domains {
  List<Domain> get domains => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this Domains to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainsCopyWith<Domains> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainsCopyWith<$Res> {
  factory $DomainsCopyWith(Domains value, $Res Function(Domains) then) =
      _$DomainsCopyWithImpl<$Res, Domains>;
  @useResult
  $Res call({List<Domain> domains, double took});
}

/// @nodoc
class _$DomainsCopyWithImpl<$Res, $Val extends Domains>
    implements $DomainsCopyWith<$Res> {
  _$DomainsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainsImplCopyWith<$Res> implements $DomainsCopyWith<$Res> {
  factory _$$DomainsImplCopyWith(
          _$DomainsImpl value, $Res Function(_$DomainsImpl) then) =
      __$$DomainsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Domain> domains, double took});
}

/// @nodoc
class __$$DomainsImplCopyWithImpl<$Res>
    extends _$DomainsCopyWithImpl<$Res, _$DomainsImpl>
    implements _$$DomainsImplCopyWith<$Res> {
  __$$DomainsImplCopyWithImpl(
      _$DomainsImpl _value, $Res Function(_$DomainsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? took = null,
  }) {
    return _then(_$DomainsImpl(
      domains: null == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainsImpl implements _Domains {
  const _$DomainsImpl({required final List<Domain> domains, required this.took})
      : _domains = domains;

  factory _$DomainsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainsImplFromJson(json);

  final List<Domain> _domains;
  @override
  List<Domain> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  final double took;

  @override
  String toString() {
    return 'Domains(domains: $domains, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainsImpl &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_domains), took);

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainsImplCopyWith<_$DomainsImpl> get copyWith =>
      __$$DomainsImplCopyWithImpl<_$DomainsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainsImplToJson(
      this,
    );
  }
}

abstract class _Domains implements Domains {
  const factory _Domains(
      {required final List<Domain> domains,
      required final double took}) = _$DomainsImpl;

  factory _Domains.fromJson(Map<String, dynamic> json) = _$DomainsImpl.fromJson;

  @override
  List<Domain> get domains;
  @override
  double get took;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainsImplCopyWith<_$DomainsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddDomains _$AddDomainsFromJson(Map<String, dynamic> json) {
  return _AddDomains.fromJson(json);
}

/// @nodoc
mixin _$AddDomains {
  List<Domain> get domains => throw _privateConstructorUsedError;
  Processed get processed => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this AddDomains to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDomainsCopyWith<AddDomains> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDomainsCopyWith<$Res> {
  factory $AddDomainsCopyWith(
          AddDomains value, $Res Function(AddDomains) then) =
      _$AddDomainsCopyWithImpl<$Res, AddDomains>;
  @useResult
  $Res call({List<Domain> domains, Processed processed, double took});

  $ProcessedCopyWith<$Res> get processed;
}

/// @nodoc
class _$AddDomainsCopyWithImpl<$Res, $Val extends AddDomains>
    implements $AddDomainsCopyWith<$Res> {
  _$AddDomainsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? processed = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      processed: null == processed
          ? _value.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProcessedCopyWith<$Res> get processed {
    return $ProcessedCopyWith<$Res>(_value.processed, (value) {
      return _then(_value.copyWith(processed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddDomainsImplCopyWith<$Res>
    implements $AddDomainsCopyWith<$Res> {
  factory _$$AddDomainsImplCopyWith(
          _$AddDomainsImpl value, $Res Function(_$AddDomainsImpl) then) =
      __$$AddDomainsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Domain> domains, Processed processed, double took});

  @override
  $ProcessedCopyWith<$Res> get processed;
}

/// @nodoc
class __$$AddDomainsImplCopyWithImpl<$Res>
    extends _$AddDomainsCopyWithImpl<$Res, _$AddDomainsImpl>
    implements _$$AddDomainsImplCopyWith<$Res> {
  __$$AddDomainsImplCopyWithImpl(
      _$AddDomainsImpl _value, $Res Function(_$AddDomainsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? processed = null,
    Object? took = null,
  }) {
    return _then(_$AddDomainsImpl(
      domains: null == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      processed: null == processed
          ? _value.processed
          : processed // ignore: cast_nullable_to_non_nullable
              as Processed,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDomainsImpl implements _AddDomains {
  const _$AddDomainsImpl(
      {required final List<Domain> domains,
      required this.processed,
      required this.took})
      : _domains = domains;

  factory _$AddDomainsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDomainsImplFromJson(json);

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

  @override
  String toString() {
    return 'AddDomains(domains: $domains, processed: $processed, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDomainsImpl &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.processed, processed) ||
                other.processed == processed) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_domains), processed, took);

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDomainsImplCopyWith<_$AddDomainsImpl> get copyWith =>
      __$$AddDomainsImplCopyWithImpl<_$AddDomainsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDomainsImplToJson(
      this,
    );
  }
}

abstract class _AddDomains implements AddDomains {
  const factory _AddDomains(
      {required final List<Domain> domains,
      required final Processed processed,
      required final double took}) = _$AddDomainsImpl;

  factory _AddDomains.fromJson(Map<String, dynamic> json) =
      _$AddDomainsImpl.fromJson;

  @override
  List<Domain> get domains;
  @override
  Processed get processed;
  @override
  double get took;

  /// Create a copy of AddDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDomainsImplCopyWith<_$AddDomainsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Domain _$DomainFromJson(Map<String, dynamic> json) {
  return _Domain.fromJson(json);
}

/// @nodoc
mixin _$Domain {
  String get domain => throw _privateConstructorUsedError; // Domain
  String get unicode => throw _privateConstructorUsedError; // Unicode domain
  String get type =>
      throw _privateConstructorUsedError; // Domain type (allow | deny)
  String get kind =>
      throw _privateConstructorUsedError; // Domain kind (exact | regex)
  String? get comment =>
      throw _privateConstructorUsedError; // Optional user-provided comment
  List<int> get groups =>
      throw _privateConstructorUsedError; // Array of group IDs
  bool get enabled =>
      throw _privateConstructorUsedError; // Status of domain (default true)
  int get id => throw _privateConstructorUsedError; // Database ID
  @JsonKey(name: 'date_added')
  int get dateAdded => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_modified')
  int get dateModified => throw _privateConstructorUsedError;

  /// Serializes this Domain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainCopyWith<Domain> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainCopyWith<$Res> {
  factory $DomainCopyWith(Domain value, $Res Function(Domain) then) =
      _$DomainCopyWithImpl<$Res, Domain>;
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
class _$DomainCopyWithImpl<$Res, $Val extends Domain>
    implements $DomainCopyWith<$Res> {
  _$DomainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      unicode: null == unicode
          ? _value.unicode
          : unicode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<int>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainImplCopyWith<$Res> implements $DomainCopyWith<$Res> {
  factory _$$DomainImplCopyWith(
          _$DomainImpl value, $Res Function(_$DomainImpl) then) =
      __$$DomainImplCopyWithImpl<$Res>;
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
class __$$DomainImplCopyWithImpl<$Res>
    extends _$DomainCopyWithImpl<$Res, _$DomainImpl>
    implements _$$DomainImplCopyWith<$Res> {
  __$$DomainImplCopyWithImpl(
      _$DomainImpl _value, $Res Function(_$DomainImpl) _then)
      : super(_value, _then);

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
    return _then(_$DomainImpl(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      unicode: null == unicode
          ? _value.unicode
          : unicode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<int>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainImpl implements _Domain {
  const _$DomainImpl(
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

  factory _$DomainImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainImplFromJson(json);

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

  @override
  String toString() {
    return 'Domain(domain: $domain, unicode: $unicode, type: $type, kind: $kind, comment: $comment, groups: $groups, enabled: $enabled, id: $id, dateAdded: $dateAdded, dateModified: $dateModified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainImpl &&
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

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainImplCopyWith<_$DomainImpl> get copyWith =>
      __$$DomainImplCopyWithImpl<_$DomainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainImplToJson(
      this,
    );
  }
}

abstract class _Domain implements Domain {
  const factory _Domain(
          {required final String domain,
          required final String unicode,
          required final String type,
          required final String kind,
          required final String? comment,
          required final List<int> groups,
          required final bool enabled,
          required final int id,
          @JsonKey(name: 'date_added') required final int dateAdded,
          @JsonKey(name: 'date_modified') required final int dateModified}) =
      _$DomainImpl;

  factory _Domain.fromJson(Map<String, dynamic> json) = _$DomainImpl.fromJson;

  @override
  String get domain; // Domain
  @override
  String get unicode; // Unicode domain
  @override
  String get type; // Domain type (allow | deny)
  @override
  String get kind; // Domain kind (exact | regex)
  @override
  String? get comment; // Optional user-provided comment
  @override
  List<int> get groups; // Array of group IDs
  @override
  bool get enabled; // Status of domain (default true)
  @override
  int get id; // Database ID
  @override
  @JsonKey(name: 'date_added')
  int get dateAdded;
  @override
  @JsonKey(name: 'date_modified')
  int get dateModified;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainImplCopyWith<_$DomainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Processed _$ProcessedFromJson(Map<String, dynamic> json) {
  return _Processed.fromJson(json);
}

/// @nodoc
mixin _$Processed {
  List<ProcessedItem> get success => throw _privateConstructorUsedError;
  List<ProcessedError> get errors => throw _privateConstructorUsedError;

  /// Serializes this Processed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessedCopyWith<Processed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessedCopyWith<$Res> {
  factory $ProcessedCopyWith(Processed value, $Res Function(Processed) then) =
      _$ProcessedCopyWithImpl<$Res, Processed>;
  @useResult
  $Res call({List<ProcessedItem> success, List<ProcessedError> errors});
}

/// @nodoc
class _$ProcessedCopyWithImpl<$Res, $Val extends Processed>
    implements $ProcessedCopyWith<$Res> {
  _$ProcessedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as List<ProcessedItem>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ProcessedError>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessedImplCopyWith<$Res>
    implements $ProcessedCopyWith<$Res> {
  factory _$$ProcessedImplCopyWith(
          _$ProcessedImpl value, $Res Function(_$ProcessedImpl) then) =
      __$$ProcessedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProcessedItem> success, List<ProcessedError> errors});
}

/// @nodoc
class __$$ProcessedImplCopyWithImpl<$Res>
    extends _$ProcessedCopyWithImpl<$Res, _$ProcessedImpl>
    implements _$$ProcessedImplCopyWith<$Res> {
  __$$ProcessedImplCopyWithImpl(
      _$ProcessedImpl _value, $Res Function(_$ProcessedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? errors = null,
  }) {
    return _then(_$ProcessedImpl(
      success: null == success
          ? _value._success
          : success // ignore: cast_nullable_to_non_nullable
              as List<ProcessedItem>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ProcessedError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessedImpl implements _Processed {
  const _$ProcessedImpl(
      {required final List<ProcessedItem> success,
      required final List<ProcessedError> errors})
      : _success = success,
        _errors = errors;

  factory _$ProcessedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessedImplFromJson(json);

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

  @override
  String toString() {
    return 'Processed(success: $success, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessedImpl &&
            const DeepCollectionEquality().equals(other._success, _success) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_success),
      const DeepCollectionEquality().hash(_errors));

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessedImplCopyWith<_$ProcessedImpl> get copyWith =>
      __$$ProcessedImplCopyWithImpl<_$ProcessedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessedImplToJson(
      this,
    );
  }
}

abstract class _Processed implements Processed {
  const factory _Processed(
      {required final List<ProcessedItem> success,
      required final List<ProcessedError> errors}) = _$ProcessedImpl;

  factory _Processed.fromJson(Map<String, dynamic> json) =
      _$ProcessedImpl.fromJson;

  @override
  List<ProcessedItem> get success;
  @override
  List<ProcessedError> get errors;

  /// Create a copy of Processed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessedImplCopyWith<_$ProcessedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProcessedItem _$ProcessedItemFromJson(Map<String, dynamic> json) {
  return _ProcessedItem.fromJson(json);
}

/// @nodoc
mixin _$ProcessedItem {
  String get item => throw _privateConstructorUsedError;

  /// Serializes this ProcessedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessedItemCopyWith<ProcessedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessedItemCopyWith<$Res> {
  factory $ProcessedItemCopyWith(
          ProcessedItem value, $Res Function(ProcessedItem) then) =
      _$ProcessedItemCopyWithImpl<$Res, ProcessedItem>;
  @useResult
  $Res call({String item});
}

/// @nodoc
class _$ProcessedItemCopyWithImpl<$Res, $Val extends ProcessedItem>
    implements $ProcessedItemCopyWith<$Res> {
  _$ProcessedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessedItemImplCopyWith<$Res>
    implements $ProcessedItemCopyWith<$Res> {
  factory _$$ProcessedItemImplCopyWith(
          _$ProcessedItemImpl value, $Res Function(_$ProcessedItemImpl) then) =
      __$$ProcessedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String item});
}

/// @nodoc
class __$$ProcessedItemImplCopyWithImpl<$Res>
    extends _$ProcessedItemCopyWithImpl<$Res, _$ProcessedItemImpl>
    implements _$$ProcessedItemImplCopyWith<$Res> {
  __$$ProcessedItemImplCopyWithImpl(
      _$ProcessedItemImpl _value, $Res Function(_$ProcessedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$ProcessedItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessedItemImpl implements _ProcessedItem {
  const _$ProcessedItemImpl({required this.item});

  factory _$ProcessedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessedItemImplFromJson(json);

  @override
  final String item;

  @override
  String toString() {
    return 'ProcessedItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessedItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessedItemImplCopyWith<_$ProcessedItemImpl> get copyWith =>
      __$$ProcessedItemImplCopyWithImpl<_$ProcessedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessedItemImplToJson(
      this,
    );
  }
}

abstract class _ProcessedItem implements ProcessedItem {
  const factory _ProcessedItem({required final String item}) =
      _$ProcessedItemImpl;

  factory _ProcessedItem.fromJson(Map<String, dynamic> json) =
      _$ProcessedItemImpl.fromJson;

  @override
  String get item;

  /// Create a copy of ProcessedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessedItemImplCopyWith<_$ProcessedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProcessedError _$ProcessedErrorFromJson(Map<String, dynamic> json) {
  return _ProcessedError.fromJson(json);
}

/// @nodoc
mixin _$ProcessedError {
  String get item => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Serializes this ProcessedError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessedErrorCopyWith<ProcessedError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessedErrorCopyWith<$Res> {
  factory $ProcessedErrorCopyWith(
          ProcessedError value, $Res Function(ProcessedError) then) =
      _$ProcessedErrorCopyWithImpl<$Res, ProcessedError>;
  @useResult
  $Res call({String item, String error});
}

/// @nodoc
class _$ProcessedErrorCopyWithImpl<$Res, $Val extends ProcessedError>
    implements $ProcessedErrorCopyWith<$Res> {
  _$ProcessedErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessedErrorImplCopyWith<$Res>
    implements $ProcessedErrorCopyWith<$Res> {
  factory _$$ProcessedErrorImplCopyWith(_$ProcessedErrorImpl value,
          $Res Function(_$ProcessedErrorImpl) then) =
      __$$ProcessedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String item, String error});
}

/// @nodoc
class __$$ProcessedErrorImplCopyWithImpl<$Res>
    extends _$ProcessedErrorCopyWithImpl<$Res, _$ProcessedErrorImpl>
    implements _$$ProcessedErrorImplCopyWith<$Res> {
  __$$ProcessedErrorImplCopyWithImpl(
      _$ProcessedErrorImpl _value, $Res Function(_$ProcessedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? error = null,
  }) {
    return _then(_$ProcessedErrorImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessedErrorImpl implements _ProcessedError {
  const _$ProcessedErrorImpl({required this.item, required this.error});

  factory _$ProcessedErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessedErrorImplFromJson(json);

  @override
  final String item;
  @override
  final String error;

  @override
  String toString() {
    return 'ProcessedError(item: $item, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessedErrorImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, error);

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessedErrorImplCopyWith<_$ProcessedErrorImpl> get copyWith =>
      __$$ProcessedErrorImplCopyWithImpl<_$ProcessedErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessedErrorImplToJson(
      this,
    );
  }
}

abstract class _ProcessedError implements ProcessedError {
  const factory _ProcessedError(
      {required final String item,
      required final String error}) = _$ProcessedErrorImpl;

  factory _ProcessedError.fromJson(Map<String, dynamic> json) =
      _$ProcessedErrorImpl.fromJson;

  @override
  String get item;
  @override
  String get error;

  /// Create a copy of ProcessedError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessedErrorImplCopyWith<_$ProcessedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
