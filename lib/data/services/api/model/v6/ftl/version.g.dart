// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
      version: VersionData.fromJson(json['version'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
      'version': instance.version,
      'took': instance.took,
    };

_VersionData _$VersionDataFromJson(Map<String, dynamic> json) => _VersionData(
      core: Core.fromJson(json['core'] as Map<String, dynamic>),
      web: Web.fromJson(json['web'] as Map<String, dynamic>),
      ftl: FTL.fromJson(json['ftl'] as Map<String, dynamic>),
      docker: Docker.fromJson(json['docker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionDataToJson(_VersionData instance) =>
    <String, dynamic>{
      'core': instance.core,
      'web': instance.web,
      'ftl': instance.ftl,
      'docker': instance.docker,
    };

_Core _$CoreFromJson(Map<String, dynamic> json) => _Core(
      local: LocalVersion.fromJson(json['local'] as Map<String, dynamic>),
      remote: RemoteVersion.fromJson(json['remote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreToJson(_Core instance) => <String, dynamic>{
      'local': instance.local,
      'remote': instance.remote,
    };

_Web _$WebFromJson(Map<String, dynamic> json) => _Web(
      local: LocalVersion.fromJson(json['local'] as Map<String, dynamic>),
      remote: RemoteVersion.fromJson(json['remote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebToJson(_Web instance) => <String, dynamic>{
      'local': instance.local,
      'remote': instance.remote,
    };

_FTL _$FTLFromJson(Map<String, dynamic> json) => _FTL(
      local: LocalFTL.fromJson(json['local'] as Map<String, dynamic>),
      remote: RemoteVersion.fromJson(json['remote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FTLToJson(_FTL instance) => <String, dynamic>{
      'local': instance.local,
      'remote': instance.remote,
    };

_Docker _$DockerFromJson(Map<String, dynamic> json) => _Docker(
      local: json['local'] as String?,
      remote: json['remote'] as String?,
    );

Map<String, dynamic> _$DockerToJson(_Docker instance) => <String, dynamic>{
      'local': instance.local,
      'remote': instance.remote,
    };

_LocalVersion _$LocalVersionFromJson(Map<String, dynamic> json) =>
    _LocalVersion(
      branch: json['branch'] as String?,
      version: json['version'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$LocalVersionToJson(_LocalVersion instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'version': instance.version,
      'hash': instance.hash,
    };

_RemoteVersion _$RemoteVersionFromJson(Map<String, dynamic> json) =>
    _RemoteVersion(
      version: json['version'] as String?,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$RemoteVersionToJson(_RemoteVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'hash': instance.hash,
    };

_LocalFTL _$LocalFTLFromJson(Map<String, dynamic> json) => _LocalFTL(
      branch: json['branch'] as String?,
      version: json['version'] as String?,
      hash: json['hash'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$LocalFTLToJson(_LocalFTL instance) => <String, dynamic>{
      'branch': instance.branch,
      'version': instance.version,
      'hash': instance.hash,
      'date': instance.date,
    };
