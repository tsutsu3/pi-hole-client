import 'package:freezed_annotation/freezed_annotation.dart';

part 'host.freezed.dart';
part 'host.g.dart';

@freezed
sealed class FtlHost with _$FtlHost {
  @JsonSerializable(explicitToJson: true)
  const factory FtlHost({
    required String domainName,
    required String arch,
    required String hostName,
    required String release,
    required String sysName,
    required String version,
    String? model,
    // v6-only field
    DmiInfo? dmi,
  }) = _FtlHost;

  factory FtlHost.fromJson(Map<String, dynamic> json) =>
      _$FtlHostFromJson(json);
}

@freezed
sealed class DmiInfo with _$DmiInfo {
  @JsonSerializable(explicitToJson: true)
  const factory DmiInfo({
    DmiBios? bios,
    DmiBoard? board,
    DmiProduct? product,
    DmiSys? sys,
  }) = _DmiInfo;

  factory DmiInfo.fromJson(Map<String, dynamic> json) =>
      _$DmiInfoFromJson(json);
}

@freezed
sealed class DmiBios with _$DmiBios {
  const factory DmiBios({
    String? vendor,
    String? version,
    String? date,
  }) = _DmiBios;

  factory DmiBios.fromJson(Map<String, dynamic> json) =>
      _$DmiBiosFromJson(json);
}

@freezed
sealed class DmiBoard with _$DmiBoard {
  const factory DmiBoard({
    String? name,
    String? vendor,
    String? version,
  }) = _DmiBoard;

  factory DmiBoard.fromJson(Map<String, dynamic> json) =>
      _$DmiBoardFromJson(json);
}

@freezed
sealed class DmiProduct with _$DmiProduct {
  const factory DmiProduct({
    String? name,
    String? family,
    String? version,
  }) = _DmiProduct;

  factory DmiProduct.fromJson(Map<String, dynamic> json) =>
      _$DmiProductFromJson(json);
}

@freezed
sealed class DmiSys with _$DmiSys {
  const factory DmiSys({
    String? vendor,
    String? version,
  }) = _DmiSys;

  factory DmiSys.fromJson(Map<String, dynamic> json) =>
      _$DmiSysFromJson(json);
}
