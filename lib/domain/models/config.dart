import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
sealed class Config with _$Config {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Config({
    Dns? dns,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

@freezed
sealed class Dns with _$Dns {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Dns({
    bool? queryLogging,
  }) = _Dns;

  factory Dns.fromJson(Map<String, dynamic> json) => _$DnsFromJson(json);
}
