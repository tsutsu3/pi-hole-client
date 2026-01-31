import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
sealed class InfoSensor with _$InfoSensor {
  @JsonSerializable(explicitToJson: true)
  const factory InfoSensor({
    required double hotLimit,
    required String unit,
    double? cpuTemp,
  }) = _InfoSensor;

  factory InfoSensor.fromJson(Map<String, dynamic> json) =>
      _$InfoSensorFromJson(json);
}
