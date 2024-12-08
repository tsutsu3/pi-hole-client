// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ftl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfoFtl _$InfoFtlFromJson(Map<String, dynamic> json) {
  return _InfoFtl.fromJson(json);
}

/// @nodoc
mixin _$InfoFtl {
  Ftl get ftl => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this InfoFtl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoFtlCopyWith<InfoFtl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoFtlCopyWith<$Res> {
  factory $InfoFtlCopyWith(InfoFtl value, $Res Function(InfoFtl) then) =
      _$InfoFtlCopyWithImpl<$Res, InfoFtl>;
  @useResult
  $Res call({Ftl ftl, double took});

  $FtlCopyWith<$Res> get ftl;
}

/// @nodoc
class _$InfoFtlCopyWithImpl<$Res, $Val extends InfoFtl>
    implements $InfoFtlCopyWith<$Res> {
  _$InfoFtlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ftl = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      ftl: null == ftl
          ? _value.ftl
          : ftl // ignore: cast_nullable_to_non_nullable
              as Ftl,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FtlCopyWith<$Res> get ftl {
    return $FtlCopyWith<$Res>(_value.ftl, (value) {
      return _then(_value.copyWith(ftl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfoFtlImplCopyWith<$Res> implements $InfoFtlCopyWith<$Res> {
  factory _$$InfoFtlImplCopyWith(
          _$InfoFtlImpl value, $Res Function(_$InfoFtlImpl) then) =
      __$$InfoFtlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ftl ftl, double took});

  @override
  $FtlCopyWith<$Res> get ftl;
}

/// @nodoc
class __$$InfoFtlImplCopyWithImpl<$Res>
    extends _$InfoFtlCopyWithImpl<$Res, _$InfoFtlImpl>
    implements _$$InfoFtlImplCopyWith<$Res> {
  __$$InfoFtlImplCopyWithImpl(
      _$InfoFtlImpl _value, $Res Function(_$InfoFtlImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ftl = null,
    Object? took = null,
  }) {
    return _then(_$InfoFtlImpl(
      ftl: null == ftl
          ? _value.ftl
          : ftl // ignore: cast_nullable_to_non_nullable
              as Ftl,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoFtlImpl implements _InfoFtl {
  const _$InfoFtlImpl({required this.ftl, required this.took});

  factory _$InfoFtlImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoFtlImplFromJson(json);

  @override
  final Ftl ftl;
  @override
  final double took;

  @override
  String toString() {
    return 'InfoFtl(ftl: $ftl, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoFtlImpl &&
            (identical(other.ftl, ftl) || other.ftl == ftl) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ftl, took);

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoFtlImplCopyWith<_$InfoFtlImpl> get copyWith =>
      __$$InfoFtlImplCopyWithImpl<_$InfoFtlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoFtlImplToJson(
      this,
    );
  }
}

abstract class _InfoFtl implements InfoFtl {
  const factory _InfoFtl({required final Ftl ftl, required final double took}) =
      _$InfoFtlImpl;

  factory _InfoFtl.fromJson(Map<String, dynamic> json) = _$InfoFtlImpl.fromJson;

  @override
  Ftl get ftl;
  @override
  double get took;

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoFtlImplCopyWith<_$InfoFtlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ftl _$FtlFromJson(Map<String, dynamic> json) {
  return _Ftl.fromJson(json);
}

/// @nodoc
mixin _$Ftl {
  Database get database => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacy_level')
  int get privacyLevel => throw _privateConstructorUsedError;
  Clients get clients => throw _privateConstructorUsedError;
  int get pid => throw _privateConstructorUsedError;
  int get uptime => throw _privateConstructorUsedError;
  @JsonKey(name: '%mem')
  double get memPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: '%cpu')
  double get cpuPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_destructive')
  bool get allowDestructive => throw _privateConstructorUsedError;
  Dnsmasq get dnsmasq => throw _privateConstructorUsedError;

  /// Serializes this Ftl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtlCopyWith<Ftl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtlCopyWith<$Res> {
  factory $FtlCopyWith(Ftl value, $Res Function(Ftl) then) =
      _$FtlCopyWithImpl<$Res, Ftl>;
  @useResult
  $Res call(
      {Database database,
      @JsonKey(name: 'privacy_level') int privacyLevel,
      Clients clients,
      int pid,
      int uptime,
      @JsonKey(name: '%mem') double memPercentage,
      @JsonKey(name: '%cpu') double cpuPercentage,
      @JsonKey(name: 'allow_destructive') bool allowDestructive,
      Dnsmasq dnsmasq});

  $DatabaseCopyWith<$Res> get database;
  $ClientsCopyWith<$Res> get clients;
  $DnsmasqCopyWith<$Res> get dnsmasq;
}

/// @nodoc
class _$FtlCopyWithImpl<$Res, $Val extends Ftl> implements $FtlCopyWith<$Res> {
  _$FtlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? database = null,
    Object? privacyLevel = null,
    Object? clients = null,
    Object? pid = null,
    Object? uptime = null,
    Object? memPercentage = null,
    Object? cpuPercentage = null,
    Object? allowDestructive = null,
    Object? dnsmasq = null,
  }) {
    return _then(_value.copyWith(
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as Database,
      privacyLevel: null == privacyLevel
          ? _value.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      uptime: null == uptime
          ? _value.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      memPercentage: null == memPercentage
          ? _value.memPercentage
          : memPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      cpuPercentage: null == cpuPercentage
          ? _value.cpuPercentage
          : cpuPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      allowDestructive: null == allowDestructive
          ? _value.allowDestructive
          : allowDestructive // ignore: cast_nullable_to_non_nullable
              as bool,
      dnsmasq: null == dnsmasq
          ? _value.dnsmasq
          : dnsmasq // ignore: cast_nullable_to_non_nullable
              as Dnsmasq,
    ) as $Val);
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatabaseCopyWith<$Res> get database {
    return $DatabaseCopyWith<$Res>(_value.database, (value) {
      return _then(_value.copyWith(database: value) as $Val);
    });
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res> get clients {
    return $ClientsCopyWith<$Res>(_value.clients, (value) {
      return _then(_value.copyWith(clients: value) as $Val);
    });
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsmasqCopyWith<$Res> get dnsmasq {
    return $DnsmasqCopyWith<$Res>(_value.dnsmasq, (value) {
      return _then(_value.copyWith(dnsmasq: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FtlImplCopyWith<$Res> implements $FtlCopyWith<$Res> {
  factory _$$FtlImplCopyWith(_$FtlImpl value, $Res Function(_$FtlImpl) then) =
      __$$FtlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Database database,
      @JsonKey(name: 'privacy_level') int privacyLevel,
      Clients clients,
      int pid,
      int uptime,
      @JsonKey(name: '%mem') double memPercentage,
      @JsonKey(name: '%cpu') double cpuPercentage,
      @JsonKey(name: 'allow_destructive') bool allowDestructive,
      Dnsmasq dnsmasq});

  @override
  $DatabaseCopyWith<$Res> get database;
  @override
  $ClientsCopyWith<$Res> get clients;
  @override
  $DnsmasqCopyWith<$Res> get dnsmasq;
}

/// @nodoc
class __$$FtlImplCopyWithImpl<$Res> extends _$FtlCopyWithImpl<$Res, _$FtlImpl>
    implements _$$FtlImplCopyWith<$Res> {
  __$$FtlImplCopyWithImpl(_$FtlImpl _value, $Res Function(_$FtlImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? database = null,
    Object? privacyLevel = null,
    Object? clients = null,
    Object? pid = null,
    Object? uptime = null,
    Object? memPercentage = null,
    Object? cpuPercentage = null,
    Object? allowDestructive = null,
    Object? dnsmasq = null,
  }) {
    return _then(_$FtlImpl(
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as Database,
      privacyLevel: null == privacyLevel
          ? _value.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      uptime: null == uptime
          ? _value.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      memPercentage: null == memPercentage
          ? _value.memPercentage
          : memPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      cpuPercentage: null == cpuPercentage
          ? _value.cpuPercentage
          : cpuPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      allowDestructive: null == allowDestructive
          ? _value.allowDestructive
          : allowDestructive // ignore: cast_nullable_to_non_nullable
              as bool,
      dnsmasq: null == dnsmasq
          ? _value.dnsmasq
          : dnsmasq // ignore: cast_nullable_to_non_nullable
              as Dnsmasq,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtlImpl implements _Ftl {
  const _$FtlImpl(
      {required this.database,
      @JsonKey(name: 'privacy_level') required this.privacyLevel,
      required this.clients,
      required this.pid,
      required this.uptime,
      @JsonKey(name: '%mem') required this.memPercentage,
      @JsonKey(name: '%cpu') required this.cpuPercentage,
      @JsonKey(name: 'allow_destructive') required this.allowDestructive,
      required this.dnsmasq});

  factory _$FtlImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtlImplFromJson(json);

  @override
  final Database database;
  @override
  @JsonKey(name: 'privacy_level')
  final int privacyLevel;
  @override
  final Clients clients;
  @override
  final int pid;
  @override
  final int uptime;
  @override
  @JsonKey(name: '%mem')
  final double memPercentage;
  @override
  @JsonKey(name: '%cpu')
  final double cpuPercentage;
  @override
  @JsonKey(name: 'allow_destructive')
  final bool allowDestructive;
  @override
  final Dnsmasq dnsmasq;

  @override
  String toString() {
    return 'Ftl(database: $database, privacyLevel: $privacyLevel, clients: $clients, pid: $pid, uptime: $uptime, memPercentage: $memPercentage, cpuPercentage: $cpuPercentage, allowDestructive: $allowDestructive, dnsmasq: $dnsmasq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtlImpl &&
            (identical(other.database, database) ||
                other.database == database) &&
            (identical(other.privacyLevel, privacyLevel) ||
                other.privacyLevel == privacyLevel) &&
            (identical(other.clients, clients) || other.clients == clients) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.uptime, uptime) || other.uptime == uptime) &&
            (identical(other.memPercentage, memPercentage) ||
                other.memPercentage == memPercentage) &&
            (identical(other.cpuPercentage, cpuPercentage) ||
                other.cpuPercentage == cpuPercentage) &&
            (identical(other.allowDestructive, allowDestructive) ||
                other.allowDestructive == allowDestructive) &&
            (identical(other.dnsmasq, dnsmasq) || other.dnsmasq == dnsmasq));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, database, privacyLevel, clients,
      pid, uptime, memPercentage, cpuPercentage, allowDestructive, dnsmasq);

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtlImplCopyWith<_$FtlImpl> get copyWith =>
      __$$FtlImplCopyWithImpl<_$FtlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtlImplToJson(
      this,
    );
  }
}

abstract class _Ftl implements Ftl {
  const factory _Ftl(
      {required final Database database,
      @JsonKey(name: 'privacy_level') required final int privacyLevel,
      required final Clients clients,
      required final int pid,
      required final int uptime,
      @JsonKey(name: '%mem') required final double memPercentage,
      @JsonKey(name: '%cpu') required final double cpuPercentage,
      @JsonKey(name: 'allow_destructive') required final bool allowDestructive,
      required final Dnsmasq dnsmasq}) = _$FtlImpl;

  factory _Ftl.fromJson(Map<String, dynamic> json) = _$FtlImpl.fromJson;

  @override
  Database get database;
  @override
  @JsonKey(name: 'privacy_level')
  int get privacyLevel;
  @override
  Clients get clients;
  @override
  int get pid;
  @override
  int get uptime;
  @override
  @JsonKey(name: '%mem')
  double get memPercentage;
  @override
  @JsonKey(name: '%cpu')
  double get cpuPercentage;
  @override
  @JsonKey(name: 'allow_destructive')
  bool get allowDestructive;
  @override
  Dnsmasq get dnsmasq;

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtlImplCopyWith<_$FtlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Database _$DatabaseFromJson(Map<String, dynamic> json) {
  return _Database.fromJson(json);
}

/// @nodoc
mixin _$Database {
  int get gravity => throw _privateConstructorUsedError;
  int get groups => throw _privateConstructorUsedError;
  int get lists => throw _privateConstructorUsedError;
  int get clients => throw _privateConstructorUsedError;
  Domains get domains => throw _privateConstructorUsedError;

  /// Serializes this Database to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatabaseCopyWith<Database> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseCopyWith<$Res> {
  factory $DatabaseCopyWith(Database value, $Res Function(Database) then) =
      _$DatabaseCopyWithImpl<$Res, Database>;
  @useResult
  $Res call({int gravity, int groups, int lists, int clients, Domains domains});

  $DomainsCopyWith<$Res> get domains;
}

/// @nodoc
class _$DatabaseCopyWithImpl<$Res, $Val extends Database>
    implements $DatabaseCopyWith<$Res> {
  _$DatabaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravity = null,
    Object? groups = null,
    Object? lists = null,
    Object? clients = null,
    Object? domains = null,
  }) {
    return _then(_value.copyWith(
      gravity: null == gravity
          ? _value.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as int,
      lists: null == lists
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as int,
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as Domains,
    ) as $Val);
  }

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DomainsCopyWith<$Res> get domains {
    return $DomainsCopyWith<$Res>(_value.domains, (value) {
      return _then(_value.copyWith(domains: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DatabaseImplCopyWith<$Res>
    implements $DatabaseCopyWith<$Res> {
  factory _$$DatabaseImplCopyWith(
          _$DatabaseImpl value, $Res Function(_$DatabaseImpl) then) =
      __$$DatabaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int gravity, int groups, int lists, int clients, Domains domains});

  @override
  $DomainsCopyWith<$Res> get domains;
}

/// @nodoc
class __$$DatabaseImplCopyWithImpl<$Res>
    extends _$DatabaseCopyWithImpl<$Res, _$DatabaseImpl>
    implements _$$DatabaseImplCopyWith<$Res> {
  __$$DatabaseImplCopyWithImpl(
      _$DatabaseImpl _value, $Res Function(_$DatabaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravity = null,
    Object? groups = null,
    Object? lists = null,
    Object? clients = null,
    Object? domains = null,
  }) {
    return _then(_$DatabaseImpl(
      gravity: null == gravity
          ? _value.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as int,
      lists: null == lists
          ? _value.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as int,
      domains: null == domains
          ? _value.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as Domains,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseImpl implements _Database {
  const _$DatabaseImpl(
      {required this.gravity,
      required this.groups,
      required this.lists,
      required this.clients,
      required this.domains});

  factory _$DatabaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseImplFromJson(json);

  @override
  final int gravity;
  @override
  final int groups;
  @override
  final int lists;
  @override
  final int clients;
  @override
  final Domains domains;

  @override
  String toString() {
    return 'Database(gravity: $gravity, groups: $groups, lists: $lists, clients: $clients, domains: $domains)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseImpl &&
            (identical(other.gravity, gravity) || other.gravity == gravity) &&
            (identical(other.groups, groups) || other.groups == groups) &&
            (identical(other.lists, lists) || other.lists == lists) &&
            (identical(other.clients, clients) || other.clients == clients) &&
            (identical(other.domains, domains) || other.domains == domains));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gravity, groups, lists, clients, domains);

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      __$$DatabaseImplCopyWithImpl<_$DatabaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseImplToJson(
      this,
    );
  }
}

abstract class _Database implements Database {
  const factory _Database(
      {required final int gravity,
      required final int groups,
      required final int lists,
      required final int clients,
      required final Domains domains}) = _$DatabaseImpl;

  factory _Database.fromJson(Map<String, dynamic> json) =
      _$DatabaseImpl.fromJson;

  @override
  int get gravity;
  @override
  int get groups;
  @override
  int get lists;
  @override
  int get clients;
  @override
  Domains get domains;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Domains _$DomainsFromJson(Map<String, dynamic> json) {
  return _Domains.fromJson(json);
}

/// @nodoc
mixin _$Domains {
  int get allowed => throw _privateConstructorUsedError;
  int get denied => throw _privateConstructorUsedError;

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
  $Res call({int allowed, int denied});
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
    Object? allowed = null,
    Object? denied = null,
  }) {
    return _then(_value.copyWith(
      allowed: null == allowed
          ? _value.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as int,
      denied: null == denied
          ? _value.denied
          : denied // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({int allowed, int denied});
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
    Object? allowed = null,
    Object? denied = null,
  }) {
    return _then(_$DomainsImpl(
      allowed: null == allowed
          ? _value.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as int,
      denied: null == denied
          ? _value.denied
          : denied // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainsImpl implements _Domains {
  const _$DomainsImpl({required this.allowed, required this.denied});

  factory _$DomainsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainsImplFromJson(json);

  @override
  final int allowed;
  @override
  final int denied;

  @override
  String toString() {
    return 'Domains(allowed: $allowed, denied: $denied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainsImpl &&
            (identical(other.allowed, allowed) || other.allowed == allowed) &&
            (identical(other.denied, denied) || other.denied == denied));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allowed, denied);

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
      {required final int allowed, required final int denied}) = _$DomainsImpl;

  factory _Domains.fromJson(Map<String, dynamic> json) = _$DomainsImpl.fromJson;

  @override
  int get allowed;
  @override
  int get denied;

  /// Create a copy of Domains
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainsImplCopyWith<_$DomainsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Clients _$ClientsFromJson(Map<String, dynamic> json) {
  return _Clients.fromJson(json);
}

/// @nodoc
mixin _$Clients {
  int get total => throw _privateConstructorUsedError;
  int get active => throw _privateConstructorUsedError;

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
  $Res call({int total, int active});
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
    Object? total = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
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
  $Res call({int total, int active});
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
    Object? total = null,
    Object? active = null,
  }) {
    return _then(_$ClientsImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientsImpl implements _Clients {
  const _$ClientsImpl({required this.total, required this.active});

  factory _$ClientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientsImplFromJson(json);

  @override
  final int total;
  @override
  final int active;

  @override
  String toString() {
    return 'Clients(total: $total, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, active);

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
      {required final int total, required final int active}) = _$ClientsImpl;

  factory _Clients.fromJson(Map<String, dynamic> json) = _$ClientsImpl.fromJson;

  @override
  int get total;
  @override
  int get active;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientsImplCopyWith<_$ClientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Dnsmasq _$DnsmasqFromJson(Map<String, dynamic> json) {
  return _Dnsmasq.fromJson(json);
}

/// @nodoc
mixin _$Dnsmasq {
  @JsonKey(name: 'dns_cache_inserted')
  int get dnsCacheInserted => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns_cache_live_freed')
  int get dnsCacheLiveFreed => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns_queries_forwarded')
  int get dnsQueriesForwarded => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns_auth_answered')
  int get dnsAuthAnswered => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns_local_answered')
  int get dnsLocalAnswered => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns_stale_answered')
  int get dnsStaleAnswered => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns_unanswered')
  int get dnsUnanswered => throw _privateConstructorUsedError;
  @JsonKey(name: 'bootp')
  int get bootp => throw _privateConstructorUsedError;
  @JsonKey(name: 'pxe')
  int get pxe => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_ack')
  int get dhcpAck => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_decline')
  int get dhcpDecline => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_discover')
  int get dhcpDiscover => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_inform')
  int get dhcpInform => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_nak')
  int get dhcpNak => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_offer')
  int get dhcpOffer => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_release')
  int get dhcpRelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'dhcp_request')
  int get dhcpRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'noanswer')
  int get noAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'leases_allocated_4')
  int get leasesAllocated4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'leases_pruned_4')
  int get leasesPruned4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'leases_allocated_6')
  int get leasesAllocated6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'leases_pruned_6')
  int get leasesPruned6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'tcp_connections')
  int get tcpConnections => throw _privateConstructorUsedError;
  @JsonKey(name: 'dnssec_max_crypto_use')
  int get dnssecMaxCryptoUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'dnssec_max_sig_fail')
  int get dnssecMaxSigFail => throw _privateConstructorUsedError;
  @JsonKey(name: 'dnssec_max_work')
  int get dnssecMaxWork => throw _privateConstructorUsedError;

  /// Serializes this Dnsmasq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DnsmasqCopyWith<Dnsmasq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DnsmasqCopyWith<$Res> {
  factory $DnsmasqCopyWith(Dnsmasq value, $Res Function(Dnsmasq) then) =
      _$DnsmasqCopyWithImpl<$Res, Dnsmasq>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dns_cache_inserted') int dnsCacheInserted,
      @JsonKey(name: 'dns_cache_live_freed') int dnsCacheLiveFreed,
      @JsonKey(name: 'dns_queries_forwarded') int dnsQueriesForwarded,
      @JsonKey(name: 'dns_auth_answered') int dnsAuthAnswered,
      @JsonKey(name: 'dns_local_answered') int dnsLocalAnswered,
      @JsonKey(name: 'dns_stale_answered') int dnsStaleAnswered,
      @JsonKey(name: 'dns_unanswered') int dnsUnanswered,
      @JsonKey(name: 'bootp') int bootp,
      @JsonKey(name: 'pxe') int pxe,
      @JsonKey(name: 'dhcp_ack') int dhcpAck,
      @JsonKey(name: 'dhcp_decline') int dhcpDecline,
      @JsonKey(name: 'dhcp_discover') int dhcpDiscover,
      @JsonKey(name: 'dhcp_inform') int dhcpInform,
      @JsonKey(name: 'dhcp_nak') int dhcpNak,
      @JsonKey(name: 'dhcp_offer') int dhcpOffer,
      @JsonKey(name: 'dhcp_release') int dhcpRelease,
      @JsonKey(name: 'dhcp_request') int dhcpRequest,
      @JsonKey(name: 'noanswer') int noAnswer,
      @JsonKey(name: 'leases_allocated_4') int leasesAllocated4,
      @JsonKey(name: 'leases_pruned_4') int leasesPruned4,
      @JsonKey(name: 'leases_allocated_6') int leasesAllocated6,
      @JsonKey(name: 'leases_pruned_6') int leasesPruned6,
      @JsonKey(name: 'tcp_connections') int tcpConnections,
      @JsonKey(name: 'dnssec_max_crypto_use') int dnssecMaxCryptoUse,
      @JsonKey(name: 'dnssec_max_sig_fail') int dnssecMaxSigFail,
      @JsonKey(name: 'dnssec_max_work') int dnssecMaxWork});
}

/// @nodoc
class _$DnsmasqCopyWithImpl<$Res, $Val extends Dnsmasq>
    implements $DnsmasqCopyWith<$Res> {
  _$DnsmasqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dnsCacheInserted = null,
    Object? dnsCacheLiveFreed = null,
    Object? dnsQueriesForwarded = null,
    Object? dnsAuthAnswered = null,
    Object? dnsLocalAnswered = null,
    Object? dnsStaleAnswered = null,
    Object? dnsUnanswered = null,
    Object? bootp = null,
    Object? pxe = null,
    Object? dhcpAck = null,
    Object? dhcpDecline = null,
    Object? dhcpDiscover = null,
    Object? dhcpInform = null,
    Object? dhcpNak = null,
    Object? dhcpOffer = null,
    Object? dhcpRelease = null,
    Object? dhcpRequest = null,
    Object? noAnswer = null,
    Object? leasesAllocated4 = null,
    Object? leasesPruned4 = null,
    Object? leasesAllocated6 = null,
    Object? leasesPruned6 = null,
    Object? tcpConnections = null,
    Object? dnssecMaxCryptoUse = null,
    Object? dnssecMaxSigFail = null,
    Object? dnssecMaxWork = null,
  }) {
    return _then(_value.copyWith(
      dnsCacheInserted: null == dnsCacheInserted
          ? _value.dnsCacheInserted
          : dnsCacheInserted // ignore: cast_nullable_to_non_nullable
              as int,
      dnsCacheLiveFreed: null == dnsCacheLiveFreed
          ? _value.dnsCacheLiveFreed
          : dnsCacheLiveFreed // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesForwarded: null == dnsQueriesForwarded
          ? _value.dnsQueriesForwarded
          : dnsQueriesForwarded // ignore: cast_nullable_to_non_nullable
              as int,
      dnsAuthAnswered: null == dnsAuthAnswered
          ? _value.dnsAuthAnswered
          : dnsAuthAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsLocalAnswered: null == dnsLocalAnswered
          ? _value.dnsLocalAnswered
          : dnsLocalAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsStaleAnswered: null == dnsStaleAnswered
          ? _value.dnsStaleAnswered
          : dnsStaleAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsUnanswered: null == dnsUnanswered
          ? _value.dnsUnanswered
          : dnsUnanswered // ignore: cast_nullable_to_non_nullable
              as int,
      bootp: null == bootp
          ? _value.bootp
          : bootp // ignore: cast_nullable_to_non_nullable
              as int,
      pxe: null == pxe
          ? _value.pxe
          : pxe // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpAck: null == dhcpAck
          ? _value.dhcpAck
          : dhcpAck // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDecline: null == dhcpDecline
          ? _value.dhcpDecline
          : dhcpDecline // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDiscover: null == dhcpDiscover
          ? _value.dhcpDiscover
          : dhcpDiscover // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpInform: null == dhcpInform
          ? _value.dhcpInform
          : dhcpInform // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpNak: null == dhcpNak
          ? _value.dhcpNak
          : dhcpNak // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpOffer: null == dhcpOffer
          ? _value.dhcpOffer
          : dhcpOffer // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRelease: null == dhcpRelease
          ? _value.dhcpRelease
          : dhcpRelease // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRequest: null == dhcpRequest
          ? _value.dhcpRequest
          : dhcpRequest // ignore: cast_nullable_to_non_nullable
              as int,
      noAnswer: null == noAnswer
          ? _value.noAnswer
          : noAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated4: null == leasesAllocated4
          ? _value.leasesAllocated4
          : leasesAllocated4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned4: null == leasesPruned4
          ? _value.leasesPruned4
          : leasesPruned4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated6: null == leasesAllocated6
          ? _value.leasesAllocated6
          : leasesAllocated6 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned6: null == leasesPruned6
          ? _value.leasesPruned6
          : leasesPruned6 // ignore: cast_nullable_to_non_nullable
              as int,
      tcpConnections: null == tcpConnections
          ? _value.tcpConnections
          : tcpConnections // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxCryptoUse: null == dnssecMaxCryptoUse
          ? _value.dnssecMaxCryptoUse
          : dnssecMaxCryptoUse // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxSigFail: null == dnssecMaxSigFail
          ? _value.dnssecMaxSigFail
          : dnssecMaxSigFail // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxWork: null == dnssecMaxWork
          ? _value.dnssecMaxWork
          : dnssecMaxWork // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DnsmasqImplCopyWith<$Res> implements $DnsmasqCopyWith<$Res> {
  factory _$$DnsmasqImplCopyWith(
          _$DnsmasqImpl value, $Res Function(_$DnsmasqImpl) then) =
      __$$DnsmasqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dns_cache_inserted') int dnsCacheInserted,
      @JsonKey(name: 'dns_cache_live_freed') int dnsCacheLiveFreed,
      @JsonKey(name: 'dns_queries_forwarded') int dnsQueriesForwarded,
      @JsonKey(name: 'dns_auth_answered') int dnsAuthAnswered,
      @JsonKey(name: 'dns_local_answered') int dnsLocalAnswered,
      @JsonKey(name: 'dns_stale_answered') int dnsStaleAnswered,
      @JsonKey(name: 'dns_unanswered') int dnsUnanswered,
      @JsonKey(name: 'bootp') int bootp,
      @JsonKey(name: 'pxe') int pxe,
      @JsonKey(name: 'dhcp_ack') int dhcpAck,
      @JsonKey(name: 'dhcp_decline') int dhcpDecline,
      @JsonKey(name: 'dhcp_discover') int dhcpDiscover,
      @JsonKey(name: 'dhcp_inform') int dhcpInform,
      @JsonKey(name: 'dhcp_nak') int dhcpNak,
      @JsonKey(name: 'dhcp_offer') int dhcpOffer,
      @JsonKey(name: 'dhcp_release') int dhcpRelease,
      @JsonKey(name: 'dhcp_request') int dhcpRequest,
      @JsonKey(name: 'noanswer') int noAnswer,
      @JsonKey(name: 'leases_allocated_4') int leasesAllocated4,
      @JsonKey(name: 'leases_pruned_4') int leasesPruned4,
      @JsonKey(name: 'leases_allocated_6') int leasesAllocated6,
      @JsonKey(name: 'leases_pruned_6') int leasesPruned6,
      @JsonKey(name: 'tcp_connections') int tcpConnections,
      @JsonKey(name: 'dnssec_max_crypto_use') int dnssecMaxCryptoUse,
      @JsonKey(name: 'dnssec_max_sig_fail') int dnssecMaxSigFail,
      @JsonKey(name: 'dnssec_max_work') int dnssecMaxWork});
}

/// @nodoc
class __$$DnsmasqImplCopyWithImpl<$Res>
    extends _$DnsmasqCopyWithImpl<$Res, _$DnsmasqImpl>
    implements _$$DnsmasqImplCopyWith<$Res> {
  __$$DnsmasqImplCopyWithImpl(
      _$DnsmasqImpl _value, $Res Function(_$DnsmasqImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dnsCacheInserted = null,
    Object? dnsCacheLiveFreed = null,
    Object? dnsQueriesForwarded = null,
    Object? dnsAuthAnswered = null,
    Object? dnsLocalAnswered = null,
    Object? dnsStaleAnswered = null,
    Object? dnsUnanswered = null,
    Object? bootp = null,
    Object? pxe = null,
    Object? dhcpAck = null,
    Object? dhcpDecline = null,
    Object? dhcpDiscover = null,
    Object? dhcpInform = null,
    Object? dhcpNak = null,
    Object? dhcpOffer = null,
    Object? dhcpRelease = null,
    Object? dhcpRequest = null,
    Object? noAnswer = null,
    Object? leasesAllocated4 = null,
    Object? leasesPruned4 = null,
    Object? leasesAllocated6 = null,
    Object? leasesPruned6 = null,
    Object? tcpConnections = null,
    Object? dnssecMaxCryptoUse = null,
    Object? dnssecMaxSigFail = null,
    Object? dnssecMaxWork = null,
  }) {
    return _then(_$DnsmasqImpl(
      dnsCacheInserted: null == dnsCacheInserted
          ? _value.dnsCacheInserted
          : dnsCacheInserted // ignore: cast_nullable_to_non_nullable
              as int,
      dnsCacheLiveFreed: null == dnsCacheLiveFreed
          ? _value.dnsCacheLiveFreed
          : dnsCacheLiveFreed // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesForwarded: null == dnsQueriesForwarded
          ? _value.dnsQueriesForwarded
          : dnsQueriesForwarded // ignore: cast_nullable_to_non_nullable
              as int,
      dnsAuthAnswered: null == dnsAuthAnswered
          ? _value.dnsAuthAnswered
          : dnsAuthAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsLocalAnswered: null == dnsLocalAnswered
          ? _value.dnsLocalAnswered
          : dnsLocalAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsStaleAnswered: null == dnsStaleAnswered
          ? _value.dnsStaleAnswered
          : dnsStaleAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsUnanswered: null == dnsUnanswered
          ? _value.dnsUnanswered
          : dnsUnanswered // ignore: cast_nullable_to_non_nullable
              as int,
      bootp: null == bootp
          ? _value.bootp
          : bootp // ignore: cast_nullable_to_non_nullable
              as int,
      pxe: null == pxe
          ? _value.pxe
          : pxe // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpAck: null == dhcpAck
          ? _value.dhcpAck
          : dhcpAck // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDecline: null == dhcpDecline
          ? _value.dhcpDecline
          : dhcpDecline // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDiscover: null == dhcpDiscover
          ? _value.dhcpDiscover
          : dhcpDiscover // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpInform: null == dhcpInform
          ? _value.dhcpInform
          : dhcpInform // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpNak: null == dhcpNak
          ? _value.dhcpNak
          : dhcpNak // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpOffer: null == dhcpOffer
          ? _value.dhcpOffer
          : dhcpOffer // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRelease: null == dhcpRelease
          ? _value.dhcpRelease
          : dhcpRelease // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRequest: null == dhcpRequest
          ? _value.dhcpRequest
          : dhcpRequest // ignore: cast_nullable_to_non_nullable
              as int,
      noAnswer: null == noAnswer
          ? _value.noAnswer
          : noAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated4: null == leasesAllocated4
          ? _value.leasesAllocated4
          : leasesAllocated4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned4: null == leasesPruned4
          ? _value.leasesPruned4
          : leasesPruned4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated6: null == leasesAllocated6
          ? _value.leasesAllocated6
          : leasesAllocated6 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned6: null == leasesPruned6
          ? _value.leasesPruned6
          : leasesPruned6 // ignore: cast_nullable_to_non_nullable
              as int,
      tcpConnections: null == tcpConnections
          ? _value.tcpConnections
          : tcpConnections // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxCryptoUse: null == dnssecMaxCryptoUse
          ? _value.dnssecMaxCryptoUse
          : dnssecMaxCryptoUse // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxSigFail: null == dnssecMaxSigFail
          ? _value.dnssecMaxSigFail
          : dnssecMaxSigFail // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxWork: null == dnssecMaxWork
          ? _value.dnssecMaxWork
          : dnssecMaxWork // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DnsmasqImpl implements _Dnsmasq {
  const _$DnsmasqImpl(
      {@JsonKey(name: 'dns_cache_inserted') required this.dnsCacheInserted,
      @JsonKey(name: 'dns_cache_live_freed') required this.dnsCacheLiveFreed,
      @JsonKey(name: 'dns_queries_forwarded') required this.dnsQueriesForwarded,
      @JsonKey(name: 'dns_auth_answered') required this.dnsAuthAnswered,
      @JsonKey(name: 'dns_local_answered') required this.dnsLocalAnswered,
      @JsonKey(name: 'dns_stale_answered') required this.dnsStaleAnswered,
      @JsonKey(name: 'dns_unanswered') required this.dnsUnanswered,
      @JsonKey(name: 'bootp') required this.bootp,
      @JsonKey(name: 'pxe') required this.pxe,
      @JsonKey(name: 'dhcp_ack') required this.dhcpAck,
      @JsonKey(name: 'dhcp_decline') required this.dhcpDecline,
      @JsonKey(name: 'dhcp_discover') required this.dhcpDiscover,
      @JsonKey(name: 'dhcp_inform') required this.dhcpInform,
      @JsonKey(name: 'dhcp_nak') required this.dhcpNak,
      @JsonKey(name: 'dhcp_offer') required this.dhcpOffer,
      @JsonKey(name: 'dhcp_release') required this.dhcpRelease,
      @JsonKey(name: 'dhcp_request') required this.dhcpRequest,
      @JsonKey(name: 'noanswer') required this.noAnswer,
      @JsonKey(name: 'leases_allocated_4') required this.leasesAllocated4,
      @JsonKey(name: 'leases_pruned_4') required this.leasesPruned4,
      @JsonKey(name: 'leases_allocated_6') required this.leasesAllocated6,
      @JsonKey(name: 'leases_pruned_6') required this.leasesPruned6,
      @JsonKey(name: 'tcp_connections') required this.tcpConnections,
      @JsonKey(name: 'dnssec_max_crypto_use') required this.dnssecMaxCryptoUse,
      @JsonKey(name: 'dnssec_max_sig_fail') required this.dnssecMaxSigFail,
      @JsonKey(name: 'dnssec_max_work') required this.dnssecMaxWork});

  factory _$DnsmasqImpl.fromJson(Map<String, dynamic> json) =>
      _$$DnsmasqImplFromJson(json);

  @override
  @JsonKey(name: 'dns_cache_inserted')
  final int dnsCacheInserted;
  @override
  @JsonKey(name: 'dns_cache_live_freed')
  final int dnsCacheLiveFreed;
  @override
  @JsonKey(name: 'dns_queries_forwarded')
  final int dnsQueriesForwarded;
  @override
  @JsonKey(name: 'dns_auth_answered')
  final int dnsAuthAnswered;
  @override
  @JsonKey(name: 'dns_local_answered')
  final int dnsLocalAnswered;
  @override
  @JsonKey(name: 'dns_stale_answered')
  final int dnsStaleAnswered;
  @override
  @JsonKey(name: 'dns_unanswered')
  final int dnsUnanswered;
  @override
  @JsonKey(name: 'bootp')
  final int bootp;
  @override
  @JsonKey(name: 'pxe')
  final int pxe;
  @override
  @JsonKey(name: 'dhcp_ack')
  final int dhcpAck;
  @override
  @JsonKey(name: 'dhcp_decline')
  final int dhcpDecline;
  @override
  @JsonKey(name: 'dhcp_discover')
  final int dhcpDiscover;
  @override
  @JsonKey(name: 'dhcp_inform')
  final int dhcpInform;
  @override
  @JsonKey(name: 'dhcp_nak')
  final int dhcpNak;
  @override
  @JsonKey(name: 'dhcp_offer')
  final int dhcpOffer;
  @override
  @JsonKey(name: 'dhcp_release')
  final int dhcpRelease;
  @override
  @JsonKey(name: 'dhcp_request')
  final int dhcpRequest;
  @override
  @JsonKey(name: 'noanswer')
  final int noAnswer;
  @override
  @JsonKey(name: 'leases_allocated_4')
  final int leasesAllocated4;
  @override
  @JsonKey(name: 'leases_pruned_4')
  final int leasesPruned4;
  @override
  @JsonKey(name: 'leases_allocated_6')
  final int leasesAllocated6;
  @override
  @JsonKey(name: 'leases_pruned_6')
  final int leasesPruned6;
  @override
  @JsonKey(name: 'tcp_connections')
  final int tcpConnections;
  @override
  @JsonKey(name: 'dnssec_max_crypto_use')
  final int dnssecMaxCryptoUse;
  @override
  @JsonKey(name: 'dnssec_max_sig_fail')
  final int dnssecMaxSigFail;
  @override
  @JsonKey(name: 'dnssec_max_work')
  final int dnssecMaxWork;

  @override
  String toString() {
    return 'Dnsmasq(dnsCacheInserted: $dnsCacheInserted, dnsCacheLiveFreed: $dnsCacheLiveFreed, dnsQueriesForwarded: $dnsQueriesForwarded, dnsAuthAnswered: $dnsAuthAnswered, dnsLocalAnswered: $dnsLocalAnswered, dnsStaleAnswered: $dnsStaleAnswered, dnsUnanswered: $dnsUnanswered, bootp: $bootp, pxe: $pxe, dhcpAck: $dhcpAck, dhcpDecline: $dhcpDecline, dhcpDiscover: $dhcpDiscover, dhcpInform: $dhcpInform, dhcpNak: $dhcpNak, dhcpOffer: $dhcpOffer, dhcpRelease: $dhcpRelease, dhcpRequest: $dhcpRequest, noAnswer: $noAnswer, leasesAllocated4: $leasesAllocated4, leasesPruned4: $leasesPruned4, leasesAllocated6: $leasesAllocated6, leasesPruned6: $leasesPruned6, tcpConnections: $tcpConnections, dnssecMaxCryptoUse: $dnssecMaxCryptoUse, dnssecMaxSigFail: $dnssecMaxSigFail, dnssecMaxWork: $dnssecMaxWork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DnsmasqImpl &&
            (identical(other.dnsCacheInserted, dnsCacheInserted) ||
                other.dnsCacheInserted == dnsCacheInserted) &&
            (identical(other.dnsCacheLiveFreed, dnsCacheLiveFreed) ||
                other.dnsCacheLiveFreed == dnsCacheLiveFreed) &&
            (identical(other.dnsQueriesForwarded, dnsQueriesForwarded) ||
                other.dnsQueriesForwarded == dnsQueriesForwarded) &&
            (identical(other.dnsAuthAnswered, dnsAuthAnswered) ||
                other.dnsAuthAnswered == dnsAuthAnswered) &&
            (identical(other.dnsLocalAnswered, dnsLocalAnswered) ||
                other.dnsLocalAnswered == dnsLocalAnswered) &&
            (identical(other.dnsStaleAnswered, dnsStaleAnswered) ||
                other.dnsStaleAnswered == dnsStaleAnswered) &&
            (identical(other.dnsUnanswered, dnsUnanswered) ||
                other.dnsUnanswered == dnsUnanswered) &&
            (identical(other.bootp, bootp) || other.bootp == bootp) &&
            (identical(other.pxe, pxe) || other.pxe == pxe) &&
            (identical(other.dhcpAck, dhcpAck) || other.dhcpAck == dhcpAck) &&
            (identical(other.dhcpDecline, dhcpDecline) ||
                other.dhcpDecline == dhcpDecline) &&
            (identical(other.dhcpDiscover, dhcpDiscover) ||
                other.dhcpDiscover == dhcpDiscover) &&
            (identical(other.dhcpInform, dhcpInform) ||
                other.dhcpInform == dhcpInform) &&
            (identical(other.dhcpNak, dhcpNak) || other.dhcpNak == dhcpNak) &&
            (identical(other.dhcpOffer, dhcpOffer) ||
                other.dhcpOffer == dhcpOffer) &&
            (identical(other.dhcpRelease, dhcpRelease) ||
                other.dhcpRelease == dhcpRelease) &&
            (identical(other.dhcpRequest, dhcpRequest) ||
                other.dhcpRequest == dhcpRequest) &&
            (identical(other.noAnswer, noAnswer) ||
                other.noAnswer == noAnswer) &&
            (identical(other.leasesAllocated4, leasesAllocated4) ||
                other.leasesAllocated4 == leasesAllocated4) &&
            (identical(other.leasesPruned4, leasesPruned4) ||
                other.leasesPruned4 == leasesPruned4) &&
            (identical(other.leasesAllocated6, leasesAllocated6) ||
                other.leasesAllocated6 == leasesAllocated6) &&
            (identical(other.leasesPruned6, leasesPruned6) ||
                other.leasesPruned6 == leasesPruned6) &&
            (identical(other.tcpConnections, tcpConnections) ||
                other.tcpConnections == tcpConnections) &&
            (identical(other.dnssecMaxCryptoUse, dnssecMaxCryptoUse) ||
                other.dnssecMaxCryptoUse == dnssecMaxCryptoUse) &&
            (identical(other.dnssecMaxSigFail, dnssecMaxSigFail) ||
                other.dnssecMaxSigFail == dnssecMaxSigFail) &&
            (identical(other.dnssecMaxWork, dnssecMaxWork) ||
                other.dnssecMaxWork == dnssecMaxWork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        dnsCacheInserted,
        dnsCacheLiveFreed,
        dnsQueriesForwarded,
        dnsAuthAnswered,
        dnsLocalAnswered,
        dnsStaleAnswered,
        dnsUnanswered,
        bootp,
        pxe,
        dhcpAck,
        dhcpDecline,
        dhcpDiscover,
        dhcpInform,
        dhcpNak,
        dhcpOffer,
        dhcpRelease,
        dhcpRequest,
        noAnswer,
        leasesAllocated4,
        leasesPruned4,
        leasesAllocated6,
        leasesPruned6,
        tcpConnections,
        dnssecMaxCryptoUse,
        dnssecMaxSigFail,
        dnssecMaxWork
      ]);

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DnsmasqImplCopyWith<_$DnsmasqImpl> get copyWith =>
      __$$DnsmasqImplCopyWithImpl<_$DnsmasqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DnsmasqImplToJson(
      this,
    );
  }
}

abstract class _Dnsmasq implements Dnsmasq {
  const factory _Dnsmasq(
      {@JsonKey(name: 'dns_cache_inserted') required final int dnsCacheInserted,
      @JsonKey(name: 'dns_cache_live_freed')
      required final int dnsCacheLiveFreed,
      @JsonKey(name: 'dns_queries_forwarded')
      required final int dnsQueriesForwarded,
      @JsonKey(name: 'dns_auth_answered') required final int dnsAuthAnswered,
      @JsonKey(name: 'dns_local_answered') required final int dnsLocalAnswered,
      @JsonKey(name: 'dns_stale_answered') required final int dnsStaleAnswered,
      @JsonKey(name: 'dns_unanswered') required final int dnsUnanswered,
      @JsonKey(name: 'bootp') required final int bootp,
      @JsonKey(name: 'pxe') required final int pxe,
      @JsonKey(name: 'dhcp_ack') required final int dhcpAck,
      @JsonKey(name: 'dhcp_decline') required final int dhcpDecline,
      @JsonKey(name: 'dhcp_discover') required final int dhcpDiscover,
      @JsonKey(name: 'dhcp_inform') required final int dhcpInform,
      @JsonKey(name: 'dhcp_nak') required final int dhcpNak,
      @JsonKey(name: 'dhcp_offer') required final int dhcpOffer,
      @JsonKey(name: 'dhcp_release') required final int dhcpRelease,
      @JsonKey(name: 'dhcp_request') required final int dhcpRequest,
      @JsonKey(name: 'noanswer') required final int noAnswer,
      @JsonKey(name: 'leases_allocated_4') required final int leasesAllocated4,
      @JsonKey(name: 'leases_pruned_4') required final int leasesPruned4,
      @JsonKey(name: 'leases_allocated_6') required final int leasesAllocated6,
      @JsonKey(name: 'leases_pruned_6') required final int leasesPruned6,
      @JsonKey(name: 'tcp_connections') required final int tcpConnections,
      @JsonKey(name: 'dnssec_max_crypto_use')
      required final int dnssecMaxCryptoUse,
      @JsonKey(name: 'dnssec_max_sig_fail') required final int dnssecMaxSigFail,
      @JsonKey(name: 'dnssec_max_work')
      required final int dnssecMaxWork}) = _$DnsmasqImpl;

  factory _Dnsmasq.fromJson(Map<String, dynamic> json) = _$DnsmasqImpl.fromJson;

  @override
  @JsonKey(name: 'dns_cache_inserted')
  int get dnsCacheInserted;
  @override
  @JsonKey(name: 'dns_cache_live_freed')
  int get dnsCacheLiveFreed;
  @override
  @JsonKey(name: 'dns_queries_forwarded')
  int get dnsQueriesForwarded;
  @override
  @JsonKey(name: 'dns_auth_answered')
  int get dnsAuthAnswered;
  @override
  @JsonKey(name: 'dns_local_answered')
  int get dnsLocalAnswered;
  @override
  @JsonKey(name: 'dns_stale_answered')
  int get dnsStaleAnswered;
  @override
  @JsonKey(name: 'dns_unanswered')
  int get dnsUnanswered;
  @override
  @JsonKey(name: 'bootp')
  int get bootp;
  @override
  @JsonKey(name: 'pxe')
  int get pxe;
  @override
  @JsonKey(name: 'dhcp_ack')
  int get dhcpAck;
  @override
  @JsonKey(name: 'dhcp_decline')
  int get dhcpDecline;
  @override
  @JsonKey(name: 'dhcp_discover')
  int get dhcpDiscover;
  @override
  @JsonKey(name: 'dhcp_inform')
  int get dhcpInform;
  @override
  @JsonKey(name: 'dhcp_nak')
  int get dhcpNak;
  @override
  @JsonKey(name: 'dhcp_offer')
  int get dhcpOffer;
  @override
  @JsonKey(name: 'dhcp_release')
  int get dhcpRelease;
  @override
  @JsonKey(name: 'dhcp_request')
  int get dhcpRequest;
  @override
  @JsonKey(name: 'noanswer')
  int get noAnswer;
  @override
  @JsonKey(name: 'leases_allocated_4')
  int get leasesAllocated4;
  @override
  @JsonKey(name: 'leases_pruned_4')
  int get leasesPruned4;
  @override
  @JsonKey(name: 'leases_allocated_6')
  int get leasesAllocated6;
  @override
  @JsonKey(name: 'leases_pruned_6')
  int get leasesPruned6;
  @override
  @JsonKey(name: 'tcp_connections')
  int get tcpConnections;
  @override
  @JsonKey(name: 'dnssec_max_crypto_use')
  int get dnssecMaxCryptoUse;
  @override
  @JsonKey(name: 'dnssec_max_sig_fail')
  int get dnssecMaxSigFail;
  @override
  @JsonKey(name: 'dnssec_max_work')
  int get dnssecMaxWork;

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DnsmasqImplCopyWith<_$DnsmasqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
