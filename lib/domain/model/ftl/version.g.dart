// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlVersion _$FtlVersionFromJson(Map<String, dynamic> json) => _FtlVersion(
  core: ComponentVersion.fromJson(json['core'] as Map<String, dynamic>),
  web: ComponentVersion.fromJson(json['web'] as Map<String, dynamic>),
  ftl: ComponentVersion.fromJson(json['ftl'] as Map<String, dynamic>),
  docker: ComponentVersion.fromJson(json['docker'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FtlVersionToJson(_FtlVersion instance) =>
    <String, dynamic>{
      'core': instance.core.toJson(),
      'web': instance.web.toJson(),
      'ftl': instance.ftl.toJson(),
      'docker': instance.docker.toJson(),
    };

_ComponentVersion _$ComponentVersionFromJson(Map<String, dynamic> json) =>
    _ComponentVersion(
      local: VersionDetail.fromJson(json['local'] as Map<String, dynamic>),
      remote: VersionDetail.fromJson(json['remote'] as Map<String, dynamic>),
      canUpdate: json['canUpdate'] as bool?,
    );

Map<String, dynamic> _$ComponentVersionToJson(_ComponentVersion instance) =>
    <String, dynamic>{
      'local': instance.local.toJson(),
      'remote': instance.remote.toJson(),
      'canUpdate': instance.canUpdate,
    };

_VersionDetail _$VersionDetailFromJson(Map<String, dynamic> json) =>
    _VersionDetail(
      version: json['version'] as String,
      branch: json['branch'] as String?,
    );

Map<String, dynamic> _$VersionDetailToJson(_VersionDetail instance) =>
    <String, dynamic>{'version': instance.version, 'branch': instance.branch};
