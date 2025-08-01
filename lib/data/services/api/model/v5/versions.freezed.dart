// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'versions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Versions {
  @JsonKey(name: 'core_update')
  bool get coreUpdate;
  @JsonKey(name: 'web_update')
  bool get webUpdate;
  @JsonKey(name: 'FTL_update')
  bool get ftlUpdate;
  @JsonKey(name: 'core_current')
  String get coreCurrent;
  @JsonKey(name: 'web_current')
  String get webCurrent;
  @JsonKey(name: 'FTL_current')
  String get ftlCurrent;
  @JsonKey(name: 'core_latest')
  String get coreLatest;
  @JsonKey(name: 'web_latest')
  String get webLatest;
  @JsonKey(name: 'FTL_latest')
  String get ftlLatest;
  @JsonKey(name: 'core_branch')
  String get coreBranch;
  @JsonKey(name: 'web_branch')
  String get webBranch;
  @JsonKey(name: 'FTL_branch')
  String get ftlBranch;
  @JsonKey(name: 'docker_update')
  bool? get dockerUpdate;
  @JsonKey(name: 'docker_current')
  String? get dockerCurrent;
  @JsonKey(name: 'docker_latest')
  String? get dockerLatest;

  /// Create a copy of Versions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VersionsCopyWith<Versions> get copyWith =>
      _$VersionsCopyWithImpl<Versions>(this as Versions, _$identity);

  /// Serializes this Versions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Versions &&
            (identical(other.coreUpdate, coreUpdate) ||
                other.coreUpdate == coreUpdate) &&
            (identical(other.webUpdate, webUpdate) ||
                other.webUpdate == webUpdate) &&
            (identical(other.ftlUpdate, ftlUpdate) ||
                other.ftlUpdate == ftlUpdate) &&
            (identical(other.coreCurrent, coreCurrent) ||
                other.coreCurrent == coreCurrent) &&
            (identical(other.webCurrent, webCurrent) ||
                other.webCurrent == webCurrent) &&
            (identical(other.ftlCurrent, ftlCurrent) ||
                other.ftlCurrent == ftlCurrent) &&
            (identical(other.coreLatest, coreLatest) ||
                other.coreLatest == coreLatest) &&
            (identical(other.webLatest, webLatest) ||
                other.webLatest == webLatest) &&
            (identical(other.ftlLatest, ftlLatest) ||
                other.ftlLatest == ftlLatest) &&
            (identical(other.coreBranch, coreBranch) ||
                other.coreBranch == coreBranch) &&
            (identical(other.webBranch, webBranch) ||
                other.webBranch == webBranch) &&
            (identical(other.ftlBranch, ftlBranch) ||
                other.ftlBranch == ftlBranch) &&
            (identical(other.dockerUpdate, dockerUpdate) ||
                other.dockerUpdate == dockerUpdate) &&
            (identical(other.dockerCurrent, dockerCurrent) ||
                other.dockerCurrent == dockerCurrent) &&
            (identical(other.dockerLatest, dockerLatest) ||
                other.dockerLatest == dockerLatest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      coreUpdate,
      webUpdate,
      ftlUpdate,
      coreCurrent,
      webCurrent,
      ftlCurrent,
      coreLatest,
      webLatest,
      ftlLatest,
      coreBranch,
      webBranch,
      ftlBranch,
      dockerUpdate,
      dockerCurrent,
      dockerLatest);

  @override
  String toString() {
    return 'Versions(coreUpdate: $coreUpdate, webUpdate: $webUpdate, ftlUpdate: $ftlUpdate, coreCurrent: $coreCurrent, webCurrent: $webCurrent, ftlCurrent: $ftlCurrent, coreLatest: $coreLatest, webLatest: $webLatest, ftlLatest: $ftlLatest, coreBranch: $coreBranch, webBranch: $webBranch, ftlBranch: $ftlBranch, dockerUpdate: $dockerUpdate, dockerCurrent: $dockerCurrent, dockerLatest: $dockerLatest)';
  }
}

