import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
sealed class FtlSensor with _$FtlSensor {
  @JsonSerializable(explicitToJson: true)
  const factory FtlSensor({
    required double hotLimit,
    required TemperatureUnit unit,
    double? cpuTemp,
  }) = _FtlSensor;

  factory FtlSensor.fromJson(Map<String, dynamic> json) =>
      _$FtlSensorFromJson(json);
}
