import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/model/ftl/host.dart';
import 'package:pi_hole_client/domain/model/ftl/sensor.dart';
import 'package:pi_hole_client/domain/model/ftl/system.dart';
import 'package:pi_hole_client/domain/model/ftl/version.dart';

part 'pihole_server.freezed.dart';
part 'pihole_server.g.dart';

@freezed
sealed class PiholeServer with _$PiholeServer {
  @JsonSerializable(explicitToJson: true)
  const factory PiholeServer({
    FtlHost? host,
    FtlSensor? sensor,
    FtlSystem? system,
    FtlVersion? version,
  }) = _PiholeServer;

  factory PiholeServer.fromJson(Map<String, dynamic> json) =>
      _$PiholeServerFromJson(json);
}
