// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatsSummary _$StatsSummaryFromJson(Map<String, dynamic> json) {
  return _StatsSummary.fromJson(json);
}

/// @nodoc
mixin _$StatsSummary {
  Queries get queries => throw _privateConstructorUsedError;
  Clients get clients => throw _privateConstructorUsedError;
  Gravity get gravity => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this StatsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsSummaryCopyWith<StatsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsSummaryCopyWith<$Res> {
  factory $StatsSummaryCopyWith(
          StatsSummary value, $Res Function(StatsSummary) then) =
      _$StatsSummaryCopyWithImpl<$Res, StatsSummary>;
  @useResult
  $Res call({Queries queries, Clients clients, Gravity gravity, double took});

  $QueriesCopyWith<$Res> get queries;
  $ClientsCopyWith<$Res> get clients;
  $GravityCopyWith<$Res> get gravity;
}

/// @nodoc
class _$StatsSummaryCopyWithImpl<$Res, $Val extends StatsSummary>
    implements $StatsSummaryCopyWith<$Res> {
  _$StatsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queries = null,
    Object? clients = null,
    Object? gravity = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      queries: null == queries
          ? _value.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as Queries,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      gravity: null == gravity
          ? _value.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as Gravity,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QueriesCopyWith<$Res> get queries {
    return $QueriesCopyWith<$Res>(_value.queries, (value) {
      return _then(_value.copyWith(queries: value) as $Val);
    });
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res> get clients {
    return $ClientsCopyWith<$Res>(_value.clients, (value) {
      return _then(_value.copyWith(clients: value) as $Val);
    });
  }

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravityCopyWith<$Res> get gravity {
    return $GravityCopyWith<$Res>(_value.gravity, (value) {
      return _then(_value.copyWith(gravity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatsSummaryImplCopyWith<$Res>
    implements $StatsSummaryCopyWith<$Res> {
  factory _$$StatsSummaryImplCopyWith(
          _$StatsSummaryImpl value, $Res Function(_$StatsSummaryImpl) then) =
      __$$StatsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Queries queries, Clients clients, Gravity gravity, double took});

  @override
  $QueriesCopyWith<$Res> get queries;
  @override
  $ClientsCopyWith<$Res> get clients;
  @override
  $GravityCopyWith<$Res> get gravity;
}

/// @nodoc
class __$$StatsSummaryImplCopyWithImpl<$Res>
    extends _$StatsSummaryCopyWithImpl<$Res, _$StatsSummaryImpl>
    implements _$$StatsSummaryImplCopyWith<$Res> {
  __$$StatsSummaryImplCopyWithImpl(
      _$StatsSummaryImpl _value, $Res Function(_$StatsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queries = null,
    Object? clients = null,
    Object? gravity = null,
    Object? took = null,
  }) {
    return _then(_$StatsSummaryImpl(
      queries: null == queries
          ? _value.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as Queries,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      gravity: null == gravity
          ? _value.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as Gravity,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsSummaryImpl implements _StatsSummary {
  const _$StatsSummaryImpl(
      {required this.queries,
      required this.clients,
      required this.gravity,
      required this.took});

  factory _$StatsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsSummaryImplFromJson(json);

  @override
  final Queries queries;
  @override
  final Clients clients;
  @override
  final Gravity gravity;
  @override
  final double took;

  @override
  String toString() {
    return 'StatsSummary(queries: $queries, clients: $clients, gravity: $gravity, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsSummaryImpl &&
            (identical(other.queries, queries) || other.queries == queries) &&
            (identical(other.clients, clients) || other.clients == clients) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, queries, clients, gravity, took);

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsSummaryImplCopyWith<_$StatsSummaryImpl> get copyWith =>
      __$$StatsSummaryImplCopyWithImpl<_$StatsSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsSummaryImplToJson(
      this,
    );
  }
}

abstract class _StatsSummary implements StatsSummary {
  const factory _StatsSummary(
      {required final Queries queries,
      required final Clients clients,
      required final Gravity gravity,
      required final double took}) = _$StatsSummaryImpl;

  factory _StatsSummary.fromJson(Map<String, dynamic> json) =
      _$StatsSummaryImpl.fromJson;

  @override
  Queries get queries;
  @override
  Clients get clients;
  @override
  Gravity get gravity;
  @override
  double get took;

  /// Create a copy of StatsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsSummaryImplCopyWith<_$StatsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Queries _$QueriesFromJson(Map<String, dynamic> json) {
  return _Queries.fromJson(json);
}

/// @nodoc
mixin _$Queries {
  int get total => throw _privateConstructorUsedError;
  int get blocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_blocked')
  double get percentBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'unique_domains')
  int get uniqueDomains => throw _privateConstructorUsedError;
  int get forwarded => throw _privateConstructorUsedError;
  int get cached => throw _privateConstructorUsedError;
  Types get types => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Replies get replies => throw _privateConstructorUsedError;

  /// Serializes this Queries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueriesCopyWith<Queries> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueriesCopyWith<$Res> {
  factory $QueriesCopyWith(Queries value, $Res Function(Queries) then) =
      _$QueriesCopyWithImpl<$Res, Queries>;
  @useResult
  $Res call(
      {int total,
      int blocked,
      @JsonKey(name: 'percent_blocked') double percentBlocked,
      @JsonKey(name: 'unique_domains') int uniqueDomains,
      int forwarded,
      int cached,
      Types types,
      Status status,
      Replies replies});

  $TypesCopyWith<$Res> get types;
  $StatusCopyWith<$Res> get status;
  $RepliesCopyWith<$Res> get replies;
}

/// @nodoc
class _$QueriesCopyWithImpl<$Res, $Val extends Queries>
    implements $QueriesCopyWith<$Res> {
  _$QueriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? blocked = null,
    Object? percentBlocked = null,
    Object? uniqueDomains = null,
    Object? forwarded = null,
    Object? cached = null,
    Object? types = null,
    Object? status = null,
    Object? replies = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      percentBlocked: null == percentBlocked
          ? _value.percentBlocked
          : percentBlocked // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueDomains: null == uniqueDomains
          ? _value.uniqueDomains
          : uniqueDomains // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _value.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Types,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as Replies,
    ) as $Val);
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypesCopyWith<$Res> get types {
    return $TypesCopyWith<$Res>(_value.types, (value) {
      return _then(_value.copyWith(types: value) as $Val);
    });
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepliesCopyWith<$Res> get replies {
    return $RepliesCopyWith<$Res>(_value.replies, (value) {
      return _then(_value.copyWith(replies: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QueriesImplCopyWith<$Res> implements $QueriesCopyWith<$Res> {
  factory _$$QueriesImplCopyWith(
          _$QueriesImpl value, $Res Function(_$QueriesImpl) then) =
      __$$QueriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int blocked,
      @JsonKey(name: 'percent_blocked') double percentBlocked,
      @JsonKey(name: 'unique_domains') int uniqueDomains,
      int forwarded,
      int cached,
      Types types,
      Status status,
      Replies replies});

  @override
  $TypesCopyWith<$Res> get types;
  @override
  $StatusCopyWith<$Res> get status;
  @override
  $RepliesCopyWith<$Res> get replies;
}

/// @nodoc
class __$$QueriesImplCopyWithImpl<$Res>
    extends _$QueriesCopyWithImpl<$Res, _$QueriesImpl>
    implements _$$QueriesImplCopyWith<$Res> {
  __$$QueriesImplCopyWithImpl(
      _$QueriesImpl _value, $Res Function(_$QueriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? blocked = null,
    Object? percentBlocked = null,
    Object? uniqueDomains = null,
    Object? forwarded = null,
    Object? cached = null,
    Object? types = null,
    Object? status = null,
    Object? replies = null,
  }) {
    return _then(_$QueriesImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      percentBlocked: null == percentBlocked
          ? _value.percentBlocked
          : percentBlocked // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueDomains: null == uniqueDomains
          ? _value.uniqueDomains
          : uniqueDomains // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _value.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as Types,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as Replies,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueriesImpl implements _Queries {
  const _$QueriesImpl(
      {required this.total,
      required this.blocked,
      @JsonKey(name: 'percent_blocked') required this.percentBlocked,
      @JsonKey(name: 'unique_domains') required this.uniqueDomains,
      required this.forwarded,
      required this.cached,
      required this.types,
      required this.status,
      required this.replies});

  factory _$QueriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueriesImplFromJson(json);

  @override
  final int total;
  @override
  final int blocked;
  @override
  @JsonKey(name: 'percent_blocked')
  final double percentBlocked;
  @override
  @JsonKey(name: 'unique_domains')
  final int uniqueDomains;
  @override
  final int forwarded;
  @override
  final int cached;
  @override
  final Types types;
  @override
  final Status status;
  @override
  final Replies replies;

  @override
  String toString() {
    return 'Queries(total: $total, blocked: $blocked, percentBlocked: $percentBlocked, uniqueDomains: $uniqueDomains, forwarded: $forwarded, cached: $cached, types: $types, status: $status, replies: $replies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueriesImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.percentBlocked, percentBlocked) ||
                other.percentBlocked == percentBlocked) &&
            (identical(other.uniqueDomains, uniqueDomains) ||
                other.uniqueDomains == uniqueDomains) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.types, types) || other.types == types) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.replies, replies) || other.replies == replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, blocked, percentBlocked,
      uniqueDomains, forwarded, cached, types, status, replies);

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueriesImplCopyWith<_$QueriesImpl> get copyWith =>
      __$$QueriesImplCopyWithImpl<_$QueriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueriesImplToJson(
      this,
    );
  }
}

abstract class _Queries implements Queries {
  const factory _Queries(
      {required final int total,
      required final int blocked,
      @JsonKey(name: 'percent_blocked') required final double percentBlocked,
      @JsonKey(name: 'unique_domains') required final int uniqueDomains,
      required final int forwarded,
      required final int cached,
      required final Types types,
      required final Status status,
      required final Replies replies}) = _$QueriesImpl;

  factory _Queries.fromJson(Map<String, dynamic> json) = _$QueriesImpl.fromJson;

  @override
  int get total;
  @override
  int get blocked;
  @override
  @JsonKey(name: 'percent_blocked')
  double get percentBlocked;
  @override
  @JsonKey(name: 'unique_domains')
  int get uniqueDomains;
  @override
  int get forwarded;
  @override
  int get cached;
  @override
  Types get types;
  @override
  Status get status;
  @override
  Replies get replies;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueriesImplCopyWith<_$QueriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Types _$TypesFromJson(Map<String, dynamic> json) {
  return _Types.fromJson(json);
}

/// @nodoc
mixin _$Types {
  @JsonKey(name: 'A')
  int get a => throw _privateConstructorUsedError;
  @JsonKey(name: 'AAAA')
  int get aaaa => throw _privateConstructorUsedError;
  @JsonKey(name: 'ANY')
  int get any => throw _privateConstructorUsedError;
  @JsonKey(name: 'SRV')
  int get srv => throw _privateConstructorUsedError;
  @JsonKey(name: 'SOA')
  int get soa => throw _privateConstructorUsedError;
  @JsonKey(name: 'PTR')
  int get ptr => throw _privateConstructorUsedError;
  @JsonKey(name: 'TXT')
  int get txt => throw _privateConstructorUsedError;
  @JsonKey(name: 'NAPTR')
  int get naptr => throw _privateConstructorUsedError;
  @JsonKey(name: 'MX')
  int get mx => throw _privateConstructorUsedError;
  @JsonKey(name: 'DS')
  int get ds => throw _privateConstructorUsedError;
  @JsonKey(name: 'RRSIG')
  int get rrsig => throw _privateConstructorUsedError;
  @JsonKey(name: 'DNSKEY')
  int get dnskey => throw _privateConstructorUsedError;
  @JsonKey(name: 'NS')
  int get ns => throw _privateConstructorUsedError;
  @JsonKey(name: 'SVCB')
  int get svcb => throw _privateConstructorUsedError;
  @JsonKey(name: 'HTTPS')
  int get https => throw _privateConstructorUsedError;
  @JsonKey(name: 'OTHER')
  int get other => throw _privateConstructorUsedError;

  /// Serializes this Types to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypesCopyWith<Types> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypesCopyWith<$Res> {
  factory $TypesCopyWith(Types value, $Res Function(Types) then) =
      _$TypesCopyWithImpl<$Res, Types>;
  @useResult
  $Res call(
      {@JsonKey(name: 'A') int a,
      @JsonKey(name: 'AAAA') int aaaa,
      @JsonKey(name: 'ANY') int any,
      @JsonKey(name: 'SRV') int srv,
      @JsonKey(name: 'SOA') int soa,
      @JsonKey(name: 'PTR') int ptr,
      @JsonKey(name: 'TXT') int txt,
      @JsonKey(name: 'NAPTR') int naptr,
      @JsonKey(name: 'MX') int mx,
      @JsonKey(name: 'DS') int ds,
      @JsonKey(name: 'RRSIG') int rrsig,
      @JsonKey(name: 'DNSKEY') int dnskey,
      @JsonKey(name: 'NS') int ns,
      @JsonKey(name: 'SVCB') int svcb,
      @JsonKey(name: 'HTTPS') int https,
      @JsonKey(name: 'OTHER') int other});
}

/// @nodoc
class _$TypesCopyWithImpl<$Res, $Val extends Types>
    implements $TypesCopyWith<$Res> {
  _$TypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? aaaa = null,
    Object? any = null,
    Object? srv = null,
    Object? soa = null,
    Object? ptr = null,
    Object? txt = null,
    Object? naptr = null,
    Object? mx = null,
    Object? ds = null,
    Object? rrsig = null,
    Object? dnskey = null,
    Object? ns = null,
    Object? svcb = null,
    Object? https = null,
    Object? other = null,
  }) {
    return _then(_value.copyWith(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      aaaa: null == aaaa
          ? _value.aaaa
          : aaaa // ignore: cast_nullable_to_non_nullable
              as int,
      any: null == any
          ? _value.any
          : any // ignore: cast_nullable_to_non_nullable
              as int,
      srv: null == srv
          ? _value.srv
          : srv // ignore: cast_nullable_to_non_nullable
              as int,
      soa: null == soa
          ? _value.soa
          : soa // ignore: cast_nullable_to_non_nullable
              as int,
      ptr: null == ptr
          ? _value.ptr
          : ptr // ignore: cast_nullable_to_non_nullable
              as int,
      txt: null == txt
          ? _value.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as int,
      naptr: null == naptr
          ? _value.naptr
          : naptr // ignore: cast_nullable_to_non_nullable
              as int,
      mx: null == mx
          ? _value.mx
          : mx // ignore: cast_nullable_to_non_nullable
              as int,
      ds: null == ds
          ? _value.ds
          : ds // ignore: cast_nullable_to_non_nullable
              as int,
      rrsig: null == rrsig
          ? _value.rrsig
          : rrsig // ignore: cast_nullable_to_non_nullable
              as int,
      dnskey: null == dnskey
          ? _value.dnskey
          : dnskey // ignore: cast_nullable_to_non_nullable
              as int,
      ns: null == ns
          ? _value.ns
          : ns // ignore: cast_nullable_to_non_nullable
              as int,
      svcb: null == svcb
          ? _value.svcb
          : svcb // ignore: cast_nullable_to_non_nullable
              as int,
      https: null == https
          ? _value.https
          : https // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypesImplCopyWith<$Res> implements $TypesCopyWith<$Res> {
  factory _$$TypesImplCopyWith(
          _$TypesImpl value, $Res Function(_$TypesImpl) then) =
      __$$TypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'A') int a,
      @JsonKey(name: 'AAAA') int aaaa,
      @JsonKey(name: 'ANY') int any,
      @JsonKey(name: 'SRV') int srv,
      @JsonKey(name: 'SOA') int soa,
      @JsonKey(name: 'PTR') int ptr,
      @JsonKey(name: 'TXT') int txt,
      @JsonKey(name: 'NAPTR') int naptr,
      @JsonKey(name: 'MX') int mx,
      @JsonKey(name: 'DS') int ds,
      @JsonKey(name: 'RRSIG') int rrsig,
      @JsonKey(name: 'DNSKEY') int dnskey,
      @JsonKey(name: 'NS') int ns,
      @JsonKey(name: 'SVCB') int svcb,
      @JsonKey(name: 'HTTPS') int https,
      @JsonKey(name: 'OTHER') int other});
}

/// @nodoc
class __$$TypesImplCopyWithImpl<$Res>
    extends _$TypesCopyWithImpl<$Res, _$TypesImpl>
    implements _$$TypesImplCopyWith<$Res> {
  __$$TypesImplCopyWithImpl(
      _$TypesImpl _value, $Res Function(_$TypesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? aaaa = null,
    Object? any = null,
    Object? srv = null,
    Object? soa = null,
    Object? ptr = null,
    Object? txt = null,
    Object? naptr = null,
    Object? mx = null,
    Object? ds = null,
    Object? rrsig = null,
    Object? dnskey = null,
    Object? ns = null,
    Object? svcb = null,
    Object? https = null,
    Object? other = null,
  }) {
    return _then(_$TypesImpl(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      aaaa: null == aaaa
          ? _value.aaaa
          : aaaa // ignore: cast_nullable_to_non_nullable
              as int,
      any: null == any
          ? _value.any
          : any // ignore: cast_nullable_to_non_nullable
              as int,
      srv: null == srv
          ? _value.srv
          : srv // ignore: cast_nullable_to_non_nullable
              as int,
      soa: null == soa
          ? _value.soa
          : soa // ignore: cast_nullable_to_non_nullable
              as int,
      ptr: null == ptr
          ? _value.ptr
          : ptr // ignore: cast_nullable_to_non_nullable
              as int,
      txt: null == txt
          ? _value.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as int,
      naptr: null == naptr
          ? _value.naptr
          : naptr // ignore: cast_nullable_to_non_nullable
              as int,
      mx: null == mx
          ? _value.mx
          : mx // ignore: cast_nullable_to_non_nullable
              as int,
      ds: null == ds
          ? _value.ds
          : ds // ignore: cast_nullable_to_non_nullable
              as int,
      rrsig: null == rrsig
          ? _value.rrsig
          : rrsig // ignore: cast_nullable_to_non_nullable
              as int,
      dnskey: null == dnskey
          ? _value.dnskey
          : dnskey // ignore: cast_nullable_to_non_nullable
              as int,
      ns: null == ns
          ? _value.ns
          : ns // ignore: cast_nullable_to_non_nullable
              as int,
      svcb: null == svcb
          ? _value.svcb
          : svcb // ignore: cast_nullable_to_non_nullable
              as int,
      https: null == https
          ? _value.https
          : https // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypesImpl implements _Types {
  const _$TypesImpl(
      {@JsonKey(name: 'A') required this.a,
      @JsonKey(name: 'AAAA') required this.aaaa,
      @JsonKey(name: 'ANY') required this.any,
      @JsonKey(name: 'SRV') required this.srv,
      @JsonKey(name: 'SOA') required this.soa,
      @JsonKey(name: 'PTR') required this.ptr,
      @JsonKey(name: 'TXT') required this.txt,
      @JsonKey(name: 'NAPTR') required this.naptr,
      @JsonKey(name: 'MX') required this.mx,
      @JsonKey(name: 'DS') required this.ds,
      @JsonKey(name: 'RRSIG') required this.rrsig,
      @JsonKey(name: 'DNSKEY') required this.dnskey,
      @JsonKey(name: 'NS') required this.ns,
      @JsonKey(name: 'SVCB') required this.svcb,
      @JsonKey(name: 'HTTPS') required this.https,
      @JsonKey(name: 'OTHER') required this.other});

  factory _$TypesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypesImplFromJson(json);

  @override
  @JsonKey(name: 'A')
  final int a;
  @override
  @JsonKey(name: 'AAAA')
  final int aaaa;
  @override
  @JsonKey(name: 'ANY')
  final int any;
  @override
  @JsonKey(name: 'SRV')
  final int srv;
  @override
  @JsonKey(name: 'SOA')
  final int soa;
  @override
  @JsonKey(name: 'PTR')
  final int ptr;
  @override
  @JsonKey(name: 'TXT')
  final int txt;
  @override
  @JsonKey(name: 'NAPTR')
  final int naptr;
  @override
  @JsonKey(name: 'MX')
  final int mx;
  @override
  @JsonKey(name: 'DS')
  final int ds;
  @override
  @JsonKey(name: 'RRSIG')
  final int rrsig;
  @override
  @JsonKey(name: 'DNSKEY')
  final int dnskey;
  @override
  @JsonKey(name: 'NS')
  final int ns;
  @override
  @JsonKey(name: 'SVCB')
  final int svcb;
  @override
  @JsonKey(name: 'HTTPS')
  final int https;
  @override
  @JsonKey(name: 'OTHER')
  final int other;

  @override
  String toString() {
    return 'Types(a: $a, aaaa: $aaaa, any: $any, srv: $srv, soa: $soa, ptr: $ptr, txt: $txt, naptr: $naptr, mx: $mx, ds: $ds, rrsig: $rrsig, dnskey: $dnskey, ns: $ns, svcb: $svcb, https: $https, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypesImpl &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.aaaa, aaaa) || other.aaaa == aaaa) &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.srv, srv) || other.srv == srv) &&
            (identical(other.soa, soa) || other.soa == soa) &&
            (identical(other.ptr, ptr) || other.ptr == ptr) &&
            (identical(other.txt, txt) || other.txt == txt) &&
            (identical(other.naptr, naptr) || other.naptr == naptr) &&
            (identical(other.mx, mx) || other.mx == mx) &&
            (identical(other.ds, ds) || other.ds == ds) &&
            (identical(other.rrsig, rrsig) || other.rrsig == rrsig) &&
            (identical(other.dnskey, dnskey) || other.dnskey == dnskey) &&
            (identical(other.ns, ns) || other.ns == ns) &&
            (identical(other.svcb, svcb) || other.svcb == svcb) &&
            (identical(other.https, https) || other.https == https) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, a, aaaa, any, srv, soa, ptr, txt,
      naptr, mx, ds, rrsig, dnskey, ns, svcb, https, other);

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypesImplCopyWith<_$TypesImpl> get copyWith =>
      __$$TypesImplCopyWithImpl<_$TypesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypesImplToJson(
      this,
    );
  }
}

abstract class _Types implements Types {
  const factory _Types(
      {@JsonKey(name: 'A') required final int a,
      @JsonKey(name: 'AAAA') required final int aaaa,
      @JsonKey(name: 'ANY') required final int any,
      @JsonKey(name: 'SRV') required final int srv,
      @JsonKey(name: 'SOA') required final int soa,
      @JsonKey(name: 'PTR') required final int ptr,
      @JsonKey(name: 'TXT') required final int txt,
      @JsonKey(name: 'NAPTR') required final int naptr,
      @JsonKey(name: 'MX') required final int mx,
      @JsonKey(name: 'DS') required final int ds,
      @JsonKey(name: 'RRSIG') required final int rrsig,
      @JsonKey(name: 'DNSKEY') required final int dnskey,
      @JsonKey(name: 'NS') required final int ns,
      @JsonKey(name: 'SVCB') required final int svcb,
      @JsonKey(name: 'HTTPS') required final int https,
      @JsonKey(name: 'OTHER') required final int other}) = _$TypesImpl;

  factory _Types.fromJson(Map<String, dynamic> json) = _$TypesImpl.fromJson;

  @override
  @JsonKey(name: 'A')
  int get a;
  @override
  @JsonKey(name: 'AAAA')
  int get aaaa;
  @override
  @JsonKey(name: 'ANY')
  int get any;
  @override
  @JsonKey(name: 'SRV')
  int get srv;
  @override
  @JsonKey(name: 'SOA')
  int get soa;
  @override
  @JsonKey(name: 'PTR')
  int get ptr;
  @override
  @JsonKey(name: 'TXT')
  int get txt;
  @override
  @JsonKey(name: 'NAPTR')
  int get naptr;
  @override
  @JsonKey(name: 'MX')
  int get mx;
  @override
  @JsonKey(name: 'DS')
  int get ds;
  @override
  @JsonKey(name: 'RRSIG')
  int get rrsig;
  @override
  @JsonKey(name: 'DNSKEY')
  int get dnskey;
  @override
  @JsonKey(name: 'NS')
  int get ns;
  @override
  @JsonKey(name: 'SVCB')
  int get svcb;
  @override
  @JsonKey(name: 'HTTPS')
  int get https;
  @override
  @JsonKey(name: 'OTHER')
  int get other;

  /// Create a copy of Types
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypesImplCopyWith<_$TypesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  @JsonKey(name: 'UNKNOWN')
  int get unknown => throw _privateConstructorUsedError;
  @JsonKey(name: 'GRAVITY')
  int get gravity => throw _privateConstructorUsedError;
  @JsonKey(name: 'FORWARDED')
  int get forwarded => throw _privateConstructorUsedError;
  @JsonKey(name: 'CACHE')
  int get cache => throw _privateConstructorUsedError;
  @JsonKey(name: 'REGEX')
  int get regex => throw _privateConstructorUsedError;
  @JsonKey(name: 'DENYLIST')
  int get denylist => throw _privateConstructorUsedError;
  @JsonKey(name: 'EXTERNAL_BLOCKED_IP')
  int get externalBlockedIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'EXTERNAL_BLOCKED_NULL')
  int get externalBlockedNull => throw _privateConstructorUsedError;
  @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA')
  int get externalBlockedNxra => throw _privateConstructorUsedError;
  @JsonKey(name: 'GRAVITY_CNAME')
  int get gravityCname => throw _privateConstructorUsedError;
  @JsonKey(name: 'REGEX_CNAME')
  int get regexCname => throw _privateConstructorUsedError;
  @JsonKey(name: 'DENYLIST_CNAME')
  int get denylistCname => throw _privateConstructorUsedError;
  @JsonKey(name: 'RETRIED')
  int get retried => throw _privateConstructorUsedError;
  @JsonKey(name: 'RETRIED_DNSSEC')
  int get retriedDnssec => throw _privateConstructorUsedError;
  @JsonKey(name: 'IN_PROGRESS')
  int get inProgress => throw _privateConstructorUsedError;
  @JsonKey(name: 'DBBUSY')
  int get dbbusy => throw _privateConstructorUsedError;
  @JsonKey(name: 'SPECIAL_DOMAIN')
  int get specialDomain => throw _privateConstructorUsedError;
  @JsonKey(name: 'CACHE_STALE')
  int get cacheStale => throw _privateConstructorUsedError;

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'GRAVITY') int gravity,
      @JsonKey(name: 'FORWARDED') int forwarded,
      @JsonKey(name: 'CACHE') int cache,
      @JsonKey(name: 'REGEX') int regex,
      @JsonKey(name: 'DENYLIST') int denylist,
      @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
      @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
      @JsonKey(name: 'REGEX_CNAME') int regexCname,
      @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
      @JsonKey(name: 'RETRIED') int retried,
      @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
      @JsonKey(name: 'IN_PROGRESS') int inProgress,
      @JsonKey(name: 'DBBUSY') int dbbusy,
      @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
      @JsonKey(name: 'CACHE_STALE') int cacheStale});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = null,
    Object? gravity = null,
    Object? forwarded = null,
    Object? cache = null,
    Object? regex = null,
    Object? denylist = null,
    Object? externalBlockedIp = null,
    Object? externalBlockedNull = null,
    Object? externalBlockedNxra = null,
    Object? gravityCname = null,
    Object? regexCname = null,
    Object? denylistCname = null,
    Object? retried = null,
    Object? retriedDnssec = null,
    Object? inProgress = null,
    Object? dbbusy = null,
    Object? specialDomain = null,
    Object? cacheStale = null,
  }) {
    return _then(_value.copyWith(
      unknown: null == unknown
          ? _value.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      gravity: null == gravity
          ? _value.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _value.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cache: null == cache
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as int,
      regex: null == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as int,
      denylist: null == denylist
          ? _value.denylist
          : denylist // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedIp: null == externalBlockedIp
          ? _value.externalBlockedIp
          : externalBlockedIp // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNull: null == externalBlockedNull
          ? _value.externalBlockedNull
          : externalBlockedNull // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNxra: null == externalBlockedNxra
          ? _value.externalBlockedNxra
          : externalBlockedNxra // ignore: cast_nullable_to_non_nullable
              as int,
      gravityCname: null == gravityCname
          ? _value.gravityCname
          : gravityCname // ignore: cast_nullable_to_non_nullable
              as int,
      regexCname: null == regexCname
          ? _value.regexCname
          : regexCname // ignore: cast_nullable_to_non_nullable
              as int,
      denylistCname: null == denylistCname
          ? _value.denylistCname
          : denylistCname // ignore: cast_nullable_to_non_nullable
              as int,
      retried: null == retried
          ? _value.retried
          : retried // ignore: cast_nullable_to_non_nullable
              as int,
      retriedDnssec: null == retriedDnssec
          ? _value.retriedDnssec
          : retriedDnssec // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      dbbusy: null == dbbusy
          ? _value.dbbusy
          : dbbusy // ignore: cast_nullable_to_non_nullable
              as int,
      specialDomain: null == specialDomain
          ? _value.specialDomain
          : specialDomain // ignore: cast_nullable_to_non_nullable
              as int,
      cacheStale: null == cacheStale
          ? _value.cacheStale
          : cacheStale // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'GRAVITY') int gravity,
      @JsonKey(name: 'FORWARDED') int forwarded,
      @JsonKey(name: 'CACHE') int cache,
      @JsonKey(name: 'REGEX') int regex,
      @JsonKey(name: 'DENYLIST') int denylist,
      @JsonKey(name: 'EXTERNAL_BLOCKED_IP') int externalBlockedIp,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') int externalBlockedNull,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') int externalBlockedNxra,
      @JsonKey(name: 'GRAVITY_CNAME') int gravityCname,
      @JsonKey(name: 'REGEX_CNAME') int regexCname,
      @JsonKey(name: 'DENYLIST_CNAME') int denylistCname,
      @JsonKey(name: 'RETRIED') int retried,
      @JsonKey(name: 'RETRIED_DNSSEC') int retriedDnssec,
      @JsonKey(name: 'IN_PROGRESS') int inProgress,
      @JsonKey(name: 'DBBUSY') int dbbusy,
      @JsonKey(name: 'SPECIAL_DOMAIN') int specialDomain,
      @JsonKey(name: 'CACHE_STALE') int cacheStale});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = null,
    Object? gravity = null,
    Object? forwarded = null,
    Object? cache = null,
    Object? regex = null,
    Object? denylist = null,
    Object? externalBlockedIp = null,
    Object? externalBlockedNull = null,
    Object? externalBlockedNxra = null,
    Object? gravityCname = null,
    Object? regexCname = null,
    Object? denylistCname = null,
    Object? retried = null,
    Object? retriedDnssec = null,
    Object? inProgress = null,
    Object? dbbusy = null,
    Object? specialDomain = null,
    Object? cacheStale = null,
  }) {
    return _then(_$StatusImpl(
      unknown: null == unknown
          ? _value.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      gravity: null == gravity
          ? _value.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _value.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
      cache: null == cache
          ? _value.cache
          : cache // ignore: cast_nullable_to_non_nullable
              as int,
      regex: null == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as int,
      denylist: null == denylist
          ? _value.denylist
          : denylist // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedIp: null == externalBlockedIp
          ? _value.externalBlockedIp
          : externalBlockedIp // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNull: null == externalBlockedNull
          ? _value.externalBlockedNull
          : externalBlockedNull // ignore: cast_nullable_to_non_nullable
              as int,
      externalBlockedNxra: null == externalBlockedNxra
          ? _value.externalBlockedNxra
          : externalBlockedNxra // ignore: cast_nullable_to_non_nullable
              as int,
      gravityCname: null == gravityCname
          ? _value.gravityCname
          : gravityCname // ignore: cast_nullable_to_non_nullable
              as int,
      regexCname: null == regexCname
          ? _value.regexCname
          : regexCname // ignore: cast_nullable_to_non_nullable
              as int,
      denylistCname: null == denylistCname
          ? _value.denylistCname
          : denylistCname // ignore: cast_nullable_to_non_nullable
              as int,
      retried: null == retried
          ? _value.retried
          : retried // ignore: cast_nullable_to_non_nullable
              as int,
      retriedDnssec: null == retriedDnssec
          ? _value.retriedDnssec
          : retriedDnssec // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      dbbusy: null == dbbusy
          ? _value.dbbusy
          : dbbusy // ignore: cast_nullable_to_non_nullable
              as int,
      specialDomain: null == specialDomain
          ? _value.specialDomain
          : specialDomain // ignore: cast_nullable_to_non_nullable
              as int,
      cacheStale: null == cacheStale
          ? _value.cacheStale
          : cacheStale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusImpl implements _Status {
  const _$StatusImpl(
      {@JsonKey(name: 'UNKNOWN') required this.unknown,
      @JsonKey(name: 'GRAVITY') required this.gravity,
      @JsonKey(name: 'FORWARDED') required this.forwarded,
      @JsonKey(name: 'CACHE') required this.cache,
      @JsonKey(name: 'REGEX') required this.regex,
      @JsonKey(name: 'DENYLIST') required this.denylist,
      @JsonKey(name: 'EXTERNAL_BLOCKED_IP') required this.externalBlockedIp,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NULL') required this.externalBlockedNull,
      @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA') required this.externalBlockedNxra,
      @JsonKey(name: 'GRAVITY_CNAME') required this.gravityCname,
      @JsonKey(name: 'REGEX_CNAME') required this.regexCname,
      @JsonKey(name: 'DENYLIST_CNAME') required this.denylistCname,
      @JsonKey(name: 'RETRIED') required this.retried,
      @JsonKey(name: 'RETRIED_DNSSEC') required this.retriedDnssec,
      @JsonKey(name: 'IN_PROGRESS') required this.inProgress,
      @JsonKey(name: 'DBBUSY') required this.dbbusy,
      @JsonKey(name: 'SPECIAL_DOMAIN') required this.specialDomain,
      @JsonKey(name: 'CACHE_STALE') required this.cacheStale});

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  @JsonKey(name: 'UNKNOWN')
  final int unknown;
  @override
  @JsonKey(name: 'GRAVITY')
  final int gravity;
  @override
  @JsonKey(name: 'FORWARDED')
  final int forwarded;
  @override
  @JsonKey(name: 'CACHE')
  final int cache;
  @override
  @JsonKey(name: 'REGEX')
  final int regex;
  @override
  @JsonKey(name: 'DENYLIST')
  final int denylist;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_IP')
  final int externalBlockedIp;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_NULL')
  final int externalBlockedNull;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA')
  final int externalBlockedNxra;
  @override
  @JsonKey(name: 'GRAVITY_CNAME')
  final int gravityCname;
  @override
  @JsonKey(name: 'REGEX_CNAME')
  final int regexCname;
  @override
  @JsonKey(name: 'DENYLIST_CNAME')
  final int denylistCname;
  @override
  @JsonKey(name: 'RETRIED')
  final int retried;
  @override
  @JsonKey(name: 'RETRIED_DNSSEC')
  final int retriedDnssec;
  @override
  @JsonKey(name: 'IN_PROGRESS')
  final int inProgress;
  @override
  @JsonKey(name: 'DBBUSY')
  final int dbbusy;
  @override
  @JsonKey(name: 'SPECIAL_DOMAIN')
  final int specialDomain;
  @override
  @JsonKey(name: 'CACHE_STALE')
  final int cacheStale;

  @override
  String toString() {
    return 'Status(unknown: $unknown, gravity: $gravity, forwarded: $forwarded, cache: $cache, regex: $regex, denylist: $denylist, externalBlockedIp: $externalBlockedIp, externalBlockedNull: $externalBlockedNull, externalBlockedNxra: $externalBlockedNxra, gravityCname: $gravityCname, regexCname: $regexCname, denylistCname: $denylistCname, retried: $retried, retriedDnssec: $retriedDnssec, inProgress: $inProgress, dbbusy: $dbbusy, specialDomain: $specialDomain, cacheStale: $cacheStale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded) &&
            (identical(other.cache, cache) || other.cache == cache) &&
            (identical(other.regex, regex) || other.regex == regex) &&
            (identical(other.denylist, denylist) ||
                other.denylist == denylist) &&
            (identical(other.externalBlockedIp, externalBlockedIp) ||
                other.externalBlockedIp == externalBlockedIp) &&
            (identical(other.externalBlockedNull, externalBlockedNull) ||
                other.externalBlockedNull == externalBlockedNull) &&
            (identical(other.externalBlockedNxra, externalBlockedNxra) ||
                other.externalBlockedNxra == externalBlockedNxra) &&
            (identical(other.gravityCname, gravityCname) ||
                other.gravityCname == gravityCname) &&
            (identical(other.regexCname, regexCname) ||
                other.regexCname == regexCname) &&
            (identical(other.denylistCname, denylistCname) ||
                other.denylistCname == denylistCname) &&
            (identical(other.retried, retried) || other.retried == retried) &&
            (identical(other.retriedDnssec, retriedDnssec) ||
                other.retriedDnssec == retriedDnssec) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.dbbusy, dbbusy) || other.dbbusy == dbbusy) &&
            (identical(other.specialDomain, specialDomain) ||
                other.specialDomain == specialDomain) &&
            (identical(other.cacheStale, cacheStale) ||
                other.cacheStale == cacheStale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      unknown,
      gravity,
      forwarded,
      cache,
      regex,
      denylist,
      externalBlockedIp,
      externalBlockedNull,
      externalBlockedNxra,
      gravityCname,
      regexCname,
      denylistCname,
      retried,
      retriedDnssec,
      inProgress,
      dbbusy,
      specialDomain,
      cacheStale);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status implements Status {
  const factory _Status(
          {@JsonKey(name: 'UNKNOWN') required final int unknown,
          @JsonKey(name: 'GRAVITY') required final int gravity,
          @JsonKey(name: 'FORWARDED') required final int forwarded,
          @JsonKey(name: 'CACHE') required final int cache,
          @JsonKey(name: 'REGEX') required final int regex,
          @JsonKey(name: 'DENYLIST') required final int denylist,
          @JsonKey(name: 'EXTERNAL_BLOCKED_IP')
          required final int externalBlockedIp,
          @JsonKey(name: 'EXTERNAL_BLOCKED_NULL')
          required final int externalBlockedNull,
          @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA')
          required final int externalBlockedNxra,
          @JsonKey(name: 'GRAVITY_CNAME') required final int gravityCname,
          @JsonKey(name: 'REGEX_CNAME') required final int regexCname,
          @JsonKey(name: 'DENYLIST_CNAME') required final int denylistCname,
          @JsonKey(name: 'RETRIED') required final int retried,
          @JsonKey(name: 'RETRIED_DNSSEC') required final int retriedDnssec,
          @JsonKey(name: 'IN_PROGRESS') required final int inProgress,
          @JsonKey(name: 'DBBUSY') required final int dbbusy,
          @JsonKey(name: 'SPECIAL_DOMAIN') required final int specialDomain,
          @JsonKey(name: 'CACHE_STALE') required final int cacheStale}) =
      _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  @JsonKey(name: 'UNKNOWN')
  int get unknown;
  @override
  @JsonKey(name: 'GRAVITY')
  int get gravity;
  @override
  @JsonKey(name: 'FORWARDED')
  int get forwarded;
  @override
  @JsonKey(name: 'CACHE')
  int get cache;
  @override
  @JsonKey(name: 'REGEX')
  int get regex;
  @override
  @JsonKey(name: 'DENYLIST')
  int get denylist;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_IP')
  int get externalBlockedIp;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_NULL')
  int get externalBlockedNull;
  @override
  @JsonKey(name: 'EXTERNAL_BLOCKED_NXRA')
  int get externalBlockedNxra;
  @override
  @JsonKey(name: 'GRAVITY_CNAME')
  int get gravityCname;
  @override
  @JsonKey(name: 'REGEX_CNAME')
  int get regexCname;
  @override
  @JsonKey(name: 'DENYLIST_CNAME')
  int get denylistCname;
  @override
  @JsonKey(name: 'RETRIED')
  int get retried;
  @override
  @JsonKey(name: 'RETRIED_DNSSEC')
  int get retriedDnssec;
  @override
  @JsonKey(name: 'IN_PROGRESS')
  int get inProgress;
  @override
  @JsonKey(name: 'DBBUSY')
  int get dbbusy;
  @override
  @JsonKey(name: 'SPECIAL_DOMAIN')
  int get specialDomain;
  @override
  @JsonKey(name: 'CACHE_STALE')
  int get cacheStale;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Replies _$RepliesFromJson(Map<String, dynamic> json) {
  return _Replies.fromJson(json);
}

/// @nodoc
mixin _$Replies {
  @JsonKey(name: 'UNKNOWN')
  int get unknown => throw _privateConstructorUsedError;
  @JsonKey(name: 'NODATA')
  int get nodata => throw _privateConstructorUsedError;
  @JsonKey(name: 'NXDOMAIN')
  int get nxdomain => throw _privateConstructorUsedError;
  @JsonKey(name: 'CNAME')
  int get cname => throw _privateConstructorUsedError;
  @JsonKey(name: 'IP')
  int get ip => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOMAIN')
  int get domain => throw _privateConstructorUsedError;
  @JsonKey(name: 'RRNAME')
  int get rrname => throw _privateConstructorUsedError;
  @JsonKey(name: 'SERVFAIL')
  int get servfail => throw _privateConstructorUsedError;
  @JsonKey(name: 'REFUSED')
  int get refused => throw _privateConstructorUsedError;
  @JsonKey(name: 'NOTIMP')
  int get notimp => throw _privateConstructorUsedError;
  @JsonKey(name: 'OTHER')
  int get other => throw _privateConstructorUsedError;
  @JsonKey(name: 'DNSSEC')
  int get dnssec => throw _privateConstructorUsedError;
  @JsonKey(name: 'NONE')
  int get none => throw _privateConstructorUsedError;
  @JsonKey(name: 'BLOB')
  int get blob => throw _privateConstructorUsedError;

  /// Serializes this Replies to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepliesCopyWith<Replies> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliesCopyWith<$Res> {
  factory $RepliesCopyWith(Replies value, $Res Function(Replies) then) =
      _$RepliesCopyWithImpl<$Res, Replies>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'NODATA') int nodata,
      @JsonKey(name: 'NXDOMAIN') int nxdomain,
      @JsonKey(name: 'CNAME') int cname,
      @JsonKey(name: 'IP') int ip,
      @JsonKey(name: 'DOMAIN') int domain,
      @JsonKey(name: 'RRNAME') int rrname,
      @JsonKey(name: 'SERVFAIL') int servfail,
      @JsonKey(name: 'REFUSED') int refused,
      @JsonKey(name: 'NOTIMP') int notimp,
      @JsonKey(name: 'OTHER') int other,
      @JsonKey(name: 'DNSSEC') int dnssec,
      @JsonKey(name: 'NONE') int none,
      @JsonKey(name: 'BLOB') int blob});
}

/// @nodoc
class _$RepliesCopyWithImpl<$Res, $Val extends Replies>
    implements $RepliesCopyWith<$Res> {
  _$RepliesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = null,
    Object? nodata = null,
    Object? nxdomain = null,
    Object? cname = null,
    Object? ip = null,
    Object? domain = null,
    Object? rrname = null,
    Object? servfail = null,
    Object? refused = null,
    Object? notimp = null,
    Object? other = null,
    Object? dnssec = null,
    Object? none = null,
    Object? blob = null,
  }) {
    return _then(_value.copyWith(
      unknown: null == unknown
          ? _value.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      nodata: null == nodata
          ? _value.nodata
          : nodata // ignore: cast_nullable_to_non_nullable
              as int,
      nxdomain: null == nxdomain
          ? _value.nxdomain
          : nxdomain // ignore: cast_nullable_to_non_nullable
              as int,
      cname: null == cname
          ? _value.cname
          : cname // ignore: cast_nullable_to_non_nullable
              as int,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as int,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as int,
      rrname: null == rrname
          ? _value.rrname
          : rrname // ignore: cast_nullable_to_non_nullable
              as int,
      servfail: null == servfail
          ? _value.servfail
          : servfail // ignore: cast_nullable_to_non_nullable
              as int,
      refused: null == refused
          ? _value.refused
          : refused // ignore: cast_nullable_to_non_nullable
              as int,
      notimp: null == notimp
          ? _value.notimp
          : notimp // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
      dnssec: null == dnssec
          ? _value.dnssec
          : dnssec // ignore: cast_nullable_to_non_nullable
              as int,
      none: null == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as int,
      blob: null == blob
          ? _value.blob
          : blob // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepliesImplCopyWith<$Res> implements $RepliesCopyWith<$Res> {
  factory _$$RepliesImplCopyWith(
          _$RepliesImpl value, $Res Function(_$RepliesImpl) then) =
      __$$RepliesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UNKNOWN') int unknown,
      @JsonKey(name: 'NODATA') int nodata,
      @JsonKey(name: 'NXDOMAIN') int nxdomain,
      @JsonKey(name: 'CNAME') int cname,
      @JsonKey(name: 'IP') int ip,
      @JsonKey(name: 'DOMAIN') int domain,
      @JsonKey(name: 'RRNAME') int rrname,
      @JsonKey(name: 'SERVFAIL') int servfail,
      @JsonKey(name: 'REFUSED') int refused,
      @JsonKey(name: 'NOTIMP') int notimp,
      @JsonKey(name: 'OTHER') int other,
      @JsonKey(name: 'DNSSEC') int dnssec,
      @JsonKey(name: 'NONE') int none,
      @JsonKey(name: 'BLOB') int blob});
}

/// @nodoc
class __$$RepliesImplCopyWithImpl<$Res>
    extends _$RepliesCopyWithImpl<$Res, _$RepliesImpl>
    implements _$$RepliesImplCopyWith<$Res> {
  __$$RepliesImplCopyWithImpl(
      _$RepliesImpl _value, $Res Function(_$RepliesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = null,
    Object? nodata = null,
    Object? nxdomain = null,
    Object? cname = null,
    Object? ip = null,
    Object? domain = null,
    Object? rrname = null,
    Object? servfail = null,
    Object? refused = null,
    Object? notimp = null,
    Object? other = null,
    Object? dnssec = null,
    Object? none = null,
    Object? blob = null,
  }) {
    return _then(_$RepliesImpl(
      unknown: null == unknown
          ? _value.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as int,
      nodata: null == nodata
          ? _value.nodata
          : nodata // ignore: cast_nullable_to_non_nullable
              as int,
      nxdomain: null == nxdomain
          ? _value.nxdomain
          : nxdomain // ignore: cast_nullable_to_non_nullable
              as int,
      cname: null == cname
          ? _value.cname
          : cname // ignore: cast_nullable_to_non_nullable
              as int,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as int,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as int,
      rrname: null == rrname
          ? _value.rrname
          : rrname // ignore: cast_nullable_to_non_nullable
              as int,
      servfail: null == servfail
          ? _value.servfail
          : servfail // ignore: cast_nullable_to_non_nullable
              as int,
      refused: null == refused
          ? _value.refused
          : refused // ignore: cast_nullable_to_non_nullable
              as int,
      notimp: null == notimp
          ? _value.notimp
          : notimp // ignore: cast_nullable_to_non_nullable
              as int,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
      dnssec: null == dnssec
          ? _value.dnssec
          : dnssec // ignore: cast_nullable_to_non_nullable
              as int,
      none: null == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as int,
      blob: null == blob
          ? _value.blob
          : blob // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepliesImpl implements _Replies {
  const _$RepliesImpl(
      {@JsonKey(name: 'UNKNOWN') required this.unknown,
      @JsonKey(name: 'NODATA') required this.nodata,
      @JsonKey(name: 'NXDOMAIN') required this.nxdomain,
      @JsonKey(name: 'CNAME') required this.cname,
      @JsonKey(name: 'IP') required this.ip,
      @JsonKey(name: 'DOMAIN') required this.domain,
      @JsonKey(name: 'RRNAME') required this.rrname,
      @JsonKey(name: 'SERVFAIL') required this.servfail,
      @JsonKey(name: 'REFUSED') required this.refused,
      @JsonKey(name: 'NOTIMP') required this.notimp,
      @JsonKey(name: 'OTHER') required this.other,
      @JsonKey(name: 'DNSSEC') required this.dnssec,
      @JsonKey(name: 'NONE') required this.none,
      @JsonKey(name: 'BLOB') required this.blob});

  factory _$RepliesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepliesImplFromJson(json);

  @override
  @JsonKey(name: 'UNKNOWN')
  final int unknown;
  @override
  @JsonKey(name: 'NODATA')
  final int nodata;
  @override
  @JsonKey(name: 'NXDOMAIN')
  final int nxdomain;
  @override
  @JsonKey(name: 'CNAME')
  final int cname;
  @override
  @JsonKey(name: 'IP')
  final int ip;
  @override
  @JsonKey(name: 'DOMAIN')
  final int domain;
  @override
  @JsonKey(name: 'RRNAME')
  final int rrname;
  @override
  @JsonKey(name: 'SERVFAIL')
  final int servfail;
  @override
  @JsonKey(name: 'REFUSED')
  final int refused;
  @override
  @JsonKey(name: 'NOTIMP')
  final int notimp;
  @override
  @JsonKey(name: 'OTHER')
  final int other;
  @override
  @JsonKey(name: 'DNSSEC')
  final int dnssec;
  @override
  @JsonKey(name: 'NONE')
  final int none;
  @override
  @JsonKey(name: 'BLOB')
  final int blob;

  @override
  String toString() {
    return 'Replies(unknown: $unknown, nodata: $nodata, nxdomain: $nxdomain, cname: $cname, ip: $ip, domain: $domain, rrname: $rrname, servfail: $servfail, refused: $refused, notimp: $notimp, other: $other, dnssec: $dnssec, none: $none, blob: $blob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepliesImpl &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.nodata, nodata) || other.nodata == nodata) &&
            (identical(other.nxdomain, nxdomain) ||
                other.nxdomain == nxdomain) &&
            (identical(other.cname, cname) || other.cname == cname) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.rrname, rrname) || other.rrname == rrname) &&
            (identical(other.servfail, servfail) ||
                other.servfail == servfail) &&
            (identical(other.refused, refused) || other.refused == refused) &&
            (identical(other.notimp, notimp) || other.notimp == notimp) &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.dnssec, dnssec) || other.dnssec == dnssec) &&
            (identical(other.none, none) || other.none == none) &&
            (identical(other.blob, blob) || other.blob == blob));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unknown, nodata, nxdomain, cname,
      ip, domain, rrname, servfail, refused, notimp, other, dnssec, none, blob);

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepliesImplCopyWith<_$RepliesImpl> get copyWith =>
      __$$RepliesImplCopyWithImpl<_$RepliesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepliesImplToJson(
      this,
    );
  }
}

