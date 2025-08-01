// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'versions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Versions _$VersionsFromJson(Map<String, dynamic> json) => _Versions(
      coreUpdate: json['core_update'] as bool,
      webUpdate: json['web_update'] as bool,
      ftlUpdate: json['FTL_update'] as bool,
      coreCurrent: json['core_current'] as String,
      webCurrent: json['web_current'] as String,
      ftlCurrent: json['FTL_current'] as String,
      coreLatest: json['core_latest'] as String,
      webLatest: json['web_latest'] as String,
      ftlLatest: json['FTL_latest'] as String,
      coreBranch: json['core_branch'] as String,
      webBranch: json['web_branch'] as String,
      ftlBranch: json['FTL_branch'] as String,
      dockerUpdate: json['docker_update'] as bool?,
      dockerCurrent: json['docker_current'] as String?,
      dockerLatest: json['docker_latest'] as String?,
    );

Map<String, dynamic> _$VersionsToJson(_Versions instance) => <String, dynamic>{
      'core_update': instance.coreUpdate,
      'web_update': instance.webUpdate,
      'FTL_update': instance.ftlUpdate,
      'core_current': instance.coreCurrent,
      'web_current': instance.webCurrent,
      'FTL_current': instance.ftlCurrent,
      'core_latest': instance.coreLatest,
      'web_latest': instance.webLatest,
      'FTL_latest': instance.ftlLatest,
      'core_branch': instance.coreBranch,
      'web_branch': instance.webBranch,
      'FTL_branch': instance.ftlBranch,
      'docker_update': instance.dockerUpdate,
      'docker_current': instance.dockerCurrent,
      'docker_latest': instance.dockerLatest,
    };
