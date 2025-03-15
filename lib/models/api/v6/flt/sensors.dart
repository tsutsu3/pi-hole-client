import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensors.freezed.dart';
part 'sensors.g.dart';

@freezed
sealed class Sensors with _$Sensors {
  const factory Sensors({
    required List<SensorData> list,
    @JsonKey(name: 'cpu_temp') required num? cpuTemp,
    @JsonKey(name: 'hot_limit') required num hotLimit,
    required String unit,
  }) = _Sensors;

  factory Sensors.fromJson(Map<String, dynamic> json) =>
      _$SensorsFromJson(json);
}

@freezed
sealed class SensorData with _$SensorData {
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