abstract class _Replies implements Replies {
  const factory _Replies(
      {@JsonKey(name: 'UNKNOWN') required final int unknown,
      @JsonKey(name: 'NODATA') required final int nodata,
      @JsonKey(name: 'NXDOMAIN') required final int nxdomain,
      @JsonKey(name: 'CNAME') required final int cname,
      @JsonKey(name: 'IP') required final int ip,
      @JsonKey(name: 'DOMAIN') required final int domain,
      @JsonKey(name: 'RRNAME') required final int rrname,
      @JsonKey(name: 'SERVFAIL') required final int servfail,
      @JsonKey(name: 'REFUSED') required final int refused,
      @JsonKey(name: 'NOTIMP') required final int notimp,
      @JsonKey(name: 'OTHER') required final int other,
      @JsonKey(name: 'DNSSEC') required final int dnssec,
      @JsonKey(name: 'NONE') required final int none,
      @JsonKey(name: 'BLOB') required final int blob}) = _$RepliesImpl;

  factory _Replies.fromJson(Map<String, dynamic> json) = _$RepliesImpl.fromJson;

  @override
  @JsonKey(name: 'UNKNOWN')
  int get unknown;
  @override
  @JsonKey(name: 'NODATA')
  int get nodata;
  @override
  @JsonKey(name: 'NXDOMAIN')
  int get nxdomain;
  @override
  @JsonKey(name: 'CNAME')
  int get cname;
  @override
  @JsonKey(name: 'IP')
  int get ip;
  @override
  @JsonKey(name: 'DOMAIN')
  int get domain;
  @override
  @JsonKey(name: 'RRNAME')
  int get rrname;
  @override
  @JsonKey(name: 'SERVFAIL')
  int get servfail;
  @override
  @JsonKey(name: 'REFUSED')
  int get refused;
  @override
  @JsonKey(name: 'NOTIMP')
  int get notimp;
  @override
  @JsonKey(name: 'OTHER')
  int get other;
  @override
  @JsonKey(name: 'DNSSEC')
  int get dnssec;
  @override
  @JsonKey(name: 'NONE')
  int get none;
  @override
  @JsonKey(name: 'BLOB')
  int get blob;

