import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/model/config/dns_config.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
sealed class Config with _$Config {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Config({
    DnsConfig? dns,
    // Future expansion (add as needed):
    // DhcpConfig? dhcp,
    // WebserverConfig? webserver,
    // DatabaseConfig? database,
    // MiscConfig? misc,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) =>
      _$ConfigFromJson(json);
}
