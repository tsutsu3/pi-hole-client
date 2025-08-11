import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/models/ftl/host.dart';
import 'package:pi_hole_client/domain/models/ftl/sensor.dart';
import 'package:pi_hole_client/domain/models/ftl/system.dart';
import 'package:pi_hole_client/domain/models/ftl/version.dart';

part 'pihole_server.freezed.dart';
part 'pihole_server.g.dart';

@freezed
sealed class InfoPiholeServer with _$InfoPiholeServer {
  @JsonSerializable(explicitToJson: true)
  const factory InfoPiholeServer({
    InfoHost? host,
    InfoSensor? sensor,
    InfoSystem? system,
    InfoVersion? version,
  }) = _InfoPiholeServer;

  factory InfoPiholeServer.fromJson(Map<String, dynamic> json) =>
      _$InfoPiholeServerFromJson(json);
}
