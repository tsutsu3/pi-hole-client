// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionCWProxy {
  VersionVersion core(VersionVersionCore? core);

  VersionVersion web(VersionVersionWeb? web);

  VersionVersion ftl(VersionVersionFtl? ftl);

  VersionVersion docker(VersionVersionDocker? docker);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersion(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersion call({
    VersionVersionCore? core,
    VersionVersionWeb? web,
    VersionVersionFtl? ftl,
    VersionVersionDocker? docker,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersion.copyWith.fieldName(...)`
class _$VersionVersionCWProxyImpl implements _$VersionVersionCWProxy {
  const _$VersionVersionCWProxyImpl(this._value);

  final VersionVersion _value;

  @override
  VersionVersion core(VersionVersionCore? core) => this(core: core);

  @override
  VersionVersion web(VersionVersionWeb? web) => this(web: web);

  @override
  VersionVersion ftl(VersionVersionFtl? ftl) => this(ftl: ftl);

  @override
  VersionVersion docker(VersionVersionDocker? docker) => this(docker: docker);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersion(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersion call({
    Object? core = const $CopyWithPlaceholder(),
    Object? web = const $CopyWithPlaceholder(),
    Object? ftl = const $CopyWithPlaceholder(),
    Object? docker = const $CopyWithPlaceholder(),
  }) {
    return VersionVersion(
      core: core == const $CopyWithPlaceholder()
          ? _value.core
          // ignore: cast_nullable_to_non_nullable
          : core as VersionVersionCore?,
      web: web == const $CopyWithPlaceholder()
          ? _value.web
          // ignore: cast_nullable_to_non_nullable
          : web as VersionVersionWeb?,
      ftl: ftl == const $CopyWithPlaceholder()
          ? _value.ftl
          // ignore: cast_nullable_to_non_nullable
          : ftl as VersionVersionFtl?,
      docker: docker == const $CopyWithPlaceholder()
          ? _value.docker
          // ignore: cast_nullable_to_non_nullable
          : docker as VersionVersionDocker?,
    );
  }
}

extension $VersionVersionCopyWith on VersionVersion {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersion.copyWith(...)` or like so:`instanceOfVersionVersion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionCWProxy get copyWith => _$VersionVersionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersion _$VersionVersionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VersionVersion', json, ($checkedConvert) {
      final val = VersionVersion(
        core: $checkedConvert(
          'core',
          (v) => v == null
              ? null
              : VersionVersionCore.fromJson(v as Map<String, dynamic>),
        ),
        web: $checkedConvert(
          'web',
          (v) => v == null
              ? null
              : VersionVersionWeb.fromJson(v as Map<String, dynamic>),
        ),
        ftl: $checkedConvert(
          'ftl',
          (v) => v == null
              ? null
              : VersionVersionFtl.fromJson(v as Map<String, dynamic>),
        ),
        docker: $checkedConvert(
          'docker',
          (v) => v == null
              ? null
              : VersionVersionDocker.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VersionVersionToJson(VersionVersion instance) =>
    <String, dynamic>{
      'core': ?instance.core?.toJson(),
      'web': ?instance.web?.toJson(),
      'ftl': ?instance.ftl?.toJson(),
      'docker': ?instance.docker?.toJson(),
    };