/// @nodoc
abstract mixin class $VersionsCopyWith<$Res> {
  factory $VersionsCopyWith(Versions value, $Res Function(Versions) _then) =
      _$VersionsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'core_update') bool coreUpdate,
      @JsonKey(name: 'web_update') bool webUpdate,
      @JsonKey(name: 'FTL_update') bool ftlUpdate,
      @JsonKey(name: 'core_current') String coreCurrent,
      @JsonKey(name: 'web_current') String webCurrent,
      @JsonKey(name: 'FTL_current') String ftlCurrent,
      @JsonKey(name: 'core_latest') String coreLatest,
      @JsonKey(name: 'web_latest') String webLatest,
      @JsonKey(name: 'FTL_latest') String ftlLatest,
      @JsonKey(name: 'core_branch') String coreBranch,
      @JsonKey(name: 'web_branch') String webBranch,
      @JsonKey(name: 'FTL_branch') String ftlBranch,
      @JsonKey(name: 'docker_update') bool? dockerUpdate,
      @JsonKey(name: 'docker_current') String? dockerCurrent,
      @JsonKey(name: 'docker_latest') String? dockerLatest});
}

/// @nodoc
class _$VersionsCopyWithImpl<$Res> implements $VersionsCopyWith<$Res> {
  _$VersionsCopyWithImpl(this._self, this._then);

  final Versions _self;
  final $Res Function(Versions) _then;

