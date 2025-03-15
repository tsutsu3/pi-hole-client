import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.freezed.dart';
part 'version.g.dart';

@freezed
sealed class Version with _$Version {
  const factory Version({
    required Core core,
    required Web web,
    required FTL ftl,
    required Docker docker,
    required double took,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}

@freezed
sealed class Core with _$Core {
  const factory Core({
    required LocalVersion local,
    required RemoteVersion remote,
  }) = _Core;

  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);
}

@freezed
sealed class Web with _$Web {
  const factory Web({
    required LocalVersion local,
    required RemoteVersion remote,
  }) = _Web;

  factory Web.fromJson(Map<String, dynamic> json) => _$WebFromJson(json);
}

@freezed
sealed class FTL with _$FTL {
  const factory FTL({
    required LocalFTL local,
    required RemoteVersion remote,
  }) = _FTL;

  factory FTL.fromJson(Map<String, dynamic> json) => _$FTLFromJson(json);
}

@freezed
sealed class Docker with _$Docker {
  const factory Docker({
    required String? local,
    required String? remote,
  }) = _Docker;

  factory Docker.fromJson(Map<String, dynamic> json) => _$DockerFromJson(json);
}

@freezed
sealed class LocalVersion with _$LocalVersion {
  const factory LocalVersion({
    required String? branch,
    required String? version,
    required String? hash,
  }) = _LocalVersion;

  factory LocalVersion.fromJson(Map<String, dynamic> json) =>
      _$LocalVersionFromJson(json);
}

@freezed
sealed class RemoteVersion with _$RemoteVersion {
  const factory RemoteVersion({
    required String? version,
    required String? hash,
  }) = _RemoteVersion;

  factory RemoteVersion.fromJson(Map<String, dynamic> json) =>
      _$RemoteVersionFromJson(json);
}

@freezed
sealed class LocalFTL with _$LocalFTL {
  const factory LocalFTL({
    required String? branch,
    required String? version,
    required String? hash,
    required String? date,
  }) = _LocalFTL;

  factory LocalFTL.fromJson(Map<String, dynamic> json) =>
      _$LocalFTLFromJson(json);
}
