import 'package:freezed_annotation/freezed_annotation.dart';

part 'versions.freezed.dart';
part 'versions.g.dart';

@freezed
sealed class Versions with _$Versions {
  const factory Versions({
    @JsonKey(name: 'core_update') required bool coreUpdate,
    @JsonKey(name: 'web_update') required bool webUpdate,
    @JsonKey(name: 'FTL_update') required bool ftlUpdate,
    @JsonKey(name: 'core_current') required String coreCurrent,
    @JsonKey(name: 'web_current') required String webCurrent,
    @JsonKey(name: 'FTL_current') required String ftlCurrent,
    @JsonKey(name: 'core_latest') required String coreLatest,
    @JsonKey(name: 'web_latest') required String webLatest,
    @JsonKey(name: 'FTL_latest') required String ftlLatest,
    @JsonKey(name: 'core_branch') required String coreBranch,
    @JsonKey(name: 'web_branch') required String webBranch,
    @JsonKey(name: 'FTL_branch') required String ftlBranch,
    @JsonKey(name: 'docker_update') bool? dockerUpdate,
    @JsonKey(name: 'docker_current') String? dockerCurrent,
    @JsonKey(name: 'docker_latest') String? dockerLatest,
  }) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
}
