import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.freezed.dart';
part 'version.g.dart';

@freezed
sealed class InfoVersion with _$InfoVersion {
  @JsonSerializable(explicitToJson: true)
  const factory InfoVersion({
    required ComponentVersion core,
    required ComponentVersion web,
    required ComponentVersion ftl,
    required ComponentVersion docker,
  }) = _InfoVersion;

  factory InfoVersion.fromJson(Map<String, dynamic> json) =>
      _$InfoVersionFromJson(json);
}

@freezed
sealed class ComponentVersion with _$ComponentVersion {
  @JsonSerializable(explicitToJson: true)
  const factory ComponentVersion({
    required VersionDetail local,
    required VersionDetail remote,
    bool? canUpdate,
  }) = _ComponentVersion;

  factory ComponentVersion.fromJson(Map<String, dynamic> json) =>
      _$ComponentVersionFromJson(json);
}

@freezed
sealed class VersionDetail with _$VersionDetail {
  const factory VersionDetail({required String version, String? branch}) =
      _VersionDetail;

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailFromJson(json);
}
