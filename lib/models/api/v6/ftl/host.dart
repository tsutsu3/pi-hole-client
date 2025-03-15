import 'package:freezed_annotation/freezed_annotation.dart';

part 'host.freezed.dart';
part 'host.g.dart';

@freezed
sealed class Host with _$Host {
  const factory Host({
    required HostData host,
    required double took,
  }) = _Host;

  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
}

@freezed
sealed class HostData with _$HostData {
  const factory HostData({
    required HostUname uname,
    required String? model,
    required HostDmi dmi,
  }) = _HostData;

  factory HostData.fromJson(Map<String, dynamic> json) =>
      _$HostDataFromJson(json);
}

@freezed
sealed class HostUname with _$HostUname {
  const factory HostUname({
    required String domainname,
    required String machine,
    required String nodename,
    required String release,
    required String sysname,
    required String version,
  }) = _HostUname;

  factory HostUname.fromJson(Map<String, dynamic> json) =>
      _$HostUnameFromJson(json);
}

@freezed
sealed class HostDmi with _$HostDmi {
  const factory HostDmi({
    required BiosInfo bios,
    required BoardInfo board,
    required ProductInfo product,
    required SystemInfo sys,
  }) = _HostDmi;

  factory HostDmi.fromJson(Map<String, dynamic> json) =>
      _$HostDmiFromJson(json);
}

@freezed
sealed class BiosInfo with _$BiosInfo {
  const factory BiosInfo({
    @JsonKey(name: 'vendor') required String? vendor,
  }) = _BiosInfo;

  factory BiosInfo.fromJson(Map<String, dynamic> json) =>
      _$BiosInfoFromJson(json);
}

@freezed
sealed class BoardInfo with _$BoardInfo {
  const factory BoardInfo({
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'vendor') required String? vendor,
    @JsonKey(name: 'version') required String? version,
  }) = _BoardInfo;

  factory BoardInfo.fromJson(Map<String, dynamic> json) =>
      _$BoardInfoFromJson(json);
}

@freezed
sealed class ProductInfo with _$ProductInfo {
  const factory ProductInfo({
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'version') required String? version,
    @JsonKey(name: 'family') required String? family,
  }) = _ProductInfo;

  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);
}

@freezed
sealed class SystemInfo with _$SystemInfo {
  const factory SystemInfo({
    @JsonKey(name: 'vendor') required String? vendor,
  }) = _SystemInfo;

  factory SystemInfo.fromJson(Map<String, dynamic> json) =>
      _$SystemInfoFromJson(json);
}
