// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoHost {
  HostData get host;
  double get took;

  /// Create a copy of InfoHost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoHostCopyWith<InfoHost> get copyWith =>
      _$InfoHostCopyWithImpl<InfoHost>(this as InfoHost, _$identity);

  /// Serializes this InfoHost to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoHost &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, host, took);

  @override
  String toString() {
    return 'InfoHost(host: $host, took: $took)';
  }
}

/// @nodoc
abstract mixin class $InfoHostCopyWith<$Res> {
  factory $InfoHostCopyWith(InfoHost value, $Res Function(InfoHost) _then) =
      _$InfoHostCopyWithImpl;
  @useResult
  $Res call({HostData host, double took});

  $HostDataCopyWith<$Res> get host;
}

/// @nodoc
class _$InfoHostCopyWithImpl<$Res> implements $InfoHostCopyWith<$Res> {
  _$InfoHostCopyWithImpl(this._self, this._then);

  final InfoHost _self;
  final $Res Function(InfoHost) _then;

  /// Create a copy of InfoHost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      host: null == host
          ? _self.host
          : host // ignore: cast_nullable_to_non_nullable
              as HostData,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of InfoHost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostDataCopyWith<$Res> get host {
    return $HostDataCopyWith<$Res>(_self.host, (value) {
      return _then(_self.copyWith(host: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InfoHost].
extension InfoHostPatterns on InfoHost {
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
    TResult Function(_InfoHost value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoHost() when $default != null:
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
    TResult Function(_InfoHost value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoHost():
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
    TResult? Function(_InfoHost value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoHost() when $default != null:
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
    TResult Function(HostData host, double took)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoHost() when $default != null:
        return $default(_that.host, _that.took);
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
    TResult Function(HostData host, double took) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoHost():
        return $default(_that.host, _that.took);
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
    TResult? Function(HostData host, double took)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoHost() when $default != null:
        return $default(_that.host, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoHost implements InfoHost {
  const _InfoHost({required this.host, required this.took});
  factory _InfoHost.fromJson(Map<String, dynamic> json) =>
      _$InfoHostFromJson(json);

  @override
  final HostData host;
  @override
  final double took;

  /// Create a copy of InfoHost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoHostCopyWith<_InfoHost> get copyWith =>
      __$InfoHostCopyWithImpl<_InfoHost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoHostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoHost &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, host, took);

  @override
  String toString() {
    return 'InfoHost(host: $host, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$InfoHostCopyWith<$Res>
    implements $InfoHostCopyWith<$Res> {
  factory _$InfoHostCopyWith(_InfoHost value, $Res Function(_InfoHost) _then) =
      __$InfoHostCopyWithImpl;
  @override
  @useResult
  $Res call({HostData host, double took});

  @override
  $HostDataCopyWith<$Res> get host;
}

/// @nodoc
class __$InfoHostCopyWithImpl<$Res> implements _$InfoHostCopyWith<$Res> {
  __$InfoHostCopyWithImpl(this._self, this._then);

  final _InfoHost _self;
  final $Res Function(_InfoHost) _then;

  /// Create a copy of InfoHost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? host = null,
    Object? took = null,
  }) {
    return _then(_InfoHost(
      host: null == host
          ? _self.host
          : host // ignore: cast_nullable_to_non_nullable
              as HostData,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of InfoHost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostDataCopyWith<$Res> get host {
    return $HostDataCopyWith<$Res>(_self.host, (value) {
      return _then(_self.copyWith(host: value));
    });
  }
}

/// @nodoc
mixin _$HostData {
  HostUname get uname;
  String? get model;
  HostDmi get dmi;

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HostDataCopyWith<HostData> get copyWith =>
      _$HostDataCopyWithImpl<HostData>(this as HostData, _$identity);

  /// Serializes this HostData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HostData &&
            (identical(other.uname, uname) || other.uname == uname) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.dmi, dmi) || other.dmi == dmi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uname, model, dmi);

  @override
  String toString() {
    return 'HostData(uname: $uname, model: $model, dmi: $dmi)';
  }
}

/// @nodoc
abstract mixin class $HostDataCopyWith<$Res> {
  factory $HostDataCopyWith(HostData value, $Res Function(HostData) _then) =
      _$HostDataCopyWithImpl;
  @useResult
  $Res call({HostUname uname, String? model, HostDmi dmi});

  $HostUnameCopyWith<$Res> get uname;
  $HostDmiCopyWith<$Res> get dmi;
}

/// @nodoc
class _$HostDataCopyWithImpl<$Res> implements $HostDataCopyWith<$Res> {
  _$HostDataCopyWithImpl(this._self, this._then);

  final HostData _self;
  final $Res Function(HostData) _then;

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uname = null,
    Object? model = freezed,
    Object? dmi = null,
  }) {
    return _then(_self.copyWith(
      uname: null == uname
          ? _self.uname
          : uname // ignore: cast_nullable_to_non_nullable
              as HostUname,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      dmi: null == dmi
          ? _self.dmi
          : dmi // ignore: cast_nullable_to_non_nullable
              as HostDmi,
    ));
  }

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostUnameCopyWith<$Res> get uname {
    return $HostUnameCopyWith<$Res>(_self.uname, (value) {
      return _then(_self.copyWith(uname: value));
    });
  }

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostDmiCopyWith<$Res> get dmi {
    return $HostDmiCopyWith<$Res>(_self.dmi, (value) {
      return _then(_self.copyWith(dmi: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HostData].
extension HostDataPatterns on HostData {
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
    TResult Function(_HostData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HostData() when $default != null:
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
    TResult Function(_HostData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostData():
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
    TResult? Function(_HostData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostData() when $default != null:
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
    TResult Function(HostUname uname, String? model, HostDmi dmi)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HostData() when $default != null:
        return $default(_that.uname, _that.model, _that.dmi);
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
    TResult Function(HostUname uname, String? model, HostDmi dmi) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostData():
        return $default(_that.uname, _that.model, _that.dmi);
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
    TResult? Function(HostUname uname, String? model, HostDmi dmi)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostData() when $default != null:
        return $default(_that.uname, _that.model, _that.dmi);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _HostData implements HostData {
  const _HostData(
      {required this.uname, required this.model, required this.dmi});
  factory _HostData.fromJson(Map<String, dynamic> json) =>
      _$HostDataFromJson(json);

  @override
  final HostUname uname;
  @override
  final String? model;
  @override
  final HostDmi dmi;

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HostDataCopyWith<_HostData> get copyWith =>
      __$HostDataCopyWithImpl<_HostData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HostDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HostData &&
            (identical(other.uname, uname) || other.uname == uname) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.dmi, dmi) || other.dmi == dmi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uname, model, dmi);

  @override
  String toString() {
    return 'HostData(uname: $uname, model: $model, dmi: $dmi)';
  }
}

/// @nodoc
abstract mixin class _$HostDataCopyWith<$Res>
    implements $HostDataCopyWith<$Res> {
  factory _$HostDataCopyWith(_HostData value, $Res Function(_HostData) _then) =
      __$HostDataCopyWithImpl;
  @override
  @useResult
  $Res call({HostUname uname, String? model, HostDmi dmi});

  @override
  $HostUnameCopyWith<$Res> get uname;
  @override
  $HostDmiCopyWith<$Res> get dmi;
}

/// @nodoc
class __$HostDataCopyWithImpl<$Res> implements _$HostDataCopyWith<$Res> {
  __$HostDataCopyWithImpl(this._self, this._then);

  final _HostData _self;
  final $Res Function(_HostData) _then;

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uname = null,
    Object? model = freezed,
    Object? dmi = null,
  }) {
    return _then(_HostData(
      uname: null == uname
          ? _self.uname
          : uname // ignore: cast_nullable_to_non_nullable
              as HostUname,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      dmi: null == dmi
          ? _self.dmi
          : dmi // ignore: cast_nullable_to_non_nullable
              as HostDmi,
    ));
  }

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostUnameCopyWith<$Res> get uname {
    return $HostUnameCopyWith<$Res>(_self.uname, (value) {
      return _then(_self.copyWith(uname: value));
    });
  }

  /// Create a copy of HostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostDmiCopyWith<$Res> get dmi {
    return $HostDmiCopyWith<$Res>(_self.dmi, (value) {
      return _then(_self.copyWith(dmi: value));
    });
  }
}

/// @nodoc
mixin _$HostUname {
  String get domainname;
  String get machine;
  String get nodename;
  String get release;
  String get sysname;
  String get version;

  /// Create a copy of HostUname
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HostUnameCopyWith<HostUname> get copyWith =>
      _$HostUnameCopyWithImpl<HostUname>(this as HostUname, _$identity);

  /// Serializes this HostUname to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HostUname &&
            (identical(other.domainname, domainname) ||
                other.domainname == domainname) &&
            (identical(other.machine, machine) || other.machine == machine) &&
            (identical(other.nodename, nodename) ||
                other.nodename == nodename) &&
            (identical(other.release, release) || other.release == release) &&
            (identical(other.sysname, sysname) || other.sysname == sysname) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, domainname, machine, nodename, release, sysname, version);

  @override
  String toString() {
    return 'HostUname(domainname: $domainname, machine: $machine, nodename: $nodename, release: $release, sysname: $sysname, version: $version)';
  }
}

/// @nodoc
abstract mixin class $HostUnameCopyWith<$Res> {
  factory $HostUnameCopyWith(HostUname value, $Res Function(HostUname) _then) =
      _$HostUnameCopyWithImpl;
  @useResult
  $Res call(
      {String domainname,
      String machine,
      String nodename,
      String release,
      String sysname,
      String version});
}

/// @nodoc
class _$HostUnameCopyWithImpl<$Res> implements $HostUnameCopyWith<$Res> {
  _$HostUnameCopyWithImpl(this._self, this._then);

  final HostUname _self;
  final $Res Function(HostUname) _then;

  /// Create a copy of HostUname
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domainname = null,
    Object? machine = null,
    Object? nodename = null,
    Object? release = null,
    Object? sysname = null,
    Object? version = null,
  }) {
    return _then(_self.copyWith(
      domainname: null == domainname
          ? _self.domainname
          : domainname // ignore: cast_nullable_to_non_nullable
              as String,
      machine: null == machine
          ? _self.machine
          : machine // ignore: cast_nullable_to_non_nullable
              as String,
      nodename: null == nodename
          ? _self.nodename
          : nodename // ignore: cast_nullable_to_non_nullable
              as String,
      release: null == release
          ? _self.release
          : release // ignore: cast_nullable_to_non_nullable
              as String,
      sysname: null == sysname
          ? _self.sysname
          : sysname // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [HostUname].
extension HostUnamePatterns on HostUname {
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
    TResult Function(_HostUname value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HostUname() when $default != null:
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
    TResult Function(_HostUname value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostUname():
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
    TResult? Function(_HostUname value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostUname() when $default != null:
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
    TResult Function(String domainname, String machine, String nodename,
            String release, String sysname, String version)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HostUname() when $default != null:
        return $default(_that.domainname, _that.machine, _that.nodename,
            _that.release, _that.sysname, _that.version);
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
    TResult Function(String domainname, String machine, String nodename,
            String release, String sysname, String version)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostUname():
        return $default(_that.domainname, _that.machine, _that.nodename,
            _that.release, _that.sysname, _that.version);
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
    TResult? Function(String domainname, String machine, String nodename,
            String release, String sysname, String version)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostUname() when $default != null:
        return $default(_that.domainname, _that.machine, _that.nodename,
            _that.release, _that.sysname, _that.version);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HostUname implements HostUname {
  const _HostUname(
      {required this.domainname,
      required this.machine,
      required this.nodename,
      required this.release,
      required this.sysname,
      required this.version});
  factory _HostUname.fromJson(Map<String, dynamic> json) =>
      _$HostUnameFromJson(json);

  @override
  final String domainname;
  @override
  final String machine;
  @override
  final String nodename;
  @override
  final String release;
  @override
  final String sysname;
  @override
  final String version;

  /// Create a copy of HostUname
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HostUnameCopyWith<_HostUname> get copyWith =>
      __$HostUnameCopyWithImpl<_HostUname>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HostUnameToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HostUname &&
            (identical(other.domainname, domainname) ||
                other.domainname == domainname) &&
            (identical(other.machine, machine) || other.machine == machine) &&
            (identical(other.nodename, nodename) ||
                other.nodename == nodename) &&
            (identical(other.release, release) || other.release == release) &&
            (identical(other.sysname, sysname) || other.sysname == sysname) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, domainname, machine, nodename, release, sysname, version);

  @override
  String toString() {
    return 'HostUname(domainname: $domainname, machine: $machine, nodename: $nodename, release: $release, sysname: $sysname, version: $version)';
  }
}

/// @nodoc
abstract mixin class _$HostUnameCopyWith<$Res>
    implements $HostUnameCopyWith<$Res> {
  factory _$HostUnameCopyWith(
          _HostUname value, $Res Function(_HostUname) _then) =
      __$HostUnameCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String domainname,
      String machine,
      String nodename,
      String release,
      String sysname,
      String version});
}

/// @nodoc
class __$HostUnameCopyWithImpl<$Res> implements _$HostUnameCopyWith<$Res> {
  __$HostUnameCopyWithImpl(this._self, this._then);

  final _HostUname _self;
  final $Res Function(_HostUname) _then;

  /// Create a copy of HostUname
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? domainname = null,
    Object? machine = null,
    Object? nodename = null,
    Object? release = null,
    Object? sysname = null,
    Object? version = null,
  }) {
    return _then(_HostUname(
      domainname: null == domainname
          ? _self.domainname
          : domainname // ignore: cast_nullable_to_non_nullable
              as String,
      machine: null == machine
          ? _self.machine
          : machine // ignore: cast_nullable_to_non_nullable
              as String,
      nodename: null == nodename
          ? _self.nodename
          : nodename // ignore: cast_nullable_to_non_nullable
              as String,
      release: null == release
          ? _self.release
          : release // ignore: cast_nullable_to_non_nullable
              as String,
      sysname: null == sysname
          ? _self.sysname
          : sysname // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$HostDmi {
  BiosInfo get bios;
  BoardInfo get board;
  ProductInfo get product;
  SystemInfo get sys;

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HostDmiCopyWith<HostDmi> get copyWith =>
      _$HostDmiCopyWithImpl<HostDmi>(this as HostDmi, _$identity);

  /// Serializes this HostDmi to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HostDmi &&
            (identical(other.bios, bios) || other.bios == bios) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.sys, sys) || other.sys == sys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bios, board, product, sys);

  @override
  String toString() {
    return 'HostDmi(bios: $bios, board: $board, product: $product, sys: $sys)';
  }
}

/// @nodoc
abstract mixin class $HostDmiCopyWith<$Res> {
  factory $HostDmiCopyWith(HostDmi value, $Res Function(HostDmi) _then) =
      _$HostDmiCopyWithImpl;
  @useResult
  $Res call(
      {BiosInfo bios, BoardInfo board, ProductInfo product, SystemInfo sys});

  $BiosInfoCopyWith<$Res> get bios;
  $BoardInfoCopyWith<$Res> get board;
  $ProductInfoCopyWith<$Res> get product;
  $SystemInfoCopyWith<$Res> get sys;
}

/// @nodoc
class _$HostDmiCopyWithImpl<$Res> implements $HostDmiCopyWith<$Res> {
  _$HostDmiCopyWithImpl(this._self, this._then);

  final HostDmi _self;
  final $Res Function(HostDmi) _then;

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bios = null,
    Object? board = null,
    Object? product = null,
    Object? sys = null,
  }) {
    return _then(_self.copyWith(
      bios: null == bios
          ? _self.bios
          : bios // ignore: cast_nullable_to_non_nullable
              as BiosInfo,
      board: null == board
          ? _self.board
          : board // ignore: cast_nullable_to_non_nullable
              as BoardInfo,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductInfo,
      sys: null == sys
          ? _self.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as SystemInfo,
    ));
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BiosInfoCopyWith<$Res> get bios {
    return $BiosInfoCopyWith<$Res>(_self.bios, (value) {
      return _then(_self.copyWith(bios: value));
    });
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardInfoCopyWith<$Res> get board {
    return $BoardInfoCopyWith<$Res>(_self.board, (value) {
      return _then(_self.copyWith(board: value));
    });
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductInfoCopyWith<$Res> get product {
    return $ProductInfoCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SystemInfoCopyWith<$Res> get sys {
    return $SystemInfoCopyWith<$Res>(_self.sys, (value) {
      return _then(_self.copyWith(sys: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HostDmi].
extension HostDmiPatterns on HostDmi {
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
    TResult Function(_HostDmi value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HostDmi() when $default != null:
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
    TResult Function(_HostDmi value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostDmi():
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
    TResult? Function(_HostDmi value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostDmi() when $default != null:
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
    TResult Function(BiosInfo bios, BoardInfo board, ProductInfo product,
            SystemInfo sys)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HostDmi() when $default != null:
        return $default(_that.bios, _that.board, _that.product, _that.sys);
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
            BiosInfo bios, BoardInfo board, ProductInfo product, SystemInfo sys)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostDmi():
        return $default(_that.bios, _that.board, _that.product, _that.sys);
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
    TResult? Function(BiosInfo bios, BoardInfo board, ProductInfo product,
            SystemInfo sys)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HostDmi() when $default != null:
        return $default(_that.bios, _that.board, _that.product, _that.sys);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _HostDmi implements HostDmi {
  const _HostDmi(
      {required this.bios,
      required this.board,
      required this.product,
      required this.sys});
  factory _HostDmi.fromJson(Map<String, dynamic> json) =>
      _$HostDmiFromJson(json);

  @override
  final BiosInfo bios;
  @override
  final BoardInfo board;
  @override
  final ProductInfo product;
  @override
  final SystemInfo sys;

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HostDmiCopyWith<_HostDmi> get copyWith =>
      __$HostDmiCopyWithImpl<_HostDmi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HostDmiToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HostDmi &&
            (identical(other.bios, bios) || other.bios == bios) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.sys, sys) || other.sys == sys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bios, board, product, sys);

  @override
  String toString() {
    return 'HostDmi(bios: $bios, board: $board, product: $product, sys: $sys)';
  }
}

/// @nodoc
abstract mixin class _$HostDmiCopyWith<$Res> implements $HostDmiCopyWith<$Res> {
  factory _$HostDmiCopyWith(_HostDmi value, $Res Function(_HostDmi) _then) =
      __$HostDmiCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BiosInfo bios, BoardInfo board, ProductInfo product, SystemInfo sys});

  @override
  $BiosInfoCopyWith<$Res> get bios;
  @override
  $BoardInfoCopyWith<$Res> get board;
  @override
  $ProductInfoCopyWith<$Res> get product;
  @override
  $SystemInfoCopyWith<$Res> get sys;
}

/// @nodoc
class __$HostDmiCopyWithImpl<$Res> implements _$HostDmiCopyWith<$Res> {
  __$HostDmiCopyWithImpl(this._self, this._then);

  final _HostDmi _self;
  final $Res Function(_HostDmi) _then;

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bios = null,
    Object? board = null,
    Object? product = null,
    Object? sys = null,
  }) {
    return _then(_HostDmi(
      bios: null == bios
          ? _self.bios
          : bios // ignore: cast_nullable_to_non_nullable
              as BiosInfo,
      board: null == board
          ? _self.board
          : board // ignore: cast_nullable_to_non_nullable
              as BoardInfo,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductInfo,
      sys: null == sys
          ? _self.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as SystemInfo,
    ));
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BiosInfoCopyWith<$Res> get bios {
    return $BiosInfoCopyWith<$Res>(_self.bios, (value) {
      return _then(_self.copyWith(bios: value));
    });
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardInfoCopyWith<$Res> get board {
    return $BoardInfoCopyWith<$Res>(_self.board, (value) {
      return _then(_self.copyWith(board: value));
    });
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductInfoCopyWith<$Res> get product {
    return $ProductInfoCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }

  /// Create a copy of HostDmi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SystemInfoCopyWith<$Res> get sys {
    return $SystemInfoCopyWith<$Res>(_self.sys, (value) {
      return _then(_self.copyWith(sys: value));
    });
  }
}

/// @nodoc
mixin _$BiosInfo {
  @JsonKey(name: 'vendor')
  String? get vendor;

  /// Create a copy of BiosInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BiosInfoCopyWith<BiosInfo> get copyWith =>
      _$BiosInfoCopyWithImpl<BiosInfo>(this as BiosInfo, _$identity);

  /// Serializes this BiosInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BiosInfo &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vendor);

  @override
  String toString() {
    return 'BiosInfo(vendor: $vendor)';
  }
}

/// @nodoc
abstract mixin class $BiosInfoCopyWith<$Res> {
  factory $BiosInfoCopyWith(BiosInfo value, $Res Function(BiosInfo) _then) =
      _$BiosInfoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'vendor') String? vendor});
}

/// @nodoc
class _$BiosInfoCopyWithImpl<$Res> implements $BiosInfoCopyWith<$Res> {
  _$BiosInfoCopyWithImpl(this._self, this._then);

  final BiosInfo _self;
  final $Res Function(BiosInfo) _then;

  /// Create a copy of BiosInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = freezed,
  }) {
    return _then(_self.copyWith(
      vendor: freezed == vendor
          ? _self.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BiosInfo].
extension BiosInfoPatterns on BiosInfo {
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
    TResult Function(_BiosInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BiosInfo() when $default != null:
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
    TResult Function(_BiosInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiosInfo():
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
    TResult? Function(_BiosInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiosInfo() when $default != null:
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
    TResult Function(@JsonKey(name: 'vendor') String? vendor)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BiosInfo() when $default != null:
        return $default(_that.vendor);
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
    TResult Function(@JsonKey(name: 'vendor') String? vendor) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiosInfo():
        return $default(_that.vendor);
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
    TResult? Function(@JsonKey(name: 'vendor') String? vendor)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BiosInfo() when $default != null:
        return $default(_that.vendor);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BiosInfo implements BiosInfo {
  const _BiosInfo({@JsonKey(name: 'vendor') required this.vendor});
  factory _BiosInfo.fromJson(Map<String, dynamic> json) =>
      _$BiosInfoFromJson(json);

  @override
  @JsonKey(name: 'vendor')
  final String? vendor;

  /// Create a copy of BiosInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BiosInfoCopyWith<_BiosInfo> get copyWith =>
      __$BiosInfoCopyWithImpl<_BiosInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BiosInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BiosInfo &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vendor);

  @override
  String toString() {
    return 'BiosInfo(vendor: $vendor)';
  }
}

/// @nodoc
abstract mixin class _$BiosInfoCopyWith<$Res>
    implements $BiosInfoCopyWith<$Res> {
  factory _$BiosInfoCopyWith(_BiosInfo value, $Res Function(_BiosInfo) _then) =
      __$BiosInfoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'vendor') String? vendor});
}

/// @nodoc
class __$BiosInfoCopyWithImpl<$Res> implements _$BiosInfoCopyWith<$Res> {
  __$BiosInfoCopyWithImpl(this._self, this._then);

  final _BiosInfo _self;
  final $Res Function(_BiosInfo) _then;

  /// Create a copy of BiosInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vendor = freezed,
  }) {
    return _then(_BiosInfo(
      vendor: freezed == vendor
          ? _self.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$BoardInfo {
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'vendor')
  String? get vendor;
  @JsonKey(name: 'version')
  String? get version;

  /// Create a copy of BoardInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BoardInfoCopyWith<BoardInfo> get copyWith =>
      _$BoardInfoCopyWithImpl<BoardInfo>(this as BoardInfo, _$identity);

  /// Serializes this BoardInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoardInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, vendor, version);

  @override
  String toString() {
    return 'BoardInfo(name: $name, vendor: $vendor, version: $version)';
  }
}

/// @nodoc
abstract mixin class $BoardInfoCopyWith<$Res> {
  factory $BoardInfoCopyWith(BoardInfo value, $Res Function(BoardInfo) _then) =
      _$BoardInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'vendor') String? vendor,
      @JsonKey(name: 'version') String? version});
}

/// @nodoc
class _$BoardInfoCopyWithImpl<$Res> implements $BoardInfoCopyWith<$Res> {
  _$BoardInfoCopyWithImpl(this._self, this._then);

  final BoardInfo _self;
  final $Res Function(BoardInfo) _then;

  /// Create a copy of BoardInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _self.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BoardInfo].
extension BoardInfoPatterns on BoardInfo {
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
    TResult Function(_BoardInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BoardInfo() when $default != null:
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
    TResult Function(_BoardInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoardInfo():
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
    TResult? Function(_BoardInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoardInfo() when $default != null:
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
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'vendor') String? vendor,
            @JsonKey(name: 'version') String? version)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BoardInfo() when $default != null:
        return $default(_that.name, _that.vendor, _that.version);
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
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'vendor') String? vendor,
            @JsonKey(name: 'version') String? version)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoardInfo():
        return $default(_that.name, _that.vendor, _that.version);
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
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'vendor') String? vendor,
            @JsonKey(name: 'version') String? version)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BoardInfo() when $default != null:
        return $default(_that.name, _that.vendor, _that.version);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BoardInfo implements BoardInfo {
  const _BoardInfo(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'vendor') required this.vendor,
      @JsonKey(name: 'version') required this.version});
  factory _BoardInfo.fromJson(Map<String, dynamic> json) =>
      _$BoardInfoFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'vendor')
  final String? vendor;
  @override
  @JsonKey(name: 'version')
  final String? version;

  /// Create a copy of BoardInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BoardInfoCopyWith<_BoardInfo> get copyWith =>
      __$BoardInfoCopyWithImpl<_BoardInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BoardInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoardInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, vendor, version);

  @override
  String toString() {
    return 'BoardInfo(name: $name, vendor: $vendor, version: $version)';
  }
}

/// @nodoc
abstract mixin class _$BoardInfoCopyWith<$Res>
    implements $BoardInfoCopyWith<$Res> {
  factory _$BoardInfoCopyWith(
          _BoardInfo value, $Res Function(_BoardInfo) _then) =
      __$BoardInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'vendor') String? vendor,
      @JsonKey(name: 'version') String? version});
}

/// @nodoc
class __$BoardInfoCopyWithImpl<$Res> implements _$BoardInfoCopyWith<$Res> {
  __$BoardInfoCopyWithImpl(this._self, this._then);

  final _BoardInfo _self;
  final $Res Function(_BoardInfo) _then;

  /// Create a copy of BoardInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? vendor = freezed,
    Object? version = freezed,
  }) {
    return _then(_BoardInfo(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _self.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProductInfo {
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'version')
  String? get version;
  @JsonKey(name: 'family')
  String? get family;

  /// Create a copy of ProductInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductInfoCopyWith<ProductInfo> get copyWith =>
      _$ProductInfoCopyWithImpl<ProductInfo>(this as ProductInfo, _$identity);

  /// Serializes this ProductInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.family, family) || other.family == family));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, version, family);

  @override
  String toString() {
    return 'ProductInfo(name: $name, version: $version, family: $family)';
  }
}

/// @nodoc
abstract mixin class $ProductInfoCopyWith<$Res> {
  factory $ProductInfoCopyWith(
          ProductInfo value, $Res Function(ProductInfo) _then) =
      _$ProductInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'version') String? version,
      @JsonKey(name: 'family') String? family});
}

/// @nodoc
class _$ProductInfoCopyWithImpl<$Res> implements $ProductInfoCopyWith<$Res> {
  _$ProductInfoCopyWithImpl(this._self, this._then);

  final ProductInfo _self;
  final $Res Function(ProductInfo) _then;

  /// Create a copy of ProductInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? family = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      family: freezed == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductInfo].
extension ProductInfoPatterns on ProductInfo {
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
    TResult Function(_ProductInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductInfo() when $default != null:
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
    TResult Function(_ProductInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductInfo():
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
    TResult? Function(_ProductInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductInfo() when $default != null:
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
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'version') String? version,
            @JsonKey(name: 'family') String? family)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductInfo() when $default != null:
        return $default(_that.name, _that.version, _that.family);
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
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'version') String? version,
            @JsonKey(name: 'family') String? family)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductInfo():
        return $default(_that.name, _that.version, _that.family);
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
            @JsonKey(name: 'name') String? name,
            @JsonKey(name: 'version') String? version,
            @JsonKey(name: 'family') String? family)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductInfo() when $default != null:
        return $default(_that.name, _that.version, _that.family);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductInfo implements ProductInfo {
  const _ProductInfo(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'version') required this.version,
      @JsonKey(name: 'family') required this.family});
  factory _ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'version')
  final String? version;
  @override
  @JsonKey(name: 'family')
  final String? family;

  /// Create a copy of ProductInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductInfoCopyWith<_ProductInfo> get copyWith =>
      __$ProductInfoCopyWithImpl<_ProductInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.family, family) || other.family == family));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, version, family);

  @override
  String toString() {
    return 'ProductInfo(name: $name, version: $version, family: $family)';
  }
}

