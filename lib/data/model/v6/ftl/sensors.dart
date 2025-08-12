import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensors.freezed.dart';
part 'sensors.g.dart';

@freezed
sealed class InfoSensors with _$InfoSensors {
  @JsonSerializable(explicitToJson: true)
  const factory InfoSensors({
    required SensorsData sensors,
    required double took,
  }) = _InfoSensors;

  factory InfoSensors.fromJson(Map<String, dynamic> json) =>
      _$InfoSensorsFromJson(json);
}

@freezed
sealed class SensorsData with _$SensorsData {
  @JsonSerializable(explicitToJson: true)
  const factory SensorsData({
    required List<SensorData> list,
    @JsonKey(name: 'cpu_temp') required double? cpuTemp,
    @JsonKey(name: 'hot_limit') required double hotLimit,
    required String unit,
  }) = _SensorsData;

  factory SensorsData.fromJson(Map<String, dynamic> json) =>
      _$SensorsDataFromJson(json);
}

@freezed
sealed class SensorData with _$SensorData {
  @JsonSerializable(explicitToJson: true)
  const factory SensorData({
    required String? name,
    required String path,
    required String source,
    required List<TempData> temps,
  }) = _SensorData;

  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);
}

@freezed
sealed class TempData with _$TempData {
  const factory TempData({
    required String? name,
    required num value,
    required num? max,
    required num? crit,
    required String sensor,
  }) = _TempData;

  factory TempData.fromJson(Map<String, dynamic> json) =>
      _$TempDataFromJson(json);
}
