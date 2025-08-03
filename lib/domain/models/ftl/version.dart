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
  }) = _ComponentVersion;

  const ComponentVersion._();

  factory ComponentVersion.fromJson(Map<String, dynamic> json) =>
      _$ComponentVersionFromJson(json);

  bool get canUpdate {
    if (local.version.isEmpty || remote.version.isEmpty) {
      return false;
    }
    return local != remote;
  }

  Map<String, dynamic> toFormattedJson() {
    return {
      'local': local.toJson(),
      'remote': remote.toJson(),
      'canUpdate': canUpdate,
    };
  }
}

@freezed
sealed class VersionDetail with _$VersionDetail {
  const factory VersionDetail({
    required String version,
    String? branch,
    String? hash,
    String? date,
  }) = _VersionDetail;

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailFromJson(json);
}