  /// Create a copy of Versions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coreUpdate = null,
    Object? webUpdate = null,
    Object? ftlUpdate = null,
    Object? coreCurrent = null,
    Object? webCurrent = null,
    Object? ftlCurrent = null,
    Object? coreLatest = null,
    Object? webLatest = null,
    Object? ftlLatest = null,
    Object? coreBranch = null,
    Object? webBranch = null,
    Object? ftlBranch = null,
    Object? dockerUpdate = freezed,
    Object? dockerCurrent = freezed,
    Object? dockerLatest = freezed,
  }) {
    return _then(_self.copyWith(
      coreUpdate: null == coreUpdate
          ? _self.coreUpdate
          : coreUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      webUpdate: null == webUpdate
          ? _self.webUpdate
          : webUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      ftlUpdate: null == ftlUpdate
          ? _self.ftlUpdate
          : ftlUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      coreCurrent: null == coreCurrent
          ? _self.coreCurrent
          : coreCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      webCurrent: null == webCurrent
          ? _self.webCurrent
          : webCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      ftlCurrent: null == ftlCurrent
          ? _self.ftlCurrent
          : ftlCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      coreLatest: null == coreLatest
          ? _self.coreLatest
          : coreLatest // ignore: cast_nullable_to_non_nullable
              as String,
      webLatest: null == webLatest
          ? _self.webLatest
          : webLatest // ignore: cast_nullable_to_non_nullable
              as String,
      ftlLatest: null == ftlLatest
          ? _self.ftlLatest
          : ftlLatest // ignore: cast_nullable_to_non_nullable
              as String,
      coreBranch: null == coreBranch
          ? _self.coreBranch
          : coreBranch // ignore: cast_nullable_to_non_nullable
              as String,
      webBranch: null == webBranch
          ? _self.webBranch
          : webBranch // ignore: cast_nullable_to_non_nullable
              as String,
      ftlBranch: null == ftlBranch
          ? _self.ftlBranch
          : ftlBranch // ignore: cast_nullable_to_non_nullable
              as String,
      dockerUpdate: freezed == dockerUpdate
          ? _self.dockerUpdate
          : dockerUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      dockerCurrent: freezed == dockerCurrent
          ? _self.dockerCurrent
          : dockerCurrent // ignore: cast_nullable_to_non_nullable
              as String?,
      dockerLatest: freezed == dockerLatest
          ? _self.dockerLatest
          : dockerLatest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Versions].
extension VersionsPatterns on Versions {
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
    TResult Function(_Versions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Versions() when $default != null:
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
    TResult Function(_Versions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Versions():
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
    TResult? Function(_Versions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Versions() when $default != null:
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
            @JsonKey(name: 'core_update') bool coreUpdate,
            @JsonKey(name: 'web_update') bool webUpdate,
            @JsonKey(name: 'FTL_update') bool ftlUpdate,
            @JsonKey(name: 'core_current') String coreCurrent,
            @JsonKey(name: 'web_current') String webCurrent,
            @JsonKey(name: 'FTL_current') String ftlCurrent,
            @JsonKey(name: 'core_latest') String coreLatest,
            @JsonKey(name: 'web_latest') String webLatest,
            @JsonKey(name: 'FTL_latest') String ftlLatest,
            @JsonKey(name: 'core_branch') String coreBranch,
            @JsonKey(name: 'web_branch') String webBranch,
            @JsonKey(name: 'FTL_branch') String ftlBranch,
            @JsonKey(name: 'docker_update') bool? dockerUpdate,
            @JsonKey(name: 'docker_current') String? dockerCurrent,
            @JsonKey(name: 'docker_latest') String? dockerLatest)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Versions() when $default != null:
        return $default(
            _that.coreUpdate,
            _that.webUpdate,
            _that.ftlUpdate,
            _that.coreCurrent,
            _that.webCurrent,
            _that.ftlCurrent,
            _that.coreLatest,
            _that.webLatest,
            _that.ftlLatest,
            _that.coreBranch,
            _that.webBranch,
            _that.ftlBranch,
            _that.dockerUpdate,
            _that.dockerCurrent,
            _that.dockerLatest);
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
            @JsonKey(name: 'core_update') bool coreUpdate,
            @JsonKey(name: 'web_update') bool webUpdate,
            @JsonKey(name: 'FTL_update') bool ftlUpdate,
            @JsonKey(name: 'core_current') String coreCurrent,
            @JsonKey(name: 'web_current') String webCurrent,
            @JsonKey(name: 'FTL_current') String ftlCurrent,
            @JsonKey(name: 'core_latest') String coreLatest,
            @JsonKey(name: 'web_latest') String webLatest,
            @JsonKey(name: 'FTL_latest') String ftlLatest,
            @JsonKey(name: 'core_branch') String coreBranch,
            @JsonKey(name: 'web_branch') String webBranch,
            @JsonKey(name: 'FTL_branch') String ftlBranch,
            @JsonKey(name: 'docker_update') bool? dockerUpdate,
            @JsonKey(name: 'docker_current') String? dockerCurrent,
            @JsonKey(name: 'docker_latest') String? dockerLatest)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Versions():
        return $default(
            _that.coreUpdate,
            _that.webUpdate,
            _that.ftlUpdate,
            _that.coreCurrent,
            _that.webCurrent,
            _that.ftlCurrent,
            _that.coreLatest,
            _that.webLatest,
            _that.ftlLatest,
            _that.coreBranch,
            _that.webBranch,
            _that.ftlBranch,
            _that.dockerUpdate,
            _that.dockerCurrent,
            _that.dockerLatest);
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
            @JsonKey(name: 'core_update') bool coreUpdate,
            @JsonKey(name: 'web_update') bool webUpdate,
            @JsonKey(name: 'FTL_update') bool ftlUpdate,
            @JsonKey(name: 'core_current') String coreCurrent,
            @JsonKey(name: 'web_current') String webCurrent,
            @JsonKey(name: 'FTL_current') String ftlCurrent,
            @JsonKey(name: 'core_latest') String coreLatest,
            @JsonKey(name: 'web_latest') String webLatest,
            @JsonKey(name: 'FTL_latest') String ftlLatest,
            @JsonKey(name: 'core_branch') String coreBranch,
            @JsonKey(name: 'web_branch') String webBranch,
            @JsonKey(name: 'FTL_branch') String ftlBranch,
            @JsonKey(name: 'docker_update') bool? dockerUpdate,
            @JsonKey(name: 'docker_current') String? dockerCurrent,
            @JsonKey(name: 'docker_latest') String? dockerLatest)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Versions() when $default != null:
        return $default(
            _that.coreUpdate,
            _that.webUpdate,
            _that.ftlUpdate,
            _that.coreCurrent,
            _that.webCurrent,
            _that.ftlCurrent,
            _that.coreLatest,
            _that.webLatest,
            _that.ftlLatest,
            _that.coreBranch,
            _that.webBranch,
            _that.ftlBranch,
            _that.dockerUpdate,
            _that.dockerCurrent,
            _that.dockerLatest);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Versions implements Versions {
  const _Versions(
      {@JsonKey(name: 'core_update') required this.coreUpdate,
      @JsonKey(name: 'web_update') required this.webUpdate,
      @JsonKey(name: 'FTL_update') required this.ftlUpdate,
      @JsonKey(name: 'core_current') required this.coreCurrent,
      @JsonKey(name: 'web_current') required this.webCurrent,
      @JsonKey(name: 'FTL_current') required this.ftlCurrent,
      @JsonKey(name: 'core_latest') required this.coreLatest,
      @JsonKey(name: 'web_latest') required this.webLatest,
      @JsonKey(name: 'FTL_latest') required this.ftlLatest,
      @JsonKey(name: 'core_branch') required this.coreBranch,
      @JsonKey(name: 'web_branch') required this.webBranch,
      @JsonKey(name: 'FTL_branch') required this.ftlBranch,
      @JsonKey(name: 'docker_update') this.dockerUpdate,
      @JsonKey(name: 'docker_current') this.dockerCurrent,
      @JsonKey(name: 'docker_latest') this.dockerLatest});
  factory _Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);

  @override
  @JsonKey(name: 'core_update')
  final bool coreUpdate;
  @override
  @JsonKey(name: 'web_update')
  final bool webUpdate;
  @override
  @JsonKey(name: 'FTL_update')
  final bool ftlUpdate;
  @override
  @JsonKey(name: 'core_current')
  final String coreCurrent;
  @override
  @JsonKey(name: 'web_current')
  final String webCurrent;
  @override
  @JsonKey(name: 'FTL_current')
  final String ftlCurrent;
  @override
  @JsonKey(name: 'core_latest')
  final String coreLatest;
  @override
  @JsonKey(name: 'web_latest')
  final String webLatest;
  @override
  @JsonKey(name: 'FTL_latest')
  final String ftlLatest;
  @override
  @JsonKey(name: 'core_branch')
  final String coreBranch;
  @override
  @JsonKey(name: 'web_branch')
  final String webBranch;
  @override
  @JsonKey(name: 'FTL_branch')
  final String ftlBranch;
  @override
  @JsonKey(name: 'docker_update')
  final bool? dockerUpdate;
  @override
  @JsonKey(name: 'docker_current')
  final String? dockerCurrent;
  @override
  @JsonKey(name: 'docker_latest')
  final String? dockerLatest;

  /// Create a copy of Versions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VersionsCopyWith<_Versions> get copyWith =>
      __$VersionsCopyWithImpl<_Versions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VersionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Versions &&
            (identical(other.coreUpdate, coreUpdate) ||
                other.coreUpdate == coreUpdate) &&
            (identical(other.webUpdate, webUpdate) ||
                other.webUpdate == webUpdate) &&
            (identical(other.ftlUpdate, ftlUpdate) ||
                other.ftlUpdate == ftlUpdate) &&
            (identical(other.coreCurrent, coreCurrent) ||
                other.coreCurrent == coreCurrent) &&
            (identical(other.webCurrent, webCurrent) ||
                other.webCurrent == webCurrent) &&
            (identical(other.ftlCurrent, ftlCurrent) ||
                other.ftlCurrent == ftlCurrent) &&
            (identical(other.coreLatest, coreLatest) ||
                other.coreLatest == coreLatest) &&
            (identical(other.webLatest, webLatest) ||
                other.webLatest == webLatest) &&
            (identical(other.ftlLatest, ftlLatest) ||
                other.ftlLatest == ftlLatest) &&
            (identical(other.coreBranch, coreBranch) ||
                other.coreBranch == coreBranch) &&
            (identical(other.webBranch, webBranch) ||
                other.webBranch == webBranch) &&
            (identical(other.ftlBranch, ftlBranch) ||
                other.ftlBranch == ftlBranch) &&
            (identical(other.dockerUpdate, dockerUpdate) ||
                other.dockerUpdate == dockerUpdate) &&
            (identical(other.dockerCurrent, dockerCurrent) ||
                other.dockerCurrent == dockerCurrent) &&
            (identical(other.dockerLatest, dockerLatest) ||
                other.dockerLatest == dockerLatest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      coreUpdate,
      webUpdate,
      ftlUpdate,
      coreCurrent,
      webCurrent,
      ftlCurrent,
      coreLatest,
      webLatest,
      ftlLatest,
      coreBranch,
      webBranch,
      ftlBranch,
      dockerUpdate,
      dockerCurrent,
      dockerLatest);

  @override
  String toString() {
    return 'Versions(coreUpdate: $coreUpdate, webUpdate: $webUpdate, ftlUpdate: $ftlUpdate, coreCurrent: $coreCurrent, webCurrent: $webCurrent, ftlCurrent: $ftlCurrent, coreLatest: $coreLatest, webLatest: $webLatest, ftlLatest: $ftlLatest, coreBranch: $coreBranch, webBranch: $webBranch, ftlBranch: $ftlBranch, dockerUpdate: $dockerUpdate, dockerCurrent: $dockerCurrent, dockerLatest: $dockerLatest)';
  }
}

/// @nodoc
abstract mixin class _$VersionsCopyWith<$Res>
    implements $VersionsCopyWith<$Res> {
  factory _$VersionsCopyWith(_Versions value, $Res Function(_Versions) _then) =
      __$VersionsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'core_update') bool coreUpdate,
      @JsonKey(name: 'web_update') bool webUpdate,
      @JsonKey(name: 'FTL_update') bool ftlUpdate,
      @JsonKey(name: 'core_current') String coreCurrent,
      @JsonKey(name: 'web_current') String webCurrent,
      @JsonKey(name: 'FTL_current') String ftlCurrent,
      @JsonKey(name: 'core_latest') String coreLatest,
      @JsonKey(name: 'web_latest') String webLatest,
      @JsonKey(name: 'FTL_latest') String ftlLatest,
      @JsonKey(name: 'core_branch') String coreBranch,
      @JsonKey(name: 'web_branch') String webBranch,
      @JsonKey(name: 'FTL_branch') String ftlBranch,
      @JsonKey(name: 'docker_update') bool? dockerUpdate,
      @JsonKey(name: 'docker_current') String? dockerCurrent,
      @JsonKey(name: 'docker_latest') String? dockerLatest});
}