/// @nodoc
abstract mixin class _$ProductInfoCopyWith<$Res>
    implements $ProductInfoCopyWith<$Res> {
  factory _$ProductInfoCopyWith(
          _ProductInfo value, $Res Function(_ProductInfo) _then) =
      __$ProductInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'version') String? version,
      @JsonKey(name: 'family') String? family});
}

/// @nodoc
class __$ProductInfoCopyWithImpl<$Res> implements _$ProductInfoCopyWith<$Res> {
  __$ProductInfoCopyWithImpl(this._self, this._then);

  final _ProductInfo _self;
  final $Res Function(_ProductInfo) _then;

  /// Create a copy of ProductInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? family = freezed,
  }) {
    return _then(_ProductInfo(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      family: freezed == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SystemInfo {
  @JsonKey(name: 'vendor')
  String? get vendor;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SystemInfoCopyWith<SystemInfo> get copyWith =>
      _$SystemInfoCopyWithImpl<SystemInfo>(this as SystemInfo, _$identity);

  /// Serializes this SystemInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SystemInfo &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vendor);

  @override
  String toString() {
    return 'SystemInfo(vendor: $vendor)';
  }
}

/// @nodoc
abstract mixin class $SystemInfoCopyWith<$Res> {
  factory $SystemInfoCopyWith(
          SystemInfo value, $Res Function(SystemInfo) _then) =
      _$SystemInfoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'vendor') String? vendor});
}

