import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
sealed class FtlSensor with _$FtlSensor {
  @JsonSerializable(explicitToJson: true)
  const factory FtlSensor({
    required double hotLimit,
    required String unit,
    double? cpuTemp,
  }) = _FtlSensor;

  factory FtlSensor.fromJson(Map<String, dynamic> json) =>
      _$FtlSensorFromJson(json);
}
