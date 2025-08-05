import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.freezed.dart';
part 'version.g.dart';

@freezed
sealed class InfoVersion with _$InfoVersion {
  @JsonSerializable(explicitToJson: true)
  const factory InfoVersion({
    required VersionData version,
    required double took,
  }) = _InfoVersion;

  factory InfoVersion.fromJson(Map<String, dynamic> json) =>
      _$InfoVersionFromJson(json);
}

@freezed
sealed class VersionData with _$VersionData {
  @JsonSerializable(explicitToJson: true)
  const factory VersionData({
    required Core core,
    required Web web,
    required FTL ftl,
    required Docker docker,
  }) = _VersionData;

  factory VersionData.fromJson(Map<String, dynamic> json) =>
      _$VersionDataFromJson(json);
}

@freezed
sealed class Core with _$Core {
  @JsonSerializable(explicitToJson: true)
  const factory Core({
    required LocalVersion local,
    required RemoteVersion remote,
  }) = _Core;

  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);
}

@freezed
sealed class Web with _$Web {
  @JsonSerializable(explicitToJson: true)
  const factory Web({
    required LocalVersion local,
    required RemoteVersion remote,
  }) = _Web;

  factory Web.fromJson(Map<String, dynamic> json) => _$WebFromJson(json);
}

@freezed
sealed class FTL with _$FTL {
  @JsonSerializable(explicitToJson: true)
  const factory FTL({required LocalFTL local, required RemoteVersion remote}) =
      _FTL;

  factory FTL.fromJson(Map<String, dynamic> json) => _$FTLFromJson(json);
}

@freezed
sealed class Docker with _$Docker {
  const factory Docker({String? local, String? remote}) = _Docker;

  factory Docker.fromJson(Map<String, dynamic> json) => _$DockerFromJson(json);
}

@freezed
sealed class LocalVersion with _$LocalVersion {
  const factory LocalVersion({String? branch, String? version, String? hash}) =
      _LocalVersion;

  factory LocalVersion.fromJson(Map<String, dynamic> json) =>
      _$LocalVersionFromJson(json);
}

@freezed
sealed class RemoteVersion with _$RemoteVersion {
  const factory RemoteVersion({String? version, String? hash}) = _RemoteVersion;

  factory RemoteVersion.fromJson(Map<String, dynamic> json) =>
      _$RemoteVersionFromJson(json);
}

@freezed
sealed class LocalFTL with _$LocalFTL {
  const factory LocalFTL({
    String? branch,
    String? version,
    String? hash,
    String? date,
  }) = _LocalFTL;

  factory LocalFTL.fromJson(Map<String, dynamic> json) =>
      _$LocalFTLFromJson(json);
}
