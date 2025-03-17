import 'package:pi_hole_client/models/api/v6/ftl/sensors.dart';

class SensorsInfo {
  SensorsInfo({
    required this.cpuTemp,
    required this.hostLimit,
    required this.unit,
  });

  factory SensorsInfo.fromV6(Sensors sensors) {
    return SensorsInfo(
      cpuTemp: sensors.sensors.cpuTemp,
      hostLimit: sensors.sensors.hotLimit,
      unit: sensors.sensors.unit,
    );
  }

  final double? cpuTemp;
  final double hostLimit;
  final String unit;

  Map<String, dynamic> toJson() {
    return {
      'cpu_temp': cpuTemp,
      'hot_limit': hostLimit,
      'unit': unit,
    };
  }
}
