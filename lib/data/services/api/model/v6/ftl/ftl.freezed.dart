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
  Ftl get ftl;
  double get took;

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
            (identical(other.ftl, ftl) || other.ftl == ftl) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ftl, took);

  @override
  String toString() {
    return 'InfoFtl(ftl: $ftl, took: $took)';
  }
}

/// @nodoc
abstract mixin class $InfoFtlCopyWith<$Res> {
  factory $InfoFtlCopyWith(InfoFtl value, $Res Function(InfoFtl) _then) =
      _$InfoFtlCopyWithImpl;
  @useResult
  $Res call({Ftl ftl, double took});

  $FtlCopyWith<$Res> get ftl;
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
    Object? ftl = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      ftl: null == ftl
          ? _self.ftl
          : ftl // ignore: cast_nullable_to_non_nullable
              as Ftl,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FtlCopyWith<$Res> get ftl {
    return $FtlCopyWith<$Res>(_self.ftl, (value) {
      return _then(_self.copyWith(ftl: value));
    });
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
    TResult Function(Ftl ftl, double took)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoFtl() when $default != null:
        return $default(_that.ftl, _that.took);
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
    TResult Function(Ftl ftl, double took) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoFtl():
        return $default(_that.ftl, _that.took);
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
    TResult? Function(Ftl ftl, double took)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoFtl() when $default != null:
        return $default(_that.ftl, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InfoFtl implements InfoFtl {
  const _InfoFtl({required this.ftl, required this.took});
  factory _InfoFtl.fromJson(Map<String, dynamic> json) =>
      _$InfoFtlFromJson(json);

  @override
  final Ftl ftl;
  @override
  final double took;

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
            (identical(other.ftl, ftl) || other.ftl == ftl) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ftl, took);

  @override
  String toString() {
    return 'InfoFtl(ftl: $ftl, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$InfoFtlCopyWith<$Res> implements $InfoFtlCopyWith<$Res> {
  factory _$InfoFtlCopyWith(_InfoFtl value, $Res Function(_InfoFtl) _then) =
      __$InfoFtlCopyWithImpl;
  @override
  @useResult
  $Res call({Ftl ftl, double took});

  @override
  $FtlCopyWith<$Res> get ftl;
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
    Object? ftl = null,
    Object? took = null,
  }) {
    return _then(_InfoFtl(
      ftl: null == ftl
          ? _self.ftl
          : ftl // ignore: cast_nullable_to_non_nullable
              as Ftl,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of InfoFtl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FtlCopyWith<$Res> get ftl {
    return $FtlCopyWith<$Res>(_self.ftl, (value) {
      return _then(_self.copyWith(ftl: value));
    });
  }
}

/// @nodoc
mixin _$Ftl {
  Database get database;
  @JsonKey(name: 'privacy_level')
  int get privacyLevel;
  Clients get clients;
  int get pid;
  int get uptime;
  @JsonKey(name: '%mem')
  double get memPercentage;
  @JsonKey(name: '%cpu')
  double get cpuPercentage;
  @JsonKey(name: 'allow_destructive')
  bool get allowDestructive;
  Dnsmasq get dnsmasq;

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FtlCopyWith<Ftl> get copyWith =>
      _$FtlCopyWithImpl<Ftl>(this as Ftl, _$identity);

  /// Serializes this Ftl to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ftl &&
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

  @override
  String toString() {
    return 'Ftl(database: $database, privacyLevel: $privacyLevel, clients: $clients, pid: $pid, uptime: $uptime, memPercentage: $memPercentage, cpuPercentage: $cpuPercentage, allowDestructive: $allowDestructive, dnsmasq: $dnsmasq)';
  }
}

/// @nodoc
abstract mixin class $FtlCopyWith<$Res> {
  factory $FtlCopyWith(Ftl value, $Res Function(Ftl) _then) = _$FtlCopyWithImpl;
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
class _$FtlCopyWithImpl<$Res> implements $FtlCopyWith<$Res> {
  _$FtlCopyWithImpl(this._self, this._then);

  final Ftl _self;
  final $Res Function(Ftl) _then;

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
    return _then(_self.copyWith(
      database: null == database
          ? _self.database
          : database // ignore: cast_nullable_to_non_nullable
              as Database,
      privacyLevel: null == privacyLevel
          ? _self.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      pid: null == pid
          ? _self.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      uptime: null == uptime
          ? _self.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      memPercentage: null == memPercentage
          ? _self.memPercentage
          : memPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      cpuPercentage: null == cpuPercentage
          ? _self.cpuPercentage
          : cpuPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      allowDestructive: null == allowDestructive
          ? _self.allowDestructive
          : allowDestructive // ignore: cast_nullable_to_non_nullable
              as bool,
      dnsmasq: null == dnsmasq
          ? _self.dnsmasq
          : dnsmasq // ignore: cast_nullable_to_non_nullable
              as Dnsmasq,
    ));
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatabaseCopyWith<$Res> get database {
    return $DatabaseCopyWith<$Res>(_self.database, (value) {
      return _then(_self.copyWith(database: value));
    });
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res> get clients {
    return $ClientsCopyWith<$Res>(_self.clients, (value) {
      return _then(_self.copyWith(clients: value));
    });
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsmasqCopyWith<$Res> get dnsmasq {
    return $DnsmasqCopyWith<$Res>(_self.dnsmasq, (value) {
      return _then(_self.copyWith(dnsmasq: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Ftl].
extension FtlPatterns on Ftl {
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
    TResult Function(_Ftl value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Ftl() when $default != null:
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
    TResult Function(_Ftl value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ftl():
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
    TResult? Function(_Ftl value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ftl() when $default != null:
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
            Database database,
            @JsonKey(name: 'privacy_level') int privacyLevel,
            Clients clients,
            int pid,
            int uptime,
            @JsonKey(name: '%mem') double memPercentage,
            @JsonKey(name: '%cpu') double cpuPercentage,
            @JsonKey(name: 'allow_destructive') bool allowDestructive,
            Dnsmasq dnsmasq)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Ftl() when $default != null:
        return $default(
            _that.database,
            _that.privacyLevel,
            _that.clients,
            _that.pid,
            _that.uptime,
            _that.memPercentage,
            _that.cpuPercentage,
            _that.allowDestructive,
            _that.dnsmasq);
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
            Database database,
            @JsonKey(name: 'privacy_level') int privacyLevel,
            Clients clients,
            int pid,
            int uptime,
            @JsonKey(name: '%mem') double memPercentage,
            @JsonKey(name: '%cpu') double cpuPercentage,
            @JsonKey(name: 'allow_destructive') bool allowDestructive,
            Dnsmasq dnsmasq)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ftl():
        return $default(
            _that.database,
            _that.privacyLevel,
            _that.clients,
            _that.pid,
            _that.uptime,
            _that.memPercentage,
            _that.cpuPercentage,
            _that.allowDestructive,
            _that.dnsmasq);
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
            Database database,
            @JsonKey(name: 'privacy_level') int privacyLevel,
            Clients clients,
            int pid,
            int uptime,
            @JsonKey(name: '%mem') double memPercentage,
            @JsonKey(name: '%cpu') double cpuPercentage,
            @JsonKey(name: 'allow_destructive') bool allowDestructive,
            Dnsmasq dnsmasq)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ftl() when $default != null:
        return $default(
            _that.database,
            _that.privacyLevel,
            _that.clients,
            _that.pid,
            _that.uptime,
            _that.memPercentage,
            _that.cpuPercentage,
            _that.allowDestructive,
            _that.dnsmasq);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Ftl implements Ftl {
  const _Ftl(
      {required this.database,
      @JsonKey(name: 'privacy_level') required this.privacyLevel,
      required this.clients,
      required this.pid,
      required this.uptime,
      @JsonKey(name: '%mem') required this.memPercentage,
      @JsonKey(name: '%cpu') required this.cpuPercentage,
      @JsonKey(name: 'allow_destructive') required this.allowDestructive,
      required this.dnsmasq});
  factory _Ftl.fromJson(Map<String, dynamic> json) => _$FtlFromJson(json);

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

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FtlCopyWith<_Ftl> get copyWith =>
      __$FtlCopyWithImpl<_Ftl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FtlToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ftl &&
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

  @override
  String toString() {
    return 'Ftl(database: $database, privacyLevel: $privacyLevel, clients: $clients, pid: $pid, uptime: $uptime, memPercentage: $memPercentage, cpuPercentage: $cpuPercentage, allowDestructive: $allowDestructive, dnsmasq: $dnsmasq)';
  }
}

/// @nodoc
abstract mixin class _$FtlCopyWith<$Res> implements $FtlCopyWith<$Res> {
  factory _$FtlCopyWith(_Ftl value, $Res Function(_Ftl) _then) =
      __$FtlCopyWithImpl;
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
class __$FtlCopyWithImpl<$Res> implements _$FtlCopyWith<$Res> {
  __$FtlCopyWithImpl(this._self, this._then);

  final _Ftl _self;
  final $Res Function(_Ftl) _then;

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Ftl(
      database: null == database
          ? _self.database
          : database // ignore: cast_nullable_to_non_nullable
              as Database,
      privacyLevel: null == privacyLevel
          ? _self.privacyLevel
          : privacyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Clients,
      pid: null == pid
          ? _self.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      uptime: null == uptime
          ? _self.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      memPercentage: null == memPercentage
          ? _self.memPercentage
          : memPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      cpuPercentage: null == cpuPercentage
          ? _self.cpuPercentage
          : cpuPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      allowDestructive: null == allowDestructive
          ? _self.allowDestructive
          : allowDestructive // ignore: cast_nullable_to_non_nullable
              as bool,
      dnsmasq: null == dnsmasq
          ? _self.dnsmasq
          : dnsmasq // ignore: cast_nullable_to_non_nullable
              as Dnsmasq,
    ));
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatabaseCopyWith<$Res> get database {
    return $DatabaseCopyWith<$Res>(_self.database, (value) {
      return _then(_self.copyWith(database: value));
    });
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<$Res> get clients {
    return $ClientsCopyWith<$Res>(_self.clients, (value) {
      return _then(_self.copyWith(clients: value));
    });
  }

  /// Create a copy of Ftl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DnsmasqCopyWith<$Res> get dnsmasq {
    return $DnsmasqCopyWith<$Res>(_self.dnsmasq, (value) {
      return _then(_self.copyWith(dnsmasq: value));
    });
  }
}

/// @nodoc
mixin _$Database {
  int get gravity;
  int get groups;
  int get lists;
  int get clients;
  Domains get domains;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DatabaseCopyWith<Database> get copyWith =>
      _$DatabaseCopyWithImpl<Database>(this as Database, _$identity);

  /// Serializes this Database to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Database &&
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

  @override
  String toString() {
    return 'Database(gravity: $gravity, groups: $groups, lists: $lists, clients: $clients, domains: $domains)';
  }
}

/// @nodoc
abstract mixin class $DatabaseCopyWith<$Res> {
  factory $DatabaseCopyWith(Database value, $Res Function(Database) _then) =
      _$DatabaseCopyWithImpl;
  @useResult
  $Res call({int gravity, int groups, int lists, int clients, Domains domains});

  $DomainsCopyWith<$Res> get domains;
}

/// @nodoc
class _$DatabaseCopyWithImpl<$Res> implements $DatabaseCopyWith<$Res> {
  _$DatabaseCopyWithImpl(this._self, this._then);

  final Database _self;
  final $Res Function(Database) _then;

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
    return _then(_self.copyWith(
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as int,
      lists: null == lists
          ? _self.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as int,
      domains: null == domains
          ? _self.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as Domains,
    ));
  }

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DomainsCopyWith<$Res> get domains {
    return $DomainsCopyWith<$Res>(_self.domains, (value) {
      return _then(_self.copyWith(domains: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Database].
extension DatabasePatterns on Database {
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
    TResult Function(_Database value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Database() when $default != null:
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
    TResult Function(_Database value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Database():
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
    TResult? Function(_Database value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Database() when $default != null:
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
            int gravity, int groups, int lists, int clients, Domains domains)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Database() when $default != null:
        return $default(_that.gravity, _that.groups, _that.lists, _that.clients,
            _that.domains);
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
            int gravity, int groups, int lists, int clients, Domains domains)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Database():
        return $default(_that.gravity, _that.groups, _that.lists, _that.clients,
            _that.domains);
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
            int gravity, int groups, int lists, int clients, Domains domains)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Database() when $default != null:
        return $default(_that.gravity, _that.groups, _that.lists, _that.clients,
            _that.domains);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Database implements Database {
  const _Database(
      {required this.gravity,
      required this.groups,
      required this.lists,
      required this.clients,
      required this.domains});
  factory _Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);

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

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DatabaseCopyWith<_Database> get copyWith =>
      __$DatabaseCopyWithImpl<_Database>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DatabaseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Database &&
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

  @override
  String toString() {
    return 'Database(gravity: $gravity, groups: $groups, lists: $lists, clients: $clients, domains: $domains)';
  }
}

/// @nodoc
abstract mixin class _$DatabaseCopyWith<$Res>
    implements $DatabaseCopyWith<$Res> {
  factory _$DatabaseCopyWith(_Database value, $Res Function(_Database) _then) =
      __$DatabaseCopyWithImpl;
  @override
  @useResult
  $Res call({int gravity, int groups, int lists, int clients, Domains domains});

  @override
  $DomainsCopyWith<$Res> get domains;
}

/// @nodoc
class __$DatabaseCopyWithImpl<$Res> implements _$DatabaseCopyWith<$Res> {
  __$DatabaseCopyWithImpl(this._self, this._then);

  final _Database _self;
  final $Res Function(_Database) _then;

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gravity = null,
    Object? groups = null,
    Object? lists = null,
    Object? clients = null,
    Object? domains = null,
  }) {
    return _then(_Database(
      gravity: null == gravity
          ? _self.gravity
          : gravity // ignore: cast_nullable_to_non_nullable
              as int,
      groups: null == groups
          ? _self.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as int,
      lists: null == lists
          ? _self.lists
          : lists // ignore: cast_nullable_to_non_nullable
              as int,
      clients: null == clients
          ? _self.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as int,
      domains: null == domains
          ? _self.domains
          : domains // ignore: cast_nullable_to_non_nullable
              as Domains,
    ));
  }

  /// Create a copy of Database
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DomainsCopyWith<$Res> get domains {
    return $DomainsCopyWith<$Res>(_self.domains, (value) {
      return _then(_self.copyWith(domains: value));
    });
  }
}

/// @nodoc
mixin _$Domains {
  int get allowed;
  int get denied;

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
            (identical(other.allowed, allowed) || other.allowed == allowed) &&
            (identical(other.denied, denied) || other.denied == denied));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allowed, denied);

  @override
  String toString() {
    return 'Domains(allowed: $allowed, denied: $denied)';
  }
}

/// @nodoc
abstract mixin class $DomainsCopyWith<$Res> {
  factory $DomainsCopyWith(Domains value, $Res Function(Domains) _then) =
      _$DomainsCopyWithImpl;
  @useResult
  $Res call({int allowed, int denied});
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
    Object? allowed = null,
    Object? denied = null,
  }) {
    return _then(_self.copyWith(
      allowed: null == allowed
          ? _self.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as int,
      denied: null == denied
          ? _self.denied
          : denied // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Domains].
extension DomainsPatterns on Domains {
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
    TResult Function(_Domains value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Domains() when $default != null:
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
    TResult Function(_Domains value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domains():
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
    TResult? Function(_Domains value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domains() when $default != null:
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
    TResult Function(int allowed, int denied)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Domains() when $default != null:
        return $default(_that.allowed, _that.denied);
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
    TResult Function(int allowed, int denied) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domains():
        return $default(_that.allowed, _that.denied);
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
    TResult? Function(int allowed, int denied)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Domains() when $default != null:
        return $default(_that.allowed, _that.denied);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Domains implements Domains {
  const _Domains({required this.allowed, required this.denied});
  factory _Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);

  @override
  final int allowed;
  @override
  final int denied;

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
            (identical(other.allowed, allowed) || other.allowed == allowed) &&
            (identical(other.denied, denied) || other.denied == denied));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allowed, denied);

  @override
  String toString() {
    return 'Domains(allowed: $allowed, denied: $denied)';
  }
}

/// @nodoc
abstract mixin class _$DomainsCopyWith<$Res> implements $DomainsCopyWith<$Res> {
  factory _$DomainsCopyWith(_Domains value, $Res Function(_Domains) _then) =
      __$DomainsCopyWithImpl;
  @override
  @useResult
  $Res call({int allowed, int denied});
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
    Object? allowed = null,
    Object? denied = null,
  }) {
    return _then(_Domains(
      allowed: null == allowed
          ? _self.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as int,
      denied: null == denied
          ? _self.denied
          : denied // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Clients {
  int get total;
  int get active;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientsCopyWith<Clients> get copyWith =>
      _$ClientsCopyWithImpl<Clients>(this as Clients, _$identity);

  /// Serializes this Clients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Clients &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, active);

  @override
  String toString() {
    return 'Clients(total: $total, active: $active)';
  }
}

/// @nodoc
abstract mixin class $ClientsCopyWith<$Res> {
  factory $ClientsCopyWith(Clients value, $Res Function(Clients) _then) =
      _$ClientsCopyWithImpl;
  @useResult
  $Res call({int total, int active});
}

/// @nodoc
class _$ClientsCopyWithImpl<$Res> implements $ClientsCopyWith<$Res> {
  _$ClientsCopyWithImpl(this._self, this._then);

  final Clients _self;
  final $Res Function(Clients) _then;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Clients].
extension ClientsPatterns on Clients {
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
    TResult Function(_Clients value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
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
    TResult Function(_Clients value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients():
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
    TResult? Function(_Clients value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
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
    TResult Function(int total, int active)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
        return $default(_that.total, _that.active);
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
    TResult Function(int total, int active) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients():
        return $default(_that.total, _that.active);
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
    TResult? Function(int total, int active)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Clients() when $default != null:
        return $default(_that.total, _that.active);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Clients implements Clients {
  const _Clients({required this.total, required this.active});
  factory _Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);

  @override
  final int total;
  @override
  final int active;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientsCopyWith<_Clients> get copyWith =>
      __$ClientsCopyWithImpl<_Clients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Clients &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, active);

  @override
  String toString() {
    return 'Clients(total: $total, active: $active)';
  }
}

/// @nodoc
abstract mixin class _$ClientsCopyWith<$Res> implements $ClientsCopyWith<$Res> {
  factory _$ClientsCopyWith(_Clients value, $Res Function(_Clients) _then) =
      __$ClientsCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int active});
}

/// @nodoc
class __$ClientsCopyWithImpl<$Res> implements _$ClientsCopyWith<$Res> {
  __$ClientsCopyWithImpl(this._self, this._then);

  final _Clients _self;
  final $Res Function(_Clients) _then;

  /// Create a copy of Clients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? active = null,
  }) {
    return _then(_Clients(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$Dnsmasq {
  @JsonKey(name: 'dns_cache_inserted')
  int get dnsCacheInserted;
  @JsonKey(name: 'dns_cache_live_freed')
  int get dnsCacheLiveFreed;
  @JsonKey(name: 'dns_queries_forwarded')
  int get dnsQueriesForwarded;
  @JsonKey(name: 'dns_auth_answered')
  int get dnsAuthAnswered;
  @JsonKey(name: 'dns_local_answered')
  int get dnsLocalAnswered;
  @JsonKey(name: 'dns_stale_answered')
  int get dnsStaleAnswered;
  @JsonKey(name: 'dns_unanswered')
  int get dnsUnanswered;
  @JsonKey(name: 'bootp')
  int get bootp;
  @JsonKey(name: 'pxe')
  int get pxe;
  @JsonKey(name: 'dhcp_ack')
  int get dhcpAck;
  @JsonKey(name: 'dhcp_decline')
  int get dhcpDecline;
  @JsonKey(name: 'dhcp_discover')
  int get dhcpDiscover;
  @JsonKey(name: 'dhcp_inform')
  int get dhcpInform;
  @JsonKey(name: 'dhcp_nak')
  int get dhcpNak;
  @JsonKey(name: 'dhcp_offer')
  int get dhcpOffer;
  @JsonKey(name: 'dhcp_release')
  int get dhcpRelease;
  @JsonKey(name: 'dhcp_request')
  int get dhcpRequest;
  @JsonKey(name: 'noanswer')
  int get noAnswer;
  @JsonKey(name: 'leases_allocated_4')
  int get leasesAllocated4;
  @JsonKey(name: 'leases_pruned_4')
  int get leasesPruned4;
  @JsonKey(name: 'leases_allocated_6')
  int get leasesAllocated6;
  @JsonKey(name: 'leases_pruned_6')
  int get leasesPruned6;
  @JsonKey(name: 'tcp_connections')
  int get tcpConnections;
  @JsonKey(name: 'dnssec_max_crypto_use')
  int get dnssecMaxCryptoUse;
  @JsonKey(name: 'dnssec_max_sig_fail')
  int get dnssecMaxSigFail;
  @JsonKey(name: 'dnssec_max_work')
  int get dnssecMaxWork;

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DnsmasqCopyWith<Dnsmasq> get copyWith =>
      _$DnsmasqCopyWithImpl<Dnsmasq>(this as Dnsmasq, _$identity);

  /// Serializes this Dnsmasq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Dnsmasq &&
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

  @override
  String toString() {
    return 'Dnsmasq(dnsCacheInserted: $dnsCacheInserted, dnsCacheLiveFreed: $dnsCacheLiveFreed, dnsQueriesForwarded: $dnsQueriesForwarded, dnsAuthAnswered: $dnsAuthAnswered, dnsLocalAnswered: $dnsLocalAnswered, dnsStaleAnswered: $dnsStaleAnswered, dnsUnanswered: $dnsUnanswered, bootp: $bootp, pxe: $pxe, dhcpAck: $dhcpAck, dhcpDecline: $dhcpDecline, dhcpDiscover: $dhcpDiscover, dhcpInform: $dhcpInform, dhcpNak: $dhcpNak, dhcpOffer: $dhcpOffer, dhcpRelease: $dhcpRelease, dhcpRequest: $dhcpRequest, noAnswer: $noAnswer, leasesAllocated4: $leasesAllocated4, leasesPruned4: $leasesPruned4, leasesAllocated6: $leasesAllocated6, leasesPruned6: $leasesPruned6, tcpConnections: $tcpConnections, dnssecMaxCryptoUse: $dnssecMaxCryptoUse, dnssecMaxSigFail: $dnssecMaxSigFail, dnssecMaxWork: $dnssecMaxWork)';
  }
}

/// @nodoc
abstract mixin class $DnsmasqCopyWith<$Res> {
  factory $DnsmasqCopyWith(Dnsmasq value, $Res Function(Dnsmasq) _then) =
      _$DnsmasqCopyWithImpl;
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
class _$DnsmasqCopyWithImpl<$Res> implements $DnsmasqCopyWith<$Res> {
  _$DnsmasqCopyWithImpl(this._self, this._then);

  final Dnsmasq _self;
  final $Res Function(Dnsmasq) _then;

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
    return _then(_self.copyWith(
      dnsCacheInserted: null == dnsCacheInserted
          ? _self.dnsCacheInserted
          : dnsCacheInserted // ignore: cast_nullable_to_non_nullable
              as int,
      dnsCacheLiveFreed: null == dnsCacheLiveFreed
          ? _self.dnsCacheLiveFreed
          : dnsCacheLiveFreed // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesForwarded: null == dnsQueriesForwarded
          ? _self.dnsQueriesForwarded
          : dnsQueriesForwarded // ignore: cast_nullable_to_non_nullable
              as int,
      dnsAuthAnswered: null == dnsAuthAnswered
          ? _self.dnsAuthAnswered
          : dnsAuthAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsLocalAnswered: null == dnsLocalAnswered
          ? _self.dnsLocalAnswered
          : dnsLocalAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsStaleAnswered: null == dnsStaleAnswered
          ? _self.dnsStaleAnswered
          : dnsStaleAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsUnanswered: null == dnsUnanswered
          ? _self.dnsUnanswered
          : dnsUnanswered // ignore: cast_nullable_to_non_nullable
              as int,
      bootp: null == bootp
          ? _self.bootp
          : bootp // ignore: cast_nullable_to_non_nullable
              as int,
      pxe: null == pxe
          ? _self.pxe
          : pxe // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpAck: null == dhcpAck
          ? _self.dhcpAck
          : dhcpAck // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDecline: null == dhcpDecline
          ? _self.dhcpDecline
          : dhcpDecline // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDiscover: null == dhcpDiscover
          ? _self.dhcpDiscover
          : dhcpDiscover // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpInform: null == dhcpInform
          ? _self.dhcpInform
          : dhcpInform // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpNak: null == dhcpNak
          ? _self.dhcpNak
          : dhcpNak // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpOffer: null == dhcpOffer
          ? _self.dhcpOffer
          : dhcpOffer // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRelease: null == dhcpRelease
          ? _self.dhcpRelease
          : dhcpRelease // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRequest: null == dhcpRequest
          ? _self.dhcpRequest
          : dhcpRequest // ignore: cast_nullable_to_non_nullable
              as int,
      noAnswer: null == noAnswer
          ? _self.noAnswer
          : noAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated4: null == leasesAllocated4
          ? _self.leasesAllocated4
          : leasesAllocated4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned4: null == leasesPruned4
          ? _self.leasesPruned4
          : leasesPruned4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated6: null == leasesAllocated6
          ? _self.leasesAllocated6
          : leasesAllocated6 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned6: null == leasesPruned6
          ? _self.leasesPruned6
          : leasesPruned6 // ignore: cast_nullable_to_non_nullable
              as int,
      tcpConnections: null == tcpConnections
          ? _self.tcpConnections
          : tcpConnections // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxCryptoUse: null == dnssecMaxCryptoUse
          ? _self.dnssecMaxCryptoUse
          : dnssecMaxCryptoUse // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxSigFail: null == dnssecMaxSigFail
          ? _self.dnssecMaxSigFail
          : dnssecMaxSigFail // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxWork: null == dnssecMaxWork
          ? _self.dnssecMaxWork
          : dnssecMaxWork // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Dnsmasq].
extension DnsmasqPatterns on Dnsmasq {
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
    TResult Function(_Dnsmasq value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Dnsmasq() when $default != null:
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
    TResult Function(_Dnsmasq value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Dnsmasq():
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
    TResult? Function(_Dnsmasq value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Dnsmasq() when $default != null:
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
            @JsonKey(name: 'dns_cache_inserted') int dnsCacheInserted,
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
            @JsonKey(name: 'dnssec_max_work') int dnssecMaxWork)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Dnsmasq() when $default != null:
        return $default(
            _that.dnsCacheInserted,
            _that.dnsCacheLiveFreed,
            _that.dnsQueriesForwarded,
            _that.dnsAuthAnswered,
            _that.dnsLocalAnswered,
            _that.dnsStaleAnswered,
            _that.dnsUnanswered,
            _that.bootp,
            _that.pxe,
            _that.dhcpAck,
            _that.dhcpDecline,
            _that.dhcpDiscover,
            _that.dhcpInform,
            _that.dhcpNak,
            _that.dhcpOffer,
            _that.dhcpRelease,
            _that.dhcpRequest,
            _that.noAnswer,
            _that.leasesAllocated4,
            _that.leasesPruned4,
            _that.leasesAllocated6,
            _that.leasesPruned6,
            _that.tcpConnections,
            _that.dnssecMaxCryptoUse,
            _that.dnssecMaxSigFail,
            _that.dnssecMaxWork);
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
            @JsonKey(name: 'dns_cache_inserted') int dnsCacheInserted,
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
            @JsonKey(name: 'dnssec_max_work') int dnssecMaxWork)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Dnsmasq():
        return $default(
            _that.dnsCacheInserted,
            _that.dnsCacheLiveFreed,
            _that.dnsQueriesForwarded,
            _that.dnsAuthAnswered,
            _that.dnsLocalAnswered,
            _that.dnsStaleAnswered,
            _that.dnsUnanswered,
            _that.bootp,
            _that.pxe,
            _that.dhcpAck,
            _that.dhcpDecline,
            _that.dhcpDiscover,
            _that.dhcpInform,
            _that.dhcpNak,
            _that.dhcpOffer,
            _that.dhcpRelease,
            _that.dhcpRequest,
            _that.noAnswer,
            _that.leasesAllocated4,
            _that.leasesPruned4,
            _that.leasesAllocated6,
            _that.leasesPruned6,
            _that.tcpConnections,
            _that.dnssecMaxCryptoUse,
            _that.dnssecMaxSigFail,
            _that.dnssecMaxWork);
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
            @JsonKey(name: 'dns_cache_inserted') int dnsCacheInserted,
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
            @JsonKey(name: 'dnssec_max_work') int dnssecMaxWork)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Dnsmasq() when $default != null:
        return $default(
            _that.dnsCacheInserted,
            _that.dnsCacheLiveFreed,
            _that.dnsQueriesForwarded,
            _that.dnsAuthAnswered,
            _that.dnsLocalAnswered,
            _that.dnsStaleAnswered,
            _that.dnsUnanswered,
            _that.bootp,
            _that.pxe,
            _that.dhcpAck,
            _that.dhcpDecline,
            _that.dhcpDiscover,
            _that.dhcpInform,
            _that.dhcpNak,
            _that.dhcpOffer,
            _that.dhcpRelease,
            _that.dhcpRequest,
            _that.noAnswer,
            _that.leasesAllocated4,
            _that.leasesPruned4,
            _that.leasesAllocated6,
            _that.leasesPruned6,
            _that.tcpConnections,
            _that.dnssecMaxCryptoUse,
            _that.dnssecMaxSigFail,
            _that.dnssecMaxWork);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Dnsmasq implements Dnsmasq {
  const _Dnsmasq(
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
  factory _Dnsmasq.fromJson(Map<String, dynamic> json) =>
      _$DnsmasqFromJson(json);

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

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DnsmasqCopyWith<_Dnsmasq> get copyWith =>
      __$DnsmasqCopyWithImpl<_Dnsmasq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DnsmasqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dnsmasq &&
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

  @override
  String toString() {
    return 'Dnsmasq(dnsCacheInserted: $dnsCacheInserted, dnsCacheLiveFreed: $dnsCacheLiveFreed, dnsQueriesForwarded: $dnsQueriesForwarded, dnsAuthAnswered: $dnsAuthAnswered, dnsLocalAnswered: $dnsLocalAnswered, dnsStaleAnswered: $dnsStaleAnswered, dnsUnanswered: $dnsUnanswered, bootp: $bootp, pxe: $pxe, dhcpAck: $dhcpAck, dhcpDecline: $dhcpDecline, dhcpDiscover: $dhcpDiscover, dhcpInform: $dhcpInform, dhcpNak: $dhcpNak, dhcpOffer: $dhcpOffer, dhcpRelease: $dhcpRelease, dhcpRequest: $dhcpRequest, noAnswer: $noAnswer, leasesAllocated4: $leasesAllocated4, leasesPruned4: $leasesPruned4, leasesAllocated6: $leasesAllocated6, leasesPruned6: $leasesPruned6, tcpConnections: $tcpConnections, dnssecMaxCryptoUse: $dnssecMaxCryptoUse, dnssecMaxSigFail: $dnssecMaxSigFail, dnssecMaxWork: $dnssecMaxWork)';
  }
}

/// @nodoc
abstract mixin class _$DnsmasqCopyWith<$Res> implements $DnsmasqCopyWith<$Res> {
  factory _$DnsmasqCopyWith(_Dnsmasq value, $Res Function(_Dnsmasq) _then) =
      __$DnsmasqCopyWithImpl;
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
class __$DnsmasqCopyWithImpl<$Res> implements _$DnsmasqCopyWith<$Res> {
  __$DnsmasqCopyWithImpl(this._self, this._then);

  final _Dnsmasq _self;
  final $Res Function(_Dnsmasq) _then;

  /// Create a copy of Dnsmasq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Dnsmasq(
      dnsCacheInserted: null == dnsCacheInserted
          ? _self.dnsCacheInserted
          : dnsCacheInserted // ignore: cast_nullable_to_non_nullable
              as int,
      dnsCacheLiveFreed: null == dnsCacheLiveFreed
          ? _self.dnsCacheLiveFreed
          : dnsCacheLiveFreed // ignore: cast_nullable_to_non_nullable
              as int,
      dnsQueriesForwarded: null == dnsQueriesForwarded
          ? _self.dnsQueriesForwarded
          : dnsQueriesForwarded // ignore: cast_nullable_to_non_nullable
              as int,
      dnsAuthAnswered: null == dnsAuthAnswered
          ? _self.dnsAuthAnswered
          : dnsAuthAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsLocalAnswered: null == dnsLocalAnswered
          ? _self.dnsLocalAnswered
          : dnsLocalAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsStaleAnswered: null == dnsStaleAnswered
          ? _self.dnsStaleAnswered
          : dnsStaleAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      dnsUnanswered: null == dnsUnanswered
          ? _self.dnsUnanswered
          : dnsUnanswered // ignore: cast_nullable_to_non_nullable
              as int,
      bootp: null == bootp
          ? _self.bootp
          : bootp // ignore: cast_nullable_to_non_nullable
              as int,
      pxe: null == pxe
          ? _self.pxe
          : pxe // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpAck: null == dhcpAck
          ? _self.dhcpAck
          : dhcpAck // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDecline: null == dhcpDecline
          ? _self.dhcpDecline
          : dhcpDecline // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpDiscover: null == dhcpDiscover
          ? _self.dhcpDiscover
          : dhcpDiscover // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpInform: null == dhcpInform
          ? _self.dhcpInform
          : dhcpInform // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpNak: null == dhcpNak
          ? _self.dhcpNak
          : dhcpNak // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpOffer: null == dhcpOffer
          ? _self.dhcpOffer
          : dhcpOffer // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRelease: null == dhcpRelease
          ? _self.dhcpRelease
          : dhcpRelease // ignore: cast_nullable_to_non_nullable
              as int,
      dhcpRequest: null == dhcpRequest
          ? _self.dhcpRequest
          : dhcpRequest // ignore: cast_nullable_to_non_nullable
              as int,
      noAnswer: null == noAnswer
          ? _self.noAnswer
          : noAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated4: null == leasesAllocated4
          ? _self.leasesAllocated4
          : leasesAllocated4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned4: null == leasesPruned4
          ? _self.leasesPruned4
          : leasesPruned4 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesAllocated6: null == leasesAllocated6
          ? _self.leasesAllocated6
          : leasesAllocated6 // ignore: cast_nullable_to_non_nullable
              as int,
      leasesPruned6: null == leasesPruned6
          ? _self.leasesPruned6
          : leasesPruned6 // ignore: cast_nullable_to_non_nullable
              as int,
      tcpConnections: null == tcpConnections
          ? _self.tcpConnections
          : tcpConnections // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxCryptoUse: null == dnssecMaxCryptoUse
          ? _self.dnssecMaxCryptoUse
          : dnssecMaxCryptoUse // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxSigFail: null == dnssecMaxSigFail
          ? _self.dnssecMaxSigFail
          : dnssecMaxSigFail // ignore: cast_nullable_to_non_nullable
              as int,
      dnssecMaxWork: null == dnssecMaxWork
          ? _self.dnssecMaxWork
          : dnssecMaxWork // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