  /// Create a copy of Replies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepliesImplCopyWith<_$RepliesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Clients _$ClientsFromJson(Map<String, dynamic> json) {
  return _Clients.fromJson(json);
}

/// @nodoc
mixin _$Clients {
  int get active => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this Clients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientsCopyWith<Clients> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientsCopyWith<$Res> {
  factory $ClientsCopyWith(Clients value, $Res Function(Clients) then) =
      _$ClientsCopyWithImpl<$Res, Clients>;
  @useResult
  $Res call({int active, int total});
}

/// @nodoc
class _$ClientsCopyWithImpl<$Res, $Val extends Clients>
    implements $ClientsCopyWith<$Res> {
  _$ClientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientsImplCopyWith<$Res> implements $ClientsCopyWith<$Res> {
  factory _$$ClientsImplCopyWith(
          _$ClientsImpl value, $Res Function(_$ClientsImpl) then) =
      __$$ClientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int active, int total});
}

/// @nodoc
class __$$ClientsImplCopyWithImpl<$Res>
    extends _$ClientsCopyWithImpl<$Res, _$ClientsImpl>
    implements _$$ClientsImplCopyWith<$Res> {
  __$$ClientsImplCopyWithImpl(
      _$ClientsImpl _value, $Res Function(_$ClientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? total = null,
  }) {
    return _then(_$ClientsImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientsImpl implements _Clients {
  const _$ClientsImpl({required this.active, required this.total});

  factory _$ClientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientsImplFromJson(json);

  @override
  final int active;
  @override
  final int total;

  @override
  String toString() {
    return 'Clients(active: $active, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientsImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, active, total);

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientsImplCopyWith<_$ClientsImpl> get copyWith =>
      __$$ClientsImplCopyWithImpl<_$ClientsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientsImplToJson(
      this,
    );
  }
}

abstract class _Clients implements Clients {
  const factory _Clients(
      {required final int active, required final int total}) = _$ClientsImpl;

  factory _Clients.fromJson(Map<String, dynamic> json) = _$ClientsImpl.fromJson;

  @override
  int get active;
  @override
  int get total;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientsImplCopyWith<_$ClientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Gravity _$GravityFromJson(Map<String, dynamic> json) {
  return _Gravity.fromJson(json);
}

/// @nodoc
mixin _$Gravity {
  @JsonKey(name: 'domains_being_blocked')
  int get domainsBeingBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_update')
  int get lastUpdate => throw _privateConstructorUsedError;

  /// Serializes this Gravity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GravityCopyWith<Gravity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GravityCopyWith<$Res> {
  factory $GravityCopyWith(Gravity value, $Res Function(Gravity) then) =
      _$GravityCopyWithImpl<$Res, Gravity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
      @JsonKey(name: 'last_update') int lastUpdate});
}

/// @nodoc
class _$GravityCopyWithImpl<$Res, $Val extends Gravity>
    implements $GravityCopyWith<$Res> {
  _$GravityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainsBeingBlocked = null,
    Object? lastUpdate = null,
  }) {
    return _then(_value.copyWith(
      domainsBeingBlocked: null == domainsBeingBlocked
          ? _value.domainsBeingBlocked
          : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GravityImplCopyWith<$Res> implements $GravityCopyWith<$Res> {
  factory _$$GravityImplCopyWith(
          _$GravityImpl value, $Res Function(_$GravityImpl) then) =
      __$$GravityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'domains_being_blocked') int domainsBeingBlocked,
      @JsonKey(name: 'last_update') int lastUpdate});
}

/// @nodoc
class __$$GravityImplCopyWithImpl<$Res>
    extends _$GravityCopyWithImpl<$Res, _$GravityImpl>
    implements _$$GravityImplCopyWith<$Res> {
  __$$GravityImplCopyWithImpl(
      _$GravityImpl _value, $Res Function(_$GravityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainsBeingBlocked = null,
    Object? lastUpdate = null,
  }) {
    return _then(_$GravityImpl(
      domainsBeingBlocked: null == domainsBeingBlocked
          ? _value.domainsBeingBlocked
          : domainsBeingBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GravityImpl implements _Gravity {
  const _$GravityImpl(
      {@JsonKey(name: 'domains_being_blocked')
      required this.domainsBeingBlocked,
      @JsonKey(name: 'last_update') required this.lastUpdate});

  factory _$GravityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GravityImplFromJson(json);

  @override
  @JsonKey(name: 'domains_being_blocked')
  final int domainsBeingBlocked;
  @override
  @JsonKey(name: 'last_update')
  final int lastUpdate;

  @override
  String toString() {
    return 'Gravity(domainsBeingBlocked: $domainsBeingBlocked, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GravityImpl &&
            (identical(other.domainsBeingBlocked, domainsBeingBlocked) ||
                other.domainsBeingBlocked == domainsBeingBlocked) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domainsBeingBlocked, lastUpdate);

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GravityImplCopyWith<_$GravityImpl> get copyWith =>
      __$$GravityImplCopyWithImpl<_$GravityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GravityImplToJson(
      this,
    );
  }
}

abstract class _Gravity implements Gravity {
  const factory _Gravity(
          {@JsonKey(name: 'domains_being_blocked')
          required final int domainsBeingBlocked,
          @JsonKey(name: 'last_update') required final int lastUpdate}) =
      _$GravityImpl;

  factory _Gravity.fromJson(Map<String, dynamic> json) = _$GravityImpl.fromJson;

  @override
  @JsonKey(name: 'domains_being_blocked')
  int get domainsBeingBlocked;
  @override
  @JsonKey(name: 'last_update')
  int get lastUpdate;

  /// Create a copy of Gravity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GravityImplCopyWith<_$GravityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsTopDomains _$StatsTopDomainsFromJson(Map<String, dynamic> json) {
  return _StatsTopDomains.fromJson(json);
}

/// @nodoc
mixin _$StatsTopDomains {
  List<Domain> get domains => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_queries')
  int get totalQueries => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_queries')
  int get blockedQueries => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this StatsTopDomains to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsTopDomainsCopyWith<StatsTopDomains> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsTopDomainsCopyWith<$Res> {
  factory $StatsTopDomainsCopyWith(
          StatsTopDomains value, $Res Function(StatsTopDomains) then) =
      _$StatsTopDomainsCopyWithImpl<$Res, StatsTopDomains>;
  @useResult
  $Res call(
      {List<Domain> domains,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class _$StatsTopDomainsCopyWithImpl<$Res, $Val extends StatsTopDomains>
    implements $StatsTopDomainsCopyWith<$Res> {
  _$StatsTopDomainsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      totalQueries: null == totalQueries
          ? _value.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _value.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsTopDomainsImplCopyWith<$Res>
    implements $StatsTopDomainsCopyWith<$Res> {
  factory _$$StatsTopDomainsImplCopyWith(_$StatsTopDomainsImpl value,
          $Res Function(_$StatsTopDomainsImpl) then) =
      __$$StatsTopDomainsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Domain> domains,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class __$$StatsTopDomainsImplCopyWithImpl<$Res>
    extends _$StatsTopDomainsCopyWithImpl<$Res, _$StatsTopDomainsImpl>
    implements _$$StatsTopDomainsImplCopyWith<$Res> {
  __$$StatsTopDomainsImplCopyWithImpl(
      _$StatsTopDomainsImpl _value, $Res Function(_$StatsTopDomainsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_$StatsTopDomainsImpl(
      domains: null == domains
          ? _value._domains
          : domains // ignore: cast_nullable_to_non_nullable
              as List<Domain>,
      totalQueries: null == totalQueries
          ? _value.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _value.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsTopDomainsImpl implements _StatsTopDomains {
  const _$StatsTopDomainsImpl(
      {required final List<Domain> domains,
      @JsonKey(name: 'total_queries') required this.totalQueries,
      @JsonKey(name: 'blocked_queries') required this.blockedQueries,
      required this.took})
      : _domains = domains;

  factory _$StatsTopDomainsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsTopDomainsImplFromJson(json);

  final List<Domain> _domains;
  @override
  List<Domain> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  @JsonKey(name: 'total_queries')
  final int totalQueries;
  @override
  @JsonKey(name: 'blocked_queries')
  final int blockedQueries;
  @override
  final double took;

  @override
  String toString() {
    return 'StatsTopDomains(domains: $domains, totalQueries: $totalQueries, blockedQueries: $blockedQueries, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsTopDomainsImpl &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.blockedQueries, blockedQueries) ||
                other.blockedQueries == blockedQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_domains),
      totalQueries,
      blockedQueries,
      took);

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsTopDomainsImplCopyWith<_$StatsTopDomainsImpl> get copyWith =>
      __$$StatsTopDomainsImplCopyWithImpl<_$StatsTopDomainsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsTopDomainsImplToJson(
      this,
    );
  }
}

abstract class _StatsTopDomains implements StatsTopDomains {
  const factory _StatsTopDomains(
      {required final List<Domain> domains,
      @JsonKey(name: 'total_queries') required final int totalQueries,
      @JsonKey(name: 'blocked_queries') required final int blockedQueries,
      required final double took}) = _$StatsTopDomainsImpl;

  factory _StatsTopDomains.fromJson(Map<String, dynamic> json) =
      _$StatsTopDomainsImpl.fromJson;

  @override
  List<Domain> get domains;
  @override
  @JsonKey(name: 'total_queries')
  int get totalQueries;
  @override
  @JsonKey(name: 'blocked_queries')
  int get blockedQueries;
  @override
  double get took;

  /// Create a copy of StatsTopDomains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsTopDomainsImplCopyWith<_$StatsTopDomainsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Domain _$DomainFromJson(Map<String, dynamic> json) {
  return _Domain.fromJson(json);
}

/// @nodoc
mixin _$Domain {
  String get domain => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

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
  $Res call({String domain, int count});
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
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
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
  $Res call({String domain, int count});
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
    Object? count = null,
  }) {
    return _then(_$DomainImpl(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainImpl implements _Domain {
  const _$DomainImpl({required this.domain, required this.count});

  factory _$DomainImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainImplFromJson(json);

  @override
  final String domain;
  @override
  final int count;

  @override
  String toString() {
    return 'Domain(domain: $domain, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainImpl &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, domain, count);

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
      {required final String domain, required final int count}) = _$DomainImpl;

  factory _Domain.fromJson(Map<String, dynamic> json) = _$DomainImpl.fromJson;

  @override
  String get domain;
  @override
  int get count;

  /// Create a copy of Domain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainImplCopyWith<_$DomainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsTopClients _$StatsTopClientsFromJson(Map<String, dynamic> json) {
  return _StatsTopClients.fromJson(json);
}

/// @nodoc
mixin _$StatsTopClients {
  List<Client> get clients => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_queries')
  int get totalQueries => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_queries')
  int get blockedQueries => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this StatsTopClients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsTopClientsCopyWith<StatsTopClients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsTopClientsCopyWith<$Res> {
  factory $StatsTopClientsCopyWith(
          StatsTopClients value, $Res Function(StatsTopClients) then) =
      _$StatsTopClientsCopyWithImpl<$Res, StatsTopClients>;
  @useResult
  $Res call(
      {List<Client> clients,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class _$StatsTopClientsCopyWithImpl<$Res, $Val extends StatsTopClients>
    implements $StatsTopClientsCopyWith<$Res> {
  _$StatsTopClientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      totalQueries: null == totalQueries
          ? _value.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _value.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsTopClientsImplCopyWith<$Res>
    implements $StatsTopClientsCopyWith<$Res> {
  factory _$$StatsTopClientsImplCopyWith(_$StatsTopClientsImpl value,
          $Res Function(_$StatsTopClientsImpl) then) =
      __$$StatsTopClientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Client> clients,
      @JsonKey(name: 'total_queries') int totalQueries,
      @JsonKey(name: 'blocked_queries') int blockedQueries,
      double took});
}

/// @nodoc
class __$$StatsTopClientsImplCopyWithImpl<$Res>
    extends _$StatsTopClientsCopyWithImpl<$Res, _$StatsTopClientsImpl>
    implements _$$StatsTopClientsImplCopyWith<$Res> {
  __$$StatsTopClientsImplCopyWithImpl(
      _$StatsTopClientsImpl _value, $Res Function(_$StatsTopClientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = null,
    Object? totalQueries = null,
    Object? blockedQueries = null,
    Object? took = null,
  }) {
    return _then(_$StatsTopClientsImpl(
      clients: null == clients
          ? _value._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      totalQueries: null == totalQueries
          ? _value.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      blockedQueries: null == blockedQueries
          ? _value.blockedQueries
          : blockedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsTopClientsImpl implements _StatsTopClients {
  const _$StatsTopClientsImpl(
      {required final List<Client> clients,
      @JsonKey(name: 'total_queries') required this.totalQueries,
      @JsonKey(name: 'blocked_queries') required this.blockedQueries,
      required this.took})
      : _clients = clients;

  factory _$StatsTopClientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsTopClientsImplFromJson(json);

  final List<Client> _clients;
  @override
  List<Client> get clients {
    if (_clients is EqualUnmodifiableListView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clients);
  }

  @override
  @JsonKey(name: 'total_queries')
  final int totalQueries;
  @override
  @JsonKey(name: 'blocked_queries')
  final int blockedQueries;
  @override
  final double took;

  @override
  String toString() {
    return 'StatsTopClients(clients: $clients, totalQueries: $totalQueries, blockedQueries: $blockedQueries, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsTopClientsImpl &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.blockedQueries, blockedQueries) ||
                other.blockedQueries == blockedQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_clients),
      totalQueries,
      blockedQueries,
      took);

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsTopClientsImplCopyWith<_$StatsTopClientsImpl> get copyWith =>
      __$$StatsTopClientsImplCopyWithImpl<_$StatsTopClientsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsTopClientsImplToJson(
      this,
    );
  }
}

abstract class _StatsTopClients implements StatsTopClients {
  const factory _StatsTopClients(
      {required final List<Client> clients,
      @JsonKey(name: 'total_queries') required final int totalQueries,
      @JsonKey(name: 'blocked_queries') required final int blockedQueries,
      required final double took}) = _$StatsTopClientsImpl;

  factory _StatsTopClients.fromJson(Map<String, dynamic> json) =
      _$StatsTopClientsImpl.fromJson;

  @override
  List<Client> get clients;
  @override
  @JsonKey(name: 'total_queries')
  int get totalQueries;
  @override
  @JsonKey(name: 'blocked_queries')
  int get blockedQueries;
  @override
  double get took;

  /// Create a copy of StatsTopClients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsTopClientsImplCopyWith<_$StatsTopClientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  String get ip => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call({String ip, String name, int count});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientImplCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$ClientImplCopyWith(
          _$ClientImpl value, $Res Function(_$ClientImpl) then) =
      __$$ClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ip, String name, int count});
}

/// @nodoc
class __$$ClientImplCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$ClientImpl>
    implements _$$ClientImplCopyWith<$Res> {
  __$$ClientImplCopyWithImpl(
      _$ClientImpl _value, $Res Function(_$ClientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_$ClientImpl(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientImpl implements _Client {
  const _$ClientImpl(
      {required this.ip, required this.name, required this.count});

  factory _$ClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientImplFromJson(json);

  @override
  final String ip;
  @override
  final String name;
  @override
  final int count;

  @override
  String toString() {
    return 'Client(ip: $ip, name: $name, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, name, count);

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      __$$ClientImplCopyWithImpl<_$ClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientImplToJson(
      this,
    );
  }
}

abstract class _Client implements Client {
  const factory _Client(
      {required final String ip,
      required final String name,
      required final int count}) = _$ClientImpl;

  factory _Client.fromJson(Map<String, dynamic> json) = _$ClientImpl.fromJson;

  @override
  String get ip;
  @override
  String get name;
  @override
  int get count;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsUpstreams _$StatsUpstreamsFromJson(Map<String, dynamic> json) {
  return _StatsUpstreams.fromJson(json);
}

/// @nodoc
mixin _$StatsUpstreams {
  List<Upstream> get upstreams => throw _privateConstructorUsedError;
  @JsonKey(name: 'forwarded_queries')
  int get forwardedQueries => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_queries')
  int get totalQueries => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this StatsUpstreams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsUpstreamsCopyWith<StatsUpstreams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsUpstreamsCopyWith<$Res> {
  factory $StatsUpstreamsCopyWith(
          StatsUpstreams value, $Res Function(StatsUpstreams) then) =
      _$StatsUpstreamsCopyWithImpl<$Res, StatsUpstreams>;
  @useResult
  $Res call(
      {List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') int forwardedQueries,
      @JsonKey(name: 'total_queries') int totalQueries,
      double took});
}

/// @nodoc
class _$StatsUpstreamsCopyWithImpl<$Res, $Val extends StatsUpstreams>
    implements $StatsUpstreamsCopyWith<$Res> {
  _$StatsUpstreamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upstreams = null,
    Object? forwardedQueries = null,
    Object? totalQueries = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      upstreams: null == upstreams
          ? _value.upstreams
          : upstreams // ignore: cast_nullable_to_non_nullable
              as List<Upstream>,
      forwardedQueries: null == forwardedQueries
          ? _value.forwardedQueries
          : forwardedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      totalQueries: null == totalQueries
          ? _value.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsUpstreamsImplCopyWith<$Res>
    implements $StatsUpstreamsCopyWith<$Res> {
  factory _$$StatsUpstreamsImplCopyWith(_$StatsUpstreamsImpl value,
          $Res Function(_$StatsUpstreamsImpl) then) =
      __$$StatsUpstreamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') int forwardedQueries,
      @JsonKey(name: 'total_queries') int totalQueries,
      double took});
}

/// @nodoc
class __$$StatsUpstreamsImplCopyWithImpl<$Res>
    extends _$StatsUpstreamsCopyWithImpl<$Res, _$StatsUpstreamsImpl>
    implements _$$StatsUpstreamsImplCopyWith<$Res> {
  __$$StatsUpstreamsImplCopyWithImpl(
      _$StatsUpstreamsImpl _value, $Res Function(_$StatsUpstreamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upstreams = null,
    Object? forwardedQueries = null,
    Object? totalQueries = null,
    Object? took = null,
  }) {
    return _then(_$StatsUpstreamsImpl(
      upstreams: null == upstreams
          ? _value._upstreams
          : upstreams // ignore: cast_nullable_to_non_nullable
              as List<Upstream>,
      forwardedQueries: null == forwardedQueries
          ? _value.forwardedQueries
          : forwardedQueries // ignore: cast_nullable_to_non_nullable
              as int,
      totalQueries: null == totalQueries
          ? _value.totalQueries
          : totalQueries // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsUpstreamsImpl implements _StatsUpstreams {
  const _$StatsUpstreamsImpl(
      {required final List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') required this.forwardedQueries,
      @JsonKey(name: 'total_queries') required this.totalQueries,
      required this.took})
      : _upstreams = upstreams;

  factory _$StatsUpstreamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsUpstreamsImplFromJson(json);

  final List<Upstream> _upstreams;
  @override
  List<Upstream> get upstreams {
    if (_upstreams is EqualUnmodifiableListView) return _upstreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upstreams);
  }

  @override
  @JsonKey(name: 'forwarded_queries')
  final int forwardedQueries;
  @override
  @JsonKey(name: 'total_queries')
  final int totalQueries;
  @override
  final double took;

  @override
  String toString() {
    return 'StatsUpstreams(upstreams: $upstreams, forwardedQueries: $forwardedQueries, totalQueries: $totalQueries, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsUpstreamsImpl &&
            const DeepCollectionEquality()
                .equals(other._upstreams, _upstreams) &&
            (identical(other.forwardedQueries, forwardedQueries) ||
                other.forwardedQueries == forwardedQueries) &&
            (identical(other.totalQueries, totalQueries) ||
                other.totalQueries == totalQueries) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_upstreams),
      forwardedQueries,
      totalQueries,
      took);

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsUpstreamsImplCopyWith<_$StatsUpstreamsImpl> get copyWith =>
      __$$StatsUpstreamsImplCopyWithImpl<_$StatsUpstreamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsUpstreamsImplToJson(
      this,
    );
  }
}

abstract class _StatsUpstreams implements StatsUpstreams {
  const factory _StatsUpstreams(
      {required final List<Upstream> upstreams,
      @JsonKey(name: 'forwarded_queries') required final int forwardedQueries,
      @JsonKey(name: 'total_queries') required final int totalQueries,
      required final double took}) = _$StatsUpstreamsImpl;

  factory _StatsUpstreams.fromJson(Map<String, dynamic> json) =
      _$StatsUpstreamsImpl.fromJson;

  @override
  List<Upstream> get upstreams;
  @override
  @JsonKey(name: 'forwarded_queries')
  int get forwardedQueries;
  @override
  @JsonKey(name: 'total_queries')
  int get totalQueries;
  @override
  double get took;

  /// Create a copy of StatsUpstreams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsUpstreamsImplCopyWith<_$StatsUpstreamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Upstream _$UpstreamFromJson(Map<String, dynamic> json) {
  return _Upstream.fromJson(json);
}

/// @nodoc
mixin _$Upstream {
  String get ip => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  Statistics get statistics => throw _privateConstructorUsedError;

  /// Serializes this Upstream to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpstreamCopyWith<Upstream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpstreamCopyWith<$Res> {
  factory $UpstreamCopyWith(Upstream value, $Res Function(Upstream) then) =
      _$UpstreamCopyWithImpl<$Res, Upstream>;
  @useResult
  $Res call(
      {String ip, String name, int port, int count, Statistics statistics});

  $StatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$UpstreamCopyWithImpl<$Res, $Val extends Upstream>
    implements $UpstreamCopyWith<$Res> {
  _$UpstreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? name = null,
    Object? port = null,
    Object? count = null,
    Object? statistics = null,
  }) {
    return _then(_value.copyWith(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
    ) as $Val);
  }

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatisticsCopyWith<$Res> get statistics {
    return $StatisticsCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpstreamImplCopyWith<$Res>
    implements $UpstreamCopyWith<$Res> {
  factory _$$UpstreamImplCopyWith(
          _$UpstreamImpl value, $Res Function(_$UpstreamImpl) then) =
      __$$UpstreamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ip, String name, int port, int count, Statistics statistics});

  @override
  $StatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$UpstreamImplCopyWithImpl<$Res>
    extends _$UpstreamCopyWithImpl<$Res, _$UpstreamImpl>
    implements _$$UpstreamImplCopyWith<$Res> {
  __$$UpstreamImplCopyWithImpl(
      _$UpstreamImpl _value, $Res Function(_$UpstreamImpl) _then)
      : super(_value, _then);

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? name = null,
    Object? port = null,
    Object? count = null,
    Object? statistics = null,
  }) {
    return _then(_$UpstreamImpl(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpstreamImpl implements _Upstream {
  const _$UpstreamImpl(
      {required this.ip,
      required this.name,
      required this.port,
      required this.count,
      required this.statistics});

  factory _$UpstreamImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpstreamImplFromJson(json);

  @override
  final String ip;
  @override
  final String name;
  @override
  final int port;
  @override
  final int count;
  @override
  final Statistics statistics;

  @override
  String toString() {
    return 'Upstream(ip: $ip, name: $name, port: $port, count: $count, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpstreamImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ip, name, port, count, statistics);

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpstreamImplCopyWith<_$UpstreamImpl> get copyWith =>
      __$$UpstreamImplCopyWithImpl<_$UpstreamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpstreamImplToJson(
      this,
    );
  }
}

abstract class _Upstream implements Upstream {
  const factory _Upstream(
      {required final String ip,
      required final String name,
      required final int port,
      required final int count,
      required final Statistics statistics}) = _$UpstreamImpl;

  factory _Upstream.fromJson(Map<String, dynamic> json) =
      _$UpstreamImpl.fromJson;

  @override
  String get ip;
  @override
  String get name;
  @override
  int get port;
  @override
  int get count;
  @override
  Statistics get statistics;

  /// Create a copy of Upstream
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpstreamImplCopyWith<_$UpstreamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return _Statistics.fromJson(json);
}

/// @nodoc
mixin _$Statistics {
  double get response => throw _privateConstructorUsedError;
  double get variance => throw _privateConstructorUsedError;

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsCopyWith<Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsCopyWith<$Res> {
  factory $StatisticsCopyWith(
          Statistics value, $Res Function(Statistics) then) =
      _$StatisticsCopyWithImpl<$Res, Statistics>;
  @useResult
  $Res call({double response, double variance});
}

/// @nodoc
class _$StatisticsCopyWithImpl<$Res, $Val extends Statistics>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? variance = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsImplCopyWith<$Res>
    implements $StatisticsCopyWith<$Res> {
  factory _$$StatisticsImplCopyWith(
          _$StatisticsImpl value, $Res Function(_$StatisticsImpl) then) =
      __$$StatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double response, double variance});
}

/// @nodoc
class __$$StatisticsImplCopyWithImpl<$Res>
    extends _$StatisticsCopyWithImpl<$Res, _$StatisticsImpl>
    implements _$$StatisticsImplCopyWith<$Res> {
  __$$StatisticsImplCopyWithImpl(
      _$StatisticsImpl _value, $Res Function(_$StatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? variance = null,
  }) {
    return _then(_$StatisticsImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as double,
      variance: null == variance
          ? _value.variance
          : variance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsImpl implements _Statistics {
  const _$StatisticsImpl({required this.response, required this.variance});

  factory _$StatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsImplFromJson(json);

  @override
  final double response;
  @override
  final double variance;

  @override
  String toString() {
    return 'Statistics(response: $response, variance: $variance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.variance, variance) ||
                other.variance == variance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response, variance);

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsImplCopyWith<_$StatisticsImpl> get copyWith =>
      __$$StatisticsImplCopyWithImpl<_$StatisticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsImplToJson(
      this,
    );
  }
}

abstract class _Statistics implements Statistics {
  const factory _Statistics(
      {required final double response,
      required final double variance}) = _$StatisticsImpl;

  factory _Statistics.fromJson(Map<String, dynamic> json) =
      _$StatisticsImpl.fromJson;

  @override
  double get response;
  @override
  double get variance;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsImplCopyWith<_$StatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
