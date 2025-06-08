import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices.freezed.dart';
part 'devices.g.dart';

@freezed
sealed class Devices with _$Devices {
  const factory Devices({
    required List<DeviceData> devices,
    required double took,
  }) = _Devices;

  factory Devices.fromJson(Map<String, dynamic> json) =>
      _$DevicesFromJson(json);
}

@freezed
sealed class DeviceData with _$DeviceData {
  const factory DeviceData({
    required int id,
    required String hwaddr,
    required String interface,
    required int firstSeen,
    required int lastQuery,
    required int numQueries,
    required List<DeviceIp> ips,
    String? macVendor,
  }) = _DeviceData;

  factory DeviceData.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataFromJson(json);
}

@freezed
sealed class DeviceIp with _$DeviceIp {
  const factory DeviceIp({
    required String ip,
    required int lastSeen,
    required int nameUpdated,
    String? name,
  }) = _DeviceIp;

  factory DeviceIp.fromJson(Map<String, dynamic> json) =>
      _$DeviceIpFromJson(json);
}