/// @nodoc
class _$SystemInfoCopyWithImpl<$Res> implements $SystemInfoCopyWith<$Res> {
  _$SystemInfoCopyWithImpl(this._self, this._then);

  final SystemInfo _self;
  final $Res Function(SystemInfo) _then;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = freezed,
  }) {
    return _then(_self.copyWith(
      vendor: freezed == vendor
          ? _self.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SystemInfo].
extension SystemInfoPatterns on SystemInfo {
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
    TResult Function(_SystemInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SystemInfo() when $default != null:
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
    TResult Function(_SystemInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SystemInfo():
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
    TResult? Function(_SystemInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SystemInfo() when $default != null:
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
    TResult Function(@JsonKey(name: 'vendor') String? vendor)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SystemInfo() when $default != null:
        return $default(_that.vendor);
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
    TResult Function(@JsonKey(name: 'vendor') String? vendor) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SystemInfo():
        return $default(_that.vendor);
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
    TResult? Function(@JsonKey(name: 'vendor') String? vendor)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SystemInfo() when $default != null:
        return $default(_that.vendor);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SystemInfo implements SystemInfo {
  const _SystemInfo({@JsonKey(name: 'vendor') required this.vendor});
  factory _SystemInfo.fromJson(Map<String, dynamic> json) =>
      _$SystemInfoFromJson(json);

  @override
  @JsonKey(name: 'vendor')
  final String? vendor;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SystemInfoCopyWith<_SystemInfo> get copyWith =>
      __$SystemInfoCopyWithImpl<_SystemInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SystemInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SystemInfo &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vendor);

  @override
  String toString() {
    return 'SystemInfo(vendor: $vendor)';
  }
}

/// @nodoc
abstract mixin class _$SystemInfoCopyWith<$Res>
    implements $SystemInfoCopyWith<$Res> {
  factory _$SystemInfoCopyWith(
          _SystemInfo value, $Res Function(_SystemInfo) _then) =
      __$SystemInfoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'vendor') String? vendor});
}

/// @nodoc
class __$SystemInfoCopyWithImpl<$Res> implements _$SystemInfoCopyWith<$Res> {
  __$SystemInfoCopyWithImpl(this._self, this._then);

  final _SystemInfo _self;
  final $Res Function(_SystemInfo) _then;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vendor = freezed,
  }) {
    return _then(_SystemInfo(
      vendor: freezed == vendor
          ? _self.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
