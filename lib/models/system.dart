import 'package:pi_hole_client/models/api/v6/ftl/system.dart';

class SystemInfo {
  SystemInfo({
    required this.uptime,
    required this.ramUsage,
    required this.cpuUsage,
  });

  factory SystemInfo.fromV6(System system) {
    return SystemInfo(
      uptime: system.system.uptime,
      ramUsage: system.system.memory.ram.percentUsed,
      cpuUsage: system.system.cpu.percentCpu ??
          _average(system.system.cpu.load.percent),
    );
  }

  static double _average(List<double> list) {
    return list.reduce((a, b) => a + b) / list.length;
  }

  final int uptime;
  final double ramUsage;
  final double cpuUsage;

  Map<String, dynamic> toJson() {
    return {
      'uptime': uptime,
      'ram_usage': ramUsage,
      'cpu_usage': cpuUsage,
    };
  }
}