/// @nodoc
class __$VersionsCopyWithImpl<$Res> implements _$VersionsCopyWith<$Res> {
  __$VersionsCopyWithImpl(this._self, this._then);

  final _Versions _self;
  final $Res Function(_Versions) _then;

  /// Create a copy of Versions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coreUpdate = null,
    Object? webUpdate = null,
    Object? ftlUpdate = null,
    Object? coreCurrent = null,
    Object? webCurrent = null,
    Object? ftlCurrent = null,
    Object? coreLatest = null,
    Object? webLatest = null,
    Object? ftlLatest = null,
    Object? coreBranch = null,
    Object? webBranch = null,
    Object? ftlBranch = null,
    Object? dockerUpdate = freezed,
    Object? dockerCurrent = freezed,
    Object? dockerLatest = freezed,
  }) {
    return _then(_Versions(
      coreUpdate: null == coreUpdate
          ? _self.coreUpdate
          : coreUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      webUpdate: null == webUpdate
          ? _self.webUpdate
          : webUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      ftlUpdate: null == ftlUpdate
          ? _self.ftlUpdate
          : ftlUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      coreCurrent: null == coreCurrent
          ? _self.coreCurrent
          : coreCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      webCurrent: null == webCurrent
          ? _self.webCurrent
          : webCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      ftlCurrent: null == ftlCurrent
          ? _self.ftlCurrent
          : ftlCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      coreLatest: null == coreLatest
          ? _self.coreLatest
          : coreLatest // ignore: cast_nullable_to_non_nullable
              as String,
      webLatest: null == webLatest
          ? _self.webLatest
          : webLatest // ignore: cast_nullable_to_non_nullable
              as String,
      ftlLatest: null == ftlLatest
          ? _self.ftlLatest
          : ftlLatest // ignore: cast_nullable_to_non_nullable
              as String,
      coreBranch: null == coreBranch
          ? _self.coreBranch
          : coreBranch // ignore: cast_nullable_to_non_nullable
              as String,
      webBranch: null == webBranch
          ? _self.webBranch
          : webBranch // ignore: cast_nullable_to_non_nullable
              as String,
      ftlBranch: null == ftlBranch
          ? _self.ftlBranch
          : ftlBranch // ignore: cast_nullable_to_non_nullable
              as String,
      dockerUpdate: freezed == dockerUpdate
          ? _self.dockerUpdate
          : dockerUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      dockerCurrent: freezed == dockerCurrent
          ? _self.dockerCurrent
          : dockerCurrent // ignore: cast_nullable_to_non_nullable
              as String?,
      dockerLatest: freezed == dockerLatest
          ? _self.dockerLatest
          : dockerLatest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
